import 'package:flutter/cupertino.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';

import '../blocs/qr_scanner_bloc.dart';
import '../repositories/system_permissions_repository.dart';
import '../services/qr_validation_service.dart';
import '../services/system_permissions_service.dart';
import '../views/qr_scanner_component.dart';

/// Root widget that wires [QrValidationService], permission services, and
/// [QrScannerBloc] around [QrScannerComponent], showing the square camera viewport,
/// scan-area overlay, optional loading bar, and camera-permission bottom sheet when
/// access is missing.
class QrScannerWidget<T> extends StatelessWidget {
  const QrScannerWidget({
    required QrValidationService<T> qrValidationService,
    this.onCodeScanned,
    this.onCodeValidated,
    this.onError,
    this.cameraPermissionButtonText,
    this.cameraAccessTitleText,
    this.cameraAccessLabelText,
    this.cameraPermissionBottomSheetConfiguration,
    this.spaceBetweenScannerAndLoadingWidget,
    this.isLoadingIndicatorVisible = true,
    super.key,
  }) : _qrValidationService = qrValidationService;

  final QrValidationService<T> _qrValidationService;

  /// Notifies listeners when the embedded camera or QR validation pipeline surfaces an
  /// error object that should be presented with host-specific UI such as a snackbar or
  /// the blurred sheet helper in `lib/src/lib_qr_scanner/views/qr_scanner_error_sheet.dart`.
  final Function(Object)? onError;

  /// Receives the raw QR payload string as soon as the device decoder observes it,
  /// before [QrValidationService.validateQrCode] runs on that value through the bloc.
  final Function(String)? onCodeScanned;

  /// Delivers the typed validation result emitted after [QrValidationService.validateQrCode]
  /// completes successfully inside [QrScannerBloc], mirroring the bloc stream fed by
  /// validateQRCode events.
  final Function(T?)? onCodeValidated;

  /// When true, [QrScannerComponent] keeps the linear progress region under the camera
  /// stack aligned with bloc loading states; set false if the host renders progress
  /// elsewhere.
  final bool isLoadingIndicatorVisible;

  /// Label for the primary button inside showAppCameraPermissionBottomSheet that asks the
  /// user to grant camera access (defaults to Grant access when null).
  final String? cameraPermissionButtonText;

  /// Headline shown above the explanation row in the permission sheet (defaults to Camera
  /// access when null).
  final String? cameraAccessTitleText;

  /// Supporting copy beside [QrScannerTheme.cameraIcon] in the bordered permission card (defaults to the
  /// package string describing why camera access is required when null).
  final String? cameraAccessLabelText;

  /// Modal chrome for showAppCameraPermissionBottomSheet (close affordance, fullscreen,
  /// safe-area behavior, header pill, dismissibility), forwarded into widget_toolkit
  /// ModalConfiguration when permission is denied.
  final QrScannerConfiguration? cameraPermissionBottomSheetConfiguration;

  /// Vertical gap inserted between the scanner square and the loading indicator inside
  /// [QrScannerComponent]; when null the widget falls back to spacingL from
  /// widgetToolkitTheme.
  final double? spaceBetweenScannerAndLoadingWidget;

  List<Provider> get _repositories => [
        Provider<SystemPermissionsRepository>(
          create: (context) => SystemPermissionsRepository(),
        ),
      ];

  List<Provider> get _services => [
        Provider<SystemPermissionsService>(
          create: (context) => SystemPermissionsService(
            context.read(),
          ),
        ),
      ];

  List<RxBlocProvider> get _blocs => [
        RxBlocProvider<QrScannerBlocType<T>>(
          create: (context) => QrScannerBloc<T>(
            _qrValidationService,
            context.read(),
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ..._repositories,
          ..._services,
          ..._blocs,
        ],
        child: QrScannerComponent(
          onCodeScanned: onCodeScanned,
          onCodeValidated: onCodeValidated,
          onError: onError,
          cameraPermissionButtonText: cameraPermissionButtonText,
          cameraAccessTitleText: cameraAccessTitleText,
          cameraAccessLabelText: cameraAccessLabelText,
          cameraPermissionBottomSheetConfiguration:
              cameraPermissionBottomSheetConfiguration,
          spaceBetweenScannerAndLoadingWidget:
              spaceBetweenScannerAndLoadingWidget,
          isLoadingIndicatorVisible: isLoadingIndicatorVisible,
        ),
      );
}
