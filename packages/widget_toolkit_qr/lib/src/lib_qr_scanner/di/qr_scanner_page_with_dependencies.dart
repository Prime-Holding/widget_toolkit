import 'package:flutter/widgets.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';

import '../../../widget_toolkit_qr.dart';

class QrScannerPageWithDependencies extends StatelessWidget {
  const QrScannerPageWithDependencies(
      {super.key,
      required QrCodeService qrCodeService,
      required SystemPermissionsService systemPermissionsService,
      required this.qrCodeCallback,
      this.onErrorCallback,
      this.cameraPermissionButtonText,
      this.cameraAccessTitleText,
      this.cameraAccessLabelText,
      this.cameraPermissionBottomSheetConfiguration,
      this.spaceBetweenScannerAndLoadingWidget,
      this.onScannedCode})
      : _qrCodeService = qrCodeService,
        _systemPermissionsService = systemPermissionsService;

  final QrCodeService _qrCodeService;
  final SystemPermissionsService _systemPermissionsService;

  final Function(String) qrCodeCallback;
  final Function(Object)? onErrorCallback;
  final String? cameraPermissionButtonText;
  final String? cameraAccessTitleText;
  final String? cameraAccessLabelText;
  final QrScannerConfiguration? cameraPermissionBottomSheetConfiguration;
  final double? spaceBetweenScannerAndLoadingWidget;
  final Function(Object?)? onScannedCode;

  List<RxBlocProvider> get _blocs => [
        RxBlocProvider<QrScannerBlocType>(
          create: (context) => QrScannerBloc(
            _qrCodeService,
            _systemPermissionsService,
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ..._blocs,
        ],
        child: QrScannerPage(
          qrCodeCallback: qrCodeCallback,
          onErrorCallback: onErrorCallback,
          cameraPermissionButtonText: cameraPermissionButtonText,
          cameraAccessTitleText: cameraAccessTitleText,
          cameraAccessLabelText: cameraAccessLabelText,
          cameraPermissionBottomSheetConfiguration:
              cameraPermissionBottomSheetConfiguration,
          spaceBetweenScannerAndLoadingWidget:
              spaceBetweenScannerAndLoadingWidget,
          onScannedCode: onScannedCode,
        ),
      );
}
