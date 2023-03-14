import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../asset_classes.dart';
import '../../base/theme/design_system/widget_toolkit_design_system.dart';

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
    WidgetToolkitDesignSystem.light().typography.descriptionThin,
    WidgetToolkitDesignSystem.dark().typography.descriptionThin,
  ];

  static List<TextStyle> titleBold = [
    WidgetToolkitDesignSystem.light().typography.titleBold,
    WidgetToolkitDesignSystem.dark().typography.titleBold,
  ];

  static List<TextStyle> languageCodeInLanguagePickerTitleBold = [
    WidgetToolkitDesignSystem.light().typography.titleBold,
    WidgetToolkitDesignSystem.dark().typography.titleBold,
  ];

  /// endregion
  /// region spacings
  static List<double> spacingS = [
    WidgetToolkitDesignSystem.light().spacings.s,
    WidgetToolkitDesignSystem.dark().spacings.s,
  ];

  static List<double> changeLanguageSizedBox = [
    WidgetToolkitDesignSystem.light().spacings.s,
    WidgetToolkitDesignSystem.dark().spacings.s,
  ];

  static List<double> spacingM = [
    WidgetToolkitDesignSystem.light().spacings.m,
    WidgetToolkitDesignSystem.dark().spacings.m,
  ];

  static List<double> spacingXXXXL1 = [
    WidgetToolkitDesignSystem.light().spacings.xxxxl1,
    WidgetToolkitDesignSystem.dark().spacings.xxxxl1,
  ];

  static List<EdgeInsets> messagePanelErrorEdgeInsets = [
    const EdgeInsets.only(bottom: 20),
    const EdgeInsets.only(bottom: 20),
  ];

  /// endregion

  /// region Color

  static List<Color> activeButtonLanguageTextColor = [
    WidgetToolkitDesignSystem.light().colors.activeButtonLanguageTextColor,
    WidgetToolkitDesignSystem.dark().colors.activeButtonLanguageTextColor,
  ];

  static List<Color> disabledFilledButtonBackgroundColor = [
    WidgetToolkitDesignSystem.light().colors.gray,
    WidgetToolkitDesignSystem.dark().colors.gray,
  ];

  static List<Color> activeGradientEnd = [
    WidgetToolkitDesignSystem.light().colors.blue,
    WidgetToolkitDesignSystem.dark().colors.blue,
  ];

  static List<Color> languageGradientStart = [
    WidgetToolkitDesignSystem.light().colors.blue,
    WidgetToolkitDesignSystem.dark().colors.darkBlue,
  ];

  static List<Color> languageGradientEnd = [
    WidgetToolkitDesignSystem.light().colors.lightBlue,
    WidgetToolkitDesignSystem.dark().colors.blue,
  ];

  static List<Color> filledButtonBackgroundColorDisabled = [
    WidgetToolkitDesignSystem.light().colors.gray,
    WidgetToolkitDesignSystem.dark().colors.gray,
  ];

  static List<Color> buttonTextColor = [
    WidgetToolkitDesignSystem.light().colors.textColorWhite,
    WidgetToolkitDesignSystem.dark().colors.textColorWhite,
  ];

  static List<Color> filledButtonTextColorDisabled = [
    WidgetToolkitDesignSystem.light().colors.gray,
    WidgetToolkitDesignSystem.dark().colors.gray,
  ];

  static List<Color> textColorWhite = [
    WidgetToolkitDesignSystem.light().colors.textColorWhite,
    WidgetToolkitDesignSystem.dark().colors.textColorWhite,
  ];

  static List<Color> boxShadowColor = [
    WidgetToolkitDesignSystem.light().colors.red,
    WidgetToolkitDesignSystem.dark().colors.red,
  ];

  static List<Color> bodyTextColor2 = [
    WidgetToolkitDesignSystem.light().colors.black,
    WidgetToolkitDesignSystem.dark().colors.activeButtonTextColor,
  ];

  static List<Color> buttonBlueGradientEnd = [
    WidgetToolkitDesignSystem.light().colors.buttonBlueGradientEnd,
    WidgetToolkitDesignSystem.dark().colors.buttonBlueGradientEnd,
  ];

  static List<Color> elevatedButtonBackgroundColor = [
    WidgetToolkitDesignSystem.light().colors.lightGray,
    WidgetToolkitDesignSystem.dark().colors.gray,
  ];

  static List<Color> outlineButtonBackgroundColor = [
    WidgetToolkitDesignSystem.light().colors.white,
    WidgetToolkitDesignSystem.dark().colors.white,
  ];

  static List<SvgFile> checkIcon = [
    WidgetToolkitDesignSystem.dark().icons.checkIcon,
    WidgetToolkitDesignSystem.light().icons.checkIcon,
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
