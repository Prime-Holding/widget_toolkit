import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../asset_classes.dart';
import 'design_system/widget_toolkit_design_system.dart';

part 'widget_toolkit_theme.tailor.dart';

@Tailor(themeGetter: ThemeGetter.none)
class _$WidgetToolkitTheme {
  /// region Primary

  static List<Color> primaryColor = [
    WidgetToolkitDesignSystem.light().colors.primaryColor,
    WidgetToolkitDesignSystem.dark().colors.primaryColor,
  ];

  static List<Color> backgroundColor = [
    WidgetToolkitDesignSystem.light().colors.backgroundColor,
    WidgetToolkitDesignSystem.dark().colors.backgroundColor,
  ];

  static List<Color> scaffoldBackgroundColor = [
    WidgetToolkitDesignSystem.light().colors.scaffoldBackgroundColor,
    WidgetToolkitDesignSystem.dark().colors.scaffoldBackgroundColor,
  ];

  static List<Color> highlightColor = [
    WidgetToolkitDesignSystem.light().colors.highlightColor,
    WidgetToolkitDesignSystem.dark().colors.highlightColor,
  ];

  static List<Color> primaryGradientStart = [
    WidgetToolkitDesignSystem.light().colors.blue,
    WidgetToolkitDesignSystem.dark().colors.darkBlue,
  ];

  static List<Color> primaryGradientEnd = [
    WidgetToolkitDesignSystem.light().colors.lightBlue,
    WidgetToolkitDesignSystem.dark().colors.blue,
  ];

  /// endregion

  /// region Common widgets

  static List<Color> searchTextFieldIconColor = [
    WidgetToolkitDesignSystem.light().colors.black,
    WidgetToolkitDesignSystem.dark().colors.mediumWhite,
  ];

  static List<Color> searchTextFieldIconColorActive = [
    WidgetToolkitDesignSystem.light().colors.blue,
    WidgetToolkitDesignSystem.dark().colors.darkBlue,
  ];

  static List<Color> searchTextFieldBackgroundColor = [
    WidgetToolkitDesignSystem.light().colors.white,
    WidgetToolkitDesignSystem.dark().colors.darkGray,
  ];

  static List<Color> searchTextFieldBackgroundColorActive = [
    WidgetToolkitDesignSystem.light().colors.mediumWhite,
    WidgetToolkitDesignSystem.dark().colors.darkGray,
  ];

  static List<double> searchTextFieldBorderRadius = [
    WidgetToolkitDesignSystem.light().spacings.xs,
    WidgetToolkitDesignSystem.light().spacings.xs,
  ];

  static List<BoxBorder> searchTextFieldBorderType = [
    Border.all(
      color: WidgetToolkitDesignSystem.light().colors.mediumWhite,
      width: WidgetToolkitDesignSystem.light().spacings.xxxs,
    ),
    Border.all(
      color: WidgetToolkitDesignSystem.light().colors.mediumWhite,
      width: WidgetToolkitDesignSystem.light().spacings.xxxs,
    ),
  ];

  static List<EdgeInsets> searchTextFieldIconEdgeInsets = [
    EdgeInsets.symmetric(
      horizontal: WidgetToolkitDesignSystem.light().spacings.m,
      vertical: WidgetToolkitDesignSystem.light().spacings.s,
    ),
    EdgeInsets.symmetric(
      horizontal: WidgetToolkitDesignSystem.light().spacings.m,
      vertical: WidgetToolkitDesignSystem.light().spacings.s,
    ),
  ];

  static List<TextStyle> searchTextFieldHintStyle = [
    WidgetToolkitDesignSystem.light().typography.h3Reg14.copyWith(
          color: WidgetToolkitDesignSystem.dark().colors.gray,
        ),
    WidgetToolkitDesignSystem.dark().typography.h3Reg14.copyWith(
          color: WidgetToolkitDesignSystem.dark().colors.gray,
        ),
  ];

  static List<TextStyle> searchTextFieldTextStyle = [
    WidgetToolkitDesignSystem.light().typography.descriptionBold.copyWith(
          color: WidgetToolkitDesignSystem.dark().colors.blue,
        ),
    WidgetToolkitDesignSystem.dark().typography.descriptionBold.copyWith(
          color: WidgetToolkitDesignSystem.dark().colors.blue,
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
    WidgetToolkitDesignSystem.light().colors.lightBlue,
    WidgetToolkitDesignSystem.dark().colors.darkBlue,
  ];

  static List<Color> pickerListItemUnselectedColor = [
    WidgetToolkitDesignSystem.light().colors.transparent,
    WidgetToolkitDesignSystem.dark().colors.transparent,
  ];

  static List<TextStyle> pickerListItemTextStyle = [
    WidgetToolkitDesignSystem.light().typography.h3Reg14,
    WidgetToolkitDesignSystem.dark().typography.h3Reg14,
  ];

  static List<TextStyle> captionBold = [
    WidgetToolkitDesignSystem.light().typography.captionBold,
    WidgetToolkitDesignSystem.dark().typography.captionBold,
  ];

  static List<TextStyle> textButtonTextStyle = captionBold;

  static List<Color> errorCardIconColor = [
    WidgetToolkitDesignSystem.light().colors.black87,
    WidgetToolkitDesignSystem.dark().colors.mediumWhite,
  ];

  static List<Color> errorCardBackgroundColor = [
    WidgetToolkitDesignSystem.light().colors.lightRed,
    WidgetToolkitDesignSystem.dark().colors.redDark,
  ];

  static List<Color> lightRed = [
    WidgetToolkitDesignSystem.light().colors.lightRed,
    WidgetToolkitDesignSystem.dark().colors.lightRed,
  ];

  static List<Color> blueLight = [
    WidgetToolkitDesignSystem.light().colors.blueLight,
    WidgetToolkitDesignSystem.dark().colors.blueLight,
  ];

  static List<Color> greenLight = [
    WidgetToolkitDesignSystem.light().colors.greenLight,
    WidgetToolkitDesignSystem.dark().colors.greenLight,
  ];
  static List<Color> errorCardTextColor = [
    WidgetToolkitDesignSystem.light().colors.black87,
    WidgetToolkitDesignSystem.dark().colors.white,
  ];

  static List<EdgeInsets> bottomSheetHeaderPadding = [
    const EdgeInsets.only(left: 24),
    const EdgeInsets.only(left: 24),
  ];

  static List<Color> bottomSheetBarrierColor = [
    WidgetToolkitDesignSystem.light().colors.bottomSheetBarrierColor,
    WidgetToolkitDesignSystem.dark().colors.bottomSheetBarrierColor,
  ];
  static List<Color> messagePanelBackgroundColor = [
    WidgetToolkitDesignSystem.light().colors.lightGray,
    WidgetToolkitDesignSystem.dark().colors.lightGray,
  ];

  static List<Color> bottomSheetLineColor = [
    WidgetToolkitDesignSystem.light().colors.gray,
    WidgetToolkitDesignSystem.dark().colors.gray,
  ];

  static List<Color> bottomSheetBackgroundColor = [
    WidgetToolkitDesignSystem.light().colors.white,
    WidgetToolkitDesignSystem.dark().colors.darkGray,
  ];

  static List<Color> bottomSheetBorderColor = [
    WidgetToolkitDesignSystem.light().colors.lightGray,
    WidgetToolkitDesignSystem.dark().colors.lightGray,
  ];

  static List<Color> loadingIndicatorColor = [
    WidgetToolkitDesignSystem.light().colors.primaryColor,
    WidgetToolkitDesignSystem.dark().colors.primaryColor,
  ];

  /// endregion

  /// region Common TextStyles

  static List<TextStyle> descriptionBold = [
    WidgetToolkitDesignSystem.light().typography.descriptionBold,
    WidgetToolkitDesignSystem.dark().typography.descriptionBold,
  ];

  static List<TextStyle> titleBold = [
    WidgetToolkitDesignSystem.light().typography.titleBold,
    WidgetToolkitDesignSystem.dark().typography.titleBold,
  ];

  static List<TextStyle> descriptionThin = [
    WidgetToolkitDesignSystem.light().typography.descriptionThin,
    WidgetToolkitDesignSystem.dark().typography.descriptionThin,
  ];

  static List<TextStyle> errorTitle = [
    WidgetToolkitDesignSystem.light().typography.errorTitle,
    WidgetToolkitDesignSystem.dark().typography.errorTitle,
  ];

  /// endregion

  /// region Buttons

  static List<Color> disabledFilledButtonBackgroundColor = [
    WidgetToolkitDesignSystem.light().colors.gray,
    WidgetToolkitDesignSystem.dark().colors.gray,
  ];
  static List<Color> gradientRedStart = [
    WidgetToolkitDesignSystem.light().colors.gradientRedStart,
    WidgetToolkitDesignSystem.dark().colors.gradientRedStart,
  ];

  static List<Color> gradientRedEnd = [
    WidgetToolkitDesignSystem.light().colors.gradientRedEnd,
    WidgetToolkitDesignSystem.dark().colors.gradientRedEnd,
  ];

  static List<Color> filledButtonBackgroundColorDisabled = [
    WidgetToolkitDesignSystem.light().colors.lightGray,
    WidgetToolkitDesignSystem.dark().colors.lightGray,
  ];

  static List<Color> filledButtonTextColorDisabled = [
    WidgetToolkitDesignSystem.light().colors.gray,
    WidgetToolkitDesignSystem.dark().colors.gray,
  ];

  static List<Color> textButtonTextColorDisabled =
      filledButtonTextColorDisabled;

  static List<Color> filledButtonTextColorEnabled = [
    WidgetToolkitDesignSystem.light().colors.activeButtonTextColor,
    WidgetToolkitDesignSystem.dark().colors.activeButtonTextColor,
  ];

  static List<Color> smallButtonBackgroundColor = [
    WidgetToolkitDesignSystem.light().colors.white,
    WidgetToolkitDesignSystem.dark().colors.darkGray,
  ];

  static List<Color> buttonTextColor = [
    WidgetToolkitDesignSystem.light().colors.black,
    WidgetToolkitDesignSystem.dark().colors.white,
  ];

  static List<Color> shimmerBaseColor = [
    WidgetToolkitDesignSystem.light().colors.shimmerBaseColor,
    WidgetToolkitDesignSystem.dark().colors.shimmerBaseColor,
  ];

  static List<Color> shimmerHighlightColor = [
    WidgetToolkitDesignSystem.light().colors.shimmerHighlightColor,
    WidgetToolkitDesignSystem.dark().colors.shimmerHighlightColor,
  ];

  static List<Color> white = [
    WidgetToolkitDesignSystem.light().colors.textColorWhite,
    WidgetToolkitDesignSystem.dark().colors.textColorWhite,
  ];
  static List<Color> buttonBlueGradientEnd = [
    WidgetToolkitDesignSystem.light().colors.buttonBlueGradientEnd,
    WidgetToolkitDesignSystem.dark().colors.buttonBlueGradientEnd,
  ];
  static List<Color> elevatedButtonBackgroundColor = [
    WidgetToolkitDesignSystem.light().colors.lightGray,
    WidgetToolkitDesignSystem.dark().colors.lightGray,
  ];

  static List<Color> textColorWhite = [
    WidgetToolkitDesignSystem.light().colors.textColorWhite,
    WidgetToolkitDesignSystem.dark().colors.textColorWhite,
  ];

  static List<Color> bodyTextColor2 = [
    WidgetToolkitDesignSystem.light().colors.black,
    WidgetToolkitDesignSystem.dark().colors.activeButtonTextColor,
  ];

  static List<Color> smallButtonFilledBackgroundColor = [
    WidgetToolkitDesignSystem.light().colors.white,
    WidgetToolkitDesignSystem.dark().colors.mediumWhite,
  ];

  static List<Color> smallButtonOutlinedBorderColor = [
    WidgetToolkitDesignSystem.light().colors.mediumWhite,
    WidgetToolkitDesignSystem.dark().colors.mediumWhite,
  ];

  static List<Color> activeButtonLanguageTextColor = [
    WidgetToolkitDesignSystem.light().colors.activeButtonLanguageTextColor,
    WidgetToolkitDesignSystem.dark().colors.activeButtonLanguageTextColor,
  ];

  static List<Color> activeButtonTextColor = [
    WidgetToolkitDesignSystem.light().colors.black87,
    WidgetToolkitDesignSystem.dark().colors.white,
  ];

  static List<Color> disabledButtonTextColor = [
    WidgetToolkitDesignSystem.light().colors.gray,
    WidgetToolkitDesignSystem.dark().colors.gray,
  ];

  static List<Color> black = [
    WidgetToolkitDesignSystem.light().colors.black,
    WidgetToolkitDesignSystem.dark().colors.white,
  ];

  static List<Color> activeGradientColorStart = [
    WidgetToolkitDesignSystem.light().colors.blue,
    WidgetToolkitDesignSystem.dark().colors.blue,
  ];

  static List<Color> activeGradientColorEnd = [
    WidgetToolkitDesignSystem.light().colors.lightGray,
    WidgetToolkitDesignSystem.dark().colors.lightGray,
  ];

  static List<Color> activeGradientRedEnd = [
    WidgetToolkitDesignSystem.light().colors.gradientRedEnd,
    WidgetToolkitDesignSystem.dark().colors.gradientRedEnd,
  ];

  static List<Color> boxShadowColor = [
    WidgetToolkitDesignSystem.light().colors.red,
    WidgetToolkitDesignSystem.dark().colors.red,
  ];

  static List<Color> red = [
    WidgetToolkitDesignSystem.light().colors.red,
    WidgetToolkitDesignSystem.dark().colors.red,
  ];
  static List<Color> orange = [
    WidgetToolkitDesignSystem.light().colors.orange,
    WidgetToolkitDesignSystem.dark().colors.orange,
  ];

  static List<Color> orangeLight = [
    WidgetToolkitDesignSystem.light().colors.orangeLight,
    WidgetToolkitDesignSystem.dark().colors.orangeLight,
  ];

  static List<Color> darkBlue = [
    WidgetToolkitDesignSystem.light().colors.darkBlue,
    WidgetToolkitDesignSystem.dark().colors.darkBlue,
  ];

  static List<Color> darkGreen = [
    WidgetToolkitDesignSystem.light().colors.darkGreen,
    WidgetToolkitDesignSystem.dark().colors.darkGreen,
  ];

  static List<Color> textButtonLoadingIndicatorColor = [
    WidgetToolkitDesignSystem.light().colors.redDark,
    WidgetToolkitDesignSystem.dark().colors.redDark,
  ];

  static List<Color> buttonShadowColor = [
    WidgetToolkitDesignSystem.light().colors.white,
    WidgetToolkitDesignSystem.dark().colors.white,
  ];

  static List<Color> buttonPressedColor = [
    WidgetToolkitDesignSystem.light().colors.blue,
    WidgetToolkitDesignSystem.dark().colors.blue,
  ];

  static List<Color> buttonBorderColor = [
    WidgetToolkitDesignSystem.light().colors.mediumWhite,
    WidgetToolkitDesignSystem.dark().colors.mediumWhite,
  ];

  static List<EdgeInsets> outlineButtonContentPadding = [
    EdgeInsets.all(WidgetToolkitDesignSystem.light().spacings.m),
    EdgeInsets.all(WidgetToolkitDesignSystem.dark().spacings.m),
  ];

  static List<TextStyle> outlineButtonTextStyle = [
    WidgetToolkitDesignSystem.light().typography.descriptionBold,
    WidgetToolkitDesignSystem.light().typography.descriptionBold
  ];

  static List<TextStyle> outlineButtonDescriptionTextStyle = [
    WidgetToolkitDesignSystem.light().typography.descriptionBold,
    WidgetToolkitDesignSystem.light().typography.descriptionBold
  ];

  static List<Color> outlineButtonBackgroundColor = [
    WidgetToolkitDesignSystem.light().colors.white,
    WidgetToolkitDesignSystem.light().colors.white
  ];

  static List<Color> outlineButtonForegroundColor = [
    WidgetToolkitDesignSystem.light().colors.buttonBlueGradientEnd,
    WidgetToolkitDesignSystem.light().colors.buttonBlueGradientEnd
  ];

  static List<Color> outlineButtonBorderColor = [
    WidgetToolkitDesignSystem.light().colors.mediumWhite,
    WidgetToolkitDesignSystem.light().colors.mediumWhite
  ];

  static List<Color> outlineButtonPressedColor = [
    WidgetToolkitDesignSystem.light().colors.buttonBlueGradientEnd,
    WidgetToolkitDesignSystem.light().colors.buttonBlueGradientEnd
  ];

  static List<Color> outlineButtonTextColor = [
    WidgetToolkitDesignSystem.light().colors.primaryColor,
    WidgetToolkitDesignSystem.light().colors.primaryColor
  ];

  static List<Color> outlineButtonTextColorDisabled = [
    WidgetToolkitDesignSystem.light().colors.primaryColor,
    WidgetToolkitDesignSystem.light().colors.primaryColor
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
    WidgetToolkitDesignSystem.light().spacings.xs1,
    WidgetToolkitDesignSystem.dark().spacings.xs1,
  ];

  static List<double> spacingXS = [
    WidgetToolkitDesignSystem.light().spacings.xs,
    WidgetToolkitDesignSystem.dark().spacings.xs,
  ];

  static List<double> spacingXSS = [
    WidgetToolkitDesignSystem.light().spacings.xss,
    WidgetToolkitDesignSystem.dark().spacings.xss,
  ];

  static List<double> spacingS = [
    WidgetToolkitDesignSystem.light().spacings.s,
    WidgetToolkitDesignSystem.dark().spacings.s,
  ];

  static List<double> spacingM = [
    WidgetToolkitDesignSystem.light().spacings.m,
    WidgetToolkitDesignSystem.dark().spacings.m,
  ];

  static List<double> spacingXL = [
    WidgetToolkitDesignSystem.light().spacings.xl,
    WidgetToolkitDesignSystem.dark().spacings.xl,
  ];

  static List<double> spacingXXL = [
    WidgetToolkitDesignSystem.light().spacings.xxl,
    WidgetToolkitDesignSystem.dark().spacings.xxl,
  ];

  static List<double> spacingXXXXL1 = [
    WidgetToolkitDesignSystem.light().spacings.xxxxl1,
    WidgetToolkitDesignSystem.dark().spacings.xxxxl1,
  ];

  static List<double> textButtonIconRightPadding = spacingS;

  static List<double> textButtonPadding = spacingXS;

  static List<double> appBarTextButtonPadding = spacingXSS;

  /// endregion

  /// region Common Icons
  static List<SvgFile> checkIcon = [
    WidgetToolkitDesignSystem.dark().icons.checkIcon,
    WidgetToolkitDesignSystem.light().icons.checkIcon,
  ];

  static List<SvgFile> checkCircleIcon = [
    WidgetToolkitDesignSystem.dark().icons.checkCircleIcon,
    WidgetToolkitDesignSystem.light().icons.checkCircleIcon,
  ];

  static List<SvgFile> closeIcon = [
    WidgetToolkitDesignSystem.dark().icons.closeIcon,
    WidgetToolkitDesignSystem.light().icons.closeIcon,
  ];

  static List<SvgFile> dangerIcon = [
    WidgetToolkitDesignSystem.dark().icons.dangerIcon,
    WidgetToolkitDesignSystem.light().icons.dangerIcon,
  ];

  static List<SvgFile> educateIcon = [
    WidgetToolkitDesignSystem.dark().icons.educateIcon,
    WidgetToolkitDesignSystem.light().icons.educateIcon,
  ];

  static List<SvgFile> greatNewsIcon = [
    WidgetToolkitDesignSystem.dark().icons.greatNewsIcon,
    WidgetToolkitDesignSystem.light().icons.greatNewsIcon,
  ];

  static List<SvgFile> infoCircleIcon = [
    WidgetToolkitDesignSystem.dark().icons.infoCircleIcon,
    WidgetToolkitDesignSystem.light().icons.infoCircleIcon,
  ];

  static List<SvgFile> messageIcon = [
    WidgetToolkitDesignSystem.dark().icons.messageIcon,
    WidgetToolkitDesignSystem.light().icons.messageIcon,
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
