import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:widget_toolkit/widget_toolkit.dart';

part 'qr_scanner_theme.tailor.dart';

@Tailor(themeGetter: ThemeGetter.none)
class _$QrScannerTheme {
  /// region paddings

  static List<EdgeInsets> cameraPermission1 = [
    EdgeInsets.symmetric(
      horizontal: WidgetToolkitDesignSystem.light().spacings.m,
    ),
    EdgeInsets.symmetric(
      horizontal: WidgetToolkitDesignSystem.dark().spacings.m,
    ),
  ];

  static List<EdgeInsets> cameraPermission2 = [
    EdgeInsets.only(
      top: WidgetToolkitDesignSystem.light().spacings.xs,
      bottom: WidgetToolkitDesignSystem.light().spacings.m,
    ),
    EdgeInsets.only(
      top: WidgetToolkitDesignSystem.dark().spacings.xs,
      bottom: WidgetToolkitDesignSystem.dark().spacings.m,
    ),
  ];

  static List<EdgeInsets> cameraPermission3 = [
    EdgeInsets.all(
      WidgetToolkitDesignSystem.light().spacings.m,
    ),
    EdgeInsets.all(
      WidgetToolkitDesignSystem.dark().spacings.m,
    ),
  ];

  static List<EdgeInsets> cameraPermission4 = [
    EdgeInsets.only(
      right: WidgetToolkitDesignSystem.light().spacings.m,
    ),
    EdgeInsets.only(
      right: WidgetToolkitDesignSystem.dark().spacings.m,
    ),
  ];
  static List<EdgeInsets> cameraPermission5 = [
    EdgeInsets.only(
      bottom: WidgetToolkitDesignSystem.light().spacings.xs,
    ),
    EdgeInsets.only(
      bottom: WidgetToolkitDesignSystem.dark().spacings.xs,
    ),
  ];
  static List<EdgeInsets> cameraPermission6 = [
    EdgeInsets.symmetric(
      vertical: WidgetToolkitDesignSystem.light().spacings.m,
    ),
    EdgeInsets.symmetric(
      vertical: WidgetToolkitDesignSystem.dark().spacings.m,
    ),
  ];

  static List<EdgeInsets> qrScannerPage1 = [
    EdgeInsets.only(
      left: WidgetToolkitDesignSystem.light().spacings.m,
      right: WidgetToolkitDesignSystem.light().spacings.m,
      bottom: WidgetToolkitDesignSystem.light().spacings.m,
    ),
    EdgeInsets.only(
      left: WidgetToolkitDesignSystem.dark().spacings.m,
      right: WidgetToolkitDesignSystem.dark().spacings.m,
      bottom: WidgetToolkitDesignSystem.dark().spacings.m,
    ),
  ];

  static List<EdgeInsets> qrScannerPage2 = [
    EdgeInsets.only(
      left: WidgetToolkitDesignSystem.light().spacings.xxxl,
      right: WidgetToolkitDesignSystem.light().spacings.xxxl,
    ),
    EdgeInsets.only(
      left: WidgetToolkitDesignSystem.dark().spacings.xxxl,
      right: WidgetToolkitDesignSystem.dark().spacings.xxxl,
    ),
  ];

  static List<EdgeInsets> qrScannerPage3 = [
    EdgeInsets.all(WidgetToolkitDesignSystem.light().spacings.xss),
    EdgeInsets.all(WidgetToolkitDesignSystem.dark().spacings.xss),
  ];

  static List<EdgeInsets> qrScannerPage4 = [
    EdgeInsets.only(
      left: WidgetToolkitDesignSystem.light().spacings.m,
      right: WidgetToolkitDesignSystem.light().spacings.m,
      bottom: WidgetToolkitDesignSystem.light().spacings.xxxl,
    ),
    EdgeInsets.only(
      left: WidgetToolkitDesignSystem.dark().spacings.m,
      right: WidgetToolkitDesignSystem.dark().spacings.m,
      bottom: WidgetToolkitDesignSystem.dark().spacings.xxxl,
    ),
  ];

  static List<EdgeInsets> qrScannerPage5 = [
    EdgeInsets.only(
      left: WidgetToolkitDesignSystem.light().spacings.m,
      right: WidgetToolkitDesignSystem.light().spacings.m,
      bottom: WidgetToolkitDesignSystem.light().spacings.xxl,
    ),
    EdgeInsets.only(
      left: WidgetToolkitDesignSystem.dark().spacings.m,
      right: WidgetToolkitDesignSystem.dark().spacings.m,
      bottom: WidgetToolkitDesignSystem.dark().spacings.xxl,
    ),
  ];

  static List<EdgeInsets> qrScannerSubtitlePadding = [
    EdgeInsets.only(top: WidgetToolkitDesignSystem.light().spacings.xs1),
    EdgeInsets.only(top: WidgetToolkitDesignSystem.light().spacings.xs1)
  ];

  static List<EdgeInsets> backButtonMarginEdgeInsets = [
    EdgeInsets.only(
      left: WidgetToolkitDesignSystem.light().spacings.xs,
    ),
    EdgeInsets.only(
      left: WidgetToolkitDesignSystem.dark().spacings.xs,
    ),
  ];

  static List<EdgeInsets> backButtonPaddingEdgeInsets = [
    EdgeInsets.only(
      left: WidgetToolkitDesignSystem.light().spacings.xs,
    ),
    EdgeInsets.only(
      left: WidgetToolkitDesignSystem.dark().spacings.xs,
    ),
  ];

  static List<EdgeInsets> backButtonContainerPaddingEdgeInsets = [
    EdgeInsets.all(WidgetToolkitDesignSystem.light().spacings.xss1),
    EdgeInsets.all(WidgetToolkitDesignSystem.dark().spacings.xss1),
  ];

  /// endregion
  /// region spacings

  static List<double> mockQrViewSpacing = [
    WidgetToolkitDesignSystem.light().spacings.m,
    WidgetToolkitDesignSystem.dark().spacings.m,
  ];

  static List<double> qrScannerPageXS = [
    WidgetToolkitDesignSystem.light().spacings.xs,
    WidgetToolkitDesignSystem.dark().spacings.xs,
  ];

  static List<double> linearProgressIndicatorXS = [
    WidgetToolkitDesignSystem.light().spacings.xs,
    WidgetToolkitDesignSystem.dark().spacings.xs,
  ];

  static List<double> qrScannerPageM = [
    WidgetToolkitDesignSystem.light().spacings.m,
    WidgetToolkitDesignSystem.dark().spacings.m,
  ];

  static List<double> backButtonSpacingL = [
    WidgetToolkitDesignSystem.light().spacings.l,
    WidgetToolkitDesignSystem.dark().spacings.l,
  ];

  static List<double> appBarSpacingM = [
    WidgetToolkitDesignSystem.light().spacings.m,
    WidgetToolkitDesignSystem.dark().spacings.m,
  ];

  static List<double> appBarSpacingXXXXL = [
    WidgetToolkitDesignSystem.light().spacings.xxxxl,
    WidgetToolkitDesignSystem.dark().spacings.xxxxl,
  ];

  static List<double> backButtonSpacingXXXL = [
    WidgetToolkitDesignSystem.light().spacings.xxxl,
    WidgetToolkitDesignSystem.dark().spacings.xxxl,
  ];

  static List<double> backButtonSpacingXSS1 = [
    WidgetToolkitDesignSystem.light().spacings.xss1,
    WidgetToolkitDesignSystem.dark().spacings.xss1,
  ];

  static List<double> backButtonWidthSpacingXXXL = [
    WidgetToolkitDesignSystem.light().spacings.xxxl,
    WidgetToolkitDesignSystem.dark().spacings.xxxl,
  ];

  static List<double> backButtonHeightSpacingXXXL = [
    WidgetToolkitDesignSystem.light().spacings.xxxl,
    WidgetToolkitDesignSystem.dark().spacings.xxxl,
  ];

  /// endregion
  /// region Colors

  static List<Color> qrScannerMediumWhiteScaffold = [
    WidgetToolkitDesignSystem.light().colors.qrScannerMediumWhite,
    WidgetToolkitDesignSystem.dark().colors.qrScannerMediumWhite,
  ];

  static List<Color> qrScannerGradientRedStart = [
    WidgetToolkitDesignSystem.light().colors.qrScannerGradientRedStart,
    WidgetToolkitDesignSystem.dark().colors.qrScannerSubtitleWhite,
  ];

  static List<Color> qrScannerCameraPermissionRedLightColor = [
    WidgetToolkitDesignSystem.light().colors.qrScannerRedLightColor,
    WidgetToolkitDesignSystem.dark().colors.qrScannerRedLightColor,
  ];

  static List<Color> linearProgressIndicatorRedLightColor = [
    WidgetToolkitDesignSystem.light()
        .colors
        .qrScannerLinearProgressRedLightColor,
    WidgetToolkitDesignSystem.dark()
        .colors
        .qrScannerLinearProgressRedLightColor,
  ];

  static List<Color> qrScannerRed = [
    WidgetToolkitDesignSystem.light().colors.qrScannerRed,
    WidgetToolkitDesignSystem.dark().colors.qrScannerRed,
  ];

  static List<Color> linearProgressIndicatorRed = [
    WidgetToolkitDesignSystem.light()
        .colors
        .qrScannerlinearProgressIndicatorRed,
    WidgetToolkitDesignSystem.dark().colors.qrScannerlinearProgressIndicatorRed,
  ];

  static List<Color> qrScannerDisabledButtonGray = [
    WidgetToolkitDesignSystem.light().colors.qrScannerDisabledFilledButtonGrey,
    WidgetToolkitDesignSystem.dark().colors.qrScannerDisabledFilledButtonGrey,
  ];

  static List<Color> qrScannerGray = [
    WidgetToolkitDesignSystem.light().colors.gray,
    WidgetToolkitDesignSystem.dark().colors.gray,
  ];

  static List<Color> qrScannerPageBackgroundColor = [
    WidgetToolkitDesignSystem.light().colors.qrScannerPageBackgroundColorWhite,
    WidgetToolkitDesignSystem.dark().colors.qrScannerPageBackgroundColor,
  ];

  static List<Color> qrScannerPageScaffoldBackgroundColor = [
    WidgetToolkitDesignSystem.light()
        .colors
        .qrScannerPageScaffoldBackgroundColorWhite,
    WidgetToolkitDesignSystem.dark().colors.qrScannerPageBackgroundColor,
  ];

  static List<Color> qrScannerPageAppBarBackgroundColor = [
    WidgetToolkitDesignSystem.light()
        .colors
        .qrScannerPageAppBarBackgroundColorWhite,
    WidgetToolkitDesignSystem.dark()
        .colors
        .qrScannerPageAppBarBackgroundColorGrey,
  ];

  static List<Color> appBarBackgroundColor = [
    WidgetToolkitDesignSystem.light().colors.appBarColorWhite,
    WidgetToolkitDesignSystem.dark().colors.appBarColorGrey,
  ];

  static List<Color> backButtonTransparentColor = [
    WidgetToolkitDesignSystem.light().colors.backButtonTransparentColor,
    WidgetToolkitDesignSystem.dark().colors.backButtonTransparentColor,
  ];

  static List<Color> backButtonColorMediumWhite = [
    WidgetToolkitDesignSystem.light().colors.mediumWhite,
    WidgetToolkitDesignSystem.dark().colors.mediumWhite,
  ];

  static List<Color> appBarTextColor = [
    WidgetToolkitDesignSystem.light().colors.appBarTextColorGrey,
    WidgetToolkitDesignSystem.dark().colors.appBarTextColorWhite,
  ];

  static List<Color> backButtonIconColor = [
    WidgetToolkitDesignSystem.light().colors.black,
    WidgetToolkitDesignSystem.dark().colors.white,
  ];

  static List<Color> backButtonIconBorderColor = [
    WidgetToolkitDesignSystem.light().colors.black,
    WidgetToolkitDesignSystem.dark().colors.white,
  ];

  /// endregion
  /// region typography
  static List<TextStyle> captionBold = [
    WidgetToolkitDesignSystem.light().typography.captionBold,
    WidgetToolkitDesignSystem.dark().typography.captionBold,
  ];

  static List<TextStyle> descriptionThin = [
    WidgetToolkitDesignSystem.light().typography.descriptionThin,
    WidgetToolkitDesignSystem.dark().typography.descriptionThin,
  ];

  static List<TextStyle> titleBold = [
    WidgetToolkitDesignSystem.light().typography.titleBold,
    WidgetToolkitDesignSystem.dark().typography.titleBold,
  ];
  static List<TextStyle> appBarTextStyle = [
    WidgetToolkitDesignSystem.light().typography.descriptionBold,
    WidgetToolkitDesignSystem.light().typography.descriptionBold,
  ];

  /// endregion
  /// region Icons
  static List<SvgFile> cameraIcon = [
    WidgetToolkitDesignSystem.dark().icons.camera,
    WidgetToolkitDesignSystem.light().icons.camera,
  ];

  static List<SvgFile> closeIcon = [
    WidgetToolkitDesignSystem.dark().icons.qrScanCloseIcon,
    WidgetToolkitDesignSystem.light().icons.qrScanCloseIcon,
  ];

  static List<SvgFile> qrScanAreaIcon = [
    WidgetToolkitDesignSystem.dark().icons.qrScanAreaIcon,
    WidgetToolkitDesignSystem.light().icons.qrScanAreaIcon,
  ];

  static List<SvgFile> backButtonCloseIcon = [
    WidgetToolkitDesignSystem.dark().icons.closeIcon,
    WidgetToolkitDesignSystem.light().icons.closeIcon,
  ];

  static List<SvgFile> backButtonArrowLeft = [
    WidgetToolkitDesignSystem.dark().icons.arrowLeft,
    WidgetToolkitDesignSystem.light().icons.arrowLeft,
  ];

  /// endregion
}

extension ThemeContextExtension on BuildContext {
  /// Returns a reference to the [QrScannerTheme] theme extension of the current [Theme]
  QrScannerTheme get qrScannerTheme {
    final theme = Theme.of(this).extension<QrScannerTheme>();
    if (theme == null) {
      throw UnimplementedError(
        'Not Implemented QrScannerTheme. '
        'Please add it as extension to the MaterialApp -> ThemeData',
      );
    }

    return theme;
  }
}
