import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'sms_code_theme.tailor.dart';

/// Theme extension that holds typography, PIN-cell chrome, and resend-button
/// tokens for SMS OTP flows. Register an instance on [ThemeData.extensions] so
/// [SmsCodeField], [ResendCodeButton], [AutomatedResendCodeButton], and
/// [ValidityWidget] can resolve shared colors and styles, and reuse the same
/// values in host-built layouts via [BuildContext.smsCodeTheme].
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
    required this.captionBold,
    required this.resendButtonDefaultTextStyle,
  });

  /// region Themes

  SmsCodeTheme.light()
      : primaryColor = const Color(0xff2196f3),
        defaultBackgroundColor = const Color.fromRGBO(222, 231, 240, .57),
        defaultBorderColor = Colors.black54.withValues(alpha: 0.4),
        defaultBorderWidth = 1.5,
        defaultBorderRadius = const BorderRadius.all(Radius.circular(8)),
        defaultTextStyle = const TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
        errorBackgroundColor = Colors.redAccent.withValues(alpha: 0.3),
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
        successBackgroundColor = Colors.greenAccent.withValues(alpha: 0.3),
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
        defaultBorderColor = Colors.black54.withValues(alpha: 0.4),
        defaultBorderWidth = 1.5,
        defaultBorderRadius = const BorderRadius.all(Radius.circular(8)),
        defaultTextStyle = const TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
        errorBackgroundColor = Colors.redAccent.withValues(alpha: 0.3),
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
        successBackgroundColor = Colors.greenAccent.withValues(alpha: 0.3),
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

  /// Accent color for OTP-related UI so hosts can line up OTP screens with app
  /// branding when composing custom widgets next to [SmsCodeField] or resend
  /// actions.
  @override
  final Color primaryColor;

  /// Fill color for each digit cell when [SmsCodeField] falls back to generic
  /// [PinTheme] styling in `sms_code_field.dart` instead of a custom
  /// [SmsFieldTheme] entry.
  @override
  final Color defaultBackgroundColor;

  /// Border color for those generic PIN cells in `sms_code_field.dart` when a
  /// border is shown.
  @override
  final Color defaultBorderColor;

  /// Border stroke width paired with [defaultBorderColor] for generic PIN cells
  /// in `sms_code_field.dart`.
  @override
  final double defaultBorderWidth;

  /// Corner radius for generic PIN cells in `sms_code_field.dart`, including
  /// default, focused, submitted, unfilled, error, and success fallbacks that
  /// all route through the shared helper there.
  @override
  final BorderRadius defaultBorderRadius;

  /// Typography inside each PIN cell when [SmsCodeField] uses theme-driven
  /// generic styling in `sms_code_field.dart`.
  @override
  final TextStyle? defaultTextStyle;

  /// Cell background when [SmsCodeField] paints an error fallback in
  /// `sms_code_field.dart` after verification fails.
  @override
  final Color errorBackgroundColor;

  /// Cell border color for that error fallback path in `sms_code_field.dart`.
  @override
  final Color errorBorderColor;

  /// Cell border width for the error fallback path in `sms_code_field.dart`.
  @override
  final double errorBorderWidth;

  /// Corner radius token aimed at error-state PIN decorations; hosts can read
  /// it when they build custom [SmsFieldTheme] or container shapes that should
  /// stay visually consistent with the packaged error palette.
  @override
  final BorderRadius errorBorderRadius;

  /// Digit text style for the error fallback path in `sms_code_field.dart`.
  @override
  final TextStyle? errorTextStyle;

  /// Heavier body style for instructional copy around the OTP step; hosts can
  /// apply it beside [SmsCodeField] or timers so helper text matches package
  /// typography.
  @override
  final TextStyle? descriptionBoldTextStyle;

  /// Style for the title line above the remaining validity interval in
  /// [ValidityWidget] when `validity_widget.dart` builds its default column.
  @override
  final TextStyle? validityTitleTextStyle;

  /// Cell background when [SmsCodeField] shows a successful verification
  /// fallback in `sms_code_field.dart`.
  @override
  final Color successBackgroundColor;

  /// Cell border color for the success fallback in `sms_code_field.dart`.
  @override
  final Color successBorderColor;

  /// Cell border width for the success fallback in `sms_code_field.dart`.
  @override
  final double successBorderWidth;

  /// Digit text style for the success fallback in `sms_code_field.dart`.
  @override
  final TextStyle? successTextStyle;

  /// Cell background when [SmsCodeField] renders digits as non-interactive after
  /// the bloc reports a disabled flow state in `sms_code_field.dart`.
  @override
  final Color disabledBackgroundColor;

  /// Digit text style paired with [disabledBackgroundColor] for that disabled
  /// fallback in `sms_code_field.dart`.
  @override
  final TextStyle? disabledTextStyle;

  /// Cell background for already-filled digits in [SmsCodeField] when the theme
  /// uses generic submitted styling in `sms_code_field.dart`.
  @override
  final Color submittedBackgroundColor;

  /// Width and height of the loading indicator in [ResendCodeButton] and
  /// [AutomatedResendCodeButton] when `resend_code_button.dart` and
  /// `automated_resend_code_button.dart` wrap a [SizedLoadingIndicator].
  @override
  final double resendButtonLoadingIndicatorSize;

  /// Gradient start color passed into [ButtonColorStyle.fromContext] for resend
  /// buttons in `resend_code_button.dart` and `automated_resend_code_button.dart`.
  @override
  final Color resendButtonBackgroundColor;

  /// Label and icon color for an enabled resend affordance in
  /// `resend_code_button.dart` and `automated_resend_code_button.dart`.
  @override
  final Color resendButtonActiveTextColor;

  /// Muted label and icon color while throttling, loading, or blocking resend in
  /// those same widgets.
  @override
  final Color resendButtonDisabledTextColor;

  /// Accent for the short-lived sent acknowledgement state in
  /// `resend_code_button.dart`.
  @override
  final Color resendButtonSuccessTextColor;

  /// Accent when resend fails and the button surfaces a recoverable error in
  /// `resend_code_button.dart`.
  @override
  final Color resendButtonErrorTextColor;

  /// Pressed-surface color forwarded to [ButtonColorStyle.fromContext] for
  /// ripple and fill alignment on resend buttons in `resend_code_button.dart`
  /// and `automated_resend_code_button.dart`.
  @override
  final Color resendButtonPressedColor;

  /// Compact emphasized style for captions; hosts can pair it with
  /// [resendButtonDefaultTextStyle] for consistent small labels near resend or
  /// helper rows.
  @override
  final TextStyle captionBold;

  /// Base text style merged with per-state colors on [IconTextButton] labels in
  /// `resend_code_button.dart` and `automated_resend_code_button.dart`.
  @override
  final TextStyle resendButtonDefaultTextStyle;
}

extension SmsCodeThemeContextExtension on BuildContext {
  /// Resolves the [SmsCodeTheme] registered on the ambient [ThemeData] so OTP
  /// widgets and host code share the same extension instance.
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
