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
    DesignSystem.light().typography.descriptionThin,
    DesignSystem.dark().typography.descriptionThin,
  ];

  static List<TextStyle> titleBold = [
    DesignSystem.light().typography.titleBold,
    DesignSystem.dark().typography.titleBold,
  ];

  static List<TextStyle> languageCodeInLanguagePickerTitleBold = [
    DesignSystem.light().typography.titleBold,
    DesignSystem.dark().typography.titleBold,
  ];

  /// endregion
  /// region spacings
  static List<double> spacingS = [
    DesignSystem.light().spacings.s,
    DesignSystem.dark().spacings.s,
  ];

  static List<double> changeLanguageSizedBox = [
    DesignSystem.light().spacings.s,
    DesignSystem.dark().spacings.s,
  ];

  static List<double> spacingM = [
    DesignSystem.light().spacings.m,
    DesignSystem.dark().spacings.m,
  ];

  static List<double> spacingXXXXL1 = [
    DesignSystem.light().spacings.xxxxl1,
    DesignSystem.dark().spacings.xxxxl1,
  ];

  static List<EdgeInsets> messagePanelErrorEdgeInsets = [
    const EdgeInsets.only(bottom: 20),
    const EdgeInsets.only(bottom: 20),
  ];

  /// endregion

  /// region Color

  static List<Color> activeButtonLanguageTextColor = [
    DesignSystem.light().colors.activeButtonLanguageTextColor,
    DesignSystem.dark().colors.activeButtonLanguageTextColor,
  ];

  static List<Color> disabledFilledButtonBackgroundColor = [
    DesignSystem.light().colors.gray,
    DesignSystem.dark().colors.gray,
  ];

  static List<Color> activeGradientRedEnd = [
    DesignSystem.light().colors.gradientRedEnd,
    DesignSystem.dark().colors.gradientRedEnd,
  ];

  static List<Color> languageGradientRedStart = [
    DesignSystem.light().colors.gradientRedStart,
    DesignSystem.dark().colors.redDark,
  ];

  static List<Color> languageGradientRedEnd = [
    DesignSystem.light().colors.gradientRedEnd,
    DesignSystem.dark().colors.gradientRedStart,
  ];

  static List<Color> filledButtonBackgroundColorDisabled = [
    DesignSystem.light().colors.filledButtonBackgroundColorDisabled,
    DesignSystem.dark().colors.filledButtonBackgroundColorDisabled,
  ];

  static List<Color> buttonTextColor = [
    DesignSystem.light().colors.textColorWhite,
    DesignSystem.dark().colors.textColorWhite,
  ];

  static List<Color> appFilledButtonTextColorDisabled = [
    DesignSystem.light().colors.gray,
    DesignSystem.dark().colors.gray,
  ];

  static List<Color> textColorWhite = [
    DesignSystem.light().colors.textColorWhite,
    DesignSystem.dark().colors.textColorWhite,
  ];

  static List<Color> boxShadowColor = [
    DesignSystem.light().colors.red,
    DesignSystem.dark().colors.red,
  ];

  static List<Color> bodyTextColor2 = [
    DesignSystem.light().colors.black,
    DesignSystem.dark().colors.activeButtonTextColor,
  ];

  static List<Color> textButtonLoadingIndicatorColor = [
    DesignSystem.light().colors.redDark,
    DesignSystem.dark().colors.redDark,
  ];

  static List<Color> buttonBlueGradientEnd = [
    DesignSystem.light().colors.appButtonBlueGradientEnd,
    DesignSystem.dark().colors.appButtonBlueGradientEnd,
  ];

  static List<Color> elevatedButtonBackgroundColor = [
    DesignSystem.light().colors.lightGray,
    DesignSystem.dark().colors.gray,
  ];

  static List<Color> appOutlineButtonBackgroundColor = [
    DesignSystem.light().colors.white,
    DesignSystem.dark().colors.white,
  ];
  static List<Color> errorTextBackgroundColor = [
    DesignSystem.light().colors.green,
    DesignSystem.dark().colors.green,
  ];

  static List<Color> errorTextColor = [
    DesignSystem.light().colors.black,
    DesignSystem.dark().colors.black,
  ];

  static List<SvgFile> checkIcon = [
    DesignSystem.dark().icons.checkIcon,
    DesignSystem.light().icons.checkIcon,
  ];

  static List<SvgFile> dangerIcon = [
    DesignSystem.dark().icons.dangerIcon,
    DesignSystem.light().icons.dangerIcon,
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
