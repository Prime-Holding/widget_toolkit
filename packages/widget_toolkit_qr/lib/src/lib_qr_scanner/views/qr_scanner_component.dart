import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:widget_toolkit/widget_toolkit.dart';

import '../../base/common_ui_components/prime_linear_progress_indicator.dart';
import '../../base/theme/qr_scanner_theme.dart';
import '../blocs/qr_scanner_bloc.dart';
import 'camera_permission.dart';

class QrScannerComponent<T> extends StatefulWidget {
  const QrScannerComponent({
    this.onCodeScanned,
    this.onError,
    this.onCodeValidated,
    this.cameraPermissionButtonText,
    this.cameraAccessTitleText,
    this.cameraAccessLabelText,
    this.cameraPermissionBottomSheetConfiguration,
    this.spaceBetweenScannerAndLoadingWidget,
    this.isLoadingIndicatorVisible = true,
    super.key,
  });

  final Function(Object)? onError;
  final Function(String)? onCodeScanned;
  final Function(T?)? onCodeValidated;
  final bool isLoadingIndicatorVisible;

  final String? cameraPermissionButtonText;
  final String? cameraAccessTitleText;
  final String? cameraAccessLabelText;
  final QrScannerConfiguration? cameraPermissionBottomSheetConfiguration;
  final double? spaceBetweenScannerAndLoadingWidget;

  @override
  State<QrScannerComponent<T>> createState() => _QrScannerComponentState<T>();
}

class _QrScannerComponentState<T> extends State<QrScannerComponent<T>> {
  late final MobileScannerController controller;

  @override
  void initState() {
    controller = MobileScannerController(formats: [BarcodeFormat.qrCode]);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RxBlocListener<QrScannerBlocType<T>, T?>(
              state: (bloc) => bloc.states.scannedValue,
              listener: (context, scannedValue) =>
                  widget.onCodeValidated?.call(scannedValue)),
          RxBlocListener<QrScannerBlocType<T>, Exception?>(
              state: (bloc) => bloc.states.errors,
              condition: (oldError, newError) => newError != null,
              listener: (context, error) => widget.onError?.call(error!)),
          AspectRatio(
            aspectRatio: 1,
            child: Stack(
              children: [
                Padding(
                  padding: context.qrScannerTheme.qrScannerCameraPadding,
                  child: RxBlocListener<QrScannerBlocType<T>, bool>(
                    state: (bloc) => bloc.states.hasCameraPermission,
                    listener: (ctx, permission) {
                      if (permission == false) {
                        showAppCameraPermissionBottomSheet(
                          ctx,
                          onPermissionTab: () => ctx
                              .read<QrScannerBlocType<T>>()
                              .events
                              .requestCameraPermission(),
                          cameraPermissionButtonText:
                              widget.cameraPermissionButtonText,
                          cameraAccessTitleText: widget.cameraAccessTitleText,
                          cameraAccessLabelText: widget.cameraAccessLabelText,
                          cameraPermissionBottomSheetConfiguration:
                              widget.cameraPermissionBottomSheetConfiguration ??
                                  const QrScannerConfiguration(),
                        );
                      }
                    },
                    child: RxBlocBuilder<QrScannerBlocType<T>, bool>(
                      state: (bloc) => bloc.states.hasCameraPermission,
                      builder: (ctx, permission, bloc) => permission.hasData &&
                              permission.data == true
                          ? _QRBarScannerCamera(
                              controller: controller,
                              onError: (ctx, error) {
                                if (error != null && widget.onError != null) {
                                  widget.onError!(error);
                                }
                                return null;
                              },
                              onDetect: (code) {
                                final barcode =
                                    code.barcodes.firstOrNull?.rawValue;
                                if (barcode != null) {
                                  widget.onCodeScanned?.call(barcode);
                                  bloc.events.validateQRCode(barcode);
                                }
                              },
                            )
                          : const SizedBox(),
                    ),
                  ),
                ),
                context.qrScannerTheme.qrScanAreaIcon.copyWith(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                )
              ],
            ),
          ),
          if (widget.isLoadingIndicatorVisible) ...[
            SizedBox(
              height: widget.spaceBetweenScannerAndLoadingWidget ??
                  context.widgetToolkitTheme.spacingL,
            ),
            RxBlocBuilder<QrScannerBlocType<T>, bool>(
              state: (bloc) => bloc.states.isLoading,
              builder: (ctx, state, bloc) =>
                  _buildLoadingLinearProgressIndicator(context,
                      isLoading: state.hasData && state.data == true),
            )
          ],
        ],
      );

  Widget _buildLoadingLinearProgressIndicator(BuildContext context,
          {required bool isLoading}) =>
      isLoading
          ? Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    context.qrScannerTheme.qrScannerProgressIndicatorPadding,
                child: PrimeLinearProgressIndicator(
                  borderRadius: context.qrScannerTheme.qrScannerPageXS,
                ),
              ),
            )
          : const SizedBox();
}

typedef AppErrorCallback = Widget? Function(
    BuildContext context, Object? error);

class _QRBarScannerCamera extends StatelessWidget {
  const _QRBarScannerCamera({
    this.controller,
    required this.onError,
    required this.onDetect,
  });

  final AppErrorCallback onError;
  final MobileScannerController? controller;
  final Function(BarcodeCapture)? onDetect;

  @override
  Widget build(BuildContext context) => MobileScanner(
        controller: controller,
        onDetect: onDetect,
        errorBuilder: (context, error, widget) => _getError(context, error),
      );

  // QRBarScannerCamera(
  Widget _getError(BuildContext context, MobileScannerException error) {
    return onError(context, error.errorDetails?.message) ?? const SizedBox();
  }
}

/// Configuration class for the bottom sheet of the camera permission
class QrScannerConfiguration {
  const QrScannerConfiguration({
    this.showCloseButton = true,
    this.fullScreen = false,
    this.safeAreaBottom = false,
    this.showHeaderPill = false,
    this.isDismissible = true,
  });

  final bool showCloseButton;
  final bool fullScreen;
  final bool safeAreaBottom;
  final bool showHeaderPill;
  final bool isDismissible;
}
