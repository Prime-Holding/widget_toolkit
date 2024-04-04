// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'sms_code_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$SmsCodeThemeTailorMixin on ThemeExtension<SmsCodeTheme> {
  Color get primaryColor;
  Color get defaultBackgroundColor;
  Color get defaultBorderColor;
  double get defaultBorderWidth;
  BorderRadius get defaultBorderRadius;
  TextStyle? get defaultTextStyle;
  Color get errorBackgroundColor;
  Color get errorBorderColor;
  double get errorBorderWidth;
  BorderRadius get errorBorderRadius;
  TextStyle? get errorTextStyle;
  TextStyle? get descriptionBoldTextStyle;
  TextStyle? get validityTitleTextStyle;
  Color get successBackgroundColor;
  Color get successBorderColor;
  double get successBorderWidth;
  TextStyle? get successTextStyle;
  Color get disabledBackgroundColor;
  TextStyle? get disabledTextStyle;
  Color get submittedBackgroundColor;
  double get resendButtonLoadingIndicatorSize;
  Color get resendButtonBackgroundColor;
  Color get resendButtonActiveTextColor;
  Color get resendButtonDisabledTextColor;
  Color get resendButtonSuccessTextColor;
  Color get resendButtonErrorTextColor;
  Color get resendButtonPressedColor;
  TextStyle get captionBold;
  TextStyle get resendButtonDefaultTextStyle;

  @override
  SmsCodeTheme copyWith({
    Color? primaryColor,
    Color? defaultBackgroundColor,
    Color? defaultBorderColor,
    double? defaultBorderWidth,
    BorderRadius? defaultBorderRadius,
    TextStyle? defaultTextStyle,
    Color? errorBackgroundColor,
    Color? errorBorderColor,
    double? errorBorderWidth,
    BorderRadius? errorBorderRadius,
    TextStyle? errorTextStyle,
    TextStyle? descriptionBoldTextStyle,
    TextStyle? validityTitleTextStyle,
    Color? successBackgroundColor,
    Color? successBorderColor,
    double? successBorderWidth,
    TextStyle? successTextStyle,
    Color? disabledBackgroundColor,
    TextStyle? disabledTextStyle,
    Color? submittedBackgroundColor,
    double? resendButtonLoadingIndicatorSize,
    Color? resendButtonBackgroundColor,
    Color? resendButtonActiveTextColor,
    Color? resendButtonDisabledTextColor,
    Color? resendButtonSuccessTextColor,
    Color? resendButtonErrorTextColor,
    Color? resendButtonPressedColor,
    TextStyle? captionBold,
    TextStyle? resendButtonDefaultTextStyle,
  }) {
    return SmsCodeTheme(
      primaryColor: primaryColor ?? this.primaryColor,
      defaultBackgroundColor:
          defaultBackgroundColor ?? this.defaultBackgroundColor,
      defaultBorderColor: defaultBorderColor ?? this.defaultBorderColor,
      defaultBorderWidth: defaultBorderWidth ?? this.defaultBorderWidth,
      defaultBorderRadius: defaultBorderRadius ?? this.defaultBorderRadius,
      defaultTextStyle: defaultTextStyle ?? this.defaultTextStyle,
      errorBackgroundColor: errorBackgroundColor ?? this.errorBackgroundColor,
      errorBorderColor: errorBorderColor ?? this.errorBorderColor,
      errorBorderWidth: errorBorderWidth ?? this.errorBorderWidth,
      errorBorderRadius: errorBorderRadius ?? this.errorBorderRadius,
      errorTextStyle: errorTextStyle ?? this.errorTextStyle,
      descriptionBoldTextStyle:
          descriptionBoldTextStyle ?? this.descriptionBoldTextStyle,
      validityTitleTextStyle:
          validityTitleTextStyle ?? this.validityTitleTextStyle,
      successBackgroundColor:
          successBackgroundColor ?? this.successBackgroundColor,
      successBorderColor: successBorderColor ?? this.successBorderColor,
      successBorderWidth: successBorderWidth ?? this.successBorderWidth,
      successTextStyle: successTextStyle ?? this.successTextStyle,
      disabledBackgroundColor:
          disabledBackgroundColor ?? this.disabledBackgroundColor,
      disabledTextStyle: disabledTextStyle ?? this.disabledTextStyle,
      submittedBackgroundColor:
          submittedBackgroundColor ?? this.submittedBackgroundColor,
      resendButtonLoadingIndicatorSize: resendButtonLoadingIndicatorSize ??
          this.resendButtonLoadingIndicatorSize,
      resendButtonBackgroundColor:
          resendButtonBackgroundColor ?? this.resendButtonBackgroundColor,
      resendButtonActiveTextColor:
          resendButtonActiveTextColor ?? this.resendButtonActiveTextColor,
      resendButtonDisabledTextColor:
          resendButtonDisabledTextColor ?? this.resendButtonDisabledTextColor,
      resendButtonSuccessTextColor:
          resendButtonSuccessTextColor ?? this.resendButtonSuccessTextColor,
      resendButtonErrorTextColor:
          resendButtonErrorTextColor ?? this.resendButtonErrorTextColor,
      resendButtonPressedColor:
          resendButtonPressedColor ?? this.resendButtonPressedColor,
      captionBold: captionBold ?? this.captionBold,
      resendButtonDefaultTextStyle:
          resendButtonDefaultTextStyle ?? this.resendButtonDefaultTextStyle,
    );
  }

  @override
  SmsCodeTheme lerp(covariant ThemeExtension<SmsCodeTheme>? other, double t) {
    if (other is! SmsCodeTheme) return this as SmsCodeTheme;
    return SmsCodeTheme(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      defaultBackgroundColor:
          Color.lerp(defaultBackgroundColor, other.defaultBackgroundColor, t)!,
      defaultBorderColor:
          Color.lerp(defaultBorderColor, other.defaultBorderColor, t)!,
      defaultBorderWidth:
          t < 0.5 ? defaultBorderWidth : other.defaultBorderWidth,
      defaultBorderRadius:
          t < 0.5 ? defaultBorderRadius : other.defaultBorderRadius,
      defaultTextStyle:
          TextStyle.lerp(defaultTextStyle, other.defaultTextStyle, t),
      errorBackgroundColor:
          Color.lerp(errorBackgroundColor, other.errorBackgroundColor, t)!,
      errorBorderColor:
          Color.lerp(errorBorderColor, other.errorBorderColor, t)!,
      errorBorderWidth: t < 0.5 ? errorBorderWidth : other.errorBorderWidth,
      errorBorderRadius: t < 0.5 ? errorBorderRadius : other.errorBorderRadius,
      errorTextStyle: TextStyle.lerp(errorTextStyle, other.errorTextStyle, t),
      descriptionBoldTextStyle: TextStyle.lerp(
          descriptionBoldTextStyle, other.descriptionBoldTextStyle, t),
      validityTitleTextStyle: TextStyle.lerp(
          validityTitleTextStyle, other.validityTitleTextStyle, t),
      successBackgroundColor:
          Color.lerp(successBackgroundColor, other.successBackgroundColor, t)!,
      successBorderColor:
          Color.lerp(successBorderColor, other.successBorderColor, t)!,
      successBorderWidth:
          t < 0.5 ? successBorderWidth : other.successBorderWidth,
      successTextStyle:
          TextStyle.lerp(successTextStyle, other.successTextStyle, t),
      disabledBackgroundColor: Color.lerp(
          disabledBackgroundColor, other.disabledBackgroundColor, t)!,
      disabledTextStyle:
          TextStyle.lerp(disabledTextStyle, other.disabledTextStyle, t),
      submittedBackgroundColor: Color.lerp(
          submittedBackgroundColor, other.submittedBackgroundColor, t)!,
      resendButtonLoadingIndicatorSize: t < 0.5
          ? resendButtonLoadingIndicatorSize
          : other.resendButtonLoadingIndicatorSize,
      resendButtonBackgroundColor: Color.lerp(
          resendButtonBackgroundColor, other.resendButtonBackgroundColor, t)!,
      resendButtonActiveTextColor: Color.lerp(
          resendButtonActiveTextColor, other.resendButtonActiveTextColor, t)!,
      resendButtonDisabledTextColor: Color.lerp(resendButtonDisabledTextColor,
          other.resendButtonDisabledTextColor, t)!,
      resendButtonSuccessTextColor: Color.lerp(
          resendButtonSuccessTextColor, other.resendButtonSuccessTextColor, t)!,
      resendButtonErrorTextColor: Color.lerp(
          resendButtonErrorTextColor, other.resendButtonErrorTextColor, t)!,
      resendButtonPressedColor: Color.lerp(
          resendButtonPressedColor, other.resendButtonPressedColor, t)!,
      captionBold: TextStyle.lerp(captionBold, other.captionBold, t)!,
      resendButtonDefaultTextStyle: TextStyle.lerp(
          resendButtonDefaultTextStyle, other.resendButtonDefaultTextStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SmsCodeTheme &&
            const DeepCollectionEquality()
                .equals(primaryColor, other.primaryColor) &&
            const DeepCollectionEquality()
                .equals(defaultBackgroundColor, other.defaultBackgroundColor) &&
            const DeepCollectionEquality()
                .equals(defaultBorderColor, other.defaultBorderColor) &&
            const DeepCollectionEquality()
                .equals(defaultBorderWidth, other.defaultBorderWidth) &&
            const DeepCollectionEquality()
                .equals(defaultBorderRadius, other.defaultBorderRadius) &&
            const DeepCollectionEquality()
                .equals(defaultTextStyle, other.defaultTextStyle) &&
            const DeepCollectionEquality()
                .equals(errorBackgroundColor, other.errorBackgroundColor) &&
            const DeepCollectionEquality()
                .equals(errorBorderColor, other.errorBorderColor) &&
            const DeepCollectionEquality()
                .equals(errorBorderWidth, other.errorBorderWidth) &&
            const DeepCollectionEquality()
                .equals(errorBorderRadius, other.errorBorderRadius) &&
            const DeepCollectionEquality()
                .equals(errorTextStyle, other.errorTextStyle) &&
            const DeepCollectionEquality().equals(
                descriptionBoldTextStyle, other.descriptionBoldTextStyle) &&
            const DeepCollectionEquality()
                .equals(validityTitleTextStyle, other.validityTitleTextStyle) &&
            const DeepCollectionEquality()
                .equals(successBackgroundColor, other.successBackgroundColor) &&
            const DeepCollectionEquality()
                .equals(successBorderColor, other.successBorderColor) &&
            const DeepCollectionEquality()
                .equals(successBorderWidth, other.successBorderWidth) &&
            const DeepCollectionEquality()
                .equals(successTextStyle, other.successTextStyle) &&
            const DeepCollectionEquality().equals(
                disabledBackgroundColor, other.disabledBackgroundColor) &&
            const DeepCollectionEquality()
                .equals(disabledTextStyle, other.disabledTextStyle) &&
            const DeepCollectionEquality().equals(
                submittedBackgroundColor, other.submittedBackgroundColor) &&
            const DeepCollectionEquality().equals(
                resendButtonLoadingIndicatorSize,
                other.resendButtonLoadingIndicatorSize) &&
            const DeepCollectionEquality().equals(resendButtonBackgroundColor,
                other.resendButtonBackgroundColor) &&
            const DeepCollectionEquality().equals(resendButtonActiveTextColor,
                other.resendButtonActiveTextColor) &&
            const DeepCollectionEquality().equals(resendButtonDisabledTextColor,
                other.resendButtonDisabledTextColor) &&
            const DeepCollectionEquality().equals(resendButtonSuccessTextColor,
                other.resendButtonSuccessTextColor) &&
            const DeepCollectionEquality().equals(
                resendButtonErrorTextColor, other.resendButtonErrorTextColor) &&
            const DeepCollectionEquality().equals(
                resendButtonPressedColor, other.resendButtonPressedColor) &&
            const DeepCollectionEquality()
                .equals(captionBold, other.captionBold) &&
            const DeepCollectionEquality().equals(resendButtonDefaultTextStyle,
                other.resendButtonDefaultTextStyle));
  }

  @override
  int get hashCode {
    return Object.hashAll([
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(primaryColor),
      const DeepCollectionEquality().hash(defaultBackgroundColor),
      const DeepCollectionEquality().hash(defaultBorderColor),
      const DeepCollectionEquality().hash(defaultBorderWidth),
      const DeepCollectionEquality().hash(defaultBorderRadius),
      const DeepCollectionEquality().hash(defaultTextStyle),
      const DeepCollectionEquality().hash(errorBackgroundColor),
      const DeepCollectionEquality().hash(errorBorderColor),
      const DeepCollectionEquality().hash(errorBorderWidth),
      const DeepCollectionEquality().hash(errorBorderRadius),
      const DeepCollectionEquality().hash(errorTextStyle),
      const DeepCollectionEquality().hash(descriptionBoldTextStyle),
      const DeepCollectionEquality().hash(validityTitleTextStyle),
      const DeepCollectionEquality().hash(successBackgroundColor),
      const DeepCollectionEquality().hash(successBorderColor),
      const DeepCollectionEquality().hash(successBorderWidth),
      const DeepCollectionEquality().hash(successTextStyle),
      const DeepCollectionEquality().hash(disabledBackgroundColor),
      const DeepCollectionEquality().hash(disabledTextStyle),
      const DeepCollectionEquality().hash(submittedBackgroundColor),
      const DeepCollectionEquality().hash(resendButtonLoadingIndicatorSize),
      const DeepCollectionEquality().hash(resendButtonBackgroundColor),
      const DeepCollectionEquality().hash(resendButtonActiveTextColor),
      const DeepCollectionEquality().hash(resendButtonDisabledTextColor),
      const DeepCollectionEquality().hash(resendButtonSuccessTextColor),
      const DeepCollectionEquality().hash(resendButtonErrorTextColor),
      const DeepCollectionEquality().hash(resendButtonPressedColor),
      const DeepCollectionEquality().hash(captionBold),
      const DeepCollectionEquality().hash(resendButtonDefaultTextStyle),
    ]);
  }
}
