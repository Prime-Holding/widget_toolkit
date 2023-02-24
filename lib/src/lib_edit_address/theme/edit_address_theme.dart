import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../asset_classes.dart';
import '../../utils/design_system/design_system.dart';

part 'edit_address_theme.tailor.dart';

@Tailor(themeGetter: ThemeGetter.none)
class _$EditAddressTheme {
  /// region spacings
  static List<double> spacingM = [
    PrimeDesignSystem.light().spacings.m,
    PrimeDesignSystem.dark().spacings.m,
  ];
  static List<double> spacingXSS = [
    PrimeDesignSystem.light().spacings.xss,
    PrimeDesignSystem.dark().spacings.xss,
  ];

  static List<double> spacingXS = [
    PrimeDesignSystem.light().spacings.xs,
    PrimeDesignSystem.dark().spacings.xs,
  ];

  static List<double> editAddressWidgetSpacingXS = spacingXS;

  static List<double> addressWidgetSpacingXS = spacingXS;

  static List<double> spacingS = [
    PrimeDesignSystem.light().spacings.s,
    PrimeDesignSystem.dark().spacings.s,
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

  ///endregion
  /// region TextStyle
  static List<TextStyle> captionBold = [
    PrimeDesignSystem.light().typography.captionBold,
    PrimeDesignSystem.dark().typography.captionBold,
  ];
  static List<TextStyle> descriptionThin = [
    PrimeDesignSystem.light().typography.descriptionThin,
    PrimeDesignSystem.dark().typography.descriptionThin,
  ];
  static List<TextStyle> titleBold = [
    PrimeDesignSystem.light().typography.titleBold,
    PrimeDesignSystem.dark().typography.titleBold,
  ];

  /// endregion
  ///region Color
  static List<Color> white = [
    PrimeDesignSystem.light().colors.editAddressWhite,
    PrimeDesignSystem.dark().colors.editAddressWhite,
  ];
  static List<Color> black = [
    PrimeDesignSystem.light().colors.editAddressBlack,
    PrimeDesignSystem.dark().colors.editAddressBlack,
  ];

  static List<Color> editAddressWidgetColor = [
    PrimeDesignSystem.light().colors.editAddressMediumWhite,
    PrimeDesignSystem.dark().colors.editAddressWidget,
  ];

  static List<Color> mediumWhite = [
    PrimeDesignSystem.light().colors.editAddressMediumWhite,
    PrimeDesignSystem.dark().colors.editAddressMediumWhite,
  ];
  static List<Color> green = [
    PrimeDesignSystem.light().colors.editAddressGreen,
    PrimeDesignSystem.dark().colors.editAddressGreen,
  ];

  static List<Color> blue = [
    PrimeDesignSystem.light().colors.editAddressBlue,
    PrimeDesignSystem.dark().colors.editAddressBlue,
  ];

  static List<Color> editAddressPageBackgroundColor = [
    PrimeDesignSystem.light().colors.white,
    PrimeDesignSystem.dark().colors.editAddressBackground,
  ];

  static List<Color> permanentAddressBlueLightColor = [
    PrimeDesignSystem.light().colors.permanentAddressBlueLight,
    PrimeDesignSystem.dark().colors.permanentAddressBlueLight,
  ];

  static List<Color> disabledFilledButtonBackgroundColor = [
    PrimeDesignSystem.light()
        .colors
        .permanentAddressDisabledFilledButtonBackgroundColor,
    PrimeDesignSystem.dark()
        .colors
        .permanentAddressDisabledFilledButtonBackgroundColor,
  ];

  static List<Color> editAddressWidgetHighlightTransparent = [
    PrimeDesignSystem.light().colors.editAddressWidgetHighlightColor,
    PrimeDesignSystem.dark().colors.editAddressWidgetHighlightColor,
  ];

  static List<Color> editAddressWidgetSplashTransparent = [
    PrimeDesignSystem.light().colors.editAddressWidgetSplashColor,
    PrimeDesignSystem.dark().colors.editAddressWidgetSplashColor,
  ];

  /// endregion
  ///region EdgeInsets
  static List<EdgeInsets> editAddressPageOuterMostPadding = [
    EdgeInsets.symmetric(
      vertical: PrimeDesignSystem.light().spacings.s2,
      horizontal: PrimeDesignSystem.light().spacings.m,
    ),
    EdgeInsets.symmetric(
      vertical: PrimeDesignSystem.dark().spacings.s2,
      horizontal: PrimeDesignSystem.dark().spacings.m,
    ),
  ];

  static List<EdgeInsets> editAddressPageOnAddressSavedPadding = [
    EdgeInsets.only(
        left: PrimeDesignSystem.light().spacings.xs,
        bottom: PrimeDesignSystem.light().spacings.xxl),
    EdgeInsets.only(
        left: PrimeDesignSystem.dark().spacings.xs,
        bottom: PrimeDesignSystem.dark().spacings.xxl),
  ];

  static List<EdgeInsets> editAddressPageErrorPanelPadding = [
    EdgeInsets.only(
      bottom: PrimeDesignSystem.light().spacings.m,
    ),
    EdgeInsets.only(
      bottom: PrimeDesignSystem.dark().spacings.m,
    ),
  ];

  static List<EdgeInsets> permanentAddressPadding1 = [
    EdgeInsets.only(
      left: PrimeDesignSystem.light().spacings.m,
      top: PrimeDesignSystem.light().spacings.s1,
      right: PrimeDesignSystem.light().spacings.m,
      bottom: PrimeDesignSystem.light().spacings.l,
    ),
    EdgeInsets.only(
      left: PrimeDesignSystem.light().spacings.m,
      top: PrimeDesignSystem.light().spacings.s1,
      right: PrimeDesignSystem.light().spacings.m,
      bottom: PrimeDesignSystem.light().spacings.l,
    )
  ];

  static List<EdgeInsets> permanentAddressPadding2 = [
    EdgeInsets.only(
      top: PrimeDesignSystem.light().spacings.xl1,
    ),
    EdgeInsets.only(
      top: PrimeDesignSystem.dark().spacings.xl1,
    )
  ];

  static List<EdgeInsets> permanentAddressPadding3 = [
    EdgeInsets.only(
      left: PrimeDesignSystem.light().spacings.m,
      right: PrimeDesignSystem.light().spacings.m,
      top: PrimeDesignSystem.light().spacings.l,
      bottom: PrimeDesignSystem.light().spacings.l,
    ),
    EdgeInsets.only(
      left: PrimeDesignSystem.dark().spacings.m,
      right: PrimeDesignSystem.dark().spacings.m,
      top: PrimeDesignSystem.dark().spacings.l,
      bottom: PrimeDesignSystem.dark().spacings.l,
    ),
  ];

  static List<EdgeInsets> permanentAddressPadding4 = [
    EdgeInsets.only(
      bottom: PrimeDesignSystem.light().spacings.m,
    ),
    EdgeInsets.only(
      bottom: PrimeDesignSystem.dark().spacings.m,
    ),
  ];

  static List<EdgeInsets> editAddressWidgetPadding1 = [
    EdgeInsets.only(bottom: PrimeDesignSystem.light().spacings.s),
    EdgeInsets.only(bottom: PrimeDesignSystem.dark().spacings.s),
  ];

  static List<EdgeInsets> editAddressWidgetPadding2 = [
    EdgeInsets.symmetric(
      vertical: PrimeDesignSystem.light().spacings.s,
      horizontal: PrimeDesignSystem.light().spacings.m,
    ),
    EdgeInsets.symmetric(
      vertical: PrimeDesignSystem.dark().spacings.s,
      horizontal: PrimeDesignSystem.dark().spacings.m,
    ),
  ];

  static List<EdgeInsets> editAddressWidgetPadding3 = [
    EdgeInsets.only(
      top: PrimeDesignSystem.light().spacings.xss,
      bottom: PrimeDesignSystem.light().spacings.xss,
    ),
    EdgeInsets.only(
      top: PrimeDesignSystem.dark().spacings.xss,
      bottom: PrimeDesignSystem.dark().spacings.xss,
    ),
  ];

  static List<EdgeInsets> editAddressWidgetPadding4 = [
    EdgeInsets.only(left: PrimeDesignSystem.light().spacings.s),
    EdgeInsets.only(left: PrimeDesignSystem.dark().spacings.s),
  ];

  /// endregion
  /// region Icons
  static List<SvgFile> editPenIcon = [
    PrimeDesignSystem.dark().icons.editPenIcon,
    PrimeDesignSystem.light().icons.editPenIcon,
  ];

  static List<SvgFile> infoCircleIcon = [
    PrimeDesignSystem.dark().icons.infoCircleIcon,
    PrimeDesignSystem.light().icons.infoCircleIcon,
  ];

  /// endregion
}

extension TextFieldDialogThemeContextExtension on BuildContext {
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
