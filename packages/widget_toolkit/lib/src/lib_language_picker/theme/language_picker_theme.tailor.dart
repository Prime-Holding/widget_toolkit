// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'language_picker_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$LanguagePickerThemeTailorMixin on ThemeExtension<LanguagePickerTheme> {
  EdgeInsets get changeLanguagePadding;
  EdgeInsets get chooseLanguagePadding;
  EdgeInsets get chooseLanguageActiveEdgeInsets;
  EdgeInsets get chooseLanguageInactiveEdgeInsets;
  TextStyle get descriptionThin;
  TextStyle get titleBold;
  TextStyle get languageCodeInLanguagePickerTitleBold;
  double get spacingS;
  double get changeLanguageSizedBox;
  double get spacingM;
  double get spacingXXXXL;
  EdgeInsets get messagePanelErrorEdgeInsets;
  Color get activeButtonLanguageTextColor;
  Color get disabledFilledButtonBackgroundColor;
  Color get activeGradientEnd;
  Color get languageGradientStart;
  Color get languageGradientEnd;
  Color get filledButtonBackgroundColorDisabled;
  Color get buttonTextColor;
  Color get filledButtonTextColorDisabled;
  Color get textColorWhite;
  Color get boxShadowColor;
  Color get bodyTextColor;
  Color get elevatedButtonForegroundColor;
  Color get elevatedButtonBackgroundColor;
  Color get outlineButtonBackgroundColor;
  SvgFile get checkIcon;

  @override
  LanguagePickerTheme copyWith({
    EdgeInsets? changeLanguagePadding,
    EdgeInsets? chooseLanguagePadding,
    EdgeInsets? chooseLanguageActiveEdgeInsets,
    EdgeInsets? chooseLanguageInactiveEdgeInsets,
    TextStyle? descriptionThin,
    TextStyle? titleBold,
    TextStyle? languageCodeInLanguagePickerTitleBold,
    double? spacingS,
    double? changeLanguageSizedBox,
    double? spacingM,
    double? spacingXXXXL,
    EdgeInsets? messagePanelErrorEdgeInsets,
    Color? activeButtonLanguageTextColor,
    Color? disabledFilledButtonBackgroundColor,
    Color? activeGradientEnd,
    Color? languageGradientStart,
    Color? languageGradientEnd,
    Color? filledButtonBackgroundColorDisabled,
    Color? buttonTextColor,
    Color? filledButtonTextColorDisabled,
    Color? textColorWhite,
    Color? boxShadowColor,
    Color? bodyTextColor,
    Color? elevatedButtonForegroundColor,
    Color? elevatedButtonBackgroundColor,
    Color? outlineButtonBackgroundColor,
    SvgFile? checkIcon,
  }) {
    return LanguagePickerTheme(
      changeLanguagePadding:
          changeLanguagePadding ?? this.changeLanguagePadding,
      chooseLanguagePadding:
          chooseLanguagePadding ?? this.chooseLanguagePadding,
      chooseLanguageActiveEdgeInsets:
          chooseLanguageActiveEdgeInsets ?? this.chooseLanguageActiveEdgeInsets,
      chooseLanguageInactiveEdgeInsets: chooseLanguageInactiveEdgeInsets ??
          this.chooseLanguageInactiveEdgeInsets,
      descriptionThin: descriptionThin ?? this.descriptionThin,
      titleBold: titleBold ?? this.titleBold,
      languageCodeInLanguagePickerTitleBold:
          languageCodeInLanguagePickerTitleBold ??
              this.languageCodeInLanguagePickerTitleBold,
      spacingS: spacingS ?? this.spacingS,
      changeLanguageSizedBox:
          changeLanguageSizedBox ?? this.changeLanguageSizedBox,
      spacingM: spacingM ?? this.spacingM,
      spacingXXXXL: spacingXXXXL ?? this.spacingXXXXL,
      messagePanelErrorEdgeInsets:
          messagePanelErrorEdgeInsets ?? this.messagePanelErrorEdgeInsets,
      activeButtonLanguageTextColor:
          activeButtonLanguageTextColor ?? this.activeButtonLanguageTextColor,
      disabledFilledButtonBackgroundColor:
          disabledFilledButtonBackgroundColor ??
              this.disabledFilledButtonBackgroundColor,
      activeGradientEnd: activeGradientEnd ?? this.activeGradientEnd,
      languageGradientStart:
          languageGradientStart ?? this.languageGradientStart,
      languageGradientEnd: languageGradientEnd ?? this.languageGradientEnd,
      filledButtonBackgroundColorDisabled:
          filledButtonBackgroundColorDisabled ??
              this.filledButtonBackgroundColorDisabled,
      buttonTextColor: buttonTextColor ?? this.buttonTextColor,
      filledButtonTextColorDisabled:
          filledButtonTextColorDisabled ?? this.filledButtonTextColorDisabled,
      textColorWhite: textColorWhite ?? this.textColorWhite,
      boxShadowColor: boxShadowColor ?? this.boxShadowColor,
      bodyTextColor: bodyTextColor ?? this.bodyTextColor,
      elevatedButtonForegroundColor:
          elevatedButtonForegroundColor ?? this.elevatedButtonForegroundColor,
      elevatedButtonBackgroundColor:
          elevatedButtonBackgroundColor ?? this.elevatedButtonBackgroundColor,
      outlineButtonBackgroundColor:
          outlineButtonBackgroundColor ?? this.outlineButtonBackgroundColor,
      checkIcon: checkIcon ?? this.checkIcon,
    );
  }

  @override
  LanguagePickerTheme lerp(
      covariant ThemeExtension<LanguagePickerTheme>? other, double t) {
    if (other is! LanguagePickerTheme) return this as LanguagePickerTheme;
    return LanguagePickerTheme(
      changeLanguagePadding:
          t < 0.5 ? changeLanguagePadding : other.changeLanguagePadding,
      chooseLanguagePadding:
          t < 0.5 ? chooseLanguagePadding : other.chooseLanguagePadding,
      chooseLanguageActiveEdgeInsets: t < 0.5
          ? chooseLanguageActiveEdgeInsets
          : other.chooseLanguageActiveEdgeInsets,
      chooseLanguageInactiveEdgeInsets: t < 0.5
          ? chooseLanguageInactiveEdgeInsets
          : other.chooseLanguageInactiveEdgeInsets,
      descriptionThin:
          TextStyle.lerp(descriptionThin, other.descriptionThin, t)!,
      titleBold: TextStyle.lerp(titleBold, other.titleBold, t)!,
      languageCodeInLanguagePickerTitleBold: TextStyle.lerp(
          languageCodeInLanguagePickerTitleBold,
          other.languageCodeInLanguagePickerTitleBold,
          t)!,
      spacingS: t < 0.5 ? spacingS : other.spacingS,
      changeLanguageSizedBox:
          t < 0.5 ? changeLanguageSizedBox : other.changeLanguageSizedBox,
      spacingM: t < 0.5 ? spacingM : other.spacingM,
      spacingXXXXL: t < 0.5 ? spacingXXXXL : other.spacingXXXXL,
      messagePanelErrorEdgeInsets: t < 0.5
          ? messagePanelErrorEdgeInsets
          : other.messagePanelErrorEdgeInsets,
      activeButtonLanguageTextColor: Color.lerp(activeButtonLanguageTextColor,
          other.activeButtonLanguageTextColor, t)!,
      disabledFilledButtonBackgroundColor: Color.lerp(
          disabledFilledButtonBackgroundColor,
          other.disabledFilledButtonBackgroundColor,
          t)!,
      activeGradientEnd:
          Color.lerp(activeGradientEnd, other.activeGradientEnd, t)!,
      languageGradientStart:
          Color.lerp(languageGradientStart, other.languageGradientStart, t)!,
      languageGradientEnd:
          Color.lerp(languageGradientEnd, other.languageGradientEnd, t)!,
      filledButtonBackgroundColorDisabled: Color.lerp(
          filledButtonBackgroundColorDisabled,
          other.filledButtonBackgroundColorDisabled,
          t)!,
      buttonTextColor: Color.lerp(buttonTextColor, other.buttonTextColor, t)!,
      filledButtonTextColorDisabled: Color.lerp(filledButtonTextColorDisabled,
          other.filledButtonTextColorDisabled, t)!,
      textColorWhite: Color.lerp(textColorWhite, other.textColorWhite, t)!,
      boxShadowColor: Color.lerp(boxShadowColor, other.boxShadowColor, t)!,
      bodyTextColor: Color.lerp(bodyTextColor, other.bodyTextColor, t)!,
      elevatedButtonForegroundColor: Color.lerp(elevatedButtonForegroundColor,
          other.elevatedButtonForegroundColor, t)!,
      elevatedButtonBackgroundColor: Color.lerp(elevatedButtonBackgroundColor,
          other.elevatedButtonBackgroundColor, t)!,
      outlineButtonBackgroundColor: Color.lerp(
          outlineButtonBackgroundColor, other.outlineButtonBackgroundColor, t)!,
      checkIcon: t < 0.5 ? checkIcon : other.checkIcon,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LanguagePickerTheme &&
            const DeepCollectionEquality()
                .equals(changeLanguagePadding, other.changeLanguagePadding) &&
            const DeepCollectionEquality()
                .equals(chooseLanguagePadding, other.chooseLanguagePadding) &&
            const DeepCollectionEquality().equals(
                chooseLanguageActiveEdgeInsets,
                other.chooseLanguageActiveEdgeInsets) &&
            const DeepCollectionEquality().equals(
                chooseLanguageInactiveEdgeInsets,
                other.chooseLanguageInactiveEdgeInsets) &&
            const DeepCollectionEquality()
                .equals(descriptionThin, other.descriptionThin) &&
            const DeepCollectionEquality().equals(titleBold, other.titleBold) &&
            const DeepCollectionEquality().equals(
                languageCodeInLanguagePickerTitleBold,
                other.languageCodeInLanguagePickerTitleBold) &&
            const DeepCollectionEquality().equals(spacingS, other.spacingS) &&
            const DeepCollectionEquality()
                .equals(changeLanguageSizedBox, other.changeLanguageSizedBox) &&
            const DeepCollectionEquality().equals(spacingM, other.spacingM) &&
            const DeepCollectionEquality()
                .equals(spacingXXXXL, other.spacingXXXXL) &&
            const DeepCollectionEquality().equals(messagePanelErrorEdgeInsets,
                other.messagePanelErrorEdgeInsets) &&
            const DeepCollectionEquality().equals(activeButtonLanguageTextColor,
                other.activeButtonLanguageTextColor) &&
            const DeepCollectionEquality().equals(
                disabledFilledButtonBackgroundColor,
                other.disabledFilledButtonBackgroundColor) &&
            const DeepCollectionEquality()
                .equals(activeGradientEnd, other.activeGradientEnd) &&
            const DeepCollectionEquality()
                .equals(languageGradientStart, other.languageGradientStart) &&
            const DeepCollectionEquality()
                .equals(languageGradientEnd, other.languageGradientEnd) &&
            const DeepCollectionEquality().equals(
                filledButtonBackgroundColorDisabled, other.filledButtonBackgroundColorDisabled) &&
            const DeepCollectionEquality().equals(buttonTextColor, other.buttonTextColor) &&
            const DeepCollectionEquality().equals(filledButtonTextColorDisabled, other.filledButtonTextColorDisabled) &&
            const DeepCollectionEquality().equals(textColorWhite, other.textColorWhite) &&
            const DeepCollectionEquality().equals(boxShadowColor, other.boxShadowColor) &&
            const DeepCollectionEquality().equals(bodyTextColor, other.bodyTextColor) &&
            const DeepCollectionEquality().equals(elevatedButtonForegroundColor, other.elevatedButtonForegroundColor) &&
            const DeepCollectionEquality().equals(elevatedButtonBackgroundColor, other.elevatedButtonBackgroundColor) &&
            const DeepCollectionEquality().equals(outlineButtonBackgroundColor, other.outlineButtonBackgroundColor) &&
            const DeepCollectionEquality().equals(checkIcon, other.checkIcon));
  }

  @override
  int get hashCode {
    return Object.hashAll([
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(changeLanguagePadding),
      const DeepCollectionEquality().hash(chooseLanguagePadding),
      const DeepCollectionEquality().hash(chooseLanguageActiveEdgeInsets),
      const DeepCollectionEquality().hash(chooseLanguageInactiveEdgeInsets),
      const DeepCollectionEquality().hash(descriptionThin),
      const DeepCollectionEquality().hash(titleBold),
      const DeepCollectionEquality()
          .hash(languageCodeInLanguagePickerTitleBold),
      const DeepCollectionEquality().hash(spacingS),
      const DeepCollectionEquality().hash(changeLanguageSizedBox),
      const DeepCollectionEquality().hash(spacingM),
      const DeepCollectionEquality().hash(spacingXXXXL),
      const DeepCollectionEquality().hash(messagePanelErrorEdgeInsets),
      const DeepCollectionEquality().hash(activeButtonLanguageTextColor),
      const DeepCollectionEquality().hash(disabledFilledButtonBackgroundColor),
      const DeepCollectionEquality().hash(activeGradientEnd),
      const DeepCollectionEquality().hash(languageGradientStart),
      const DeepCollectionEquality().hash(languageGradientEnd),
      const DeepCollectionEquality().hash(filledButtonBackgroundColorDisabled),
      const DeepCollectionEquality().hash(buttonTextColor),
      const DeepCollectionEquality().hash(filledButtonTextColorDisabled),
      const DeepCollectionEquality().hash(textColorWhite),
      const DeepCollectionEquality().hash(boxShadowColor),
      const DeepCollectionEquality().hash(bodyTextColor),
      const DeepCollectionEquality().hash(elevatedButtonForegroundColor),
      const DeepCollectionEquality().hash(elevatedButtonBackgroundColor),
      const DeepCollectionEquality().hash(outlineButtonBackgroundColor),
      const DeepCollectionEquality().hash(checkIcon),
    ]);
  }
}
