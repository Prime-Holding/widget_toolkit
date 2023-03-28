import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'sms_code_theme.tailor.dart';

@Tailor(themeGetter: ThemeGetter.none)
class _$SmsCodeTheme {
  /// region Default state

  static List<Color> primaryColor = [
    const Color(0xff2196f3),
    const Color(0xffce93d8),
  ];

  static List<Color> defaultBackgroundColor = [
    const Color.fromRGBO(222, 231, 240, .57),
    const Color.fromRGBO(222, 231, 240, .9),
  ];

  static List<Color> defaultBorderColor = [
    Colors.black54.withOpacity(0.4),
    Colors.black54.withOpacity(0.4),
  ];

  static List<double> defaultBorderWidth = [1.5, 1.5];

  static List<BorderRadius> defaultBorderRadius = [
    const BorderRadius.all(Radius.circular(8)),
    const BorderRadius.all(Radius.circular(8)),
  ];

  static List<TextStyle?> defaultTextStyle = [
    const TextStyle(
      fontSize: 18,
      color: Colors.black,
    ),
    const TextStyle(
      fontSize: 18,
      color: Colors.white,
    ),
  ];

  /// endregion

  /// region Error state

  static List<Color> errorBackgroundColor = [
    Colors.redAccent.withOpacity(0.3),
    Colors.redAccent.withOpacity(0.3),
  ];

  static List<Color> errorBorderColor = [
    Colors.red,
    Colors.red,
  ];

  static List<double> errorBorderWidth = [2, 2];

  static List<BorderRadius> errorBorderRadius = [
    const BorderRadius.all(Radius.circular(8)),
    const BorderRadius.all(Radius.circular(8)),
  ];

  static List<TextStyle?> errorTextStyle = [
    const TextStyle(
      fontSize: 18,
      color: Colors.black,
    ),
    const TextStyle(
      fontSize: 18,
      color: Colors.white,
    ),
  ];

  static List<TextStyle?> descriptionBoldTextStyle = [
    const TextStyle(fontSize: 14, color: Colors.black, height: 1.6),
    const TextStyle(fontSize: 14, color: Colors.white, height: 1.6),
  ];

  static List<TextStyle?> validityTitleTextStyle = descriptionBoldTextStyle;

  /// endregion

  /// region Success state

  static List<Color> successBackgroundColor = [
    Colors.greenAccent.withOpacity(0.3),
    Colors.greenAccent.withOpacity(0.3),
  ];

  static List<Color> successBorderColor = [
    Colors.green,
    Colors.green,
  ];

  static List<double> successBorderWidth = [2, 2];

  static List<TextStyle?> successTextStyle = [
    const TextStyle(
      fontSize: 18,
      color: Colors.black,
    ),
    const TextStyle(
      fontSize: 18,
      color: Colors.white,
    ),
  ];

  /// endregion

  /// region Disabled state

  static List<Color> disabledBackgroundColor = [
    const Color.fromRGBO(222, 231, 240, .18),
    const Color.fromRGBO(222, 231, 240, .3),
  ];

  static List<TextStyle?> disabledTextStyle = [
    const TextStyle(
      fontSize: 18,
      color: Color.fromRGBO(0, 0, 0, .3),
    ),
    const TextStyle(
      fontSize: 18,
      color: Color.fromRGBO(0, 0, 0, .3),
    ),
  ];

  /// endregion

  /// region Submitted state

  static List<Color> submittedBackgroundColor = [
    const Color.fromRGBO(222, 231, 240, .9),
    const Color.fromRGBO(222, 231, 240, .57),
  ];

  /// endregion

  /// region Resend button

  static List<double> resendButtonLoadingIndicatorSize = [16, 16];

  static List<Color> resendButtonBackgroundColor = [
    Colors.transparent,
    Colors.transparent
  ];

  static List<Color> resendButtonActiveTextColor = primaryColor;

  static List<Color> resendButtonDisabledTextColor = [gray, gray];

  static List<Color> resendButtonSuccessTextColor = [
    Colors.green,
    Colors.green
  ];

  static List<Color> resendButtonErrorTextColor = [Colors.red, Colors.red];

  static List<Color> resendButtonPressedColor = [
    Colors.transparent,
    Colors.transparent
  ];

  /// endregion

  static Color gray = const Color(0xff9da2a6);

  static TextStyle captionBold = const TextStyle(
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.8,
      fontSize: 10.0);

  static List<TextStyle> resendButtonDefaultTextStyle = [
    captionBold,
    captionBold
  ];
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
