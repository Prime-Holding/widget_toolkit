import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../asset_classes.dart';
import 'design_system/widget_toolkit_design_system.dart';

part 'widget_toolkit_theme.tailor.dart';

@TailorMixinComponent()
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
    required this.textColorWhite,
    required this.bodyTextColor2,
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
    required this.spacingXS1,
    required this.spacingXS,
    required this.spacingXSS,
    required this.spacingS,
    required this.spacingM,
    required this.spacingL,
    required this.spacingXL,
    required this.spacingXXL,
    required this.spacingXXXXL1,
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
        textColorWhite =
            WidgetToolkitDesignSystem.light().colors.textColorWhite,
        bodyTextColor2 = WidgetToolkitDesignSystem.light().colors.black,
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
        spacingXS1 = WidgetToolkitDesignSystem.light().spacings.xs1,
        spacingXS = WidgetToolkitDesignSystem.light().spacings.xs,
        spacingXSS = WidgetToolkitDesignSystem.light().spacings.xss,
        spacingS = WidgetToolkitDesignSystem.light().spacings.s,
        spacingM = WidgetToolkitDesignSystem.light().spacings.m,
        spacingL = WidgetToolkitDesignSystem.light().spacings.l,
        spacingXL = WidgetToolkitDesignSystem.light().spacings.xl,
        spacingXXL = WidgetToolkitDesignSystem.light().spacings.xxl,
        spacingXXXXL1 = WidgetToolkitDesignSystem.light().spacings.xxxxl1,
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
        textColorWhite = WidgetToolkitDesignSystem.dark().colors.textColorWhite,
        bodyTextColor2 =
            WidgetToolkitDesignSystem.dark().colors.activeButtonTextColor,
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
        spacingXS1 = WidgetToolkitDesignSystem.dark().spacings.xs1,
        spacingXS = WidgetToolkitDesignSystem.dark().spacings.xs,
        spacingXSS = WidgetToolkitDesignSystem.dark().spacings.xss,
        spacingS = WidgetToolkitDesignSystem.dark().spacings.s,
        spacingM = WidgetToolkitDesignSystem.dark().spacings.m,
        spacingL = WidgetToolkitDesignSystem.dark().spacings.l,
        spacingXL = WidgetToolkitDesignSystem.dark().spacings.xl,
        spacingXXL = WidgetToolkitDesignSystem.dark().spacings.xxl,
        spacingXXXXL1 = WidgetToolkitDesignSystem.dark().spacings.xxxxl1,
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

  @override
  final Color primaryColor;
  @override
  final Color backgroundColor;
  @override
  final Color scaffoldBackgroundColor;
  @override
  final Color highlightColor;
  @override
  final Color primaryGradientStart;
  @override
  final Color primaryGradientEnd;
  @override
  final Color searchTextFieldIconColor;
  @override
  final Color searchTextFieldIconColorActive;
  @override
  final Color searchTextFieldBackgroundColor;
  @override
  final Color searchTextFieldBackgroundColorActive;
  @override
  final double searchTextFieldBorderRadius;
  @override
  final BoxBorder searchTextFieldBorderType;
  @override
  final EdgeInsets searchTextFieldIconEdgeInsets;
  @override
  final TextStyle searchTextFieldHintStyle;
  @override
  final TextStyle searchTextFieldTextStyle;
  @override
  final EdgeInsets pickerListItemInnerEdgeInsets;
  @override
  final EdgeInsets pickerListItemOuterEdgeInsets;
  @override
  final double pickerListItemBorderRadius;
  @override
  final Color pickerListItemSelectedColor;
  @override
  final Color pickerListItemUnselectedColor;
  @override
  final TextStyle pickerListItemTextStyle;
  @override
  final TextStyle captionBold;
  @override
  final TextStyle textButtonTextStyle;
  @override
  final Color errorCardIconColor;
  @override
  final Color errorCardBackgroundColor;
  @override
  final Color messagePanelBackgroundColorImportant;
  @override
  final Color messagePanelBackgroundColorInformative;
  @override
  final Color messagePanelBackgroundColorPositive;
  @override
  final Color errorCardTextColor;
  @override
  final Color bottomSheetBarrierColor;
  @override
  final Color messagePanelBackgroundColor;
  @override
  final Color bottomSheetLineColor;
  @override
  final Color bottomSheetBackgroundColor;
  @override
  final Color bottomSheetBorderColor;
  @override
  final Color loadingIndicatorColor;
  @override
  final TextStyle descriptionBold;
  @override
  final TextStyle titleBold;
  @override
  final TextStyle descriptionThin;
  @override
  final TextStyle errorTitle;
  @override
  final Color disabledFilledButtonBackgroundColor;
  @override
  final Color filledButtonBackgroundColorDisabled;
  @override
  final Color filledButtonBackgroundColorPressed;
  @override
  final Color filledButtonTextColorDisabled;
  @override
  final Color textButtonTextColorDisabled;
  @override
  final Color textButtonBackgroundColor;
  @override
  final Color filledButtonTextColorEnabled;
  @override
  final Color smallButtonBackgroundColor;
  @override
  final Color buttonTextColor;
  @override
  final Color shimmerBaseColor;
  @override
  final Color shimmerHighlightColor;
  @override
  final Color messagePanelColorNeutral;
  @override
  final Color buttonBlueGradientEnd;
  @override
  final Color elevatedButtonBackgroundColor;
  @override
  final Color textColorWhite;
  @override
  final Color bodyTextColor2;
  @override
  final Color smallButtonFilledBackgroundColor;
  @override
  final Color smallButtonOutlinedBorderColor;
  @override
  final Color activeButtonLanguageTextColor;
  @override
  final Color activeButtonTextColor;
  @override
  final Color disabledButtonTextColor;
  @override
  final Color shimmerTextColor;
  @override
  final Color activeGradientColorStart;
  @override
  final Color activeGradientColorEnd;
  @override
  final Color boxShadowColor;
  @override
  final Color messagePanelBackgroundColorNeutral;
  @override
  final Color messagePanelColorLessImportant;
  @override
  final Color messagePanelBackgroundColorLessImportant;
  @override
  final Color messagePanelColorInformative;
  @override
  final Color messagePanelColorImportant;
  @override
  final Color messagePanelColorPositive;
  @override
  final Color textButtonLoadingIndicatorColor;
  @override
  final Color buttonShadowColor;
  @override
  final Color buttonPressedColor;
  @override
  final Color buttonBorderColor;
  @override
  final EdgeInsets outlineButtonContentPadding;
  @override
  final TextStyle outlineButtonTextStyle;
  @override
  final TextStyle outlineButtonDescriptionTextStyle;
  @override
  final Color outlineButtonBackgroundColor;
  @override
  final Color outlineButtonForegroundColor;
  @override
  final Color outlineButtonBorderColor;
  @override
  final Color outlineButtonPressedColor;
  @override
  final Color outlineButtonTextColor;
  @override
  final Color outlineButtonTextColorDisabled;
  @override
  final EdgeInsets bottomSheetHeaderPadding;
  @override
  final EdgeInsets bottomSheetCloseButtonPadding;
  @override
  final EdgeInsets bottomSheetContentPadding;
  @override
  final EdgeInsets messagePanelErrorEdgeInsets;
  @override
  final EdgeInsets errorModalContentTitleInsets;
  @override
  final EdgeInsets smallButtonPadding;
  @override
  final EdgeInsets gradientFillButtonDefaultPadding;
  @override
  final EdgeInsets messagePanelEdgeInsets;
  @override
  final EdgeInsets bottomSheetPaddingAlternative;
  @override
  final double spacingXS1;
  @override
  final double spacingXS;
  @override
  final double spacingXSS;
  @override
  final double spacingS;
  @override
  final double spacingM;
  @override
  final double spacingL;
  @override
  final double spacingXL;
  @override
  final double spacingXXL;
  @override
  final double spacingXXXXL1;
  @override
  final double textButtonIconRightPadding;
  @override
  final double textButtonPadding;
  @override
  final double appBarTextButtonPadding;
  @override
  final double bottomSheetBottomPadding;
  @override
  final SvgFile checkIcon;
  @override
  final SvgFile checkCircleIcon;
  @override
  final SvgFile closeIcon;
  @override
  final SvgFile dangerIcon;
  @override
  final SvgFile educateIcon;
  @override
  final SvgFile greatNewsIcon;
  @override
  final SvgFile infoCircleIcon;
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
