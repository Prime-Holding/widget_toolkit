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

/// Column layout that hosts [MobileScanner] behind the scan-area SVG from [QrScannerTheme],
/// wires bloc listeners for permission gating and QR validation, and optionally renders
/// [PrimeLinearProgressIndicator] below the viewport while validation runs.
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

  /// Forwards camera pipeline or validation failures to host widgets so they can log,
  /// present recovery UI, or halt scanning without crashing the subtree.
  final Function(Object)? onError;

  /// Receives decoded QR strings from [MobileScanner.onDetect] prior to throttled calls into
  /// [QrScannerBlocEvents.validateQRCode].
  final Function(String)? onCodeScanned;

  /// Surfaces successful generic validation results emitted by [QrScannerBlocStates.scannedValue].
  final Function(T?)? onCodeValidated;

  /// Controls whether the bloc-driven loading strip rendered by [PrimeLinearProgressIndicator]
  /// appears beneath the square viewport while [QrScannerBlocStates.isLoading] stays true.
  final bool isLoadingIndicatorVisible;

  /// Forwarded into showAppCameraPermissionBottomSheet as the primary call-to-action label when
  /// [QrScannerBlocStates.hasCameraPermission] becomes false.
  final String? cameraPermissionButtonText;

  /// Forwarded into the bordered permission card as the headline styled with [QrScannerTheme.captionBold].
  final String? cameraAccessTitleText;

  /// Forwarded into the explanatory paragraph styled with [QrScannerTheme.descriptionThin].
  final String? cameraAccessLabelText;

  /// Modal chrome applied when the listener opens showAppCameraPermissionBottomSheet; defaults to an
  /// empty [QrScannerConfiguration] when absent so callers still configure dismissal behavior explicitly.
  final QrScannerConfiguration? cameraPermissionBottomSheetConfiguration;

  /// Overrides the vertical spacer above [PrimeLinearProgressIndicator]; when null this widget
  /// reads spacingL from the host Widget Toolkit theme via widgetToolkitTheme on [BuildContext].
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

/// Values forwarded into widget_toolkit ModalConfiguration when presenting camera permission UI from
/// `camera_permission.dart`.
class QrScannerConfiguration {
  const QrScannerConfiguration({
    this.showCloseButton = true,
    this.fullScreen = false,
    this.safeAreaBottom = false,
    this.showHeaderPill = false,
    this.isDismissible = true,
  });

  /// Requests the blurred sheet renderer to show the standard close icon alongside header chrome.
  final bool showCloseButton;

  /// Expands the sheet to occupy the full viewport height similar to other Widget Toolkit immersive flows.
  final bool fullScreen;

  /// Applies bottom safe-area padding within the modal scaffold when hosting controls near the home indicator.
  final bool safeAreaBottom;

  /// Toggles the grabber-style pill rendered above sheet content for modal affordance cues.
  final bool showHeaderPill;

  /// Allows swipe-to-dismiss and barrier taps to close the sheet when true; hosts disable this when flows must remain modal until permission resolves.
  final bool isDismissible;
}
