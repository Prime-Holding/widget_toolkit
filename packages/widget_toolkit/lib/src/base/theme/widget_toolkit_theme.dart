import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../asset_classes.dart';
import 'design_system/widget_toolkit_design_system.dart';

part 'widget_toolkit_theme.tailor.dart';

@TailorMixinComponent()
/// Toolkit-wide branding, spacing, typography, icon, and shimmer tokens read from the BuildContext extension accessor declared at the bottom of this file.
///
/// Register this extension alongside feature themes such as [EditAddressTheme] or [LanguagePickerTheme] so shared UI widgets receive consistent styling.
class WidgetToolkitTheme extends ThemeExtension<WidgetToolkitTheme>
    with _$WidgetToolkitThemeTailorMixin {
  const WidgetToolkitTheme({
    required this.primaryColor,
    required this.backgroundColor,
    required this.scaffoldBackgroundColor,
    required this.highlightColor,
    required this.primaryGradientStart,
    required this.primaryGradientEnd,
    required this.searchTextFieldIconColor,
    required this.searchTextFieldIconColorActive,
    required this.searchTextFieldBackgroundColor,
    required this.searchTextFieldBackgroundColorActive,
    required this.searchTextFieldBorderRadius,
    required this.searchTextFieldBorderType,
    required this.searchTextFieldIconEdgeInsets,
    required this.searchTextFieldHintStyle,
    required this.searchTextFieldTextStyle,
    required this.pickerListItemInnerEdgeInsets,
    required this.pickerListItemOuterEdgeInsets,
    required this.pickerListItemBorderRadius,
    required this.pickerListItemSelectedColor,
    required this.pickerListItemUnselectedColor,
    required this.pickerListItemTextStyle,
    required this.captionBold,
    required this.textButtonTextStyle,
    required this.errorCardIconColor,
    required this.errorCardBackgroundColor,
    required this.messagePanelBackgroundColorImportant,
    required this.messagePanelBackgroundColorInformative,
    required this.messagePanelBackgroundColorPositive,
    required this.errorCardTextColor,
    required this.bottomSheetBarrierColor,
    required this.messagePanelBackgroundColor,
    required this.bottomSheetLineColor,
    required this.bottomSheetBackgroundColor,
    required this.bottomSheetBorderColor,
    required this.loadingIndicatorColor,
    required this.descriptionBold,
    required this.titleBold,
    required this.descriptionThin,
    required this.errorTitle,
    required this.disabledFilledButtonBackgroundColor,
    required this.filledButtonBackgroundColorDisabled,
    required this.filledButtonBackgroundColorPressed,
    required this.filledButtonTextColorDisabled,
    required this.textButtonTextColorDisabled,
    required this.textButtonBackgroundColor,
    required this.filledButtonTextColorEnabled,
    required this.smallButtonBackgroundColor,
    required this.buttonTextColor,
    required this.shimmerBaseColor,
    required this.shimmerHighlightColor,
    required this.messagePanelColorNeutral,
    required this.buttonBlueGradientEnd,
    required this.elevatedButtonBackgroundColor,
    required this.smallButtonFilledBackgroundColor,
    required this.smallButtonOutlinedBorderColor,
    required this.activeButtonLanguageTextColor,
    required this.activeButtonTextColor,
    required this.disabledButtonTextColor,
    required this.shimmerTextColor,
    required this.activeGradientColorStart,
    required this.activeGradientColorEnd,
    required this.boxShadowColor,
    required this.messagePanelBackgroundColorNeutral,
    required this.messagePanelColorLessImportant,
    required this.messagePanelBackgroundColorLessImportant,
    required this.messagePanelColorImportant,
    required this.messagePanelColorInformative,
    required this.messagePanelColorPositive,
    required this.textButtonLoadingIndicatorColor,
    required this.buttonShadowColor,
    required this.buttonPressedColor,
    required this.buttonBorderColor,
    required this.outlineButtonContentPadding,
    required this.outlineButtonTextStyle,
    required this.outlineButtonDescriptionTextStyle,
    required this.outlineButtonBackgroundColor,
    required this.outlineButtonForegroundColor,
    required this.outlineButtonBorderColor,
    required this.outlineButtonPressedColor,
    required this.outlineButtonTextColor,
    required this.outlineButtonTextColorDisabled,
    required this.bottomSheetHeaderPadding,
    required this.bottomSheetCloseButtonPadding,
    required this.bottomSheetContentPadding,
    required this.messagePanelErrorEdgeInsets,
    required this.errorModalContentTitleInsets,
    required this.smallButtonPadding,
    required this.gradientFillButtonDefaultPadding,
    required this.messagePanelEdgeInsets,
    required this.bottomSheetPaddingAlternative,
    required this.spacingXS,
    required this.spacingS,
    required this.spacingL,
    required this.spacingM,
    required this.spacingXL,
    required this.spacingXXL,
    required this.spacingXXXXL,
    required this.textButtonIconRightPadding,
    required this.textButtonPadding,
    required this.appBarTextButtonPadding,
    required this.bottomSheetBottomPadding,
    required this.checkIcon,
    required this.checkCircleIcon,
    required this.closeIcon,
    required this.dangerIcon,
    required this.educateIcon,
    required this.greatNewsIcon,
    required this.infoCircleIcon,
    required this.messageIcon,
  });

  /// region Themes
  WidgetToolkitTheme.light()
      : primaryColor = WidgetToolkitDesignSystem.light().colors.primaryColor,
        backgroundColor =
            WidgetToolkitDesignSystem.light().colors.backgroundColor,
        scaffoldBackgroundColor =
            WidgetToolkitDesignSystem.light().colors.scaffoldBackgroundColor,
        highlightColor =
            WidgetToolkitDesignSystem.light().colors.highlightColor,
        primaryGradientStart = WidgetToolkitDesignSystem.light().colors.blue,
        primaryGradientEnd = WidgetToolkitDesignSystem.light().colors.lightBlue,
        searchTextFieldIconColor =
            WidgetToolkitDesignSystem.light().colors.black,
        searchTextFieldIconColorActive =
            WidgetToolkitDesignSystem.light().colors.blue,
        searchTextFieldBackgroundColor =
            WidgetToolkitDesignSystem.light().colors.white,
        searchTextFieldBackgroundColorActive =
            WidgetToolkitDesignSystem.light().colors.mediumWhite,
        searchTextFieldBorderRadius =
            WidgetToolkitDesignSystem.light().spacings.xs,
        searchTextFieldBorderType = Border.all(
          color: WidgetToolkitDesignSystem.light().colors.mediumWhite,
          width: WidgetToolkitDesignSystem.light().spacings.xxxs,
        ),
        searchTextFieldIconEdgeInsets = EdgeInsets.symmetric(
          horizontal: WidgetToolkitDesignSystem.light().spacings.m,
          vertical: WidgetToolkitDesignSystem.light().spacings.s,
        ),
        searchTextFieldHintStyle =
            WidgetToolkitDesignSystem.light().typography.h3Reg14.copyWith(
                  color: WidgetToolkitDesignSystem.dark().colors.gray,
                ),
        searchTextFieldTextStyle = WidgetToolkitDesignSystem.light()
            .typography
            .descriptionBold
            .copyWith(
              color: WidgetToolkitDesignSystem.dark().colors.blue,
            ),
        pickerListItemInnerEdgeInsets =
            const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        pickerListItemOuterEdgeInsets =
            const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        pickerListItemBorderRadius = 8,
        pickerListItemSelectedColor =
            WidgetToolkitDesignSystem.light().colors.lightBlue,
        pickerListItemUnselectedColor =
            WidgetToolkitDesignSystem.light().colors.transparent,
        pickerListItemTextStyle =
            WidgetToolkitDesignSystem.light().typography.h3Reg14,
        captionBold = WidgetToolkitDesignSystem.light().typography.captionBold,
        textButtonTextStyle =
            WidgetToolkitDesignSystem.light().typography.captionBold,
        errorCardIconColor = WidgetToolkitDesignSystem.light().colors.black87,
        errorCardBackgroundColor =
            WidgetToolkitDesignSystem.light().colors.lightRed,
        messagePanelBackgroundColorImportant =
            WidgetToolkitDesignSystem.light().colors.lightRed,
        messagePanelBackgroundColorInformative =
            WidgetToolkitDesignSystem.light().colors.blueLight,
        messagePanelBackgroundColorPositive =
            WidgetToolkitDesignSystem.light().colors.greenLight,
        errorCardTextColor = WidgetToolkitDesignSystem.light().colors.black87,
        bottomSheetBarrierColor =
            WidgetToolkitDesignSystem.light().colors.bottomSheetBarrierColor,
        messagePanelBackgroundColor =
            WidgetToolkitDesignSystem.light().colors.lightGray,
        bottomSheetLineColor = WidgetToolkitDesignSystem.light().colors.gray,
        bottomSheetBackgroundColor =
            WidgetToolkitDesignSystem.light().colors.white,
        bottomSheetBorderColor =
            WidgetToolkitDesignSystem.light().colors.lightGray,
        loadingIndicatorColor =
            WidgetToolkitDesignSystem.light().colors.primaryColor,
        descriptionBold =
            WidgetToolkitDesignSystem.light().typography.descriptionBold,
        titleBold = WidgetToolkitDesignSystem.light().typography.titleBold,
        descriptionThin =
            WidgetToolkitDesignSystem.light().typography.descriptionThin,
        errorTitle = WidgetToolkitDesignSystem.light().typography.errorTitle,
        disabledFilledButtonBackgroundColor =
            WidgetToolkitDesignSystem.light().colors.gray,
        filledButtonBackgroundColorDisabled =
            WidgetToolkitDesignSystem.light().colors.lightGray,
        filledButtonBackgroundColorPressed =
            WidgetToolkitDesignSystem.light().colors.blueAccent,
        filledButtonTextColorDisabled =
            WidgetToolkitDesignSystem.light().colors.gray,
        textButtonTextColorDisabled =
            WidgetToolkitDesignSystem.light().colors.gray,
        textButtonBackgroundColor =
            WidgetToolkitDesignSystem.light().colors.transparent,
        filledButtonTextColorEnabled =
            WidgetToolkitDesignSystem.light().colors.activeButtonTextColor,
        smallButtonBackgroundColor =
            WidgetToolkitDesignSystem.light().colors.white,
        buttonTextColor = WidgetToolkitDesignSystem.light().colors.black,
        shimmerBaseColor =
            WidgetToolkitDesignSystem.light().colors.shimmerBaseColor,
        shimmerHighlightColor =
            WidgetToolkitDesignSystem.light().colors.shimmerHighlightColor,
        messagePanelColorNeutral =
            WidgetToolkitDesignSystem.light().colors.textColorWhite,
        buttonBlueGradientEnd =
            WidgetToolkitDesignSystem.light().colors.buttonBlueGradientEnd,
        elevatedButtonBackgroundColor =
            WidgetToolkitDesignSystem.light().colors.lightGray,
        smallButtonFilledBackgroundColor =
            WidgetToolkitDesignSystem.light().colors.white,
        smallButtonOutlinedBorderColor =
            WidgetToolkitDesignSystem.light().colors.mediumWhite,
        activeButtonLanguageTextColor = WidgetToolkitDesignSystem.light()
            .colors
            .activeButtonLanguageTextColor,
        activeButtonTextColor =
            WidgetToolkitDesignSystem.light().colors.black87,
        disabledButtonTextColor = WidgetToolkitDesignSystem.light().colors.gray,
        shimmerTextColor = WidgetToolkitDesignSystem.light().colors.black,
        activeGradientColorStart =
            WidgetToolkitDesignSystem.light().colors.blue,
        activeGradientColorEnd =
            WidgetToolkitDesignSystem.light().colors.lightGray,
        boxShadowColor = WidgetToolkitDesignSystem.light().colors.red,
        messagePanelBackgroundColorNeutral =
            WidgetToolkitDesignSystem.light().colors.red,
        messagePanelColorLessImportant =
            WidgetToolkitDesignSystem.light().colors.orange,
        messagePanelBackgroundColorLessImportant =
            WidgetToolkitDesignSystem.light().colors.orangeLight,
        messagePanelColorInformative =
            WidgetToolkitDesignSystem.light().colors.darkBlue,
        messagePanelColorImportant =
            WidgetToolkitDesignSystem.light().colors.red,
        messagePanelColorPositive =
            WidgetToolkitDesignSystem.light().colors.darkGreen,
        textButtonLoadingIndicatorColor =
            WidgetToolkitDesignSystem.light().colors.redDark,
        buttonShadowColor = WidgetToolkitDesignSystem.light().colors.white,
        buttonPressedColor = WidgetToolkitDesignSystem.light().colors.blue,
        buttonBorderColor =
            WidgetToolkitDesignSystem.light().colors.mediumWhite,
        outlineButtonContentPadding =
            EdgeInsets.all(WidgetToolkitDesignSystem.light().spacings.m),
        outlineButtonTextStyle =
            WidgetToolkitDesignSystem.light().typography.descriptionBold,
        outlineButtonDescriptionTextStyle =
            WidgetToolkitDesignSystem.light().typography.descriptionBold,
        outlineButtonBackgroundColor =
            WidgetToolkitDesignSystem.light().colors.white,
        outlineButtonForegroundColor =
            WidgetToolkitDesignSystem.light().colors.buttonBlueGradientEnd,
        outlineButtonBorderColor =
            WidgetToolkitDesignSystem.light().colors.mediumWhite,
        outlineButtonPressedColor =
            WidgetToolkitDesignSystem.light().colors.buttonBlueGradientEnd,
        outlineButtonTextColor =
            WidgetToolkitDesignSystem.light().colors.primaryColor,
        outlineButtonTextColorDisabled =
            WidgetToolkitDesignSystem.light().colors.primaryColor,
        bottomSheetHeaderPadding = const EdgeInsets.only(left: 24),
        bottomSheetCloseButtonPadding = const EdgeInsets.only(top: 20),
        bottomSheetContentPadding = const EdgeInsets.fromLTRB(20, 20, 20, 0),
        messagePanelErrorEdgeInsets = const EdgeInsets.only(bottom: 20),
        errorModalContentTitleInsets = const EdgeInsets.only(bottom: 8),
        smallButtonPadding = const EdgeInsets.all(12),
        gradientFillButtonDefaultPadding = const EdgeInsets.all(16),
        messagePanelEdgeInsets =
            const EdgeInsets.only(left: 20, top: 16, right: 16, bottom: 16),
        bottomSheetPaddingAlternative = const EdgeInsets.all(16),
        spacingXS = WidgetToolkitDesignSystem.light().spacings.xs1,
        spacingS = WidgetToolkitDesignSystem.light().spacings.s,
        spacingL = WidgetToolkitDesignSystem.light().spacings.l,
        spacingM = WidgetToolkitDesignSystem.light().spacings.m,
        spacingXL = WidgetToolkitDesignSystem.light().spacings.xl,
        spacingXXL = WidgetToolkitDesignSystem.light().spacings.xxl,
        spacingXXXXL = WidgetToolkitDesignSystem.light().spacings.xxxxl,
        textButtonIconRightPadding =
            WidgetToolkitDesignSystem.light().spacings.s,
        textButtonPadding = WidgetToolkitDesignSystem.light().spacings.xs,
        appBarTextButtonPadding =
            WidgetToolkitDesignSystem.light().spacings.xss,
        bottomSheetBottomPadding = WidgetToolkitDesignSystem.light().spacings.l,
        checkIcon = WidgetToolkitDesignSystem.dark().icons.checkIcon,
        checkCircleIcon =
            WidgetToolkitDesignSystem.dark().icons.checkCircleIcon,
        closeIcon = WidgetToolkitDesignSystem.dark().icons.closeIcon,
        dangerIcon = WidgetToolkitDesignSystem.dark().icons.dangerIcon,
        educateIcon = WidgetToolkitDesignSystem.dark().icons.educateIcon,
        greatNewsIcon = WidgetToolkitDesignSystem.dark().icons.greatNewsIcon,
        infoCircleIcon = WidgetToolkitDesignSystem.dark().icons.infoCircleIcon,
        messageIcon = WidgetToolkitDesignSystem.dark().icons.messageIcon;

  WidgetToolkitTheme.dark()
      : primaryColor = WidgetToolkitDesignSystem.dark().colors.primaryColor,
        backgroundColor =
            WidgetToolkitDesignSystem.dark().colors.backgroundColor,
        scaffoldBackgroundColor =
            WidgetToolkitDesignSystem.dark().colors.scaffoldBackgroundColor,
        highlightColor = WidgetToolkitDesignSystem.dark().colors.highlightColor,
        primaryGradientStart = WidgetToolkitDesignSystem.dark().colors.darkBlue,
        primaryGradientEnd = WidgetToolkitDesignSystem.dark().colors.blue,
        searchTextFieldIconColor =
            WidgetToolkitDesignSystem.dark().colors.mediumWhite,
        searchTextFieldIconColorActive =
            WidgetToolkitDesignSystem.dark().colors.darkBlue,
        searchTextFieldBackgroundColor =
            WidgetToolkitDesignSystem.dark().colors.darkGray,
        searchTextFieldBackgroundColorActive =
            WidgetToolkitDesignSystem.dark().colors.darkGray,
        searchTextFieldBorderRadius =
            WidgetToolkitDesignSystem.light().spacings.xs,
        searchTextFieldBorderType = Border.all(
          color: WidgetToolkitDesignSystem.light().colors.mediumWhite,
          width: WidgetToolkitDesignSystem.light().spacings.xxxs,
        ),
        searchTextFieldIconEdgeInsets = EdgeInsets.symmetric(
          horizontal: WidgetToolkitDesignSystem.light().spacings.m,
          vertical: WidgetToolkitDesignSystem.light().spacings.s,
        ),
        searchTextFieldHintStyle =
            WidgetToolkitDesignSystem.dark().typography.h3Reg14.copyWith(
                  color: WidgetToolkitDesignSystem.dark().colors.gray,
                ),
        searchTextFieldTextStyle = WidgetToolkitDesignSystem.dark()
            .typography
            .descriptionBold
            .copyWith(
              color: WidgetToolkitDesignSystem.dark().colors.blue,
            ),
        pickerListItemInnerEdgeInsets =
            const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        pickerListItemOuterEdgeInsets =
            const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        pickerListItemBorderRadius = 8,
        pickerListItemSelectedColor =
            WidgetToolkitDesignSystem.dark().colors.darkBlue,
        pickerListItemUnselectedColor =
            WidgetToolkitDesignSystem.dark().colors.transparent,
        pickerListItemTextStyle =
            WidgetToolkitDesignSystem.dark().typography.h3Reg14,
        captionBold = WidgetToolkitDesignSystem.dark().typography.captionBold,
        textButtonTextStyle =
            WidgetToolkitDesignSystem.dark().typography.captionBold,
        errorCardIconColor =
            WidgetToolkitDesignSystem.dark().colors.mediumWhite,
        errorCardBackgroundColor =
            WidgetToolkitDesignSystem.dark().colors.redDark,
        messagePanelBackgroundColorImportant =
            WidgetToolkitDesignSystem.dark().colors.lightRed,
        messagePanelBackgroundColorInformative =
            WidgetToolkitDesignSystem.dark().colors.blueLight,
        messagePanelBackgroundColorPositive =
            WidgetToolkitDesignSystem.dark().colors.greenLight,
        errorCardTextColor = WidgetToolkitDesignSystem.dark().colors.white,
        bottomSheetBarrierColor =
            WidgetToolkitDesignSystem.dark().colors.bottomSheetBarrierColor,
        messagePanelBackgroundColor =
            WidgetToolkitDesignSystem.dark().colors.lightGray,
        bottomSheetLineColor = WidgetToolkitDesignSystem.dark().colors.gray,
        bottomSheetBackgroundColor =
            WidgetToolkitDesignSystem.dark().colors.darkGray,
        bottomSheetBorderColor =
            WidgetToolkitDesignSystem.dark().colors.lightGray,
        loadingIndicatorColor =
            WidgetToolkitDesignSystem.dark().colors.primaryColor,
        descriptionBold =
            WidgetToolkitDesignSystem.dark().typography.descriptionBold,
        titleBold = WidgetToolkitDesignSystem.dark().typography.titleBold,
        descriptionThin =
            WidgetToolkitDesignSystem.dark().typography.descriptionThin,
        errorTitle = WidgetToolkitDesignSystem.dark().typography.errorTitle,
        disabledFilledButtonBackgroundColor =
            WidgetToolkitDesignSystem.dark().colors.gray,
        filledButtonBackgroundColorDisabled =
            WidgetToolkitDesignSystem.dark().colors.lightGray,
        filledButtonBackgroundColorPressed =
            WidgetToolkitDesignSystem.dark().colors.blueAccent,
        filledButtonTextColorDisabled =
            WidgetToolkitDesignSystem.dark().colors.gray,
        textButtonTextColorDisabled =
            WidgetToolkitDesignSystem.dark().colors.gray,
        textButtonBackgroundColor =
            WidgetToolkitDesignSystem.dark().colors.transparent,
        filledButtonTextColorEnabled =
            WidgetToolkitDesignSystem.dark().colors.activeButtonTextColor,
        smallButtonBackgroundColor =
            WidgetToolkitDesignSystem.dark().colors.darkGray,
        buttonTextColor = WidgetToolkitDesignSystem.dark().colors.white,
        shimmerBaseColor =
            WidgetToolkitDesignSystem.dark().colors.shimmerBaseColor,
        shimmerHighlightColor =
            WidgetToolkitDesignSystem.dark().colors.shimmerHighlightColor,
        messagePanelColorNeutral =
            WidgetToolkitDesignSystem.dark().colors.textColorWhite,
        buttonBlueGradientEnd =
            WidgetToolkitDesignSystem.dark().colors.buttonBlueGradientEnd,
        elevatedButtonBackgroundColor =
            WidgetToolkitDesignSystem.dark().colors.lightGray,
        smallButtonFilledBackgroundColor =
            WidgetToolkitDesignSystem.dark().colors.mediumWhite,
        smallButtonOutlinedBorderColor =
            WidgetToolkitDesignSystem.dark().colors.mediumWhite,
        activeButtonLanguageTextColor = WidgetToolkitDesignSystem.dark()
            .colors
            .activeButtonLanguageTextColor,
        activeButtonTextColor = WidgetToolkitDesignSystem.dark().colors.white,
        disabledButtonTextColor = WidgetToolkitDesignSystem.dark().colors.gray,
        shimmerTextColor = WidgetToolkitDesignSystem.dark().colors.white,
        activeGradientColorStart = WidgetToolkitDesignSystem.dark().colors.blue,
        activeGradientColorEnd =
            WidgetToolkitDesignSystem.dark().colors.lightGray,
        boxShadowColor = WidgetToolkitDesignSystem.dark().colors.red,
        messagePanelBackgroundColorNeutral =
            WidgetToolkitDesignSystem.dark().colors.red,
        messagePanelColorLessImportant =
            WidgetToolkitDesignSystem.dark().colors.orange,
        messagePanelBackgroundColorLessImportant =
            WidgetToolkitDesignSystem.dark().colors.orangeLight,
        messagePanelColorInformative =
            WidgetToolkitDesignSystem.dark().colors.darkBlue,
        messagePanelColorImportant =
            WidgetToolkitDesignSystem.dark().colors.red,
        messagePanelColorPositive =
            WidgetToolkitDesignSystem.dark().colors.darkGreen,
        textButtonLoadingIndicatorColor =
            WidgetToolkitDesignSystem.dark().colors.redDark,
        buttonShadowColor = WidgetToolkitDesignSystem.dark().colors.white,
        buttonPressedColor = WidgetToolkitDesignSystem.dark().colors.blue,
        buttonBorderColor = WidgetToolkitDesignSystem.dark().colors.mediumWhite,
        outlineButtonContentPadding =
            EdgeInsets.all(WidgetToolkitDesignSystem.dark().spacings.m),
        outlineButtonTextStyle =
            WidgetToolkitDesignSystem.light().typography.descriptionBold,
        outlineButtonDescriptionTextStyle =
            WidgetToolkitDesignSystem.light().typography.descriptionBold,
        outlineButtonBackgroundColor =
            WidgetToolkitDesignSystem.light().colors.white,
        outlineButtonForegroundColor =
            WidgetToolkitDesignSystem.light().colors.buttonBlueGradientEnd,
        outlineButtonBorderColor =
            WidgetToolkitDesignSystem.light().colors.mediumWhite,
        outlineButtonPressedColor =
            WidgetToolkitDesignSystem.light().colors.buttonBlueGradientEnd,
        outlineButtonTextColor =
            WidgetToolkitDesignSystem.light().colors.primaryColor,
        outlineButtonTextColorDisabled =
            WidgetToolkitDesignSystem.light().colors.primaryColor,
        bottomSheetHeaderPadding = const EdgeInsets.only(left: 24),
        bottomSheetCloseButtonPadding = const EdgeInsets.only(top: 20),
        bottomSheetContentPadding = const EdgeInsets.fromLTRB(20, 20, 20, 0),
        messagePanelErrorEdgeInsets = const EdgeInsets.only(bottom: 20),
        errorModalContentTitleInsets = const EdgeInsets.only(bottom: 8),
        smallButtonPadding = const EdgeInsets.all(12),
        gradientFillButtonDefaultPadding = const EdgeInsets.all(16),
        messagePanelEdgeInsets =
            const EdgeInsets.only(left: 20, top: 16, right: 16, bottom: 16),
        bottomSheetPaddingAlternative = const EdgeInsets.all(16),
        spacingXS = WidgetToolkitDesignSystem.dark().spacings.xs1,
        spacingS = WidgetToolkitDesignSystem.dark().spacings.s,
        spacingL = WidgetToolkitDesignSystem.dark().spacings.l,
        spacingM = WidgetToolkitDesignSystem.dark().spacings.m,
        spacingXL = WidgetToolkitDesignSystem.dark().spacings.xl,
        spacingXXL = WidgetToolkitDesignSystem.dark().spacings.xxl,
        spacingXXXXL = WidgetToolkitDesignSystem.dark().spacings.xxxxl,
        textButtonIconRightPadding =
            WidgetToolkitDesignSystem.dark().spacings.s,
        textButtonPadding = WidgetToolkitDesignSystem.dark().spacings.xs,
        appBarTextButtonPadding = WidgetToolkitDesignSystem.dark().spacings.xss,
        bottomSheetBottomPadding = WidgetToolkitDesignSystem.dark().spacings.l,
        checkIcon = WidgetToolkitDesignSystem.light().icons.checkIcon,
        checkCircleIcon =
            WidgetToolkitDesignSystem.light().icons.checkCircleIcon,
        closeIcon = WidgetToolkitDesignSystem.light().icons.closeIcon,
        dangerIcon = WidgetToolkitDesignSystem.light().icons.dangerIcon,
        educateIcon = WidgetToolkitDesignSystem.light().icons.educateIcon,
        greatNewsIcon = WidgetToolkitDesignSystem.light().icons.greatNewsIcon,
        infoCircleIcon = WidgetToolkitDesignSystem.light().icons.infoCircleIcon,
        messageIcon = WidgetToolkitDesignSystem.light().icons.messageIcon;

  /// endregion

  /// Canonical brand hue that apps typically mirror onto ThemeData.primaryColor or ColorScheme.primary so surrounding Material chrome matches toolkit gradients sourced from related fields below.
  @override
  final Color primaryColor;
  /// Typical canvas tint that hosts align with ThemeData scaffold or dialog backgrounds when embedding blurred sheets powered by these tokens.
  @override
  final Color backgroundColor;
  /// Preferred scaffold wash that aligns host pages before presenting flows that reuse [showBlurredBottomSheet].
  @override
  final Color scaffoldBackgroundColor;
  /// High-contrast ink applied to inline icons when [EditAddressWidget] recolors SVG assets for neutral info actions.
  @override
  final Color highlightColor;
  /// Leading stops for primary gradients inside [GradientFillButton], [SmallButton], and [IconTextButton] affordances.
  @override
  final Color primaryGradientStart;
  /// Trailing stops for those gradients and for muted controls that still need a brand accent in `show_blurred_bottom_sheet.dart`.
  @override
  final Color primaryGradientEnd;
  /// Idle search icon stroke on [SearchPickerTextField] before the field focuses.
  @override
  final Color searchTextFieldIconColor;
  /// Active search icon stroke after the observer marks the query field focused in `search_picker_text_field.dart`.
  @override
  final Color searchTextFieldIconColorActive;
  /// Default field wash behind picker search outlines in `search_picker_text_field.dart`.
  @override
  final Color searchTextFieldBackgroundColor;
  /// Alternate wash conveying focus or typing state for the same widget.
  @override
  final Color searchTextFieldBackgroundColorActive;
  /// Corner rounding shared by the bordered search capsule in `search_picker_text_field.dart`.
  @override
  final double searchTextFieldBorderRadius;
  /// Outline specification matched to the capsule border painting in `search_picker_text_field.dart`.
  @override
  final BoxBorder searchTextFieldBorderType;
  /// Insets translating search icons away from typography within `search_picker_text_field.dart`.
  @override
  final EdgeInsets searchTextFieldIconEdgeInsets;
  /// Hint style before operators type inside `search_picker_text_field.dart`.
  @override
  final TextStyle searchTextFieldHintStyle;
  /// Composed query style rendered once text populates `search_picker_text_field.dart`.
  @override
  final TextStyle searchTextFieldTextStyle;
  /// Inner padding wrapping label text on every [PickerListItem] row in `picker_list_item.dart`.
  @override
  final EdgeInsets pickerListItemInnerEdgeInsets;
  /// Outer padding spacing consecutive list rows in `picker_list_item.dart`.
  @override
  final EdgeInsets pickerListItemOuterEdgeInsets;
  /// Corner radius animating focus states on [PickerListItem].
  @override
  final double pickerListItemBorderRadius;
  /// Fill when a row reports itself selected within `picker_list_item.dart`.
  @override
  final Color pickerListItemSelectedColor;
  /// Fill when the row idles without selection in `picker_list_item.dart`.
  @override
  final Color pickerListItemUnselectedColor;
  /// Typography for item titles inside `picker_list_item.dart`.
  @override
  final TextStyle pickerListItemTextStyle;
  /// Uppercase caption treatment embedded in [MessagePanelWidget] skeletons and loading rows.
  @override
  final TextStyle captionBold;
  /// Baseline label style for [IconTextButton] before hosts override with custom TextStyle parameters.
  @override
  final TextStyle textButtonTextStyle;
  /// Icon tint inside [ErrorCardWidget] leading artwork.
  @override
  final Color errorCardIconColor;
  /// Card surface fill behind error summaries in `error_card_widget.dart`.
  @override
  final Color errorCardBackgroundColor;
  /// Panel wash when [MessagePanelWidget] renders MessagePanelState.important backgrounds.
  @override
  final Color messagePanelBackgroundColorImportant;
  /// Panel wash for informative states on [MessagePanelWidget].
  @override
  final Color messagePanelBackgroundColorInformative;
  /// Panel wash for positive reinforcement states on [MessagePanelWidget].
  @override
  final Color messagePanelBackgroundColorPositive;
  /// Body text color on [ErrorCardWidget] once warnings materialize.
  @override
  final Color errorCardTextColor;
  /// Dimming layer shown behind modal sheets opened through [showBlurredBottomSheet].
  @override
  final Color bottomSheetBarrierColor;
  /// Default neutral wash for [MessagePanelWidget] when states fall back to generic messaging.
  @override
  final Color messagePanelBackgroundColor;
  /// Hairline separator color between header chrome and body content in `show_blurred_bottom_sheet.dart`.
  @override
  final Color bottomSheetLineColor;
  /// Primary sheet surface fill for [showBlurredBottomSheet] containers and footers.
  @override
  final Color bottomSheetBackgroundColor;
  /// Border stroke available for hosts customizing sheet outlines that should stay on palette with toolkit defaults.
  @override
  final Color bottomSheetBorderColor;
  /// Stroke on [SizedLoadingIndicator] when callers rely on the themed default color.
  @override
  final Color loadingIndicatorColor;
  /// Semibold body copy on [ErrorCardWidget] and [GradientFillButton] labels.
  @override
  final TextStyle descriptionBold;
  /// Title style available for host-authored chrome that should align with toolkit heading cadence.
  @override
  final TextStyle titleBold;
  /// Supporting body style available for host-authored helper copy adjacent to toolkit flows.
  @override
  final TextStyle descriptionThin;
  /// Emphasis style reserved for error headings that hosts render beside toolkit sheets.
  @override
  final TextStyle errorTitle;
  /// Disabled fill for outline actions such as the dismiss control in `show_blurred_bottom_sheet.dart`.
  @override
  final Color disabledFilledButtonBackgroundColor;
  /// Flat fill for disabled [GradientFillButton] variants while gradients rest.
  @override
  final Color filledButtonBackgroundColorDisabled;
  /// Pressed-state fill for gradient buttons and language rows referencing [GradientFillButton] behavior.
  @override
  final Color filledButtonBackgroundColorPressed;
  /// Label color when gradient buttons cannot accept input in `gradient_fill_button.dart`.
  @override
  final Color filledButtonTextColorDisabled;
  /// Muted label color for disabled [IconTextButton] rows in `icon_text_button.dart`.
  @override
  final Color textButtonTextColorDisabled;
  /// Transparent wash keeping text buttons visually flat in `icon_text_button.dart`.
  @override
  final Color textButtonBackgroundColor;
  /// Enabled label color on [GradientFillButton].
  @override
  final Color filledButtonTextColorEnabled;
  /// Fill for idle [SmallButton] outline variants in `small_button.dart`.
  @override
  final Color smallButtonBackgroundColor;
  /// Shared label pigment for compact buttons inside `small_button.dart`.
  @override
  final Color buttonTextColor;
  /// Base shimmer band for [ShimmerWrapper], [ShimmerPlaceholderWidget], and panel skeletons inside [MessagePanelWidget].
  @override
  final Color shimmerBaseColor;
  /// Moving highlight layered on top of shimmer placeholders in those same surfaces.
  @override
  final Color shimmerHighlightColor;
  /// Foreground tone for neutral message states while icons stay monochrome in [MessagePanelWidget].
  @override
  final Color messagePanelColorNeutral;
  /// Cool gradient stop paired with primary blues on outlined buttons and language tiles when hosts align elevated actions.
  @override
  final Color buttonBlueGradientEnd;
  /// Surface fill that hosts align with ThemeData elevated buttons wrapping toolkit modals.
  @override
  final Color elevatedButtonBackgroundColor;
  /// Solid fill for filled [SmallButton] treatments in `small_button.dart`.
  @override
  final Color smallButtonFilledBackgroundColor;
  /// Stroke around outlined [SmallButton] frames in `small_button.dart`.
  @override
  final Color smallButtonOutlinedBorderColor;
  /// Text color for bilingual selection buttons that hosts style next to [LanguagePickerTheme] tiles.
  @override
  final Color activeButtonLanguageTextColor;
  /// Enabled label color for [IconTextButton] and components built with [ButtonColorStyle.fromContext].
  @override
  final Color activeButtonTextColor;
  /// Disabled label color within [ButtonColorStyle] inactive states.
  @override
  final Color disabledButtonTextColor;
  /// Confident text color used when shimmer rows in [MessagePanelWidget] exit placeholder mode.
  @override
  final Color shimmerTextColor;
  /// Leading color for multi-stop gradients inside [ButtonColorStyle] active treatments.
  @override
  final Color activeGradientColorStart;
  /// Trailing color finishing those gradients in `button_color_style.dart`.
  @override
  final Color activeGradientColorEnd;
  /// Ambient shadow pigment for elevated chips that hosts render next to toolkit buttons.
  @override
  final Color boxShadowColor;
  /// Background wash paired with neutral message states in [MessagePanelWidget].
  @override
  final Color messagePanelBackgroundColorNeutral;
  /// Foreground emphasis for MessagePanelState.lessImportant pathways in `message_panel_widget.dart`.
  @override
  final Color messagePanelColorLessImportant;
  /// Panel fill variant for MessagePanelState.lessImportant in `message_panel_widget.dart`.
  @override
  final Color messagePanelBackgroundColorLessImportant;
  /// Foreground tone for informative states in `message_panel_widget.dart`.
  @override
  final Color messagePanelColorInformative;
  /// Foreground tone for urgent states in `message_panel_widget.dart`.
  @override
  final Color messagePanelColorImportant;
  /// Foreground tone for positive states in `message_panel_widget.dart`.
  @override
  final Color messagePanelColorPositive;
  /// Spinner color that hosts apply to trailing progress indicators on text buttons mirroring toolkit behavior.
  @override
  final Color textButtonLoadingIndicatorColor;
  /// Drop shadow pigment for elevated [ButtonColorStyle] surfaces.
  @override
  final Color buttonShadowColor;
  /// Pressed overlay pigment for gradient and outline interactions within [ButtonColorStyle].
  @override
  final Color buttonPressedColor;
  /// Outline stroke shared by [ButtonColorStyle] wrappers.
  @override
  final Color buttonBorderColor;
  /// Interior padding for [OutlineFillButton] rows in `outline_fill_button.dart`.
  @override
  final EdgeInsets outlineButtonContentPadding;
  /// Primary label typography on [OutlineFillButton].
  @override
  final TextStyle outlineButtonTextStyle;
  /// Secondary descriptive typography beneath titles on [OutlineFillButton].
  @override
  final TextStyle outlineButtonDescriptionTextStyle;
  /// Idle surface fill for [OutlineFillButton].
  @override
  final Color outlineButtonBackgroundColor;
  /// Icon and gradient foreground color on [OutlineFillButton].
  @override
  final Color outlineButtonForegroundColor;
  /// Border stroke on idle [OutlineFillButton] frames.
  @override
  final Color outlineButtonBorderColor;
  /// Pressed fill for [OutlineFillButton] highlights in `outline_fill_button.dart`.
  @override
  final Color outlineButtonPressedColor;
  /// Enabled text color on [OutlineFillButton].
  @override
  final Color outlineButtonTextColor;
  /// Disabled text color on [OutlineFillButton].
  @override
  final Color outlineButtonTextColorDisabled;
  /// Left inset aligning sheet titles with drag handles in `show_blurred_bottom_sheet.dart`.
  @override
  final EdgeInsets bottomSheetHeaderPadding;
  /// Top inset positioning close controls on modal headers in `show_blurred_bottom_sheet.dart`.
  @override
  final EdgeInsets bottomSheetCloseButtonPadding;
  /// Primary body padding inside draggable sheets opened through [showBlurredBottomSheet].
  @override
  final EdgeInsets bottomSheetContentPadding;
  /// Bottom inset before error rows meet sibling widgets; hosts pair it with [MessagePanelError] outside this package when they need matching rhythm.
  @override
  final EdgeInsets messagePanelErrorEdgeInsets;
  /// Title padding within [showErrorBlurredBottomSheet] error presentations.
  @override
  final EdgeInsets errorModalContentTitleInsets;
  /// Uniform padding for compact [SmallButton] hit targets in `small_button.dart`.
  @override
  final EdgeInsets smallButtonPadding;
  /// Default padding for [GradientFillButton] labels when callers omit explicit inset overrides.
  @override
  final EdgeInsets gradientFillButtonDefaultPadding;
  /// Outer padding wrapping [MessagePanelWidget] cards.
  @override
  final EdgeInsets messagePanelEdgeInsets;
  /// Alternate sheet padding hosts can apply when creating custom sheet bodies that still need harmony with toolkit defaults.
  @override
  final EdgeInsets bottomSheetPaddingAlternative;

  /// Extra-tight rhythm for skeleton bars and inline dividers inside [MessagePanelWidget].
  @override
  final double spacingXS;
  /// Separator width beside [OutlineFillButton] iconography in `outline_fill_button.dart`.
  @override
  final double spacingS;
  /// Mid-scale spacing increment for companion layouts hosts mount next to toolkit pages.
  @override
  final double spacingL;
  /// Standard gutter separating iconography from typography in [MessagePanelWidget].
  @override
  final double spacingM;
  /// Width and height modulus for shimmer placeholders in `message_panel_widget.dart`.
  @override
  final double spacingXL;
  /// Square sizing for shimmering avatar placeholders inside [MessagePanelWidget].
  @override
  final double spacingXXL;
  /// Large vertical rhythm hosts reuse when stacking sections above toolkit modals.
  @override
  final double spacingXXXXL;

  /// Spacing between trailing icons and labels on [IconTextButton].
  @override
  final double textButtonIconRightPadding;
  /// Horizontal padding wrapping [IconTextButton] content.
  @override
  final double textButtonPadding;
  /// Trailing inset for toolbar-styled [IconTextButton] placements in `icon_text_button.dart`.
  @override
  final double appBarTextButtonPadding;
  /// Spacer height before bottom safe areas on modal sheets configured in `show_blurred_bottom_sheet.dart`.
  @override
  final double bottomSheetBottomPadding;
  /// Success glyph hosts can pair with bilingual pickers or custom confirmation rows that follow [SelectLanguageItem] visual language.
  @override
  final SvgFile checkIcon;
  /// Positive status artwork for neutral success states inside [MessagePanelWidget].
  @override
  final SvgFile checkCircleIcon;
  /// Dismiss artwork hosts mount on custom modal headers aligned with toolkit affordances.
  @override
  final SvgFile closeIcon;
  /// Error-state vector for MessagePanelState.important inside [MessagePanelWidget].
  @override
  final SvgFile dangerIcon;
  /// Education-state vector for MessagePanelState.informative inside [MessagePanelWidget].
  @override
  final SvgFile educateIcon;
  /// Celebration-state vector for MessagePanelState.positive inside [MessagePanelWidget].
  @override
  final SvgFile greatNewsIcon;
  /// Neutral info vector carried by MessagePanelState paths in `message_panel_widget.dart` and recolored in `edit_address_widget.dart`.
  @override
  final SvgFile infoCircleIcon;
  /// General messaging vector for MessagePanelState.neutral variants in `message_panel_widget.dart`.
  @override
  final SvgFile messageIcon;
}

extension ThemeContextExtension on BuildContext {
  /// Returns a reference to the [WidgetToolkitTheme] theme extension of the current [Theme]
  WidgetToolkitTheme get widgetToolkitTheme {
    final theme = Theme.of(this).extension<WidgetToolkitTheme>();
    if (theme == null) {
      throw UnimplementedError(
        'Not Implemented WidgetToolkitTheme. '
        'Please add it as extension to the MaterialApp -> ThemeData',
      );
    }

    return theme;
  }
}
