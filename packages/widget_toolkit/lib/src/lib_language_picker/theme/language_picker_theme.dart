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
    required this.spacingXXXXL,
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
    required this.bodyTextColor,
    required this.elevatedButtonForegroundColor,
    required this.elevatedButtonBackgroundColor,
    required this.outlineButtonBackgroundColor,
    required this.checkIcon,
    required this.changeLanguagePadding,
    required this.chooseLanguagePadding,
    required this.chooseLanguageActiveEdgeInsets,
    required this.chooseLanguageInactiveEdgeInsets,
    required this.messagePanelErrorEdgeInsets,
  });

  /// Wrapper padding around the scrolling column assembled in `change_language.dart`.
  @override
  final EdgeInsets changeLanguagePadding;
  /// Bottom inset applied between consecutive language rows and surrounding layout in `change_language.dart`.
  @override
  final EdgeInsets chooseLanguagePadding;
  /// Horizontal and vertical inset for tiles built through [SelectLanguageItem.selected] inside `select_language_item.dart`.
  @override
  final EdgeInsets chooseLanguageActiveEdgeInsets;
  /// Matching inset for [SelectLanguageItem.unSelected] states so tapped and idle tiles share footprint in `select_language_item.dart`.
  @override
  final EdgeInsets chooseLanguageInactiveEdgeInsets;

  /// Body typography for translated descriptions rendered on rows inside `select_language_item.dart`.
  @override
  final TextStyle descriptionThin;
  /// Heading typography hosts can reuse when composing custom headers beside presentations created by [showChangeLanguageBottomSheet].
  @override
  final TextStyle titleBold;
  /// Emphasized typography for uppercase language codes on rows rendered in `select_language_item.dart`.
  @override
  final TextStyle languageCodeInLanguagePickerTitleBold;

  /// Rhythm token driving shadow blurRadius on selectable rows and other tight vertical gaps in `select_language_item.dart`.
  @override
  final double spacingS;
  /// Trailing spacer after the stacked languages before footer actions toward the bottom of `change_language.dart`.
  @override
  final double changeLanguageSizedBox;
  /// Horizontal gutters between bilingual columns rendered in `select_language_item.dart`.
  @override
  final double spacingM;
  /// Fixed height reserved for shimmering skeleton rows mimicking selectable tiles rendered in `select_language_item.dart`.
  @override
  final double spacingXXXXL;
  /// Padding forwarded to [MessagePanelError] so error summaries align visually with padded list content constructed in `change_language.dart`.
  @override
  final EdgeInsets messagePanelErrorEdgeInsets;

  /// Foreground color on idle tiles when [ChangeLanguageWidget] builds [SelectLanguageItem.unSelected] rows with button color helpers from `change_language.dart`.
  @override
  final Color activeButtonLanguageTextColor;
  /// Gradient start surrogate paired with [activeGradientEnd] on the muted footer [SmallButton] that dismisses `change_language.dart`.
  @override
  final Color disabledFilledButtonBackgroundColor;
  /// Gradient end color completing that footer [SmallButton] outline treatment in `change_language.dart`.
  @override
  final Color activeGradientEnd;
  /// Leading bilingual gradient stop for active selection gradients painted in `select_language_item.dart`.
  @override
  final Color languageGradientStart;
  /// Trailing color finishing those gradients inside `select_language_item.dart`.
  @override
  final Color languageGradientEnd;
  /// Gradient fill for shimmering loading placeholders on selectable rows in `select_language_item.dart`.
  @override
  final Color filledButtonBackgroundColorDisabled;
  /// High-contrast text color layered on bilingual gradient rails when selections highlight rows in `select_language_item.dart`.
  @override
  final Color buttonTextColor;
  /// Muted label color paired with inactive gradient stops while rows wait for selection in `select_language_item.dart`.
  @override
  final Color filledButtonTextColorDisabled;
  /// Light typography fill applied once bilingual gradients saturate rows in `select_language_item.dart`.
  @override
  final Color textColorWhite;
  /// Shadow tint blended under bilingual rows that elevate above list content inside `select_language_item.dart`.
  @override
  final Color boxShadowColor;
  /// Body text tint for dormant row labels contrasting against outlined buttons rendered in `select_language_item.dart`.
  @override
  final Color bodyTextColor;
  /// Icon foreground on bilingual buttons elevated above inactive rows rendered in `select_language_item.dart`.
  @override
  final Color elevatedButtonForegroundColor;
  /// Surface wash behind bilingual buttons elevated alongside list tiles in `select_language_item.dart`.
  @override
  final Color elevatedButtonBackgroundColor;
  /// Flat outline button wash framing dormant tiles ahead of bilingual gradients inside `select_language_item.dart`.
  @override
  final Color outlineButtonBackgroundColor;

  /// Confirmation glyph on the trailing edge when [SelectLanguageItem.selected] marks the active locale in `select_language_item.dart`.
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
        spacingXXXXL = WidgetToolkitDesignSystem.light().spacings.xxxxl1,
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
        bodyTextColor = WidgetToolkitDesignSystem.light().colors.black,
        elevatedButtonForegroundColor =
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
        spacingXXXXL = WidgetToolkitDesignSystem.dark().spacings.xxxxl1,
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
        bodyTextColor = WidgetToolkitDesignSystem.dark().colors.black,
        elevatedButtonForegroundColor =
            WidgetToolkitDesignSystem.dark().colors.buttonBlueGradientEnd,
        elevatedButtonBackgroundColor =
            WidgetToolkitDesignSystem.dark().colors.lightGray,
        outlineButtonBackgroundColor =
            WidgetToolkitDesignSystem.dark().colors.white,
        checkIcon = WidgetToolkitDesignSystem.dark().icons.checkIcon;

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
