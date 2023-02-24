import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../asset_classes.dart';
import '../design_system/design_system.dart';

part 'prime_components_theme.tailor.dart';

@Tailor(themeGetter: ThemeGetter.none)
class _$PrimeComponentsTheme {
  /// region Primary

  static List<Color> primaryColor = [
    PrimeDesignSystem.light().colors.primaryColor,
    PrimeDesignSystem.dark().colors.primaryColor,
  ];

  static List<Color> backgroundColor = [
    PrimeDesignSystem.light().colors.backgroundColor,
    PrimeDesignSystem.dark().colors.backgroundColor,
  ];

  static List<Color> scaffoldBackgroundColor = [
    PrimeDesignSystem.light().colors.scaffoldBackgroundColor,
    PrimeDesignSystem.dark().colors.scaffoldBackgroundColor,
  ];

  static List<Color> highlightColor = [
    PrimeDesignSystem.light().colors.highlightColor,
    PrimeDesignSystem.dark().colors.highlightColor,
  ];

  static List<Color> primaryGradientStart = [
    PrimeDesignSystem.light().colors.blue,
    PrimeDesignSystem.dark().colors.darkBlue,
  ];

  static List<Color> primaryGradientEnd = [
    PrimeDesignSystem.light().colors.lightBlue,
    PrimeDesignSystem.dark().colors.blue,
  ];

  /// endregion

  /// region Common widgets

  static List<Color> searchTextFieldIconColor = [
    PrimeDesignSystem.light().colors.black,
    PrimeDesignSystem.dark().colors.mediumWhite,
  ];

  static List<Color> searchTextFieldIconColorActive = [
    PrimeDesignSystem.light().colors.blue,
    PrimeDesignSystem.dark().colors.darkBlue,
  ];

  static List<Color> searchTextFieldBackgroundColor = [
    PrimeDesignSystem.light().colors.white,
    PrimeDesignSystem.dark().colors.darkGray,
  ];

  static List<Color> searchTextFieldBackgroundColorActive = [
    PrimeDesignSystem.light().colors.mediumWhite,
    PrimeDesignSystem.dark().colors.darkGray,
  ];

  static List<double> searchTextFieldBorderRadius = [
    PrimeDesignSystem.light().spacings.xs,
    PrimeDesignSystem.light().spacings.xs,
  ];

  static List<BoxBorder> searchTextFieldBorderType = [
    Border.all(
      color: PrimeDesignSystem.light().colors.mediumWhite,
      width: PrimeDesignSystem.light().spacings.xxxs,
    ),
    Border.all(
      color: PrimeDesignSystem.light().colors.mediumWhite,
      width: PrimeDesignSystem.light().spacings.xxxs,
    ),
  ];

  static List<EdgeInsets> searchTextFieldIconEdgeInsets = [
    EdgeInsets.symmetric(
      horizontal: PrimeDesignSystem.light().spacings.m,
      vertical: PrimeDesignSystem.light().spacings.s,
    ),
    EdgeInsets.symmetric(
      horizontal: PrimeDesignSystem.light().spacings.m,
      vertical: PrimeDesignSystem.light().spacings.s,
    ),
  ];

  static List<TextStyle> searchTextFieldHintStyle = [
    PrimeDesignSystem.light().typography.h3Reg14.copyWith(
          color: PrimeDesignSystem.dark().colors.gray,
        ),
    PrimeDesignSystem.dark().typography.h3Reg14.copyWith(
          color: PrimeDesignSystem.dark().colors.gray,
        ),
  ];

  static List<TextStyle> searchTextFieldTextStyle = [
    PrimeDesignSystem.light().typography.descriptionBold.copyWith(
          color: PrimeDesignSystem.dark().colors.blue,
        ),
    PrimeDesignSystem.dark().typography.descriptionBold.copyWith(
          color: PrimeDesignSystem.dark().colors.blue,
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
    PrimeDesignSystem.light().colors.lightBlue,
    PrimeDesignSystem.dark().colors.darkBlue,
  ];

  static List<Color> pickerListItemUnselectedColor = [
    PrimeDesignSystem.light().colors.transparent,
    PrimeDesignSystem.dark().colors.transparent,
  ];

  static List<TextStyle> pickerListItemTextStyle = [
    PrimeDesignSystem.light().typography.h3Reg14,
    PrimeDesignSystem.dark().typography.h3Reg14,
  ];

  static List<TextStyle> captionBold = [
    PrimeDesignSystem.light().typography.captionBold,
    PrimeDesignSystem.dark().typography.captionBold,
  ];

  static List<TextStyle> textButtonTextStyle = captionBold;

  static List<Color> appErrorCardIconColor = [
    PrimeDesignSystem.light().colors.black87,
    PrimeDesignSystem.dark().colors.mediumWhite,
  ];

  static List<Color> appErrorCardBackgroundColor = [
    PrimeDesignSystem.light().colors.lightRed,
    PrimeDesignSystem.dark().colors.redDark,
  ];

  static List<Color> lightRed = [
    PrimeDesignSystem.light().colors.lightRed,
    PrimeDesignSystem.dark().colors.lightRed,
  ];

  static List<Color> blueLight = [
    PrimeDesignSystem.light().colors.blueLight,
    PrimeDesignSystem.dark().colors.blueLight,
  ];

  static List<Color> greenLight = [
    PrimeDesignSystem.light().colors.greenLight,
    PrimeDesignSystem.dark().colors.greenLight,
  ];
  static List<Color> appErrorCardTextColor = [
    PrimeDesignSystem.light().colors.black87,
    PrimeDesignSystem.dark().colors.white,
  ];

  static List<EdgeInsets> bottomSheetHeaderPadding = [
    const EdgeInsets.only(left: 24),
    const EdgeInsets.only(left: 24),
  ];

  static List<Color> bottomSheetBarrierColor = [
    PrimeDesignSystem.light().colors.bottomSheetBarrierColor,
    PrimeDesignSystem.dark().colors.bottomSheetBarrierColor,
  ];
  static List<Color> messagePanelBackgroundColor = [
    PrimeDesignSystem.light().colors.lightGray,
    PrimeDesignSystem.dark().colors.lightGray,
  ];

  static List<Color> bottomSheetLineColor = [
    PrimeDesignSystem.light().colors.gray,
    PrimeDesignSystem.dark().colors.gray,
  ];

  static List<Color> bottomSheetBackgroundColor = [
    PrimeDesignSystem.light().colors.white,
    PrimeDesignSystem.dark().colors.darkGray,
  ];

  static List<Color> bottomSheetBorderColor = [
    PrimeDesignSystem.light().colors.lightGray,
    PrimeDesignSystem.dark().colors.lightGray,
  ];

  static List<Color> loadingIndicatorColor = [
    PrimeDesignSystem.light().colors.primaryColor,
    PrimeDesignSystem.dark().colors.primaryColor,
  ];

  /// endregion

  /// region Common TextStyles

  static List<TextStyle> descriptionBold = [
    PrimeDesignSystem.light().typography.descriptionBold,
    PrimeDesignSystem.dark().typography.descriptionBold,
  ];

  static List<TextStyle> titleBold = [
    PrimeDesignSystem.light().typography.titleBold,
    PrimeDesignSystem.dark().typography.titleBold,
  ];

  static List<TextStyle> descriptionThin = [
    PrimeDesignSystem.light().typography.descriptionThin,
    PrimeDesignSystem.dark().typography.descriptionThin,
  ];

  static List<TextStyle> errorTitle = [
    PrimeDesignSystem.light().typography.errorTitle,
    PrimeDesignSystem.dark().typography.errorTitle,
  ];

  /// endregion

  /// region Buttons

  static List<Color> disabledFilledButtonBackgroundColor = [
    PrimeDesignSystem.light().colors.gray,
    PrimeDesignSystem.dark().colors.gray,
  ];
  static List<Color> gradientRedStart = [
    PrimeDesignSystem.light().colors.gradientRedStart,
    PrimeDesignSystem.dark().colors.gradientRedStart,
  ];

  static List<Color> gradientRedEnd = [
    PrimeDesignSystem.light().colors.gradientRedEnd,
    PrimeDesignSystem.dark().colors.gradientRedEnd,
  ];

  static List<Color> filledButtonBackgroundColorDisabled = [
    PrimeDesignSystem.light().colors.filledButtonBackgroundColorDisabled,
    PrimeDesignSystem.dark().colors.filledButtonBackgroundColorDisabled,
  ];

  static List<Color> appFilledButtonBackgroundColorDisabled = [
    PrimeDesignSystem.light().colors.lightGray,
    PrimeDesignSystem.dark().colors.lightGray,
  ];

  static List<Color> appFilledButtonTextColorDisabled = [
    PrimeDesignSystem.light().colors.gray,
    PrimeDesignSystem.dark().colors.gray,
  ];

  static List<Color> appTextButtonTextColorDisabled =
      appFilledButtonTextColorDisabled;

  static List<Color> appFilledButtonTextColorEnabled = [
    PrimeDesignSystem.light().colors.activeButtonTextColor,
    PrimeDesignSystem.dark().colors.activeButtonTextColor,
  ];

  static List<Color> appSmallButtonBackgroundColor = [
    PrimeDesignSystem.light().colors.white,
    PrimeDesignSystem.dark().colors.darkGray,
  ];

  static List<Color> appButtonTextColor = [
    PrimeDesignSystem.light().colors.black,
    PrimeDesignSystem.dark().colors.white,
  ];

  static List<Color> buttonTextColor = [
    PrimeDesignSystem.light().colors.textColorWhite,
    PrimeDesignSystem.dark().colors.textColorWhite,
  ];

  static List<Color> shimmerBaseColor = [
    PrimeDesignSystem.light().colors.shimmerBaseColor,
    PrimeDesignSystem.dark().colors.shimmerBaseColor,
  ];

  static List<Color> shimmerHighlightColor = [
    PrimeDesignSystem.light().colors.shimmerHighlightColor,
    PrimeDesignSystem.dark().colors.shimmerHighlightColor,
  ];

  static List<Color> white = [
    PrimeDesignSystem.light().colors.textColorWhite,
    PrimeDesignSystem.dark().colors.textColorWhite,
  ];
  static List<Color> buttonBlueGradientEnd = [
    PrimeDesignSystem.light().colors.appButtonBlueGradientEnd,
    PrimeDesignSystem.dark().colors.appButtonBlueGradientEnd,
  ];
  static List<Color> elevatedButtonBackgroundColor = [
    PrimeDesignSystem.light().colors.lightGray,
    PrimeDesignSystem.dark().colors.lightGray,
  ];

  static List<Color> textColorWhite = [
    PrimeDesignSystem.light().colors.textColorWhite,
    PrimeDesignSystem.dark().colors.textColorWhite,
  ];

  static List<Color> bodyTextColor2 = [
    PrimeDesignSystem.light().colors.black,
    PrimeDesignSystem.dark().colors.activeButtonTextColor,
  ];

  static List<Color> appSmallButtonFilledBackgroundColor = [
    PrimeDesignSystem.light().colors.white,
    PrimeDesignSystem.dark().colors.mediumWhite,
  ];

  static List<Color> appSmallButtonOutlinedBorderColor = [
    PrimeDesignSystem.light().colors.mediumWhite,
    PrimeDesignSystem.dark().colors.mediumWhite,
  ];

  static List<Color> activeButtonLanguageTextColor = [
    PrimeDesignSystem.light().colors.activeButtonLanguageTextColor,
    PrimeDesignSystem.dark().colors.activeButtonLanguageTextColor,
  ];

  static List<Color> activeButtonTextColor = [
    PrimeDesignSystem.light().colors.black87,
    PrimeDesignSystem.dark().colors.white,
  ];

  static List<Color> disabledButtonTextColor = [
    PrimeDesignSystem.light().colors.gray,
    PrimeDesignSystem.dark().colors.gray,
  ];

  static List<Color> black = [
    PrimeDesignSystem.light().colors.black,
    PrimeDesignSystem.dark().colors.white,
  ];

  static List<Color> activeGradientColorStart = [
    PrimeDesignSystem.light().colors.blue,
    PrimeDesignSystem.dark().colors.blue,
  ];

  static List<Color> activeGradientColorEnd = [
    PrimeDesignSystem.light().colors.lightGray,
    PrimeDesignSystem.dark().colors.lightGray,
  ];

  static List<Color> activeGradientRedEnd = [
    PrimeDesignSystem.light().colors.gradientRedEnd,
    PrimeDesignSystem.dark().colors.gradientRedEnd,
  ];

  static List<Color> boxShadowColor = [
    PrimeDesignSystem.light().colors.red,
    PrimeDesignSystem.dark().colors.red,
  ];

  static List<Color> red = [
    PrimeDesignSystem.light().colors.red,
    PrimeDesignSystem.dark().colors.red,
  ];
  static List<Color> orange = [
    PrimeDesignSystem.light().colors.orange,
    PrimeDesignSystem.dark().colors.orange,
  ];

  static List<Color> orangeLight = [
    PrimeDesignSystem.light().colors.orangeLight,
    PrimeDesignSystem.dark().colors.orangeLight,
  ];

  static List<Color> darkBlue = [
    PrimeDesignSystem.light().colors.darkBlue,
    PrimeDesignSystem.dark().colors.darkBlue,
  ];

  static List<Color> darkGreen = [
    PrimeDesignSystem.light().colors.darkGreen,
    PrimeDesignSystem.dark().colors.darkGreen,
  ];

  static List<Color> textButtonLoadingIndicatorColor = [
    PrimeDesignSystem.light().colors.redDark,
    PrimeDesignSystem.dark().colors.redDark,
  ];

  static List<Color> appOutlineButtonBackgroundColor = [
    PrimeDesignSystem.light().colors.white,
    PrimeDesignSystem.dark().colors.white,
  ];

  static List<Color> buttonShadowColor = [
    PrimeDesignSystem.light().colors.white,
    PrimeDesignSystem.dark().colors.white,
  ];

  static List<Color> buttonPressedColor = [
    PrimeDesignSystem.light().colors.blue,
    PrimeDesignSystem.dark().colors.blue,
  ];

  static List<Color> buttonBorderColor = [
    PrimeDesignSystem.light().colors.mediumWhite,
    PrimeDesignSystem.dark().colors.mediumWhite,
  ];

  static List<EdgeInsets> outlineButtonContentPadding = [
    EdgeInsets.all(PrimeDesignSystem.light().spacings.m),
    EdgeInsets.all(PrimeDesignSystem.dark().spacings.m),
  ];

  static List<TextStyle> outlineButtonTextStyle = [
    PrimeDesignSystem.light().typography.descriptionBold,
    PrimeDesignSystem.light().typography.descriptionBold
  ];

  static List<TextStyle> outlineButtonDescriptionTextStyle = [
    PrimeDesignSystem.light().typography.descriptionBold,
    PrimeDesignSystem.light().typography.descriptionBold
  ];

  static List<Color> outlineButtonBackgroundColor = [
    PrimeDesignSystem.light().colors.white,
    PrimeDesignSystem.light().colors.white
  ];

  static List<Color> outlineButtonForegroundColor = [
    PrimeDesignSystem.light().colors.appButtonBlueGradientEnd,
    PrimeDesignSystem.light().colors.appButtonBlueGradientEnd
  ];

  static List<Color> outlineButtonBorderColor = [
    PrimeDesignSystem.light().colors.mediumWhite,
    PrimeDesignSystem.light().colors.mediumWhite
  ];

  static List<Color> outlineButtonPressedColor = [
    PrimeDesignSystem.light().colors.appButtonBlueGradientEnd,
    PrimeDesignSystem.light().colors.appButtonBlueGradientEnd
  ];

  static List<Color> outlineButtonTextColor = [
    PrimeDesignSystem.light().colors.primaryColor,
    PrimeDesignSystem.light().colors.primaryColor
  ];

  static List<Color> outlineButtonTextColorDisabled = [
    PrimeDesignSystem.light().colors.primaryColor,
    PrimeDesignSystem.light().colors.primaryColor
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
    PrimeDesignSystem.light().spacings.xs1,
    PrimeDesignSystem.dark().spacings.xs1,
  ];

  static List<double> spacingXS = [
    PrimeDesignSystem.light().spacings.xs,
    PrimeDesignSystem.dark().spacings.xs,
  ];

  static List<double> spacingXSS = [
    PrimeDesignSystem.light().spacings.xss,
    PrimeDesignSystem.dark().spacings.xss,
  ];

  static List<double> spacingS = [
    PrimeDesignSystem.light().spacings.s,
    PrimeDesignSystem.dark().spacings.s,
  ];

  static List<double> spacingM = [
    PrimeDesignSystem.light().spacings.m,
    PrimeDesignSystem.dark().spacings.m,
  ];

  static List<double> spacingXL = [
    PrimeDesignSystem.light().spacings.xl,
    PrimeDesignSystem.dark().spacings.xl,
  ];

  static List<double> spacingXXL = [
    PrimeDesignSystem.light().spacings.xxl,
    PrimeDesignSystem.dark().spacings.xxl,
  ];

  static List<double> spacingXXXXL1 = [
    PrimeDesignSystem.light().spacings.xxxxl1,
    PrimeDesignSystem.dark().spacings.xxxxl1,
  ];

  static List<double> textButtonIconRightPadding = spacingS;

  static List<double> textButtonPadding = spacingXS;

  static List<double> appBarTextButtonPadding = spacingXSS;

  /// endregion

  /// region Common Icons
  static List<SvgFile> checkIcon = [
    PrimeDesignSystem.dark().icons.checkIcon,
    PrimeDesignSystem.light().icons.checkIcon,
  ];

  static List<SvgFile> checkCircleIcon = [
    PrimeDesignSystem.dark().icons.checkCircleIcon,
    PrimeDesignSystem.light().icons.checkCircleIcon,
  ];

  static List<SvgFile> closeIcon = [
    PrimeDesignSystem.dark().icons.closeIcon,
    PrimeDesignSystem.light().icons.closeIcon,
  ];

  static List<SvgFile> dangerIcon = [
    PrimeDesignSystem.dark().icons.dangerIcon,
    PrimeDesignSystem.light().icons.dangerIcon,
  ];

  static List<SvgFile> educateIcon = [
    PrimeDesignSystem.dark().icons.educateIcon,
    PrimeDesignSystem.light().icons.educateIcon,
  ];

  static List<SvgFile> greatNewsIcon = [
    PrimeDesignSystem.dark().icons.greatNewsIcon,
    PrimeDesignSystem.light().icons.greatNewsIcon,
  ];

  static List<SvgFile> infoCircleIcon = [
    PrimeDesignSystem.dark().icons.infoCircleIcon,
    PrimeDesignSystem.light().icons.infoCircleIcon,
  ];

  static List<SvgFile> messageIcon = [
    PrimeDesignSystem.dark().icons.messageIcon,
    PrimeDesignSystem.light().icons.messageIcon,
  ];

  /// endregion
}

extension ThemeContextExtension on BuildContext {
  /// Returns a reference to the [PrimeComponentsTheme] theme extension of the current [Theme]
  PrimeComponentsTheme get primeComponentsTheme {
    final theme = Theme.of(this).extension<PrimeComponentsTheme>();
    if (theme == null) {
      throw UnimplementedError(
        'Not Implemented PrimeComponentsTheme. '
        'Please add it as extension to the MaterialApp -> ThemeData',
      );
    }

    return theme;
  }
}
