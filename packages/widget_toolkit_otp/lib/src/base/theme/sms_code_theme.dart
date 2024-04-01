import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'sms_code_theme.tailor.dart';

@TailorMixinComponent()
class SmsCodeTheme extends ThemeExtension<SmsCodeTheme>
    with _$SmsCodeThemeTailorMixin {
  const SmsCodeTheme({
    required this.primaryColor,
    required this.defaultBackgroundColor,
    required this.defaultBorderColor,
    required this.defaultBorderWidth,
    required this.defaultBorderRadius,
    required this.defaultTextStyle,
    required this.errorBackgroundColor,
    required this.errorBorderColor,
    required this.errorBorderWidth,
    required this.errorBorderRadius,
    required this.errorTextStyle,
    required this.descriptionBoldTextStyle,
    required this.validityTitleTextStyle,
    required this.successBackgroundColor,
    required this.successBorderColor,
    required this.successBorderWidth,
    required this.successTextStyle,
    required this.disabledBackgroundColor,
    required this.disabledTextStyle,
    required this.submittedBackgroundColor,
    required this.resendButtonLoadingIndicatorSize,
    required this.resendButtonBackgroundColor,
    required this.resendButtonActiveTextColor,
    required this.resendButtonDisabledTextColor,
    required this.resendButtonSuccessTextColor,
    required this.resendButtonErrorTextColor,
    required this.resendButtonPressedColor,
    required this.gray,
    required this.captionBold,
    required this.resendButtonDefaultTextStyle,
  });

  /// region Themes

  SmsCodeTheme.light()
      : primaryColor = const Color(0xff2196f3),
        defaultBackgroundColor = const Color.fromRGBO(222, 231, 240, .57),
        defaultBorderColor = Colors.black54.withOpacity(0.4),
        defaultBorderWidth = 1.5,
        defaultBorderRadius = const BorderRadius.all(Radius.circular(8)),
        defaultTextStyle = const TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
        errorBackgroundColor = Colors.redAccent.withOpacity(0.3),
        errorBorderColor = Colors.red,
        errorBorderWidth = 2,
        errorBorderRadius = const BorderRadius.all(Radius.circular(8)),
        errorTextStyle = const TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
        descriptionBoldTextStyle =
            const TextStyle(fontSize: 14, color: Colors.black, height: 1.6),
        validityTitleTextStyle =
            const TextStyle(fontSize: 14, color: Colors.black, height: 1.6),
        successBackgroundColor = Colors.greenAccent.withOpacity(0.3),
        successBorderColor = Colors.green,
        successBorderWidth = 2,
        successTextStyle = const TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
        disabledBackgroundColor = const Color.fromRGBO(222, 231, 240, .18),
        disabledTextStyle = const TextStyle(
          fontSize: 18,
          color: Color.fromRGBO(0, 0, 0, .3),
        ),
        submittedBackgroundColor = const Color.fromRGBO(222, 231, 240, .9),
        resendButtonLoadingIndicatorSize = 16,
        resendButtonBackgroundColor = Colors.transparent,
        resendButtonActiveTextColor = const Color(0xff2196f3),
        resendButtonDisabledTextColor = const Color(0xff9da2a6),
        resendButtonSuccessTextColor = Colors.green,
        resendButtonErrorTextColor = Colors.red,
        resendButtonPressedColor = Colors.transparent,
        gray = const Color(0xff9da2a6),
        captionBold = const TextStyle(
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            letterSpacing: 0.8,
            fontSize: 10.0),
        resendButtonDefaultTextStyle = const TextStyle(
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            letterSpacing: 0.8,
            fontSize: 10.0);

  SmsCodeTheme.dark()
      : primaryColor = const Color(0xffce93d8),
        defaultBackgroundColor = const Color.fromRGBO(222, 231, 240, .9),
        defaultBorderColor = Colors.black54.withOpacity(0.4),
        defaultBorderWidth = 1.5,
        defaultBorderRadius = const BorderRadius.all(Radius.circular(8)),
        defaultTextStyle = const TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
        errorBackgroundColor = Colors.redAccent.withOpacity(0.3),
        errorBorderColor = Colors.red,
        errorBorderWidth = 2,
        errorBorderRadius = const BorderRadius.all(Radius.circular(8)),
        errorTextStyle = const TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
        descriptionBoldTextStyle =
            const TextStyle(fontSize: 14, color: Colors.white, height: 1.6),
        validityTitleTextStyle =
            const TextStyle(fontSize: 14, color: Colors.white, height: 1.6),
        successBackgroundColor = Colors.greenAccent.withOpacity(0.3),
        successBorderColor = Colors.green,
        successBorderWidth = 2,
        successTextStyle = const TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
        disabledBackgroundColor = const Color.fromRGBO(222, 231, 240, .3),
        disabledTextStyle = const TextStyle(
          fontSize: 18,
          color: Color.fromRGBO(0, 0, 0, .3),
        ),
        submittedBackgroundColor = const Color.fromRGBO(222, 231, 240, .57),
        resendButtonLoadingIndicatorSize = 16,
        resendButtonBackgroundColor = Colors.transparent,
        resendButtonActiveTextColor = const Color(0xffce93d8),
        resendButtonDisabledTextColor = const Color(0xff9da2a6),
        resendButtonSuccessTextColor = Colors.green,
        resendButtonErrorTextColor = Colors.red,
        resendButtonPressedColor = Colors.transparent,
        gray = const Color(0xff9da2a6),
        captionBold = const TextStyle(
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            letterSpacing: 0.8,
            fontSize: 10.0),
        resendButtonDefaultTextStyle = const TextStyle(
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            letterSpacing: 0.8,
            fontSize: 10.0);

  /// endregion

  @override
  final Color primaryColor;
  @override
  final Color defaultBackgroundColor;
  @override
  final Color defaultBorderColor;
  @override
  final double defaultBorderWidth;
  @override
  final BorderRadius defaultBorderRadius;
  @override
  final TextStyle? defaultTextStyle;
  @override
  final Color errorBackgroundColor;
  @override
  final Color errorBorderColor;
  @override
  final double errorBorderWidth;
  @override
  final BorderRadius errorBorderRadius;
  @override
  final TextStyle? errorTextStyle;
  @override
  final TextStyle? descriptionBoldTextStyle;
  @override
  final TextStyle? validityTitleTextStyle;
  @override
  final Color successBackgroundColor;
  @override
  final Color successBorderColor;
  @override
  final double successBorderWidth;
  @override
  final TextStyle? successTextStyle;
  @override
  final Color disabledBackgroundColor;
  @override
  final TextStyle? disabledTextStyle;
  @override
  final Color submittedBackgroundColor;
  @override
  final double resendButtonLoadingIndicatorSize;
  @override
  final Color resendButtonBackgroundColor;
  @override
  final Color resendButtonActiveTextColor;
  @override
  final Color resendButtonDisabledTextColor;
  @override
  final Color resendButtonSuccessTextColor;
  @override
  final Color resendButtonErrorTextColor;
  @override
  final Color resendButtonPressedColor;
  @override
  final Color gray;
  @override
  final TextStyle captionBold;
  @override
  final TextStyle resendButtonDefaultTextStyle;
}

extension SmsCodeThemeContextExtension on BuildContext {
  /// Returns a reference to the [SmsCodeTheme] theme extension of the current [Theme]
  SmsCodeTheme get smsCodeTheme {
    final theme = Theme.of(this).extension<SmsCodeTheme>();
    if (theme == null) {
      throw UnimplementedError(
        'Not Implemented SmsCodeTheme. '
        'Please add it as extension to the MaterialApp -> ThemeData',
      );
    }

    return theme;
  }
}
