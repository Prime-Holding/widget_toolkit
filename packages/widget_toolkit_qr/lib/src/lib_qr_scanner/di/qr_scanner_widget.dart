import 'package:flutter/cupertino.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';

import '../blocs/qr_scanner_bloc.dart';
import '../services/qr_validation_service.dart';
import '../services/system_permissions_service.dart';
import '../views/qr_scanner_component.dart';

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

  List<Provider> get _services => [
        Provider<SystemPermissionsService>(
          create: (context) => SystemPermissionsService(),
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
