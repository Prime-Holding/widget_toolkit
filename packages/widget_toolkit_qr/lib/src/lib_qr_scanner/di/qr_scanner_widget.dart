import 'package:flutter/cupertino.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';

import '../blocs/qr_scanner_bloc.dart';
import '../repositories/system_permissions_repository.dart';
import '../services/qr_validation_service.dart';
import '../services/system_permissions_service.dart';
import '../views/qr_scanner_component.dart';

/// [QrScannerWidget<T>] is the widget, which displays a qr scanner and a loading
/// indicator bellow it.
///
/// [onCodeScanned] A callback, which receives the value of the
/// scanned QR code as String parameter. This method is called before the QR is validated.
///
/// [onError] a callback receiving an error from [QRBarScannerCamera]
/// widget and any possible error that occurred during the QR validation.
///
/// [onCodeValidated] a callback which returns a generic value.
///
/// [cameraPermissionBottomSheetConfiguration] configuration for camera
/// permission bottom sheet, displayed when the user has not yet provided
/// access for the application to the device's camera.
///
/// [cameraPermissionButtonText] the text in the button, which is in the camera
/// permission bottom modal sheet, displayed when there is still no access given
/// to the device's camera. The default value is 'Grant access'.
///
/// [cameraAccessTitleText] the text value
/// it is used in the  [_CameraPermissionWidget], the default value is
/// 'Camera access'
///
/// [cameraAccessLabelText] A label text for the bottom error modal sheet
///
/// [spaceBetweenScannerAndLoadingWidget] a double value used to set the space
/// between the qr scanner widget and the loading widget
///
/// [isLoadingIndicatorVisible]
/// specifies if the loading indicator should be visible. It has default value `true`.
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

  final Function(Object)? onError;
  final Function(String)? onCodeScanned;
  final Function(T?)? onCodeValidated;
  final bool isLoadingIndicatorVisible;

  final String? cameraPermissionButtonText;
  final String? cameraAccessTitleText;
  final String? cameraAccessLabelText;
  final QrScannerConfiguration? cameraPermissionBottomSheetConfiguration;
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
          cameraAccessTitleText: cameraAccessLabelText,
          cameraAccessLabelText: cameraAccessLabelText,
          cameraPermissionBottomSheetConfiguration:
              cameraPermissionBottomSheetConfiguration,
          spaceBetweenScannerAndLoadingWidget:
              spaceBetweenScannerAndLoadingWidget,
          isLoadingIndicatorVisible: isLoadingIndicatorVisible,
        ),
      );
}
