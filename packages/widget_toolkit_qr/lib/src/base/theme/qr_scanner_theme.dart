import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:widget_toolkit/widget_toolkit.dart';

part 'qr_scanner_theme.tailor.dart';

@TailorMixinComponent()
class QrScannerTheme extends ThemeExtension<QrScannerTheme>
    with _$QrScannerThemeTailorMixin {
  const QrScannerTheme({
    required this.cameraPermissionPadding,
    required this.cameraPermissionBorderPadding,
    required this.cameraPermissionContentPadding,
    required this.cameraPermissionIconPadding,
    required this.cameraPermissionTitlePadding,
    required this.qrScannerComponentPadding,
    required this.qrScannerCameraPadding,
    required this.qrScannerProgressIndicatorPadding,
    required this.qrScannerSubtitlePadding,
    required this.backButtonMarginEdgeInsets,
    required this.backButtonPaddingEdgeInsets,
    required this.backButtonContainerPaddingEdgeInsets,
    required this.mockQrViewSpacing,
    required this.qrScannerPageXS,
    required this.linearProgressIndicatorDefaultMinHeight,
    required this.qrScannerPageM,
    required this.backButtonSpacingL,
    required this.appBarSpacingM,
    required this.appBarSpacingXXXXL,
    required this.backButtonSpacingXXXL,
    required this.backButtonSpacingXSS1,
    required this.backButtonWidthSpacingXXXL,
    required this.backButtonHeightSpacingXXXL,
    required this.qrScannerMediumWhiteScaffold,
    required this.qrScannerPageBackgroundColor,
    required this.qrScannerPageScaffoldBackgroundColor,
    required this.qrScannerPageAppBarBackgroundColor,
    required this.appBarBackgroundColor,
    required this.backButtonTransparentColor,
    required this.backButtonColorMediumWhite,
    required this.appBarTextColor,
    required this.backButtonIconColor,
    required this.backButtonIconBorderColor,
    required this.captionBold,
    required this.descriptionThin,
    required this.titleBold,
    required this.appBarTextStyle,
    required this.cameraIcon,
    required this.closeIcon,
    required this.qrScanAreaIcon,
    required this.backButtonCloseIcon,
    required this.backButtonArrowLeft,
    required this.qrScannerCameraPermissionBorderColor,
    required this.linearProgressIndicatorBackgroundColor,
    required this.qrScannerTextColor,
    required this.linearProgressIndicatorColor,
  });

  /// region Themes

  QrScannerTheme.light()
      : cameraPermissionPadding = EdgeInsets.symmetric(
          horizontal: WidgetToolkitDesignSystem.light().spacings.m,
        ),
        cameraPermissionBorderPadding = EdgeInsets.only(
          top: WidgetToolkitDesignSystem.light().spacings.xs,
          bottom: WidgetToolkitDesignSystem.light().spacings.m,
        ),
        cameraPermissionContentPadding = EdgeInsets.all(
          WidgetToolkitDesignSystem.light().spacings.m,
        ),
        cameraPermissionIconPadding = EdgeInsets.only(
          right: WidgetToolkitDesignSystem.light().spacings.m,
        ),
        cameraPermissionTitlePadding = EdgeInsets.only(
          bottom: WidgetToolkitDesignSystem.light().spacings.xs,
        ),
        qrScannerComponentPadding = EdgeInsets.only(
          left: WidgetToolkitDesignSystem.light().spacings.xxxl,
          right: WidgetToolkitDesignSystem.light().spacings.xxxl,
        ),
        qrScannerCameraPadding =
            EdgeInsets.all(WidgetToolkitDesignSystem.light().spacings.xss),
        qrScannerProgressIndicatorPadding = EdgeInsets.only(
          left: WidgetToolkitDesignSystem.light().spacings.m,
          right: WidgetToolkitDesignSystem.light().spacings.m,
          bottom: WidgetToolkitDesignSystem.light().spacings.xxxl,
        ),
        qrScannerSubtitlePadding = EdgeInsets.only(
            top: WidgetToolkitDesignSystem.light().spacings.xs1),
        backButtonMarginEdgeInsets = EdgeInsets.only(
          left: WidgetToolkitDesignSystem.light().spacings.xs,
        ),
        backButtonPaddingEdgeInsets = EdgeInsets.only(
          left: WidgetToolkitDesignSystem.light().spacings.xs,
        ),
        backButtonContainerPaddingEdgeInsets =
            EdgeInsets.all(WidgetToolkitDesignSystem.light().spacings.xss1),
        mockQrViewSpacing = WidgetToolkitDesignSystem.light().spacings.m,
        qrScannerPageXS = WidgetToolkitDesignSystem.light().spacings.xs,
        linearProgressIndicatorDefaultMinHeight =
            WidgetToolkitDesignSystem.light().spacings.xs,
        qrScannerPageM = WidgetToolkitDesignSystem.light().spacings.m,
        backButtonSpacingL = WidgetToolkitDesignSystem.light().spacings.l,
        appBarSpacingM = WidgetToolkitDesignSystem.light().spacings.m,
        appBarSpacingXXXXL = WidgetToolkitDesignSystem.light().spacings.xxxxl,
        backButtonSpacingXXXL = WidgetToolkitDesignSystem.light().spacings.xxxl,
        backButtonSpacingXSS1 = WidgetToolkitDesignSystem.light().spacings.xss1,
        backButtonWidthSpacingXXXL =
            WidgetToolkitDesignSystem.light().spacings.xxxl,
        backButtonHeightSpacingXXXL =
            WidgetToolkitDesignSystem.light().spacings.xxxl,
        qrScannerMediumWhiteScaffold =
            WidgetToolkitDesignSystem.light().colors.qrScannerMediumWhite,
        qrScannerPageBackgroundColor = WidgetToolkitDesignSystem.light()
            .colors
            .qrScannerPageBackgroundColorWhite,
        qrScannerPageScaffoldBackgroundColor = WidgetToolkitDesignSystem.light()
            .colors
            .qrScannerPageScaffoldBackgroundColorWhite,
        qrScannerPageAppBarBackgroundColor = WidgetToolkitDesignSystem.light()
            .colors
            .qrScannerPageAppBarBackgroundColorWhite,
        appBarBackgroundColor =
            WidgetToolkitDesignSystem.light().colors.appBarColorWhite,
        backButtonTransparentColor =
            WidgetToolkitDesignSystem.light().colors.backButtonTransparentColor,
        backButtonColorMediumWhite =
            WidgetToolkitDesignSystem.light().colors.mediumWhite,
        appBarTextColor =
            WidgetToolkitDesignSystem.light().colors.appBarTextColorGrey,
        backButtonIconColor = WidgetToolkitDesignSystem.light().colors.black,
        backButtonIconBorderColor =
            WidgetToolkitDesignSystem.light().colors.black,
        captionBold = WidgetToolkitDesignSystem.light().typography.captionBold,
        descriptionThin =
            WidgetToolkitDesignSystem.light().typography.descriptionThin,
        titleBold = WidgetToolkitDesignSystem.light().typography.titleBold,
        appBarTextStyle =
            WidgetToolkitDesignSystem.light().typography.descriptionBold,
        cameraIcon = WidgetToolkitDesignSystem.dark().icons.camera,
        closeIcon = WidgetToolkitDesignSystem.dark().icons.qrScanCloseIcon,
        qrScanAreaIcon =
            const SvgFile('packages/widget_toolkit_qr/icons/qr-scan-area.svg'),
        backButtonCloseIcon = WidgetToolkitDesignSystem.dark().icons.closeIcon,
        backButtonArrowLeft = WidgetToolkitDesignSystem.dark().icons.arrowLeft,
        qrScannerCameraPermissionBorderColor =
            _HexColor(_qrFrameBlueLightColorHex),
        linearProgressIndicatorBackgroundColor =
            _HexColor(_qrFrameBlueLightColorHex),
        qrScannerTextColor = _HexColor(_qrFrameBlueColorHex),
        linearProgressIndicatorColor = _HexColor(_qrFrameBlueColorHex);

  QrScannerTheme.dark()
      : cameraPermissionPadding = EdgeInsets.symmetric(
          horizontal: WidgetToolkitDesignSystem.dark().spacings.m,
        ),
        cameraPermissionBorderPadding = EdgeInsets.only(
          top: WidgetToolkitDesignSystem.dark().spacings.xs,
          bottom: WidgetToolkitDesignSystem.dark().spacings.m,
        ),
        cameraPermissionContentPadding = EdgeInsets.all(
          WidgetToolkitDesignSystem.dark().spacings.m,
        ),
        cameraPermissionIconPadding = EdgeInsets.only(
          right: WidgetToolkitDesignSystem.dark().spacings.m,
        ),
        cameraPermissionTitlePadding = EdgeInsets.only(
          bottom: WidgetToolkitDesignSystem.dark().spacings.xs,
        ),
        qrScannerComponentPadding = EdgeInsets.only(
          left: WidgetToolkitDesignSystem.dark().spacings.xxxl,
          right: WidgetToolkitDesignSystem.dark().spacings.xxxl,
        ),
        qrScannerCameraPadding =
            EdgeInsets.all(WidgetToolkitDesignSystem.dark().spacings.xss),
        qrScannerProgressIndicatorPadding = EdgeInsets.only(
          left: WidgetToolkitDesignSystem.dark().spacings.m,
          right: WidgetToolkitDesignSystem.dark().spacings.m,
          bottom: WidgetToolkitDesignSystem.dark().spacings.xxxl,
        ),
        qrScannerSubtitlePadding = EdgeInsets.only(
            top: WidgetToolkitDesignSystem.light().spacings.xs1),
        backButtonMarginEdgeInsets = EdgeInsets.only(
          left: WidgetToolkitDesignSystem.dark().spacings.xs,
        ),
        backButtonPaddingEdgeInsets = EdgeInsets.only(
          left: WidgetToolkitDesignSystem.dark().spacings.xs,
        ),
        backButtonContainerPaddingEdgeInsets =
            EdgeInsets.all(WidgetToolkitDesignSystem.dark().spacings.xss1),
        mockQrViewSpacing = WidgetToolkitDesignSystem.dark().spacings.m,
        qrScannerPageXS = WidgetToolkitDesignSystem.dark().spacings.xs,
        linearProgressIndicatorDefaultMinHeight =
            WidgetToolkitDesignSystem.dark().spacings.xs,
        qrScannerPageM = WidgetToolkitDesignSystem.dark().spacings.m,
        backButtonSpacingL = WidgetToolkitDesignSystem.dark().spacings.l,
        appBarSpacingM = WidgetToolkitDesignSystem.dark().spacings.m,
        appBarSpacingXXXXL = WidgetToolkitDesignSystem.dark().spacings.xxxxl,
        backButtonSpacingXXXL = WidgetToolkitDesignSystem.dark().spacings.xxxl,
        backButtonSpacingXSS1 = WidgetToolkitDesignSystem.dark().spacings.xss1,
        backButtonWidthSpacingXXXL =
            WidgetToolkitDesignSystem.dark().spacings.xxxl,
        backButtonHeightSpacingXXXL =
            WidgetToolkitDesignSystem.dark().spacings.xxxl,
        qrScannerMediumWhiteScaffold =
            WidgetToolkitDesignSystem.dark().colors.qrScannerMediumWhite,
        qrScannerPageBackgroundColor = WidgetToolkitDesignSystem.dark()
            .colors
            .qrScannerPageBackgroundColor,
        qrScannerPageScaffoldBackgroundColor = WidgetToolkitDesignSystem.dark()
            .colors
            .qrScannerPageBackgroundColor,
        qrScannerPageAppBarBackgroundColor = WidgetToolkitDesignSystem.dark()
            .colors
            .qrScannerPageAppBarBackgroundColorGrey,
        appBarBackgroundColor =
            WidgetToolkitDesignSystem.dark().colors.appBarColorGrey,
        backButtonTransparentColor =
            WidgetToolkitDesignSystem.dark().colors.backButtonTransparentColor,
        backButtonColorMediumWhite =
            WidgetToolkitDesignSystem.dark().colors.mediumWhite,
        appBarTextColor =
            WidgetToolkitDesignSystem.dark().colors.appBarTextColorWhite,
        backButtonIconColor = WidgetToolkitDesignSystem.dark().colors.white,
        backButtonIconBorderColor =
            WidgetToolkitDesignSystem.dark().colors.white,
        captionBold = WidgetToolkitDesignSystem.dark().typography.captionBold,
        descriptionThin =
            WidgetToolkitDesignSystem.dark().typography.descriptionThin,
        titleBold = WidgetToolkitDesignSystem.dark().typography.titleBold,
        appBarTextStyle =
            WidgetToolkitDesignSystem.light().typography.descriptionBold,
        cameraIcon = WidgetToolkitDesignSystem.light().icons.camera,
        closeIcon = WidgetToolkitDesignSystem.light().icons.qrScanCloseIcon,
        qrScanAreaIcon =
            const SvgFile('packages/widget_toolkit_qr/icons/qr-scan-area.svg'),
        backButtonCloseIcon = WidgetToolkitDesignSystem.light().icons.closeIcon,
        backButtonArrowLeft = WidgetToolkitDesignSystem.light().icons.arrowLeft,
        qrScannerCameraPermissionBorderColor =
            _HexColor(_qrFrameBlueLightColorHex),
        linearProgressIndicatorBackgroundColor =
            _HexColor(_qrFrameBlueLightColorHex),
        qrScannerTextColor = _HexColor(_qrFrameBlueColorHex),
        linearProgressIndicatorColor = _HexColor(_qrFrameBlueColorHex);

  /// endregion

  static const _qrFrameBlueColorHex = '004F95';
  static const _qrFrameBlueLightColorHex = 'e6e7ff';

  @override
  final EdgeInsets qrScannerSubtitlePadding;
  @override
  final EdgeInsets backButtonMarginEdgeInsets;
  @override
  final EdgeInsets backButtonPaddingEdgeInsets;
  @override
  final EdgeInsets backButtonContainerPaddingEdgeInsets;

  @override
  final double mockQrViewSpacing;
  @override
  final double qrScannerPageXS;
  @override
  final double linearProgressIndicatorDefaultMinHeight;
  @override
  final double qrScannerPageM;
  @override
  final double backButtonSpacingL;
  @override
  final double appBarSpacingM;
  @override
  final double appBarSpacingXXXXL;
  @override
  final double backButtonSpacingXXXL;
  @override
  final double backButtonSpacingXSS1;
  @override
  final double backButtonWidthSpacingXXXL;
  @override
  final double backButtonHeightSpacingXXXL;

  @override
  final Color qrScannerMediumWhiteScaffold;
  @override
  final Color qrScannerPageBackgroundColor;
  @override
  final Color qrScannerPageScaffoldBackgroundColor;
  @override
  final Color qrScannerPageAppBarBackgroundColor;
  @override
  final Color appBarBackgroundColor;
  @override
  final Color backButtonTransparentColor;
  @override
  final Color backButtonColorMediumWhite;
  @override
  final Color appBarTextColor;
  @override
  final Color backButtonIconColor;
  @override
  final Color backButtonIconBorderColor;

  @override
  final Color qrScannerTextColor;
  @override
  final Color linearProgressIndicatorColor;
  @override
  final Color qrScannerCameraPermissionBorderColor;
  @override
  final Color linearProgressIndicatorBackgroundColor;

  @override
  final TextStyle captionBold;
  @override
  final TextStyle descriptionThin;
  @override
  final TextStyle titleBold;
  @override
  final TextStyle appBarTextStyle;

  @override
  final SvgFile cameraIcon;
  @override
  final SvgFile closeIcon;
  @override
  final SvgFile backButtonCloseIcon;
  @override
  final SvgFile qrScanAreaIcon;
  @override
  final SvgFile backButtonArrowLeft;

  @override
  final EdgeInsets cameraPermissionPadding;
  @override
  final EdgeInsets cameraPermissionBorderPadding;
  @override
  final EdgeInsets cameraPermissionContentPadding;
  @override
  final EdgeInsets cameraPermissionIconPadding;
  @override
  final EdgeInsets cameraPermissionTitlePadding;

  @override
  final EdgeInsets qrScannerComponentPadding;
  @override
  final EdgeInsets qrScannerCameraPadding;
  @override
  final EdgeInsets qrScannerProgressIndicatorPadding;
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

class _HexColor extends Color {
  _HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    var hex = hexColor.toUpperCase().replaceAll('#', '');
    if (hex.length == 6) hex = 'FF$hex';
    return int.parse(hex, radix: 16);
  }
}
