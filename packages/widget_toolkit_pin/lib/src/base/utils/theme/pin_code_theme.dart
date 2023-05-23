import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../design_system/design_system.dart';

part 'pin_code_theme.tailor.dart';

@Tailor(themeGetter: ThemeGetter.none)
class _$PinCodeTheme {
  /// region Colors

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

  static List<Color> transparentColor = [
    PrimeDesignSystem.light().colors.lightBlue,
    PrimeDesignSystem.dark().colors.blue,
  ];

  static List<Color> pinCodeKeyTextColorPressed = [
    PrimeDesignSystem.light().colors.black,
    PrimeDesignSystem.dark().colors.black,
  ];

  static List<Color> pinCodeKeyTextColorDefault = [
    PrimeDesignSystem.light().colors.white,
    PrimeDesignSystem.dark().colors.white,
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

  static List<Color> pinKeyboardErrorPinColor = lightRed;

  static List<Color> pinKeyboardBottomButtonTextColor = white;

  static List<Color> appBarButtonIconColor = [
    PrimeDesignSystem.light().colors.textColorWhite,
    PrimeDesignSystem.dark().colors.textColorWhite,
  ];

  static List<Color> shimmerBaseColor = [
    PrimeDesignSystem.light().colors.white,
    PrimeDesignSystem.dark().colors.white,
  ];

  static List<Color> shimmerHighlightColor = [
    PrimeDesignSystem.light().colors.white.withOpacity(0.4),
    PrimeDesignSystem.dark().colors.white.withOpacity(0.4),
  ];

  static List<Color> titleButtonIconBorderColor = shimmerHighlightColor;

  static List<Color> white = [
    PrimeDesignSystem.light().colors.textColorWhite,
    PrimeDesignSystem.dark().colors.textColorWhite,
  ];

  static List<Color> black = [
    PrimeDesignSystem.light().colors.black,
    PrimeDesignSystem.dark().colors.white,
  ];

  static List<Color> pinKeyboardMaskedKeyBorderColor = [
    PrimeDesignSystem.light().colors.lightBlue,
    PrimeDesignSystem.dark().colors.lightBlue,
  ];

  static List<Color> pinKeyboardMaskedKeyColor = white;

  /// endregion

  /// region Common TextStyles
  static List<TextStyle> descriptionBoldTextStyle = [
    PrimeDesignSystem.light().typography.descriptionBold.copyWith(
          color: PrimeDesignSystem.light().colors.white,
        ),
    PrimeDesignSystem.dark().typography.descriptionBold.copyWith(
          color: PrimeDesignSystem.dark().colors.white,
        ),
  ];

  static List<TextStyle> appBarTitleDescriptionBoldTextStyle =
      descriptionBoldTextStyle;

  static List<TextStyle> captionBold = [
    PrimeDesignSystem.light().typography.captionBold,
    PrimeDesignSystem.dark().typography.captionBold,
  ];

  static List<TextStyle> subtitleBold = [
    PrimeDesignSystem.light().typography.h2Semibold16,
    PrimeDesignSystem.dark().typography.h2Semibold16,
  ];

  static List<TextStyle> pinCodeKeyTextStyle = subtitleBold;

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

  static List<TextStyle> pinKeyboardBottomButtonTextStyle = captionBold;

  /// endregion

  /// region Common Spacings

  static List<double> spacingXSS1 = [
    PrimeDesignSystem.light().spacings.xss1,
    PrimeDesignSystem.dark().spacings.xss1,
  ];

  static List<double> spacingXS = [
    PrimeDesignSystem.light().spacings.xs,
    PrimeDesignSystem.dark().spacings.xs,
  ];

  static List<double> spacingXS1 = [
    PrimeDesignSystem.light().spacings.xs1,
    PrimeDesignSystem.dark().spacings.xs1,
  ];

  static List<double> spacingS = [
    PrimeDesignSystem.light().spacings.s,
    PrimeDesignSystem.dark().spacings.s,
  ];

  static List<double> spacingM = [
    PrimeDesignSystem.light().spacings.m,
    PrimeDesignSystem.dark().spacings.m,
  ];

  static List<double> spacingL = [
    PrimeDesignSystem.light().spacings.l,
    PrimeDesignSystem.dark().spacings.l,
  ];

  static List<double> spacingXL = [
    PrimeDesignSystem.light().spacings.xl,
    PrimeDesignSystem.dark().spacings.xl,
  ];

  static List<double> spacingXXL = [
    PrimeDesignSystem.light().spacings.xxl,
    PrimeDesignSystem.dark().spacings.xxl,
  ];

  static List<double> spacingXXXL = [
    PrimeDesignSystem.light().spacings.xxxl,
    PrimeDesignSystem.dark().spacings.xxxl,
  ];

  static List<double> spacingXXXXL1 = [
    PrimeDesignSystem.light().spacings.xxxxl1,
    PrimeDesignSystem.dark().spacings.xxxxl1,
  ];

  static List<double> appBarTitleLeadingWidth = [
    PrimeDesignSystem.light().spacings.xxxxl1 +
        PrimeDesignSystem.light().spacings.m,
    PrimeDesignSystem.dark().spacings.xxxxl1 +
        PrimeDesignSystem.light().spacings.m,
  ];

  static List<double> spacing1 = spacingM;

  static List<double> spacing2 = spacingXS1;

  static List<double> spacing3 = spacingXS;

  static List<double> spacing4 = spacingXXL;

  static List<double> spacing5 = spacingS;

  static List<double> spacing6 = spacingM;

  /// endregion

  /// region Common Icons

  static List<Widget> pinDeleteActionIcon = [
    PrimeDesignSystem.dark().icons.pinDeleteAction,
    PrimeDesignSystem.light().icons.pinDeleteAction,
  ];

  static List<Widget> pinDeleteDefaultIcon = [
    PrimeDesignSystem.dark().icons.pinDeleteDefault,
    PrimeDesignSystem.light().icons.pinDeleteDefault,
  ];

  static List<Widget> faceScanDefaultIcon = [
    PrimeDesignSystem.dark().icons.faceScanDefault,
    PrimeDesignSystem.light().icons.faceScanDefault,
  ];

  static List<Widget> faceScanInvertedIcon = [
    PrimeDesignSystem.dark().icons.faceScanInverted,
    PrimeDesignSystem.light().icons.faceScanInverted,
  ];

  static List<Widget> faceScanPressedIcon = [
    PrimeDesignSystem.dark().icons.faceScanPressed,
    PrimeDesignSystem.light().icons.faceScanPressed,
  ];

  static List<Widget> fingerScanDefaultIcon = [
    PrimeDesignSystem.dark().icons.fingerScanDefault,
    PrimeDesignSystem.light().icons.fingerScanDefault,
  ];

  static List<Widget> fingerScanInvertedIcon = [
    PrimeDesignSystem.dark().icons.fingerScanInverted,
    PrimeDesignSystem.light().icons.fingerScanInverted,
  ];

  static List<Widget> fingerScanPressedIcon = [
    PrimeDesignSystem.dark().icons.fingerScanPressed,
    PrimeDesignSystem.light().icons.fingerScanPressed,
  ];

  /// endregion
}

extension ThemePinExtension on BuildContext {
  /// Returns a reference to the [PinCodeTheme] theme extension of the current [Theme]
  PinCodeTheme get pinCodeTheme {
    final theme = Theme.of(this).extension<PinCodeTheme>();
    if (theme == null) {
      throw UnimplementedError(
        'Not Implemented PinCodeTheme. '
        'Please add it as extension to the MaterialApp -> ThemeData',
      );
    }
    return theme;
  }
}
