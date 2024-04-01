import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../design_system/design_system.dart';

part 'pin_code_theme.tailor.dart';

@TailorMixinComponent()
class PinCodeTheme extends ThemeExtension<PinCodeTheme>
    with _$PinCodeThemeTailorMixin {
  const PinCodeTheme({
    required this.primaryColor,
    required this.backgroundColor,
    required this.scaffoldBackgroundColor,
    required this.highlightColor,
    required this.primaryGradientStart,
    required this.primaryGradientEnd,
    required this.transparentColor,
    required this.pinCodeKeyTextColorPressed,
    required this.pinCodeKeyTextColorDefault,
    required this.lightRed,
    required this.blueLight,
    required this.greenLight,
    required this.pinKeyboardErrorPinColor,
    required this.pinKeyboardBottomButtonTextColor,
    required this.appBarButtonIconColor,
    required this.shimmerBaseColor,
    required this.shimmerHighlightColor,
    required this.titleButtonIconBorderColor,
    required this.white,
    required this.black,
    required this.pinKeyboardMaskedKeyBorderColor,
    required this.pinKeyboardMaskedKeyColor,
    required this.descriptionBoldTextStyle,
    required this.appBarTitleDescriptionBoldTextStyle,
    required this.captionBold,
    required this.subtitleBold,
    required this.pinCodeKeyTextStyle,
    required this.descriptionBold,
    required this.titleBold,
    required this.descriptionThin,
    required this.errorTitle,
    required this.pinKeyboardBottomButtonTextStyle,
    required this.spacingXSS1,
    required this.spacingXS,
    required this.spacingXS1,
    required this.spacingS,
    required this.spacingM,
    required this.spacingL,
    required this.spacingXL,
    required this.spacingXXL,
    required this.spacingXXXL,
    required this.spacingXXXXL1,
    required this.spacing1,
    required this.spacing2,
    required this.spacing3,
    required this.spacing4,
    required this.spacing5,
    required this.spacing6,
    required this.pinDeleteActionIcon,
    required this.pinDeleteDefaultIcon,
    required this.faceScanDefaultIcon,
    required this.faceScanInvertedIcon,
    required this.faceScanPressedIcon,
    required this.fingerScanDefaultIcon,
    required this.fingerScanInvertedIcon,
    required this.fingerScanPressedIcon,
    required this.appBarTitleLeadingWidth,
  });

  /// region Themes

  PinCodeTheme.light()
      : primaryColor = PrimeDesignSystem.light().colors.primaryColor,
        backgroundColor = PrimeDesignSystem.light().colors.backgroundColor,
        scaffoldBackgroundColor =
            PrimeDesignSystem.light().colors.scaffoldBackgroundColor,
        highlightColor = PrimeDesignSystem.light().colors.highlightColor,
        primaryGradientStart = PrimeDesignSystem.light().colors.blue,
        primaryGradientEnd = PrimeDesignSystem.light().colors.lightBlue,
        transparentColor = PrimeDesignSystem.light().colors.lightBlue,
        pinCodeKeyTextColorPressed = PrimeDesignSystem.light().colors.black,
        pinCodeKeyTextColorDefault = PrimeDesignSystem.light().colors.white,
        lightRed = PrimeDesignSystem.light().colors.lightRed,
        blueLight = PrimeDesignSystem.light().colors.blueLight,
        greenLight = PrimeDesignSystem.light().colors.greenLight,
        pinKeyboardErrorPinColor = PrimeDesignSystem.light().colors.lightRed,
        pinKeyboardBottomButtonTextColor =
            PrimeDesignSystem.light().colors.textColorWhite,
        appBarButtonIconColor = PrimeDesignSystem.light().colors.textColorWhite,
        shimmerBaseColor = PrimeDesignSystem.light().colors.white,
        shimmerHighlightColor =
            PrimeDesignSystem.light().colors.white.withOpacity(0.4),
        titleButtonIconBorderColor =
            PrimeDesignSystem.light().colors.white.withOpacity(0.4),
        white = PrimeDesignSystem.light().colors.textColorWhite,
        black = PrimeDesignSystem.light().colors.black,
        pinKeyboardMaskedKeyBorderColor =
            PrimeDesignSystem.light().colors.lightBlue,
        pinKeyboardMaskedKeyColor =
            PrimeDesignSystem.light().colors.textColorWhite,
        descriptionBoldTextStyle =
            PrimeDesignSystem.light().typography.descriptionBold.copyWith(
                  color: PrimeDesignSystem.light().colors.white,
                ),
        appBarTitleDescriptionBoldTextStyle =
            PrimeDesignSystem.light().typography.descriptionBold.copyWith(
                  color: PrimeDesignSystem.light().colors.white,
                ),
        captionBold = PrimeDesignSystem.light().typography.captionBold,
        subtitleBold = PrimeDesignSystem.light().typography.h2Semibold16,
        pinCodeKeyTextStyle = PrimeDesignSystem.light().typography.h2Semibold16,
        descriptionBold = PrimeDesignSystem.light().typography.descriptionBold,
        titleBold = PrimeDesignSystem.light().typography.titleBold,
        descriptionThin = PrimeDesignSystem.light().typography.descriptionThin,
        errorTitle = PrimeDesignSystem.light().typography.errorTitle,
        pinKeyboardBottomButtonTextStyle =
            PrimeDesignSystem.light().typography.captionBold,
        spacingXSS1 = PrimeDesignSystem.light().spacings.xss1,
        spacingXS = PrimeDesignSystem.light().spacings.xs,
        spacingXS1 = PrimeDesignSystem.light().spacings.xs1,
        spacingS = PrimeDesignSystem.light().spacings.s,
        spacingM = PrimeDesignSystem.light().spacings.m,
        spacingL = PrimeDesignSystem.light().spacings.l,
        spacingXL = PrimeDesignSystem.light().spacings.xl,
        spacingXXL = PrimeDesignSystem.light().spacings.xxl,
        spacingXXXL = PrimeDesignSystem.light().spacings.xxxl,
        spacingXXXXL1 = PrimeDesignSystem.light().spacings.xxxxl1,
        spacing1 = PrimeDesignSystem.light().spacings.m,
        spacing2 = PrimeDesignSystem.light().spacings.xs1,
        spacing3 = PrimeDesignSystem.light().spacings.xs,
        spacing4 = PrimeDesignSystem.light().spacings.xxl,
        spacing5 = PrimeDesignSystem.light().spacings.s,
        spacing6 = PrimeDesignSystem.light().spacings.m,
        pinDeleteActionIcon = PrimeDesignSystem.dark().icons.pinDeleteAction,
        pinDeleteDefaultIcon = PrimeDesignSystem.dark().icons.pinDeleteDefault,
        faceScanDefaultIcon = PrimeDesignSystem.dark().icons.faceScanDefault,
        faceScanInvertedIcon = PrimeDesignSystem.dark().icons.faceScanInverted,
        faceScanPressedIcon = PrimeDesignSystem.dark().icons.faceScanPressed,
        fingerScanDefaultIcon =
            PrimeDesignSystem.dark().icons.fingerScanDefault,
        fingerScanInvertedIcon =
            PrimeDesignSystem.dark().icons.fingerScanInverted,
        fingerScanPressedIcon =
            PrimeDesignSystem.dark().icons.fingerScanPressed,
        appBarTitleLeadingWidth = PrimeDesignSystem.light().spacings.xxxxl1 +
            PrimeDesignSystem.light().spacings.m;

  PinCodeTheme.dark()
      : primaryColor = PrimeDesignSystem.dark().colors.primaryColor,
        backgroundColor = PrimeDesignSystem.dark().colors.backgroundColor,
        scaffoldBackgroundColor =
            PrimeDesignSystem.dark().colors.scaffoldBackgroundColor,
        highlightColor = PrimeDesignSystem.dark().colors.highlightColor,
        primaryGradientStart = PrimeDesignSystem.dark().colors.darkBlue,
        primaryGradientEnd = PrimeDesignSystem.dark().colors.blue,
        transparentColor = PrimeDesignSystem.dark().colors.blue,
        pinCodeKeyTextColorPressed = PrimeDesignSystem.dark().colors.black,
        pinCodeKeyTextColorDefault = PrimeDesignSystem.dark().colors.white,
        lightRed = PrimeDesignSystem.dark().colors.lightRed,
        blueLight = PrimeDesignSystem.dark().colors.blueLight,
        greenLight = PrimeDesignSystem.dark().colors.greenLight,
        pinKeyboardErrorPinColor = PrimeDesignSystem.dark().colors.lightRed,
        pinKeyboardBottomButtonTextColor =
            PrimeDesignSystem.dark().colors.textColorWhite,
        appBarButtonIconColor = PrimeDesignSystem.dark().colors.textColorWhite,
        shimmerBaseColor = PrimeDesignSystem.dark().colors.white,
        shimmerHighlightColor =
            PrimeDesignSystem.dark().colors.white.withOpacity(0.4),
        titleButtonIconBorderColor =
            PrimeDesignSystem.dark().colors.white.withOpacity(0.4),
        white = PrimeDesignSystem.dark().colors.textColorWhite,
        black = PrimeDesignSystem.dark().colors.white,
        pinKeyboardMaskedKeyBorderColor =
            PrimeDesignSystem.dark().colors.lightBlue,
        pinKeyboardMaskedKeyColor =
            PrimeDesignSystem.dark().colors.textColorWhite,
        descriptionBoldTextStyle =
            PrimeDesignSystem.dark().typography.descriptionBold.copyWith(
                  color: PrimeDesignSystem.dark().colors.white,
                ),
        appBarTitleDescriptionBoldTextStyle =
            PrimeDesignSystem.dark().typography.descriptionBold.copyWith(
                  color: PrimeDesignSystem.dark().colors.white,
                ),
        captionBold = PrimeDesignSystem.dark().typography.captionBold,
        subtitleBold = PrimeDesignSystem.dark().typography.h2Semibold16,
        pinCodeKeyTextStyle = PrimeDesignSystem.dark().typography.h2Semibold16,
        descriptionBold = PrimeDesignSystem.dark().typography.descriptionBold,
        titleBold = PrimeDesignSystem.dark().typography.titleBold,
        descriptionThin = PrimeDesignSystem.dark().typography.descriptionThin,
        errorTitle = PrimeDesignSystem.dark().typography.errorTitle,
        pinKeyboardBottomButtonTextStyle =
            PrimeDesignSystem.dark().typography.captionBold,
        spacingXSS1 = PrimeDesignSystem.dark().spacings.xss1,
        spacingXS = PrimeDesignSystem.dark().spacings.xs,
        spacingXS1 = PrimeDesignSystem.dark().spacings.xs1,
        spacingS = PrimeDesignSystem.dark().spacings.s,
        spacingM = PrimeDesignSystem.dark().spacings.m,
        spacingL = PrimeDesignSystem.dark().spacings.l,
        spacingXL = PrimeDesignSystem.dark().spacings.xl,
        spacingXXL = PrimeDesignSystem.dark().spacings.xxl,
        spacingXXXL = PrimeDesignSystem.dark().spacings.xxxl,
        spacingXXXXL1 = PrimeDesignSystem.dark().spacings.xxxxl1,
        spacing1 = PrimeDesignSystem.dark().spacings.m,
        spacing2 = PrimeDesignSystem.dark().spacings.xs1,
        spacing3 = PrimeDesignSystem.dark().spacings.xs,
        spacing4 = PrimeDesignSystem.dark().spacings.xxl,
        spacing5 = PrimeDesignSystem.dark().spacings.s,
        spacing6 = PrimeDesignSystem.dark().spacings.m,
        pinDeleteActionIcon = PrimeDesignSystem.light().icons.pinDeleteAction,
        pinDeleteDefaultIcon = PrimeDesignSystem.light().icons.pinDeleteDefault,
        faceScanDefaultIcon = PrimeDesignSystem.light().icons.faceScanDefault,
        faceScanInvertedIcon = PrimeDesignSystem.light().icons.faceScanInverted,
        faceScanPressedIcon = PrimeDesignSystem.light().icons.faceScanPressed,
        fingerScanDefaultIcon =
            PrimeDesignSystem.light().icons.fingerScanDefault,
        fingerScanInvertedIcon =
            PrimeDesignSystem.light().icons.fingerScanInverted,
        fingerScanPressedIcon =
            PrimeDesignSystem.light().icons.fingerScanPressed,
        appBarTitleLeadingWidth = PrimeDesignSystem.dark().spacings.xxxxl1 +
            PrimeDesignSystem.light().spacings.m;

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
  final Color transparentColor;
  @override
  final Color pinCodeKeyTextColorPressed;
  @override
  final Color pinCodeKeyTextColorDefault;
  @override
  final Color lightRed;
  @override
  final Color blueLight;
  @override
  final Color greenLight;
  @override
  final Color pinKeyboardErrorPinColor;
  @override
  final Color pinKeyboardBottomButtonTextColor;
  @override
  final Color appBarButtonIconColor;
  @override
  final Color shimmerBaseColor;
  @override
  final Color shimmerHighlightColor;
  @override
  final Color titleButtonIconBorderColor;
  @override
  final Color white;
  @override
  final Color black;
  @override
  final Color pinKeyboardMaskedKeyBorderColor;
  @override
  final Color pinKeyboardMaskedKeyColor;
  @override
  final TextStyle descriptionBoldTextStyle;
  @override
  final TextStyle appBarTitleDescriptionBoldTextStyle;
  @override
  final TextStyle captionBold;
  @override
  final TextStyle subtitleBold;
  @override
  final TextStyle pinCodeKeyTextStyle;
  @override
  final TextStyle descriptionBold;
  @override
  final TextStyle titleBold;
  @override
  final TextStyle descriptionThin;
  @override
  final TextStyle errorTitle;
  @override
  final TextStyle pinKeyboardBottomButtonTextStyle;
  @override
  final double spacingXSS1;
  @override
  final double spacingXS;
  @override
  final double spacingXS1;
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
  final double spacingXXXL;
  @override
  final double spacingXXXXL1;
  @override
  final double spacing1;
  @override
  final double spacing2;
  @override
  final double spacing3;
  @override
  final double spacing4;
  @override
  final double spacing5;
  @override
  final double spacing6;
  @override
  final Widget pinDeleteActionIcon;
  @override
  final Widget pinDeleteDefaultIcon;
  @override
  final Widget faceScanDefaultIcon;
  @override
  final Widget faceScanInvertedIcon;
  @override
  final Widget faceScanPressedIcon;
  @override
  final Widget fingerScanDefaultIcon;
  @override
  final Widget fingerScanInvertedIcon;
  @override
  final Widget fingerScanPressedIcon;
  @override
  final double appBarTitleLeadingWidth;
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
