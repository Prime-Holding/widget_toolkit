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
            WidgetToolkitDesignSystem.dark().colors.editAddressMediumWhite,
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

  @override
  final double spacingM;
  @override
  final double spacingXSS;
  @override
  final double spacingXS;
  @override
  final double editAddressWidgetSpacingXS;
  @override
  final double addressWidgetSpacingXS;
  @override
  final double spacingS;
  @override
  final double spacingL;
  @override
  final double spacingXL;
  @override
  final double spacingXXL;
  @override
  final double spacingXXXL;

  @override
  final TextStyle captionBold;
  @override
  final TextStyle descriptionThin;
  @override
  final TextStyle titleBold;

  @override
  final Color shimmerTextBaseColor;
  @override
  final Color editAddressWidgetColor;
  @override
  final Color shimmerTextHighlightColor;
  @override
  final Color iconColorSecondary;
  @override
  final Color iconColorPrimary;
  @override
  final Color editAddressPageBackgroundColor;
  @override
  final Color permanentAddressBlueLightColor;
  @override
  final Color disabledFilledButtonBackgroundColor;
  @override
  final Color editAddressWidgetHighlightTransparent;
  @override
  final Color editAddressWidgetSplashTransparent;

  @override
  final EdgeInsets editAddressPageOuterMostPadding;
  @override
  final EdgeInsets editAddressPageOnAddressSavedPadding;
  @override
  final EdgeInsets editAddressPageErrorPanelPadding;
  @override
  final EdgeInsets permanentAddressBottomSheetPadding;
  @override
  final EdgeInsets permanentAddressBottomSheetDecorationPadding;
  @override
  final EdgeInsets permanentAddressBottomSheetContentPadding;
  @override
  final EdgeInsets permanentAddressIconPadding;
  @override
  final EdgeInsets editAddressWidgetDecorationPadding;
  @override
  final EdgeInsets editAddressWidgetContentPadding;
  @override
  final EdgeInsets editAddressWidgetShimmerPadding;
  @override
  final EdgeInsets editAddressWidgetIconPadding;

  @override
  final SvgFile editPenIcon;
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
