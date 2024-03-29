import 'package:flutter/material.dart';

import '../base/theme/widget_toolkit_theme.dart';
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
      builder: (ctx) => PopScope(
        canPop: false,
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

class _ErrorModalContent extends StatefulWidget {
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
  State<_ErrorModalContent> createState() => _ErrorModalContentState();
}

class _ErrorModalContentState extends State<_ErrorModalContent> {
  late bool isButtonLoading = false;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.titleWidget != null)
            Padding(
              padding: context.widgetToolkitTheme.errorModalContentTitleInsets,
              child: widget.titleWidget!,
            ),
          ErrorCardWidget(
            text: widget.error,
            header: widget.messageHeader,
            retryButtonVisible: widget.tryAgainCallback != null,
            onRetryPressed: () async {
              setState(() {
                isButtonLoading = true;
              });
              await widget.tryAgainCallback?.call(context);
              setState(() {
                isButtonLoading = false;
              });
            },
            retryButtonState: widget.retryButtonState ??
                (isButtonLoading
                    ? ButtonStateModel.loading
                    : ButtonStateModel.enabled),
            retryButtonText: widget.retryButtonText,
          ),
          if (widget.footerWidget != null) widget.footerWidget!,
        ],
      );
}
