import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_qr_bar_scanner/flutter_qr_bar_scanner.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';
import 'package:widget_toolkit/widget_toolkit.dart';

import '../../base/common_ui_components/prime_linear_progress_indicator.dart';
import '../../base/theme/qr_scanner_theme.dart';
import '../blocs/qr_scanner_bloc.dart';
import 'camera_permission.dart';

class QrScannerComponent<T> extends StatelessWidget {
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
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RxBlocListener<QrScannerBlocType<T>, T?>(
              state: (bloc) => bloc.states.scannedValue,
              listener: (context, scannedValue) =>
                  onCodeValidated?.call(scannedValue)),
          RxBlocListener<QrScannerBlocType<T>, Exception?>(
              state: (bloc) => bloc.states.errors,
              condition: (oldError, newError) => newError != null,
              listener: (context, error) => onError?.call(error!)),
          AspectRatio(
            aspectRatio: 1,
            child: Stack(
              children: [
                Padding(
                  padding: context.qrScannerTheme.qrScannerPage3,
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
                              cameraPermissionButtonText,
                          cameraAccessTitleText: cameraAccessTitleText,
                          cameraAccessLabelText: cameraAccessLabelText,
                          cameraPermissionBottomSheetConfiguration:
                              cameraPermissionBottomSheetConfiguration ??
                                  const QrScannerConfiguration(),
                        );
                      }
                    },
                    child: RxBlocBuilder<QrScannerBlocType<T>, bool>(
                      state: (bloc) => bloc.states.hasCameraPermission,
                      builder: (ctx, permission, bloc) =>
                          permission.hasData && permission.data == true
                              ? _QRBarScannerCamera(
                                  formats: const [
                                    BarcodeFormats.QR_CODE,
                                  ],
                                  onError: (ctx, error) {
                                    if (error != null && onError != null) {
                                      onError!(error);
                                    }
                                    return null;
                                  },
                                  qrCodeCallback: (code) {
                                    if (code != null) {
                                      onCodeScanned?.call(code);
                                      bloc.events.validateQRCode(code);
                                    }
                                  },
                                  offscreenBuilder: (ctx) => const SizedBox(),
                                  notStartedBuilder: (ctx) => const SizedBox(),
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
          if (isLoadingIndicatorVisible) ...[
            SizedBox(
              height: spaceBetweenScannerAndLoadingWidget ??
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
                padding: context.qrScannerTheme.qrScannerPage4,
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
    required this.qrCodeCallback,
    required this.onError,
    this.formats,
    this.notStartedBuilder,
    this.offscreenBuilder,
  });

  final WidgetBuilder? notStartedBuilder;
  final WidgetBuilder? offscreenBuilder;
  final ValueChanged<String?> qrCodeCallback;
  final AppErrorCallback onError;
  final List<BarcodeFormats>? formats;

  @override
  Widget build(BuildContext context) => QRBarScannerCamera(
        formats: formats,
        onError: (ctx, error) => FutureBuilder(
          future: _getError(ctx, error.toString()),
          initialData: const SizedBox(),
          builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) =>
              snapshot.data!,
        ),
        notStartedBuilder: notStartedBuilder,
        offscreenBuilder: offscreenBuilder,
        qrCodeCallback: (code) => qrCodeCallback(code),
      );

  Future<Widget> _getError(BuildContext context, String error) async {
    return await Future.delayed(Duration.zero, () {
      return onError(context, error) ?? const SizedBox();
    });
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
