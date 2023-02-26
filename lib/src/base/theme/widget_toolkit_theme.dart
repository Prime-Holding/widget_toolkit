import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../asset_classes.dart';
import 'design_system/design_system.dart';

part 'widget_toolkit_theme.tailor.dart';

@Tailor(themeGetter: ThemeGetter.none)
class _$WidgetToolkitTheme {
  /// region Primary

  static List<Color> primaryColor = [
    DesignSystem.light().colors.primaryColor,
    DesignSystem.dark().colors.primaryColor,
  ];

  static List<Color> backgroundColor = [
    DesignSystem.light().colors.backgroundColor,
    DesignSystem.dark().colors.backgroundColor,
  ];

  static List<Color> scaffoldBackgroundColor = [
    DesignSystem.light().colors.scaffoldBackgroundColor,
    DesignSystem.dark().colors.scaffoldBackgroundColor,
  ];

  static List<Color> highlightColor = [
    DesignSystem.light().colors.highlightColor,
    DesignSystem.dark().colors.highlightColor,
  ];

  static List<Color> primaryGradientStart = [
    DesignSystem.light().colors.blue,
    DesignSystem.dark().colors.darkBlue,
  ];

  static List<Color> primaryGradientEnd = [
    DesignSystem.light().colors.lightBlue,
    DesignSystem.dark().colors.blue,
  ];

  /// endregion

  /// region Common widgets

  static List<Color> searchTextFieldIconColor = [
    DesignSystem.light().colors.black,
    DesignSystem.dark().colors.mediumWhite,
  ];

  static List<Color> searchTextFieldIconColorActive = [
    DesignSystem.light().colors.blue,
    DesignSystem.dark().colors.darkBlue,
  ];

  static List<Color> searchTextFieldBackgroundColor = [
    DesignSystem.light().colors.white,
    DesignSystem.dark().colors.darkGray,
  ];

  static List<Color> searchTextFieldBackgroundColorActive = [
    DesignSystem.light().colors.mediumWhite,
    DesignSystem.dark().colors.darkGray,
  ];

  static List<double> searchTextFieldBorderRadius = [
    DesignSystem.light().spacings.xs,
    DesignSystem.light().spacings.xs,
  ];

  static List<BoxBorder> searchTextFieldBorderType = [
    Border.all(
      color: DesignSystem.light().colors.mediumWhite,
      width: DesignSystem.light().spacings.xxxs,
    ),
    Border.all(
      color: DesignSystem.light().colors.mediumWhite,
      width: DesignSystem.light().spacings.xxxs,
    ),
  ];

  static List<EdgeInsets> searchTextFieldIconEdgeInsets = [
    EdgeInsets.symmetric(
      horizontal: DesignSystem.light().spacings.m,
      vertical: DesignSystem.light().spacings.s,
    ),
    EdgeInsets.symmetric(
      horizontal: DesignSystem.light().spacings.m,
      vertical: DesignSystem.light().spacings.s,
    ),
  ];

  static List<TextStyle> searchTextFieldHintStyle = [
    DesignSystem.light().typography.h3Reg14.copyWith(
          color: DesignSystem.dark().colors.gray,
        ),
    DesignSystem.dark().typography.h3Reg14.copyWith(
          color: DesignSystem.dark().colors.gray,
        ),
  ];

  static List<TextStyle> searchTextFieldTextStyle = [
    DesignSystem.light().typography.descriptionBold.copyWith(
          color: DesignSystem.dark().colors.blue,
        ),
    DesignSystem.dark().typography.descriptionBold.copyWith(
          color: DesignSystem.dark().colors.blue,
        ),
  ];

  static List<EdgeInsets> pickerListItemInnerEdgeInsets = [
    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
  ];

  static List<EdgeInsets> pickerListItemOuterEdgeInsets = [
    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
  ];

  static List<double> pickerListItemBorderRadius = [8, 8];

  static List<Color> pickerListItemSelectedColor = [
    DesignSystem.light().colors.lightBlue,
    DesignSystem.dark().colors.darkBlue,
  ];

  static List<Color> pickerListItemUnselectedColor = [
    DesignSystem.light().colors.transparent,
    DesignSystem.dark().colors.transparent,
  ];

  static List<TextStyle> pickerListItemTextStyle = [
    DesignSystem.light().typography.h3Reg14,
    DesignSystem.dark().typography.h3Reg14,
  ];

  static List<TextStyle> captionBold = [
    DesignSystem.light().typography.captionBold,
    DesignSystem.dark().typography.captionBold,
  ];

  static List<TextStyle> textButtonTextStyle = captionBold;

  static List<Color> appErrorCardIconColor = [
    DesignSystem.light().colors.black87,
    DesignSystem.dark().colors.mediumWhite,
  ];

  static List<Color> appErrorCardBackgroundColor = [
    DesignSystem.light().colors.lightRed,
    DesignSystem.dark().colors.redDark,
  ];

  static List<Color> lightRed = [
    DesignSystem.light().colors.lightRed,
    DesignSystem.dark().colors.lightRed,
  ];

  static List<Color> blueLight = [
    DesignSystem.light().colors.blueLight,
    DesignSystem.dark().colors.blueLight,
  ];

  static List<Color> greenLight = [
    DesignSystem.light().colors.greenLight,
    DesignSystem.dark().colors.greenLight,
  ];
  static List<Color> appErrorCardTextColor = [
    DesignSystem.light().colors.black87,
    DesignSystem.dark().colors.white,
  ];

  static List<EdgeInsets> bottomSheetHeaderPadding = [
    const EdgeInsets.only(left: 24),
    const EdgeInsets.only(left: 24),
  ];

  static List<Color> bottomSheetBarrierColor = [
    DesignSystem.light().colors.bottomSheetBarrierColor,
    DesignSystem.dark().colors.bottomSheetBarrierColor,
  ];
  static List<Color> messagePanelBackgroundColor = [
    DesignSystem.light().colors.lightGray,
    DesignSystem.dark().colors.lightGray,
  ];

  static List<Color> bottomSheetLineColor = [
    DesignSystem.light().colors.gray,
    DesignSystem.dark().colors.gray,
  ];

  static List<Color> bottomSheetBackgroundColor = [
    DesignSystem.light().colors.white,
    DesignSystem.dark().colors.darkGray,
  ];

  static List<Color> bottomSheetBorderColor = [
    DesignSystem.light().colors.lightGray,
    DesignSystem.dark().colors.lightGray,
  ];

  static List<Color> loadingIndicatorColor = [
    DesignSystem.light().colors.primaryColor,
    DesignSystem.dark().colors.primaryColor,
  ];

  /// endregion

  /// region Common TextStyles

  static List<TextStyle> descriptionBold = [
    DesignSystem.light().typography.descriptionBold,
    DesignSystem.dark().typography.descriptionBold,
  ];

  static List<TextStyle> titleBold = [
    DesignSystem.light().typography.titleBold,
    DesignSystem.dark().typography.titleBold,
  ];

  static List<TextStyle> descriptionThin = [
    DesignSystem.light().typography.descriptionThin,
    DesignSystem.dark().typography.descriptionThin,
  ];

  static List<TextStyle> errorTitle = [
    DesignSystem.light().typography.errorTitle,
    DesignSystem.dark().typography.errorTitle,
  ];

  /// endregion

  /// region Buttons

  static List<Color> disabledFilledButtonBackgroundColor = [
    DesignSystem.light().colors.gray,
    DesignSystem.dark().colors.gray,
  ];
  static List<Color> gradientRedStart = [
    DesignSystem.light().colors.gradientRedStart,
    DesignSystem.dark().colors.gradientRedStart,
  ];

  static List<Color> gradientRedEnd = [
    DesignSystem.light().colors.gradientRedEnd,
    DesignSystem.dark().colors.gradientRedEnd,
  ];

  static List<Color> filledButtonBackgroundColorDisabled = [
    DesignSystem.light().colors.filledButtonBackgroundColorDisabled,
    DesignSystem.dark().colors.filledButtonBackgroundColorDisabled,
  ];

  static List<Color> appFilledButtonBackgroundColorDisabled = [
    DesignSystem.light().colors.lightGray,
    DesignSystem.dark().colors.lightGray,
  ];

  static List<Color> appFilledButtonTextColorDisabled = [
    DesignSystem.light().colors.gray,
    DesignSystem.dark().colors.gray,
  ];

  static List<Color> appTextButtonTextColorDisabled =
      appFilledButtonTextColorDisabled;

  static List<Color> appFilledButtonTextColorEnabled = [
    DesignSystem.light().colors.activeButtonTextColor,
    DesignSystem.dark().colors.activeButtonTextColor,
  ];

  static List<Color> appSmallButtonBackgroundColor = [
    DesignSystem.light().colors.white,
    DesignSystem.dark().colors.darkGray,
  ];

  static List<Color> appButtonTextColor = [
    DesignSystem.light().colors.black,
    DesignSystem.dark().colors.white,
  ];

  static List<Color> buttonTextColor = [
    DesignSystem.light().colors.textColorWhite,
    DesignSystem.dark().colors.textColorWhite,
  ];

  static List<Color> shimmerBaseColor = [
    DesignSystem.light().colors.shimmerBaseColor,
    DesignSystem.dark().colors.shimmerBaseColor,
  ];

  static List<Color> shimmerHighlightColor = [
    DesignSystem.light().colors.shimmerHighlightColor,
    DesignSystem.dark().colors.shimmerHighlightColor,
  ];

  static List<Color> white = [
    DesignSystem.light().colors.textColorWhite,
    DesignSystem.dark().colors.textColorWhite,
  ];
  static List<Color> buttonBlueGradientEnd = [
    DesignSystem.light().colors.appButtonBlueGradientEnd,
    DesignSystem.dark().colors.appButtonBlueGradientEnd,
  ];
  static List<Color> elevatedButtonBackgroundColor = [
    DesignSystem.light().colors.lightGray,
    DesignSystem.dark().colors.lightGray,
  ];

  static List<Color> textColorWhite = [
    DesignSystem.light().colors.textColorWhite,
    DesignSystem.dark().colors.textColorWhite,
  ];

  static List<Color> bodyTextColor2 = [
    DesignSystem.light().colors.black,
    DesignSystem.dark().colors.activeButtonTextColor,
  ];

  static List<Color> appSmallButtonFilledBackgroundColor = [
    DesignSystem.light().colors.white,
    DesignSystem.dark().colors.mediumWhite,
  ];

  static List<Color> appSmallButtonOutlinedBorderColor = [
    DesignSystem.light().colors.mediumWhite,
    DesignSystem.dark().colors.mediumWhite,
  ];

  static List<Color> activeButtonLanguageTextColor = [
    DesignSystem.light().colors.activeButtonLanguageTextColor,
    DesignSystem.dark().colors.activeButtonLanguageTextColor,
  ];

  static List<Color> activeButtonTextColor = [
    DesignSystem.light().colors.black87,
    DesignSystem.dark().colors.white,
  ];

  static List<Color> disabledButtonTextColor = [
    DesignSystem.light().colors.gray,
    DesignSystem.dark().colors.gray,
  ];

  static List<Color> black = [
    DesignSystem.light().colors.black,
    DesignSystem.dark().colors.white,
  ];

  static List<Color> activeGradientColorStart = [
    DesignSystem.light().colors.blue,
    DesignSystem.dark().colors.blue,
  ];

  static List<Color> activeGradientColorEnd = [
    DesignSystem.light().colors.lightGray,
    DesignSystem.dark().colors.lightGray,
  ];

  static List<Color> activeGradientRedEnd = [
    DesignSystem.light().colors.gradientRedEnd,
    DesignSystem.dark().colors.gradientRedEnd,
  ];

  static List<Color> boxShadowColor = [
    DesignSystem.light().colors.red,
    DesignSystem.dark().colors.red,
  ];

  static List<Color> red = [
    DesignSystem.light().colors.red,
    DesignSystem.dark().colors.red,
  ];
  static List<Color> orange = [
    DesignSystem.light().colors.orange,
    DesignSystem.dark().colors.orange,
  ];

  static List<Color> orangeLight = [
    DesignSystem.light().colors.orangeLight,
    DesignSystem.dark().colors.orangeLight,
  ];

  static List<Color> darkBlue = [
    DesignSystem.light().colors.darkBlue,
    DesignSystem.dark().colors.darkBlue,
  ];

  static List<Color> darkGreen = [
    DesignSystem.light().colors.darkGreen,
    DesignSystem.dark().colors.darkGreen,
  ];

  static List<Color> textButtonLoadingIndicatorColor = [
    DesignSystem.light().colors.redDark,
    DesignSystem.dark().colors.redDark,
  ];

  static List<Color> appOutlineButtonBackgroundColor = [
    DesignSystem.light().colors.white,
    DesignSystem.dark().colors.white,
  ];

  static List<Color> buttonShadowColor = [
    DesignSystem.light().colors.white,
    DesignSystem.dark().colors.white,
  ];

  static List<Color> buttonPressedColor = [
    DesignSystem.light().colors.blue,
    DesignSystem.dark().colors.blue,
  ];

  static List<Color> buttonBorderColor = [
    DesignSystem.light().colors.mediumWhite,
    DesignSystem.dark().colors.mediumWhite,
  ];

  static List<EdgeInsets> outlineButtonContentPadding = [
    EdgeInsets.all(DesignSystem.light().spacings.m),
    EdgeInsets.all(DesignSystem.dark().spacings.m),
  ];

  static List<TextStyle> outlineButtonTextStyle = [
    DesignSystem.light().typography.descriptionBold,
    DesignSystem.light().typography.descriptionBold
  ];

  static List<TextStyle> outlineButtonDescriptionTextStyle = [
    DesignSystem.light().typography.descriptionBold,
    DesignSystem.light().typography.descriptionBold
  ];

  static List<Color> outlineButtonBackgroundColor = [
    DesignSystem.light().colors.white,
    DesignSystem.light().colors.white
  ];

  static List<Color> outlineButtonForegroundColor = [
    DesignSystem.light().colors.appButtonBlueGradientEnd,
    DesignSystem.light().colors.appButtonBlueGradientEnd
  ];

  static List<Color> outlineButtonBorderColor = [
    DesignSystem.light().colors.mediumWhite,
    DesignSystem.light().colors.mediumWhite
  ];

  static List<Color> outlineButtonPressedColor = [
    DesignSystem.light().colors.appButtonBlueGradientEnd,
    DesignSystem.light().colors.appButtonBlueGradientEnd
  ];

  static List<Color> outlineButtonTextColor = [
    DesignSystem.light().colors.primaryColor,
    DesignSystem.light().colors.primaryColor
  ];

  static List<Color> outlineButtonTextColorDisabled = [
    DesignSystem.light().colors.primaryColor,
    DesignSystem.light().colors.primaryColor
  ];

  /// endregion

  /// region Common Spacings

  static List<EdgeInsets> messagePanelErrorEdgeInsets = [
    const EdgeInsets.only(bottom: 20),
    const EdgeInsets.only(bottom: 20),
  ];

  static List<EdgeInsets> smallEdgeInsets = [
    const EdgeInsets.all(12),
    const EdgeInsets.all(12),
  ];

  static List<EdgeInsets> mediumEdgeInsets = [
    const EdgeInsets.all(16),
    const EdgeInsets.all(16),
  ];

  static List<EdgeInsets> largeEdgeInsets = [
    const EdgeInsets.all(22),
    const EdgeInsets.all(22),
  ];

  static List<EdgeInsets> messagePanelEdgeInsets = [
    const EdgeInsets.only(left: 20, top: 16, right: 16, bottom: 16),
    const EdgeInsets.only(left: 20, top: 16, right: 16, bottom: 16),
  ];

  static List<double> spacingXS1 = [
    DesignSystem.light().spacings.xs1,
    DesignSystem.dark().spacings.xs1,
  ];

  static List<double> spacingXS = [
    DesignSystem.light().spacings.xs,
    DesignSystem.dark().spacings.xs,
  ];

  static List<double> spacingXSS = [
    DesignSystem.light().spacings.xss,
    DesignSystem.dark().spacings.xss,
  ];

  static List<double> spacingS = [
    DesignSystem.light().spacings.s,
    DesignSystem.dark().spacings.s,
  ];

  static List<double> spacingM = [
    DesignSystem.light().spacings.m,
    DesignSystem.dark().spacings.m,
  ];

  static List<double> spacingXL = [
    DesignSystem.light().spacings.xl,
    DesignSystem.dark().spacings.xl,
  ];

  static List<double> spacingXXL = [
    DesignSystem.light().spacings.xxl,
    DesignSystem.dark().spacings.xxl,
  ];

  static List<double> spacingXXXXL1 = [
    DesignSystem.light().spacings.xxxxl1,
    DesignSystem.dark().spacings.xxxxl1,
  ];

  static List<double> textButtonIconRightPadding = spacingS;

  static List<double> textButtonPadding = spacingXS;

  static List<double> appBarTextButtonPadding = spacingXSS;

  /// endregion

  /// region Common Icons
  static List<SvgFile> checkIcon = [
    DesignSystem.dark().icons.checkIcon,
    DesignSystem.light().icons.checkIcon,
  ];

  static List<SvgFile> checkCircleIcon = [
    DesignSystem.dark().icons.checkCircleIcon,
    DesignSystem.light().icons.checkCircleIcon,
  ];

  static List<SvgFile> closeIcon = [
    DesignSystem.dark().icons.closeIcon,
    DesignSystem.light().icons.closeIcon,
  ];

  static List<SvgFile> dangerIcon = [
    DesignSystem.dark().icons.dangerIcon,
    DesignSystem.light().icons.dangerIcon,
  ];

  static List<SvgFile> educateIcon = [
    DesignSystem.dark().icons.educateIcon,
    DesignSystem.light().icons.educateIcon,
  ];

  static List<SvgFile> greatNewsIcon = [
    DesignSystem.dark().icons.greatNewsIcon,
    DesignSystem.light().icons.greatNewsIcon,
  ];

  static List<SvgFile> infoCircleIcon = [
    DesignSystem.dark().icons.infoCircleIcon,
    DesignSystem.light().icons.infoCircleIcon,
  ];

  static List<SvgFile> messageIcon = [
    DesignSystem.dark().icons.messageIcon,
    DesignSystem.light().icons.messageIcon,
  ];

  /// endregion
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
