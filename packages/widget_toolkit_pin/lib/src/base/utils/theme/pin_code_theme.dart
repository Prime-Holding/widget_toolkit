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
    required this.pinCodeErrorTextColor,
    required this.pinKeyboardErrorPinColor,
    required this.pinKeyboardBottomButtonTextColor,
    required this.appBarButtonIconColor,
    required this.shimmerBaseColor,
    required this.shimmerHighlightColor,
    required this.titleButtonIconBorderColor,
    required this.pinCodeKeyBackgroundColor,
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
      : primaryColor = PinCodeDesignSystem.light().colors.primaryColor,
        backgroundColor = PinCodeDesignSystem.light().colors.backgroundColor,
        scaffoldBackgroundColor =
            PinCodeDesignSystem.light().colors.scaffoldBackgroundColor,
        highlightColor = PinCodeDesignSystem.light().colors.highlightColor,
        primaryGradientStart = PinCodeDesignSystem.light().colors.blue,
        primaryGradientEnd = PinCodeDesignSystem.light().colors.lightBlue,
        transparentColor = PinCodeDesignSystem.light().colors.lightBlue,
        pinCodeKeyTextColorPressed = PinCodeDesignSystem.light().colors.black,
        pinCodeKeyTextColorDefault = PinCodeDesignSystem.light().colors.white,
        pinCodeErrorTextColor = PinCodeDesignSystem.light().colors.lightRed,
        pinKeyboardErrorPinColor = PinCodeDesignSystem.light().colors.lightRed,
        pinKeyboardBottomButtonTextColor =
            PinCodeDesignSystem.light().colors.textColorWhite,
        appBarButtonIconColor =
            PinCodeDesignSystem.light().colors.textColorWhite,
        shimmerBaseColor = PinCodeDesignSystem.light().colors.white,
        shimmerHighlightColor =
            PinCodeDesignSystem.light().colors.white.withValues(alpha: 0.4),
        titleButtonIconBorderColor =
            PinCodeDesignSystem.light().colors.white.withValues(alpha: 0.4),
        pinCodeKeyBackgroundColor =
            PinCodeDesignSystem.light().colors.textColorWhite,
        pinKeyboardMaskedKeyBorderColor =
            PinCodeDesignSystem.light().colors.lightBlue,
        pinKeyboardMaskedKeyColor =
            PinCodeDesignSystem.light().colors.textColorWhite,
        descriptionBoldTextStyle =
            PinCodeDesignSystem.light().typography.descriptionBold.copyWith(
                  color: PinCodeDesignSystem.light().colors.white,
                ),
        appBarTitleDescriptionBoldTextStyle =
            PinCodeDesignSystem.light().typography.descriptionBold.copyWith(
                  color: PinCodeDesignSystem.light().colors.white,
                ),
        captionBold = PinCodeDesignSystem.light().typography.captionBold,
        subtitleBold = PinCodeDesignSystem.light().typography.h2Semibold16,
        pinCodeKeyTextStyle =
            PinCodeDesignSystem.light().typography.h2Semibold16,
        descriptionBold =
            PinCodeDesignSystem.light().typography.descriptionBold,
        titleBold = PinCodeDesignSystem.light().typography.titleBold,
        descriptionThin =
            PinCodeDesignSystem.light().typography.descriptionThin,
        errorTitle = PinCodeDesignSystem.light().typography.errorTitle,
        pinKeyboardBottomButtonTextStyle =
            PinCodeDesignSystem.light().typography.captionBold,
        spacingXSS1 = PinCodeDesignSystem.light().spacings.xss1,
        spacingXS = PinCodeDesignSystem.light().spacings.xs,
        spacingXS1 = PinCodeDesignSystem.light().spacings.xs1,
        spacingS = PinCodeDesignSystem.light().spacings.s,
        spacingM = PinCodeDesignSystem.light().spacings.m,
        spacingL = PinCodeDesignSystem.light().spacings.l,
        spacingXL = PinCodeDesignSystem.light().spacings.xl,
        spacingXXL = PinCodeDesignSystem.light().spacings.xxl,
        spacingXXXL = PinCodeDesignSystem.light().spacings.xxxl,
        spacingXXXXL1 = PinCodeDesignSystem.light().spacings.xxxxl1,
        spacing1 = PinCodeDesignSystem.light().spacings.m,
        spacing2 = PinCodeDesignSystem.light().spacings.xs1,
        spacing3 = PinCodeDesignSystem.light().spacings.xs,
        spacing4 = PinCodeDesignSystem.light().spacings.xxl,
        spacing5 = PinCodeDesignSystem.light().spacings.s,
        spacing6 = PinCodeDesignSystem.light().spacings.m,
        pinDeleteActionIcon = PinCodeDesignSystem.dark().icons.pinDeleteAction,
        pinDeleteDefaultIcon =
            PinCodeDesignSystem.dark().icons.pinDeleteDefault,
        faceScanDefaultIcon = PinCodeDesignSystem.dark().icons.faceScanDefault,
        faceScanInvertedIcon =
            PinCodeDesignSystem.dark().icons.faceScanInverted,
        faceScanPressedIcon = PinCodeDesignSystem.dark().icons.faceScanPressed,
        fingerScanDefaultIcon =
            PinCodeDesignSystem.dark().icons.fingerScanDefault,
        fingerScanInvertedIcon =
            PinCodeDesignSystem.dark().icons.fingerScanInverted,
        fingerScanPressedIcon =
            PinCodeDesignSystem.dark().icons.fingerScanPressed,
        appBarTitleLeadingWidth = PinCodeDesignSystem.light().spacings.xxxxl1 +
            PinCodeDesignSystem.light().spacings.m;

  PinCodeTheme.dark()
      : primaryColor = PinCodeDesignSystem.dark().colors.primaryColor,
        backgroundColor = PinCodeDesignSystem.dark().colors.backgroundColor,
        scaffoldBackgroundColor =
            PinCodeDesignSystem.dark().colors.scaffoldBackgroundColor,
        highlightColor = PinCodeDesignSystem.dark().colors.highlightColor,
        primaryGradientStart = PinCodeDesignSystem.dark().colors.darkBlue,
        primaryGradientEnd = PinCodeDesignSystem.dark().colors.blue,
        transparentColor = PinCodeDesignSystem.dark().colors.blue,
        pinCodeKeyTextColorPressed = PinCodeDesignSystem.dark().colors.black,
        pinCodeKeyTextColorDefault = PinCodeDesignSystem.dark().colors.white,
        pinCodeErrorTextColor = PinCodeDesignSystem.dark().colors.lightRed,
        pinKeyboardErrorPinColor = PinCodeDesignSystem.dark().colors.lightRed,
        pinKeyboardBottomButtonTextColor =
            PinCodeDesignSystem.dark().colors.textColorWhite,
        appBarButtonIconColor =
            PinCodeDesignSystem.dark().colors.textColorWhite,
        shimmerBaseColor = PinCodeDesignSystem.dark().colors.white,
        shimmerHighlightColor =
            PinCodeDesignSystem.dark().colors.white.withValues(alpha: 0.4),
        titleButtonIconBorderColor =
            PinCodeDesignSystem.dark().colors.white.withValues(alpha: 0.4),
        pinCodeKeyBackgroundColor =
            PinCodeDesignSystem.dark().colors.textColorWhite,
        pinKeyboardMaskedKeyBorderColor =
            PinCodeDesignSystem.dark().colors.lightBlue,
        pinKeyboardMaskedKeyColor =
            PinCodeDesignSystem.dark().colors.textColorWhite,
        descriptionBoldTextStyle =
            PinCodeDesignSystem.dark().typography.descriptionBold.copyWith(
                  color: PinCodeDesignSystem.dark().colors.white,
                ),
        appBarTitleDescriptionBoldTextStyle =
            PinCodeDesignSystem.dark().typography.descriptionBold.copyWith(
                  color: PinCodeDesignSystem.dark().colors.white,
                ),
        captionBold = PinCodeDesignSystem.dark().typography.captionBold,
        subtitleBold = PinCodeDesignSystem.dark().typography.h2Semibold16,
        pinCodeKeyTextStyle =
            PinCodeDesignSystem.dark().typography.h2Semibold16,
        descriptionBold = PinCodeDesignSystem.dark().typography.descriptionBold,
        titleBold = PinCodeDesignSystem.dark().typography.titleBold,
        descriptionThin = PinCodeDesignSystem.dark().typography.descriptionThin,
        errorTitle = PinCodeDesignSystem.dark().typography.errorTitle,
        pinKeyboardBottomButtonTextStyle =
            PinCodeDesignSystem.dark().typography.captionBold,
        spacingXSS1 = PinCodeDesignSystem.dark().spacings.xss1,
        spacingXS = PinCodeDesignSystem.dark().spacings.xs,
        spacingXS1 = PinCodeDesignSystem.dark().spacings.xs1,
        spacingS = PinCodeDesignSystem.dark().spacings.s,
        spacingM = PinCodeDesignSystem.dark().spacings.m,
        spacingL = PinCodeDesignSystem.dark().spacings.l,
        spacingXL = PinCodeDesignSystem.dark().spacings.xl,
        spacingXXL = PinCodeDesignSystem.dark().spacings.xxl,
        spacingXXXL = PinCodeDesignSystem.dark().spacings.xxxl,
        spacingXXXXL1 = PinCodeDesignSystem.dark().spacings.xxxxl1,
        spacing1 = PinCodeDesignSystem.dark().spacings.m,
        spacing2 = PinCodeDesignSystem.dark().spacings.xs1,
        spacing3 = PinCodeDesignSystem.dark().spacings.xs,
        spacing4 = PinCodeDesignSystem.dark().spacings.xxl,
        spacing5 = PinCodeDesignSystem.dark().spacings.s,
        spacing6 = PinCodeDesignSystem.dark().spacings.m,
        pinDeleteActionIcon = PinCodeDesignSystem.light().icons.pinDeleteAction,
        pinDeleteDefaultIcon =
            PinCodeDesignSystem.light().icons.pinDeleteDefault,
        faceScanDefaultIcon = PinCodeDesignSystem.light().icons.faceScanDefault,
        faceScanInvertedIcon =
            PinCodeDesignSystem.light().icons.faceScanInverted,
        faceScanPressedIcon = PinCodeDesignSystem.light().icons.faceScanPressed,
        fingerScanDefaultIcon =
            PinCodeDesignSystem.light().icons.fingerScanDefault,
        fingerScanInvertedIcon =
            PinCodeDesignSystem.light().icons.fingerScanInverted,
        fingerScanPressedIcon =
            PinCodeDesignSystem.light().icons.fingerScanPressed,
        appBarTitleLeadingWidth = PinCodeDesignSystem.dark().spacings.xxxxl1 +
            PinCodeDesignSystem.light().spacings.m;

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
  @override
  final Color pinCodeErrorTextColor;
  @override
  final Color pinCodeKeyBackgroundColor;
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
