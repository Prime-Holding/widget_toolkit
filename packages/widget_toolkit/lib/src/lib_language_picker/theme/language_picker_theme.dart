import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../asset_classes.dart';
import '../../base/theme/design_system/widget_toolkit_design_system.dart';

part 'language_picker_theme.tailor.dart';

@TailorMixinComponent()
class LanguagePickerTheme extends ThemeExtension<LanguagePickerTheme>
    with _$LanguagePickerThemeTailorMixin {
  const LanguagePickerTheme({
    required this.descriptionThin,
    required this.titleBold,
    required this.languageCodeInLanguagePickerTitleBold,
    required this.spacingS,
    required this.changeLanguageSizedBox,
    required this.spacingM,
    required this.spacingXXXXL1,
    required this.activeButtonLanguageTextColor,
    required this.disabledFilledButtonBackgroundColor,
    required this.activeGradientEnd,
    required this.languageGradientStart,
    required this.languageGradientEnd,
    required this.filledButtonBackgroundColorDisabled,
    required this.buttonTextColor,
    required this.filledButtonTextColorDisabled,
    required this.textColorWhite,
    required this.boxShadowColor,
    required this.bodyTextColor2,
    required this.buttonBlueGradientEnd,
    required this.elevatedButtonBackgroundColor,
    required this.outlineButtonBackgroundColor,
    required this.checkIcon,
    required this.changeLanguagePadding,
    required this.chooseLanguagePadding,
    required this.chooseLanguageActiveEdgeInsets,
    required this.chooseLanguageInactiveEdgeInsets,
    required this.messagePanelErrorEdgeInsets,
  });

  @override
  final EdgeInsets changeLanguagePadding;
  @override
  final EdgeInsets chooseLanguagePadding;
  @override
  final EdgeInsets chooseLanguageActiveEdgeInsets;
  @override
  final EdgeInsets chooseLanguageInactiveEdgeInsets;

  @override
  final TextStyle descriptionThin;
  @override
  final TextStyle titleBold;
  @override
  final TextStyle languageCodeInLanguagePickerTitleBold;

  @override
  final double spacingS;
  @override
  final double changeLanguageSizedBox;
  @override
  final double spacingM;
  @override
  final double spacingXXXXL1;
  @override
  final EdgeInsets messagePanelErrorEdgeInsets;

  @override
  final Color activeButtonLanguageTextColor;
  @override
  final Color disabledFilledButtonBackgroundColor;
  @override
  final Color activeGradientEnd;
  @override
  final Color languageGradientStart;
  @override
  final Color languageGradientEnd;
  @override
  final Color filledButtonBackgroundColorDisabled;
  @override
  final Color buttonTextColor;
  @override
  final Color filledButtonTextColorDisabled;
  @override
  final Color textColorWhite;
  @override
  final Color boxShadowColor;
  @override
  final Color bodyTextColor2;
  @override
  final Color buttonBlueGradientEnd;
  @override
  final Color elevatedButtonBackgroundColor;
  @override
  final Color outlineButtonBackgroundColor;

  @override
  final SvgFile checkIcon;

  /// region Themes

  LanguagePickerTheme.light()
      : changeLanguagePadding = EdgeInsets.zero,
        chooseLanguagePadding = const EdgeInsets.only(bottom: 8),
        chooseLanguageActiveEdgeInsets =
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        chooseLanguageInactiveEdgeInsets =
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        messagePanelErrorEdgeInsets = const EdgeInsets.only(bottom: 20),
        descriptionThin =
            WidgetToolkitDesignSystem.light().typography.descriptionThin,
        titleBold = WidgetToolkitDesignSystem.light().typography.titleBold,
        languageCodeInLanguagePickerTitleBold =
            WidgetToolkitDesignSystem.light().typography.titleBold,
        spacingS = WidgetToolkitDesignSystem.light().spacings.s,
        changeLanguageSizedBox = WidgetToolkitDesignSystem.light().spacings.s,
        spacingM = WidgetToolkitDesignSystem.light().spacings.m,
        spacingXXXXL1 = WidgetToolkitDesignSystem.light().spacings.xxxxl1,
        activeButtonLanguageTextColor = WidgetToolkitDesignSystem.light()
            .colors
            .activeButtonLanguageTextColor,
        disabledFilledButtonBackgroundColor =
            WidgetToolkitDesignSystem.light().colors.gray,
        activeGradientEnd = WidgetToolkitDesignSystem.light().colors.blue,
        languageGradientStart = WidgetToolkitDesignSystem.light().colors.blue,
        languageGradientEnd =
            WidgetToolkitDesignSystem.light().colors.lightBlue,
        filledButtonBackgroundColorDisabled =
            WidgetToolkitDesignSystem.light().colors.gray,
        buttonTextColor =
            WidgetToolkitDesignSystem.light().colors.textColorWhite,
        filledButtonTextColorDisabled =
            WidgetToolkitDesignSystem.light().colors.gray,
        textColorWhite =
            WidgetToolkitDesignSystem.light().colors.textColorWhite,
        boxShadowColor = WidgetToolkitDesignSystem.light().colors.red,
        bodyTextColor2 = WidgetToolkitDesignSystem.light().colors.black,
        buttonBlueGradientEnd =
            WidgetToolkitDesignSystem.light().colors.buttonBlueGradientEnd,
        elevatedButtonBackgroundColor =
            WidgetToolkitDesignSystem.light().colors.lightGray,
        outlineButtonBackgroundColor =
            WidgetToolkitDesignSystem.light().colors.white,
        checkIcon = WidgetToolkitDesignSystem.dark().icons.checkIcon;

  LanguagePickerTheme.dark()
      : changeLanguagePadding = EdgeInsets.zero,
        chooseLanguagePadding = const EdgeInsets.only(bottom: 8),
        chooseLanguageActiveEdgeInsets =
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        chooseLanguageInactiveEdgeInsets =
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        messagePanelErrorEdgeInsets = const EdgeInsets.only(bottom: 20),
        descriptionThin =
            WidgetToolkitDesignSystem.dark().typography.descriptionThin,
        titleBold = WidgetToolkitDesignSystem.dark().typography.titleBold,
        languageCodeInLanguagePickerTitleBold =
            WidgetToolkitDesignSystem.dark().typography.titleBold,
        spacingS = WidgetToolkitDesignSystem.dark().spacings.s,
        changeLanguageSizedBox = WidgetToolkitDesignSystem.dark().spacings.s,
        spacingM = WidgetToolkitDesignSystem.dark().spacings.m,
        spacingXXXXL1 = WidgetToolkitDesignSystem.dark().spacings.xxxxl1,
        activeButtonLanguageTextColor = WidgetToolkitDesignSystem.dark()
            .colors
            .activeButtonLanguageTextColor,
        disabledFilledButtonBackgroundColor =
            WidgetToolkitDesignSystem.dark().colors.gray,
        activeGradientEnd = WidgetToolkitDesignSystem.dark().colors.blue,
        languageGradientStart = WidgetToolkitDesignSystem.dark().colors.blue,
        languageGradientEnd = WidgetToolkitDesignSystem.dark().colors.lightBlue,
        filledButtonBackgroundColorDisabled =
            WidgetToolkitDesignSystem.dark().colors.gray,
        buttonTextColor =
            WidgetToolkitDesignSystem.dark().colors.textColorWhite,
        filledButtonTextColorDisabled =
            WidgetToolkitDesignSystem.dark().colors.gray,
        textColorWhite = WidgetToolkitDesignSystem.dark().colors.textColorWhite,
        boxShadowColor = WidgetToolkitDesignSystem.dark().colors.red,
        bodyTextColor2 = WidgetToolkitDesignSystem.dark().colors.black,
        buttonBlueGradientEnd =
            WidgetToolkitDesignSystem.dark().colors.buttonBlueGradientEnd,
        elevatedButtonBackgroundColor =
            WidgetToolkitDesignSystem.dark().colors.lightGray,
        outlineButtonBackgroundColor =
            WidgetToolkitDesignSystem.dark().colors.white,
        checkIcon = WidgetToolkitDesignSystem.light().icons.checkIcon;

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
