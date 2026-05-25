import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../asset_classes.dart';
import '../../base/theme/design_system/widget_toolkit_design_system.dart';

part 'edit_address_theme.tailor.dart';

@TailorMixinComponent()
class EditAddressTheme extends ThemeExtension<EditAddressTheme>
    with _$EditAddressThemeTailorMixin {
  const EditAddressTheme({
    required this.spacingM,
    required this.spacingXSS,
    required this.spacingXS,
    required this.spacingS,
    required this.spacingL,
    required this.spacingXL,
    required this.spacingXXL,
    required this.spacingXXXL,
    required this.editAddressWidgetSpacingXS,
    required this.addressWidgetSpacingXS,
    required this.captionBold,
    required this.descriptionThin,
    required this.titleBold,
    required this.shimmerTextBaseColor,
    required this.editAddressWidgetColor,
    required this.shimmerTextHighlightColor,
    required this.iconColorSecondary,
    required this.iconColorPrimary,
    required this.editAddressPageBackgroundColor,
    required this.permanentAddressBlueLightColor,
    required this.disabledFilledButtonBackgroundColor,
    required this.editAddressWidgetHighlightTransparent,
    required this.editAddressWidgetSplashTransparent,
    required this.editAddressPageOuterMostPadding,
    required this.editAddressPageOnAddressSavedPadding,
    required this.editAddressPageErrorPanelPadding,
    required this.permanentAddressBottomSheetPadding,
    required this.permanentAddressBottomSheetDecorationPadding,
    required this.permanentAddressBottomSheetContentPadding,
    required this.permanentAddressIconPadding,
    required this.editAddressWidgetDecorationPadding,
    required this.editAddressWidgetContentPadding,
    required this.editAddressWidgetShimmerPadding,
    required this.editAddressWidgetIconPadding,
    required this.editPenIcon,
    required this.infoCircleIcon,
  });

  /// region Themes

  EditAddressTheme.light()
      : spacingM = WidgetToolkitDesignSystem.light().spacings.m,
        spacingXSS = WidgetToolkitDesignSystem.light().spacings.xss,
        spacingXS = WidgetToolkitDesignSystem.light().spacings.xs,
        editAddressWidgetSpacingXS =
            WidgetToolkitDesignSystem.light().spacings.xs,
        addressWidgetSpacingXS = WidgetToolkitDesignSystem.light().spacings.xs,
        spacingS = WidgetToolkitDesignSystem.light().spacings.s,
        spacingL = WidgetToolkitDesignSystem.light().spacings.l,
        spacingXL = WidgetToolkitDesignSystem.light().spacings.xl,
        spacingXXL = WidgetToolkitDesignSystem.light().spacings.xxl,
        spacingXXXL = WidgetToolkitDesignSystem.light().spacings.xxxl,
        captionBold = WidgetToolkitDesignSystem.light().typography.captionBold,
        descriptionThin =
            WidgetToolkitDesignSystem.light().typography.descriptionThin,
        titleBold = WidgetToolkitDesignSystem.light().typography.titleBold,
        shimmerTextBaseColor =
            WidgetToolkitDesignSystem.light().colors.editAddressWhite,
        editAddressWidgetColor =
            WidgetToolkitDesignSystem.light().colors.editAddressMediumWhite,
        shimmerTextHighlightColor =
            WidgetToolkitDesignSystem.light().colors.editAddressMediumWhite,
        iconColorSecondary =
            WidgetToolkitDesignSystem.light().colors.editAddressGreen,
        iconColorPrimary =
            WidgetToolkitDesignSystem.light().colors.editAddressBlue,
        editAddressPageBackgroundColor =
            WidgetToolkitDesignSystem.light().colors.white,
        permanentAddressBlueLightColor =
            WidgetToolkitDesignSystem.light().colors.permanentAddressBlueLight,
        disabledFilledButtonBackgroundColor = WidgetToolkitDesignSystem.light()
            .colors
            .permanentAddressDisabledFilledButtonBackgroundColor,
        editAddressWidgetHighlightTransparent =
            WidgetToolkitDesignSystem.light()
                .colors
                .editAddressWidgetHighlightColor,
        editAddressWidgetSplashTransparent = WidgetToolkitDesignSystem.light()
            .colors
            .editAddressWidgetSplashColor,
        editAddressPageOuterMostPadding = EdgeInsets.zero,
        editAddressPageOnAddressSavedPadding = EdgeInsets.only(
            left: WidgetToolkitDesignSystem.light().spacings.xs,
            bottom: WidgetToolkitDesignSystem.light().spacings.xxl),
        editAddressPageErrorPanelPadding = EdgeInsets.only(
          bottom: WidgetToolkitDesignSystem.light().spacings.m,
        ),
        permanentAddressBottomSheetPadding = EdgeInsets.zero,
        permanentAddressBottomSheetDecorationPadding = EdgeInsets.only(
          top: WidgetToolkitDesignSystem.light().spacings.xl1,
        ),
        permanentAddressBottomSheetContentPadding = EdgeInsets.only(
          left: WidgetToolkitDesignSystem.light().spacings.m,
          right: WidgetToolkitDesignSystem.light().spacings.m,
          top: WidgetToolkitDesignSystem.light().spacings.l,
          bottom: WidgetToolkitDesignSystem.light().spacings.l,
        ),
        permanentAddressIconPadding = EdgeInsets.only(
          bottom: WidgetToolkitDesignSystem.light().spacings.m,
        ),
        editAddressWidgetDecorationPadding = EdgeInsets.only(
            bottom: WidgetToolkitDesignSystem.light().spacings.s),
        editAddressWidgetContentPadding = EdgeInsets.symmetric(
          vertical: WidgetToolkitDesignSystem.light().spacings.s,
          horizontal: WidgetToolkitDesignSystem.light().spacings.m,
        ),
        editAddressWidgetShimmerPadding = EdgeInsets.only(
          top: WidgetToolkitDesignSystem.light().spacings.xss,
          bottom: WidgetToolkitDesignSystem.light().spacings.xss,
        ),
        editAddressWidgetIconPadding =
            EdgeInsets.only(left: WidgetToolkitDesignSystem.light().spacings.s),
        editPenIcon = WidgetToolkitDesignSystem.dark().icons.editPenIcon,
        infoCircleIcon = WidgetToolkitDesignSystem.dark().icons.infoCircleIcon;

  EditAddressTheme.dark()
      : spacingM = WidgetToolkitDesignSystem.dark().spacings.m,
        spacingXSS = WidgetToolkitDesignSystem.dark().spacings.xss,
        spacingXS = WidgetToolkitDesignSystem.dark().spacings.xs,
        editAddressWidgetSpacingXS =
            WidgetToolkitDesignSystem.dark().spacings.xs,
        addressWidgetSpacingXS = WidgetToolkitDesignSystem.dark().spacings.xs,
        spacingS = WidgetToolkitDesignSystem.dark().spacings.s,
        spacingL = WidgetToolkitDesignSystem.dark().spacings.l,
        spacingXL = WidgetToolkitDesignSystem.dark().spacings.xl,
        spacingXXL = WidgetToolkitDesignSystem.dark().spacings.xxl,
        spacingXXXL = WidgetToolkitDesignSystem.dark().spacings.xxxl,
        captionBold = WidgetToolkitDesignSystem.dark().typography.captionBold,
        descriptionThin =
            WidgetToolkitDesignSystem.dark().typography.descriptionThin,
        titleBold = WidgetToolkitDesignSystem.dark().typography.titleBold,
        shimmerTextBaseColor =
            WidgetToolkitDesignSystem.dark().colors.editAddressWhite,
        editAddressWidgetColor =
            WidgetToolkitDesignSystem.dark().colors.editAddressWidget,
        shimmerTextHighlightColor =
            WidgetToolkitDesignSystem.dark().colors.editAddressMediumWhite,
        iconColorSecondary =
            WidgetToolkitDesignSystem.dark().colors.editAddressGreen,
        iconColorPrimary =
            WidgetToolkitDesignSystem.dark().colors.editAddressBlue,
        editAddressPageBackgroundColor =
            WidgetToolkitDesignSystem.dark().colors.editAddressBackground,
        permanentAddressBlueLightColor =
            WidgetToolkitDesignSystem.dark().colors.permanentAddressBlueLight,
        disabledFilledButtonBackgroundColor = WidgetToolkitDesignSystem.dark()
            .colors
            .permanentAddressDisabledFilledButtonBackgroundColor,
        editAddressWidgetHighlightTransparent = WidgetToolkitDesignSystem.dark()
            .colors
            .editAddressWidgetHighlightColor,
        editAddressWidgetSplashTransparent = WidgetToolkitDesignSystem.dark()
            .colors
            .editAddressWidgetSplashColor,
        editAddressPageOuterMostPadding = EdgeInsets.zero,
        editAddressPageOnAddressSavedPadding = EdgeInsets.only(
            left: WidgetToolkitDesignSystem.dark().spacings.xs,
            bottom: WidgetToolkitDesignSystem.dark().spacings.xxl),
        editAddressPageErrorPanelPadding = EdgeInsets.only(
          bottom: WidgetToolkitDesignSystem.dark().spacings.m,
        ),
        permanentAddressBottomSheetPadding = EdgeInsets.zero,
        permanentAddressBottomSheetDecorationPadding = EdgeInsets.only(
          top: WidgetToolkitDesignSystem.dark().spacings.xl1,
        ),
        permanentAddressBottomSheetContentPadding = EdgeInsets.only(
          left: WidgetToolkitDesignSystem.dark().spacings.m,
          right: WidgetToolkitDesignSystem.dark().spacings.m,
          top: WidgetToolkitDesignSystem.dark().spacings.l,
          bottom: WidgetToolkitDesignSystem.dark().spacings.l,
        ),
        permanentAddressIconPadding = EdgeInsets.only(
          bottom: WidgetToolkitDesignSystem.dark().spacings.m,
        ),
        editAddressWidgetDecorationPadding = EdgeInsets.only(
            bottom: WidgetToolkitDesignSystem.dark().spacings.s),
        editAddressWidgetContentPadding = EdgeInsets.symmetric(
          vertical: WidgetToolkitDesignSystem.dark().spacings.s,
          horizontal: WidgetToolkitDesignSystem.dark().spacings.m,
        ),
        editAddressWidgetShimmerPadding = EdgeInsets.only(
          top: WidgetToolkitDesignSystem.dark().spacings.xss,
          bottom: WidgetToolkitDesignSystem.dark().spacings.xss,
        ),
        editAddressWidgetIconPadding =
            EdgeInsets.only(left: WidgetToolkitDesignSystem.dark().spacings.s),
        editPenIcon = WidgetToolkitDesignSystem.light().icons.editPenIcon,
        infoCircleIcon = WidgetToolkitDesignSystem.light().icons.infoCircleIcon;

  /// endregion

  /// Default medium spacing notch applied between stacked rows and dividers throughout `edit_address_form.dart`.
  @override
  final double spacingM;
  /// Extra-small spacing increment mirrored from [DesignSystemSpacings] so host-built adornments around address rows can stay on the shared modular scale.
  @override
  final double spacingXSS;
  /// Compact horizontal rhythm increment with the same intent as [spacingXSS] for grid alignment next to toolkit tiles.
  @override
  final double spacingXS;
  /// Narrow gap token dedicated to shimmering address tiles inside `edit_address_widget.dart`.
  @override
  final double editAddressWidgetSpacingXS;
  /// Shared tight gap reused when placeholder copy sits beside summaries in `_buildAddressTiles` sequences within `edit_address_widget.dart`.
  @override
  final double addressWidgetSpacingXS;
  /// Small spacing notch from [DesignSystemSpacings.s] intended for supplementary rows hosts mount alongside toolkit lists without re-deriving raw pixel values.
  @override
  final double spacingS;
  /// Large spacing notch from [DesignSystemSpacings.l] intended for supplementary sections padded around the scaffolded flows in this library.
  @override
  final double spacingL;
  /// Extra-large vertical spacer after success messaging on `edit_address_page.dart` when `_buildLanguagesList`-style scaffolding is not loading.
  @override
  final double spacingXL;
  /// Host-facing rhythm notch mapped from [DesignSystemSpacings.xxl] so companion columns rendered next to toolkit pages inherit the same ladder as production widgets.
  @override
  final double spacingXXL;
  /// Square measure sizing circular info glyphs and hero treatments in `permanent_address_bottom_sheet.dart`.
  @override
  final double spacingXXXL;

  /// Caption emphasis for inline labels on address tiles and bottom sheet copy in `edit_address_widget.dart` and `permanent_address_bottom_sheet.dart`.
  @override
  final TextStyle captionBold;
  /// Secondary body style for human-readable address lines while placeholders shimmer in `edit_address_widget.dart`.
  @override
  final TextStyle descriptionThin;
  /// Title style for page chrome on `edit_address_page.dart` and headlines inside `permanent_address_bottom_sheet.dart`.
  @override
  final TextStyle titleBold;

  /// Shimmer base tone for placeholder text while street or city lines resolve inside `edit_address_widget.dart`.
  @override
  final Color shimmerTextBaseColor;
  /// Tile fill and border wash for each `EditAddressWidget` card in `edit_address_widget.dart`.
  @override
  final Color editAddressWidgetColor;
  /// Shimmer highlight that runs across placeholder rows in `edit_address_widget.dart`.
  @override
  final Color shimmerTextHighlightColor;
  /// Icon stroke for status accents resolved through `user_profile_card_types_extension.dart` and secondary affordances.
  @override
  final Color iconColorSecondary;
  /// Primary icon stroke for neutral info moments, including recolored SVG assets in `permanent_address_bottom_sheet.dart` and `edit_address_widget.dart`.
  @override
  final Color iconColorPrimary;
  /// Page backdrop color on `edit_address_page.dart` wrapping the overall editor experience.
  @override
  final Color editAddressPageBackgroundColor;
  /// Lightened blue wash behind permanent-address hero rows within `permanent_address_bottom_sheet.dart`.
  @override
  final Color permanentAddressBlueLightColor;
  /// Fill for disabled primary buttons that confirm address saves when validation blocks progress.
  @override
  final Color disabledFilledButtonBackgroundColor;
  /// Highlight overlay for `EditAddressWidget` ink responses to keep contrast predictable in `edit_address_widget.dart`.
  @override
  final Color editAddressWidgetHighlightTransparent;
  /// Splash overlay for interactive tiles so touches stay subtle on `edit_address_widget.dart`.
  @override
  final Color editAddressWidgetSplashTransparent;

  /// Outermost padding wrapping the scaffold body on `edit_address_page.dart`.
  @override
  final EdgeInsets editAddressPageOuterMostPadding;
  /// Padding pairing the instructional column after saves complete on `edit_address_page.dart`.
  @override
  final EdgeInsets editAddressPageOnAddressSavedPadding;
  /// Bottom inset before error panels butt against sibling content on `edit_address_page.dart`.
  @override
  final EdgeInsets editAddressPageErrorPanelPadding;
  /// Root padding wrapping the draggable sheet scaffold in `permanent_address_bottom_sheet.dart`.
  @override
  final EdgeInsets permanentAddressBottomSheetPadding;
  /// Top inset offsetting sheet grabbers and headings inside `permanent_address_bottom_sheet.dart`.
  @override
  final EdgeInsets permanentAddressBottomSheetDecorationPadding;
  /// Insets framing copy and actions within the draggable surface in `permanent_address_bottom_sheet.dart`.
  @override
  final EdgeInsets permanentAddressBottomSheetContentPadding;
  /// Bottom inset anchoring oversized info icons preceding explanatory text inside `permanent_address_bottom_sheet.dart`.
  @override
  final EdgeInsets permanentAddressIconPadding;
  /// Separator padding beneath tile headers before values begin inside `edit_address_widget.dart`.
  @override
  final EdgeInsets editAddressWidgetDecorationPadding;
  /// Interior padding guarding value text and placeholders within each `edit_address_widget.dart` tile.
  @override
  final EdgeInsets editAddressWidgetContentPadding;
  /// Vertical padding enclosing shimmer bars while placeholders animate in `edit_address_widget.dart`.
  @override
  final EdgeInsets editAddressWidgetShimmerPadding;
  /// Leading inset positioning icons beside stacked labels inside `edit_address_widget.dart`.
  @override
  final EdgeInsets editAddressWidgetIconPadding;

  /// Pencil glyph for editable rows when summaries expose inline edit entry points inside `edit_address_widget.dart`.
  @override
  final SvgFile editPenIcon;
  /// Circular info glyph tinted with [iconColorPrimary] for permanent-address education moments in `permanent_address_bottom_sheet.dart`.
  @override
  final SvgFile infoCircleIcon;
}

extension EditAddressThemeContextExtension on BuildContext {
  /// Returns a reference to the [EditAddressTheme] theme extension of the current [Theme]
  EditAddressTheme get editAddressTheme {
    final theme = Theme.of(this).extension<EditAddressTheme>();
    if (theme == null) {
      throw UnimplementedError(
        'Not Implemented EditAddressTheme. '
        'Please add it as extension to the MaterialApp -> ThemeData',
      );
    }

    return theme;
  }
}
