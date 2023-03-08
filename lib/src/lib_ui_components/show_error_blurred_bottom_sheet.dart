import 'package:flutter/material.dart';

import 'buttons/button_state.dart';
import 'error_card_widget.dart';
import 'show_blurred_bottom_sheet.dart';

/// Displays a customizable modal sheet with a background blur effect. Requires
/// an [error] which will be presented on the modal sheet, with an optional
/// retry functionality.
///
/// The [retryCallback] will be executed by pressing on the retry button. If
/// this parameter is not supplied or is set to `null`, no retry button will be
/// displayed.
///
/// The [retryButtonText] will replace the original text of the retry button,
/// if visible.
///
/// With [headerWidget] and [footerWidget], you can add your own widgets before
/// and after the error widget. If the [retryCallback] is specified and the
/// retry button is visible, the [footerWidget] will be build below the retry
/// button.
///
/// With [configuration] property you can set up how the ModalBottomSheet will
/// appear. It refers to the default ModalConfiguration, but doesn't show
/// close button and allows more then one sheets.
///
/// The [image] is a widget that will be placed on top of the error message in
/// the error message box.
Future<T?> showErrorBlurredBottomSheet<T>({
  required BuildContext context,
  required String error,
  Widget? headerWidget,
  Widget? footerWidget,
  Widget? image,
  Function(BuildContext)? retryCallback,
  Function()? onCancelCallback,
  ModalConfiguration configuration =
      const ModalConfiguration(showCloseButton: false),
  String retryButtonText = 'Retry',
  ButtonStateModel? retryButtonState,
}) =>
    showBlurredBottomSheet<T>(
      context: context,
      onCancelPressed: onCancelCallback,
      configuration: configuration,
      builder: (ctx) => WillPopScope(
        onWillPop: () => Future.value(false),
        child: _ErrorModalContent(
          error: error,
          titleWidget: headerWidget,
          footerWidget: footerWidget,
          tryAgainCallback: retryCallback,
          messageHeader: image,
          retryButtonText: retryButtonText,
          retryButtonState: retryButtonState,
        ),
      ),
    );

class _ErrorModalContent extends StatelessWidget {
  const _ErrorModalContent({
    required this.error,
    required this.retryButtonText,
    this.titleWidget,
    this.footerWidget,
    this.messageHeader,
    this.tryAgainCallback,
    this.retryButtonState,
  });

  /// The error to be handled
  final String error;

  /// The widget displayed above the error message
  final Widget? titleWidget;

  /// The widget displayed below the retry button
  final Widget? footerWidget;

  /// The image to be used instead of the error icon
  final Widget? messageHeader;

  /// Callback triggered on when the retry button has been pressed. If this is
  /// set to `null` the retry button won't be displayed.
  final Function(BuildContext)? tryAgainCallback;

  /// The text displayed on the retry button
  final String retryButtonText;

  /// Use [retryButtonState] to toggle the state of the retry button. Defaults to
  /// ButtonStateModel.enabled
  final ButtonStateModel? retryButtonState;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            if (titleWidget != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: titleWidget!,
              ),
            ErrorCardWidget(
              text: error,
              header: messageHeader,
              retryButtonVisible: tryAgainCallback != null,
              onRetryPressed: () {
                tryAgainCallback?.call(context);
                Navigator.of(context).pop();
              },
              retryButtonState: retryButtonState ?? ButtonStateModel.enabled,
              retryButtonText: retryButtonText,
            ),
            if (footerWidget != null) footerWidget!,
          ],
        ),
      );
}
