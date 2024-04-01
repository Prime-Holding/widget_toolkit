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
    required this.editAddressWidgetSpacingXS,
    required this.addressWidgetSpacingXS,
    required this.spacingS,
    required this.spacingL,
    required this.spacingXL,
    required this.spacingXXL,
    required this.spacingXXXL,
    required this.captionBold,
    required this.descriptionThin,
    required this.titleBold,
    required this.white,
    required this.black,
    required this.editAddressWidgetColor,
    required this.mediumWhite,
    required this.green,
    required this.blue,
    required this.editAddressPageBackgroundColor,
    required this.permanentAddressBlueLightColor,
    required this.disabledFilledButtonBackgroundColor,
    required this.editAddressWidgetHighlightTransparent,
    required this.editAddressWidgetSplashTransparent,
    required this.editAddressPageOuterMostPadding,
    required this.editAddressPageOnAddressSavedPadding,
    required this.editAddressPageErrorPanelPadding,
    required this.permanentAddressPadding1,
    required this.permanentAddressPadding2,
    required this.permanentAddressPadding3,
    required this.permanentAddressPadding4,
    required this.editAddressWidgetPadding1,
    required this.editAddressWidgetPadding2,
    required this.editAddressWidgetPadding3,
    required this.editAddressWidgetPadding4,
    required this.editPenIcon,
    required this.infoCircleIcon,
  });

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
  final Color white;
  @override
  final Color black;
  @override
  final Color editAddressWidgetColor;
  @override
  final Color mediumWhite;
  @override
  final Color green;
  @override
  final Color blue;
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
  final EdgeInsets permanentAddressPadding1;
  @override
  final EdgeInsets permanentAddressPadding2;
  @override
  final EdgeInsets permanentAddressPadding3;
  @override
  final EdgeInsets permanentAddressPadding4;
  @override
  final EdgeInsets editAddressWidgetPadding1;
  @override
  final EdgeInsets editAddressWidgetPadding2;
  @override
  final EdgeInsets editAddressWidgetPadding3;
  @override
  final EdgeInsets editAddressWidgetPadding4;

  @override
  final SvgFile editPenIcon;
  @override
  final SvgFile infoCircleIcon;

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
        white = WidgetToolkitDesignSystem.light().colors.editAddressWhite,
        black = WidgetToolkitDesignSystem.light().colors.editAddressBlack,
        editAddressWidgetColor =
            WidgetToolkitDesignSystem.light().colors.editAddressMediumWhite,
        mediumWhite =
            WidgetToolkitDesignSystem.light().colors.editAddressMediumWhite,
        green = WidgetToolkitDesignSystem.light().colors.editAddressGreen,
        blue = WidgetToolkitDesignSystem.light().colors.editAddressBlue,
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
        permanentAddressPadding1 = EdgeInsets.zero,
        permanentAddressPadding2 = EdgeInsets.only(
          top: WidgetToolkitDesignSystem.light().spacings.xl1,
        ),
        permanentAddressPadding3 = EdgeInsets.only(
          left: WidgetToolkitDesignSystem.light().spacings.m,
          right: WidgetToolkitDesignSystem.light().spacings.m,
          top: WidgetToolkitDesignSystem.light().spacings.l,
          bottom: WidgetToolkitDesignSystem.light().spacings.l,
        ),
        permanentAddressPadding4 = EdgeInsets.only(
          bottom: WidgetToolkitDesignSystem.light().spacings.m,
        ),
        editAddressWidgetPadding1 = EdgeInsets.only(
            bottom: WidgetToolkitDesignSystem.light().spacings.s),
        editAddressWidgetPadding2 = EdgeInsets.symmetric(
          vertical: WidgetToolkitDesignSystem.light().spacings.s,
          horizontal: WidgetToolkitDesignSystem.light().spacings.m,
        ),
        editAddressWidgetPadding3 = EdgeInsets.only(
          top: WidgetToolkitDesignSystem.light().spacings.xss,
          bottom: WidgetToolkitDesignSystem.light().spacings.xss,
        ),
        editAddressWidgetPadding4 =
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
        white = WidgetToolkitDesignSystem.dark().colors.editAddressWhite,
        black = WidgetToolkitDesignSystem.dark().colors.editAddressBlack,
        editAddressWidgetColor =
            WidgetToolkitDesignSystem.dark().colors.editAddressMediumWhite,
        mediumWhite =
            WidgetToolkitDesignSystem.dark().colors.editAddressMediumWhite,
        green = WidgetToolkitDesignSystem.dark().colors.editAddressGreen,
        blue = WidgetToolkitDesignSystem.dark().colors.editAddressBlue,
        editAddressPageBackgroundColor =
            WidgetToolkitDesignSystem.dark().colors.white,
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
        permanentAddressPadding1 = EdgeInsets.zero,
        permanentAddressPadding2 = EdgeInsets.only(
          top: WidgetToolkitDesignSystem.dark().spacings.xl1,
        ),
        permanentAddressPadding3 = EdgeInsets.only(
          left: WidgetToolkitDesignSystem.dark().spacings.m,
          right: WidgetToolkitDesignSystem.dark().spacings.m,
          top: WidgetToolkitDesignSystem.dark().spacings.l,
          bottom: WidgetToolkitDesignSystem.dark().spacings.l,
        ),
        permanentAddressPadding4 = EdgeInsets.only(
          bottom: WidgetToolkitDesignSystem.dark().spacings.m,
        ),
        editAddressWidgetPadding1 = EdgeInsets.only(
            bottom: WidgetToolkitDesignSystem.dark().spacings.s),
        editAddressWidgetPadding2 = EdgeInsets.symmetric(
          vertical: WidgetToolkitDesignSystem.dark().spacings.s,
          horizontal: WidgetToolkitDesignSystem.dark().spacings.m,
        ),
        editAddressWidgetPadding3 = EdgeInsets.only(
          top: WidgetToolkitDesignSystem.dark().spacings.xss,
          bottom: WidgetToolkitDesignSystem.dark().spacings.xss,
        ),
        editAddressWidgetPadding4 =
            EdgeInsets.only(left: WidgetToolkitDesignSystem.dark().spacings.s),
        editPenIcon = WidgetToolkitDesignSystem.light().icons.editPenIcon,
        infoCircleIcon = WidgetToolkitDesignSystem.light().icons.infoCircleIcon;

  /// endregion
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
