import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../asset_classes.dart';
import '../../base/theme/design_system/design_system.dart';

part 'language_picker_theme.tailor.dart';

@Tailor(themeGetter: ThemeGetter.none)
class _$LanguagePickerTheme {
  /// region EdgeInsets
  static List<EdgeInsets> changeLanguagePadding = [
    const EdgeInsets.only(left: 16, right: 16, bottom: 16),
    const EdgeInsets.only(left: 16, right: 16, bottom: 16),
  ];

  static List<EdgeInsets> chooseLanguagePadding = [
    const EdgeInsets.only(bottom: 8),
    const EdgeInsets.only(bottom: 8)
  ];

  static List<EdgeInsets> chooseLanguageActiveEdgeInsets = [
    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  ];

  static List<EdgeInsets> chooseLanguageInactiveEdgeInsets = [
    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  ];

  /// endregion

  /// region TextStyle
  static List<TextStyle> descriptionThin = [
    PrimeDesignSystem.light().typography.descriptionThin,
    PrimeDesignSystem.dark().typography.descriptionThin,
  ];

  static List<TextStyle> titleBold = [
    PrimeDesignSystem.light().typography.titleBold,
    PrimeDesignSystem.dark().typography.titleBold,
  ];

  static List<TextStyle> languageCodeInLanguagePickerTitleBold = [
    PrimeDesignSystem.light().typography.titleBold,
    PrimeDesignSystem.dark().typography.titleBold,
  ];

  /// endregion
  /// region spacings
  static List<double> spacingS = [
    PrimeDesignSystem.light().spacings.s,
    PrimeDesignSystem.dark().spacings.s,
  ];

  static List<double> changeLanguageSizedBox = [
    PrimeDesignSystem.light().spacings.s,
    PrimeDesignSystem.dark().spacings.s,
  ];

  static List<double> spacingM = [
    PrimeDesignSystem.light().spacings.m,
    PrimeDesignSystem.dark().spacings.m,
  ];

  static List<double> spacingXXXXL1 = [
    PrimeDesignSystem.light().spacings.xxxxl1,
    PrimeDesignSystem.dark().spacings.xxxxl1,
  ];

  static List<EdgeInsets> messagePanelErrorEdgeInsets = [
    const EdgeInsets.only(bottom: 20),
    const EdgeInsets.only(bottom: 20),
  ];

  /// endregion

  /// region Color

  static List<Color> activeButtonLanguageTextColor = [
    PrimeDesignSystem.light().colors.activeButtonLanguageTextColor,
    PrimeDesignSystem.dark().colors.activeButtonLanguageTextColor,
  ];

  static List<Color> disabledFilledButtonBackgroundColor = [
    PrimeDesignSystem.light().colors.gray,
    PrimeDesignSystem.dark().colors.gray,
  ];

  static List<Color> activeGradientRedEnd = [
    PrimeDesignSystem.light().colors.gradientRedEnd,
    PrimeDesignSystem.dark().colors.gradientRedEnd,
  ];

  static List<Color> languageGradientRedStart = [
    PrimeDesignSystem.light().colors.gradientRedStart,
    PrimeDesignSystem.dark().colors.redDark,
  ];

  static List<Color> languageGradientRedEnd = [
    PrimeDesignSystem.light().colors.gradientRedEnd,
    PrimeDesignSystem.dark().colors.gradientRedStart,
  ];

  static List<Color> filledButtonBackgroundColorDisabled = [
    PrimeDesignSystem.light().colors.filledButtonBackgroundColorDisabled,
    PrimeDesignSystem.dark().colors.filledButtonBackgroundColorDisabled,
  ];

  static List<Color> buttonTextColor = [
    PrimeDesignSystem.light().colors.textColorWhite,
    PrimeDesignSystem.dark().colors.textColorWhite,
  ];

  static List<Color> appFilledButtonTextColorDisabled = [
    PrimeDesignSystem.light().colors.gray,
    PrimeDesignSystem.dark().colors.gray,
  ];

  static List<Color> textColorWhite = [
    PrimeDesignSystem.light().colors.textColorWhite,
    PrimeDesignSystem.dark().colors.textColorWhite,
  ];

  static List<Color> boxShadowColor = [
    PrimeDesignSystem.light().colors.red,
    PrimeDesignSystem.dark().colors.red,
  ];

  static List<Color> bodyTextColor2 = [
    PrimeDesignSystem.light().colors.black,
    PrimeDesignSystem.dark().colors.activeButtonTextColor,
  ];

  static List<Color> textButtonLoadingIndicatorColor = [
    PrimeDesignSystem.light().colors.redDark,
    PrimeDesignSystem.dark().colors.redDark,
  ];

  static List<Color> buttonBlueGradientEnd = [
    PrimeDesignSystem.light().colors.appButtonBlueGradientEnd,
    PrimeDesignSystem.dark().colors.appButtonBlueGradientEnd,
  ];

  static List<Color> elevatedButtonBackgroundColor = [
    PrimeDesignSystem.light().colors.lightGray,
    PrimeDesignSystem.dark().colors.gray,
  ];

  static List<Color> appOutlineButtonBackgroundColor = [
    PrimeDesignSystem.light().colors.white,
    PrimeDesignSystem.dark().colors.white,
  ];
  static List<Color> errorTextBackgroundColor = [
    PrimeDesignSystem.light().colors.green,
    PrimeDesignSystem.dark().colors.green,
  ];

  static List<Color> errorTextColor = [
    PrimeDesignSystem.light().colors.black,
    PrimeDesignSystem.dark().colors.black,
  ];

  static List<SvgFile> checkIcon = [
    PrimeDesignSystem.dark().icons.checkIcon,
    PrimeDesignSystem.light().icons.checkIcon,
  ];

  static List<SvgFile> dangerIcon = [
    PrimeDesignSystem.dark().icons.dangerIcon,
    PrimeDesignSystem.light().icons.dangerIcon,
  ];

  /// endregion
}

extension LanguagePickerThemeContextExtension on BuildContext {
  /// Returns a reference to the [LanguagePickerTheme] theme extension of the current [Theme]
  LanguagePickerTheme get languagePickerTheme {
    final theme = Theme.of(this).extension<LanguagePickerTheme>();
    if (theme == null) {
      throw UnimplementedError(
        'Not Implemented LanguagePickerTheme. '
        'Please add it as extension to the MaterialApp -> ThemeData',
      );
    }

    return theme;
  }
}
