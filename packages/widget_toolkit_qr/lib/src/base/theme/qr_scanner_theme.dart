import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:widget_toolkit/widget_toolkit.dart';

part 'qr_scanner_theme.tailor.dart';

@TailorMixinComponent()
/// Theme extension for visual tokens used by the QR scanner package and by host apps
/// that wrap the scanner in a full-screen flow. [QrScannerComponent] in
/// `lib/src/lib_qr_scanner/views/qr_scanner_component.dart` drives camera preview
/// padding, the scan-area overlay asset, loading bar placement, and progress
/// indicator corner radius. The permission experience surfaced through
/// showAppCameraPermissionBottomSheet is implemented in `camera_permission.dart`,
/// where sheet paddings, the bordered info card, typography, iconography, and accent
/// text color pull from these tokens. [PrimeLinearProgressIndicator] in
/// `prime_linear_progress_indicator.dart` supplies default progress colors and bar
/// height from the same extension. Golden and widget tests compose synthetic scanner
/// pages with [QrScannerTheme] through
/// `test/lib_qr_scanner/factory/qr_scanner_page_factory.dart`, covering scaffold and
/// page background colors plus outer component padding. Toolbar, spacing, subtitle,
/// navigation, and mock-layout tokens mirror Widget Toolkit steps so host screens stay
/// visually aligned while composing QR flows with one theme surface that supports
/// [ThemeExtension.copyWith] and [ThemeExtension.lerp]. Register this extension on
/// [ThemeData.extensions] (see package README and `example/lib/main.dart`), then read
/// it through [BuildContext.qrScannerTheme].
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

  /// Top inset for subtitle or helper copy on a full QR flow screen (for example
  /// instructions shown above or below [QrScannerWidget]), keeping subtitle spacing
  /// aligned with [QrScannerTheme.light] and [QrScannerTheme.dark].
  @override
  final EdgeInsets qrScannerSubtitlePadding;

  /// Margin around the tappable region that wraps a leading back or close control on
  /// scanner pages, typically applied to the outer Padding or Container that positions
  /// the control inside an [AppBar] or custom header.
  @override
  final EdgeInsets backButtonMarginEdgeInsets;

  /// Padding inside the icon or label of a scanner back affordance between the widget
  /// boundary and the visible glyph.
  @override
  final EdgeInsets backButtonPaddingEdgeInsets;

  /// Padding for the decorative wrapper around a back button such as a circular or
  /// rounded container larger than the icon itself.
  @override
  final EdgeInsets backButtonContainerPaddingEdgeInsets;

  /// Spacing around a placeholder or mocked QR preview used in tests, demos, or
  /// simulator builds where the live camera is replaced by static content. Host
  /// layouts can reuse the same gap when previewing QR flows without enabling the
  /// camera so mocked surfaces align with golden harness spacing.
  @override
  final double mockQrViewSpacing;

  /// Extra-small layout token from the shared design system (same step as
  /// WidgetToolkitDesignSystem.*.spacings.xs). [QrScannerComponent] passes this radius
  /// into [PrimeLinearProgressIndicator] via [PrimeLinearProgressIndicator.borderRadius],
  /// which rounds the indeterminate loading strip to match the scanner chrome.
  @override
  final double qrScannerPageXS;

  /// Default thickness for the scanner loading bar when callers omit an explicit
  /// minHeight on [PrimeLinearProgressIndicator]. The widget defined in
  /// `prime_linear_progress_indicator.dart` supplies this value whenever the widget is
  /// built without an explicit minHeight, wiring it through to
  /// [LinearProgressIndicator.minHeight].
  @override
  final double linearProgressIndicatorDefaultMinHeight;

  /// Medium spacing token for vertical or horizontal gaps on scanner shells such as
  /// section spacing and standard gutters. Host screens apply this step when
  /// separating [QrScannerWidget] from titles, helper text, or sibling sections so
  /// rhythm stays consistent with Widget Toolkit spacing scales.
  @override
  final double qrScannerPageM;

  /// Large spacing constant from WidgetToolkitDesignSystem.*.spacings.l reserved for
  /// laying out navigation chrome relative to the scanner viewport. Host toolbars and
  /// header rows can rely on this token when positioning leading actions beside titles
  /// above the scanner column.
  @override
  final double backButtonSpacingL;

  /// Medium spacing intended between major app-bar regions such as the title row and
  /// trailing actions. Host [AppBar] layouts reuse this value when aligning QR routes
  /// with Widget Toolkit navigation density.
  @override
  final double appBarSpacingM;

  /// Extra-large spacing for tall app-bar layouts or stacked toolbar rows on scanner
  /// pages. Hosts building multi-line headers above [QrScannerWidget] can adopt this
  /// step for consistent vertical rhythm.
  @override
  final double appBarSpacingXXXXL;

  /// Triple-extra-large spacing used when sizing offsets around prominent back buttons
  /// or large touch targets. Host leading-button gutters or minimum separation from
  /// screen edges can reference this token so spacing matches other Widget Toolkit
  /// flows.
  @override
  final double backButtonSpacingXXXL;

  /// Compact spacing variant from WidgetToolkitDesignSystem.*.spacings.xss1 for tight
  /// padding inside small navigation controls. Host IconButton padding or nested chips
  /// beside the scanner can mirror this step.
  @override
  final double backButtonSpacingXSS1;

  /// Width of square or rounded back-button containers when designers specify a
  /// xxxl-based hit target. Hosts sizing circular backgrounds around
  /// [backButtonArrowLeft] can match this dimension for parity with toolkit navigation
  /// specs.
  @override
  final double backButtonWidthSpacingXXXL;

  /// Height paired with [backButtonWidthSpacingXXXL] for square back buttons so hosts
  /// can keep circular hit targets visually balanced.
  @override
  final double backButtonHeightSpacingXXXL;

  /// Soft off-white surface color for scanner scaffolding such as cards, sheets, or
  /// page bodies, sourced from WidgetToolkitDesignSystem.colors.qrScannerMediumWhite.
  /// Host surfaces adjacent to the scanner can reuse this fill so layered sheets and
  /// body backgrounds stay cohesive.
  @override
  final Color qrScannerMediumWhiteScaffold;

  /// Primary fill behind the scanner content column as the inner container color on
  /// full-screen QR flows. Golden layouts in
  /// `test/lib_qr_scanner/factory/qr_scanner_page_factory.dart` paint the centered
  /// wrapper around [QrScannerComponent] using this color, and production hosts can
  /// adopt it for the column that frames the camera viewport.
  @override
  final Color qrScannerPageBackgroundColor;

  /// Fill used with [Scaffold.backgroundColor] for entire QR scanner routes.
  /// `test/lib_qr_scanner/factory/qr_scanner_page_factory.dart` assigns this color when
  /// assembling golden scaffolding, and production hosts should prefer the same token
  /// so status-bar and edge-to-edge regions stay aligned with scanner mockups.
  @override
  final Color qrScannerPageScaffoldBackgroundColor;

  /// Dedicated app-bar surface color on QR routes when the bar floats or uses a
  /// different elevation than the scaffold body. Host [AppBar] widgets can pair this
  /// with [appBarBackgroundColor] when QR-specific chrome needs a distinct toolbar wash.
  @override
  final Color qrScannerPageAppBarBackgroundColor;

  /// Generic toolbar background aligned with the Widget Toolkit app-bar palette
  /// (appBarColorWhite or appBarColorGrey depending on brightness). Host headers
  /// surrounding [QrScannerWidget] can apply this color to Material banners or
  /// navigation shells outside package widgets.
  @override
  final Color appBarBackgroundColor;

  /// Fully transparent color used where the back control should show only an icon
  /// border without a filled chip, mapping to backButtonTransparentColor from the
  /// design system. Host outlined navigation icons can draw borders against this
  /// surface instead of an opaque chip.
  @override
  final Color backButtonTransparentColor;

  /// Secondary surface fill for outlined back buttons using the mediumWhite token.
  /// Host circular buttons wrapping [backButtonArrowLeft] can use this fill when
  /// designers specify a soft neutral chip behind the glyph.
  @override
  final Color backButtonColorMediumWhite;

  /// Toolbar title and action icon tint on QR screens, resolving to
  /// appBarTextColorGrey or appBarTextColorWhite per brightness. Host [AppBar.title]
  /// and icon widgets should reuse this tint alongside [appBarTextStyle].
  @override
  final Color appBarTextColor;

  /// Glyph tint for back and navigation icons on standard QR chrome where lighter
  /// backgrounds pair with darker glyphs (and dark themes invert accordingly). Host
  /// Icon widgets displaying [backButtonArrowLeft] can adopt this color for parity with
  /// toolkit defaults.
  @override
  final Color backButtonIconColor;

  /// Stroke color for bordered circular back buttons when outlines wrap navigation
  /// glyphs. Host CircularOutlinedButton-style visuals can pair this stroke with
  /// [backButtonTransparentColor] or [backButtonColorMediumWhite].
  @override
  final Color backButtonIconBorderColor;

  /// Accent color applied to the permission headline together with [captionBold].
  /// `camera_permission.dart` applies [captionBold] with copyWith so the headline
  /// adopts this accent color when inviting camera access.
  @override
  final Color qrScannerTextColor;

  /// Foreground or value color for [PrimeLinearProgressIndicator] when callers do not
  /// override color. `prime_linear_progress_indicator.dart` falls back to this shade
  /// whenever callers omit an explicit color, and both factory constructors map it from
  /// brand blue encoded as _qrFrameBlueColorHex (004F95).
  @override
  final Color linearProgressIndicatorColor;

  /// Stroke for the bordered informational card shown before granting camera access.
  /// `camera_permission.dart` strokes the permission explainer card with Border.all
  /// using this color aligned with _qrFrameBlueLightColorHex (e6e7ff).
  @override
  final Color qrScannerCameraPermissionBorderColor;

  /// Track color behind the determinate or indeterminate progress indicator when
  /// callers omit backgroundColor. `prime_linear_progress_indicator.dart` paints the
  /// indicator track with this light blue whenever callers omit backgroundColor,
  /// matching _qrFrameBlueLightColorHex (e6e7ff).
  @override
  final Color linearProgressIndicatorBackgroundColor;

  /// Typography for the permission headline. `camera_permission.dart` combines this
  /// TextStyle with [qrScannerTextColor] when painting the title line that introduces
  /// camera access.
  @override
  final TextStyle captionBold;

  /// Typography for the supporting explanation beneath the headline.
  /// `camera_permission.dart` applies this TextStyle directly to the explanatory
  /// paragraph that elaborates why camera access is needed.
  @override
  final TextStyle descriptionThin;

  /// Bold title style for screen-level headings on QR flows such as a page title
  /// above [QrScannerWidget]. Host shells composing titles outside package widgets can
  /// reuse this style so stacked headings align with permission typography.
  @override
  final TextStyle titleBold;

  /// Preferred style for [AppBar.title] text on QR routes. The [QrScannerTheme.dark]
  /// factory constructor continues taking descriptionBold from the light design system
  /// typography so the toolbar mirrors legacy styling, and hosts can override dark
  /// tokens whenever toolbar contrast needs to diverge.
  @override
  final TextStyle appBarTextStyle;

  /// Camera glyph beside the permission copy. `camera_permission.dart` lays out this
  /// asset inside the bordered row, and the light factory selects icons from the dark
  /// design palette (with the inverse pairing for dark) so the illustration contrasts
  /// against the sheet background.
  @override
  final SvgFile cameraIcon;

  /// Close glyph for QR flows shown alongside blurred modal sheets from widget_toolkit.
  /// Hosts configuring modal headers or standalone dismiss controls can swap this
  /// SvgFile through [QrScannerTheme] for QR-specific artwork while staying compatible
  /// with toolkit blur sheets.
  @override
  final SvgFile closeIcon;

  /// Alternate close glyph tailored for compact toolbar buttons or dense navigation
  /// clusters where the primary closeIcon artwork would appear oversized.
  @override
  final SvgFile backButtonCloseIcon;

  /// SVG overlay drawn above the live preview to highlight the scan window.
  /// [QrScannerComponent] keeps this SVG on top of the preview stack, stretches it
  /// through [SvgFile.copyWith] to the screen dimensions, and preserves framing
  /// relative to the padded preview rectangle.
  @override
  final SvgFile qrScanAreaIcon;

  /// Leading chevron or arrow asset for custom back buttons on QR routes. Host
  /// IconButtons or GestureDetectors implementing pop navigation can render this
  /// vector while applying [backButtonIconColor] and sizing helpers such as
  /// [backButtonWidthSpacingXXXL].
  @override
  final SvgFile backButtonArrowLeft;

  /// Horizontal padding around the entire camera-permission sheet body inside
  /// showBlurredBottomSheet. `camera_permission.dart` applies this inset through the
  /// outermost Padding that wraps the permission widget subtree.
  @override
  final EdgeInsets cameraPermissionPadding;

  /// Padding separating the bordered info card from the gradient primary button.
  /// `camera_permission.dart` wraps the bordered explanation container with Padding
  /// built from this inset ahead of the [GradientFillButton].
  @override
  final EdgeInsets cameraPermissionBorderPadding;

  /// Insets between the card border and its inner row (icon and texts).
  /// `camera_permission.dart` nests Padding built from this inset immediately inside the
  /// bordered decoration so icon and copy breathe away from the stroke.
  @override
  final EdgeInsets cameraPermissionContentPadding;

  /// Space between the camera illustration and the text column inside the card.
  /// `camera_permission.dart` wraps [cameraIcon] with Padding so these insets separate
  /// the glyph from the textual column.
  @override
  final EdgeInsets cameraPermissionIconPadding;

  /// Gap below the permission title before the description paragraph.
  /// `camera_permission.dart` wraps the title Text with Padding so this inset defines
  /// the vertical gap before the description paragraph begins.
  @override
  final EdgeInsets cameraPermissionTitlePadding;

  /// Horizontal inset applied around [QrScannerWidget] or [QrScannerComponent] when
  /// embedded in a page with full-width backgrounds.
  /// `test/lib_qr_scanner/factory/qr_scanner_page_factory.dart` pads [QrScannerComponent]
  /// with this inset while capturing golden screenshots. Host shells should mirror the
  /// same xxxl gutters when reproducing those layouts in production.
  @override
  final EdgeInsets qrScannerComponentPadding;

  /// Inset applied around the [MobileScanner] preview inside the square viewport.
  /// [QrScannerComponent] wraps the permission listeners and camera subtree with
  /// Padding built from this inset so the scan-area SVG overlay lines up with the padded
  /// preview.
  @override
  final EdgeInsets qrScannerCameraPadding;

  /// Offsets the loading indicator below the scanner stack inside the column layout.
  /// [QrScannerComponent] wraps [PrimeLinearProgressIndicator] with Padding built from
  /// this inset and pins the indicator toward the bottom inside that padded region.
  @override
  final EdgeInsets qrScannerProgressIndicatorPadding;
}

extension ThemeContextExtension on BuildContext {
  /// Resolved [QrScannerTheme] from [Theme.of]. Throws [UnimplementedError] if
  /// [QrScannerTheme] was not added to [ThemeData.extensions] (see package README).
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

/// Parses 6-digit RGB hex strings (with or without a hash prefix) into opaque ARGB colors.
class _HexColor extends Color {
  _HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    var hex = hexColor.toUpperCase().replaceAll('#', '');
    if (hex.length == 6) hex = 'FF$hex';
    return int.parse(hex, radix: 16);
  }
}
