import 'package:flutter/material.dart';

import '../theme/widget_toolkit_theme.dart';
import 'buttons/button_color_style.dart';
import 'buttons/button_state.dart';
import 'buttons/gradient_fill_button.dart';

/// ErrorCardWidget is an error widget presenting an error as a widget.
/// It provides an option to display a retry button in case the user wants to
/// repeat an operation.
///
/// A [text] or an [exception] must be provided in order for the error to be
/// displayed. In case an [exception] is provided, the message can be customized
/// with the [exceptionTextBuilder] which takes the exception and returns a
/// string which can be customized.
///
/// You can also specify the [errorMessageBuilder] static function which will
/// be used for converting all exceptions to string, in case you don't want to
/// define specific [exceptionTextBuilder]s for each widget. The function will
/// be used on an app level and will not be applied if an [exceptionTextBuilder]
/// is defined for the widget.
///
/// An optional [header] widget can be provided which will be displayed above
/// the message which will replace the default error icon.
///
/// In case you want to display a retry button, you can do that by setting the
/// [retryButtonVisible] flag to `true`. You can customize the text and color of
/// the retry button by providing a [retryButtonText] and a [retryButtonColorStyle]
/// for the widget.
///
/// Once the button is pressed, the [onRetryPressed] callback is executed. Also,
/// you can set the state of the button with the [retryButtonState] in case you
/// want to disable it or display an inactive state.
class ErrorCardWidget extends StatelessWidget {
  const ErrorCardWidget({
    this.text,
    this.exception,
    this.exceptionTextBuilder,
    this.header,
    this.onRetryPressed,
    this.retryButtonColorStyle,
    this.retryButtonText = 'Retry',
    this.retryButtonVisible = false,
    this.retryButtonState = ButtonStateModel.enabled,
    this.verticalAxisAlignment = MainAxisAlignment.start,
    super.key,
  }) : assert(
          text != null || exception != null,
          'Either text or an exception is required for the ErrorCardWidget'
          ' widget to display an error message.',
        );

  /// The [text] to be displayed, if no [exception] is provided
  final String? text;

  /// An [exception] to be displayed, if no [text] is provided
  final Exception? exception;

  /// A builder function which converts an exception into a presentable string
  final String Function(BuildContext, Exception)? exceptionTextBuilder;

  /// The text displayed on the retry button
  final String retryButtonText;

  /// The callback executed once the retry button has been pressed
  final VoidCallback? onRetryPressed;

  /// The header widget displayed above the error
  final Widget? header;

  /// The color style of the retry button
  final ButtonColorStyle? retryButtonColorStyle;

  /// Flag indicating whether or not to display the retry button
  final bool retryButtonVisible;

  /// The state of the retry button
  final ButtonStateModel retryButtonState;

  /// The vertical alignment of the contents of the widget
  final MainAxisAlignment verticalAxisAlignment;

  /// Static function which translates an exception and returns a string. Useful
  /// in case you want to define a single function and use it throughout the app
  static String Function(BuildContext, Exception)? errorMessageBuilder;

  /// The exception builder function which converts an exception to a string
  String Function(BuildContext, Exception) get _stringExceptionBuilder =>
      exceptionTextBuilder ??
      (errorMessageBuilder ?? (_, Exception e) => e.toString());

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: verticalAxisAlignment,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: context.widgetToolkitTheme.errorCardBackgroundColor,
              borderRadius: BorderRadius.circular(
                16,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: double.infinity),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 24,
                    bottom: 12,
                  ),
                  child: header ??
                      Icon(
                        Icons.warning,
                        color: context.widgetToolkitTheme.errorCardIconColor,
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 22,
                    right: 16,
                    bottom: 22,
                  ),
                  child: Text(
                    _buildErrorText(context),
                    style: context.widgetToolkitTheme.descriptionBold.copyWith(
                      color: context.widgetToolkitTheme.errorCardTextColor,
                      letterSpacing: 1.1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          if (retryButtonVisible)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: GradientFillButton(
                text: retryButtonText,
                onPressed: onRetryPressed,
                colorStyle: retryButtonColorStyle,
                radius: 24,
                elevation: 8,
                state: retryButtonState,
              ),
            ),
        ],
      );

  String _buildErrorText(BuildContext context) {
    /// If text is provided, return it
    if (text != null) return text!;

    /// Else, build the text from the exception
    return _stringExceptionBuilder(context, exception!);
  }
}
