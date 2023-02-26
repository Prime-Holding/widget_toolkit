import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../asset_classes.dart';
import '../../base/theme/design_system/design_system.dart';

part 'edit_address_theme.tailor.dart';

@Tailor(themeGetter: ThemeGetter.none)
class _$EditAddressTheme {
  /// region spacings
  static List<double> spacingM = [
    DesignSystem.light().spacings.m,
    DesignSystem.dark().spacings.m,
  ];
  static List<double> spacingXSS = [
    DesignSystem.light().spacings.xss,
    DesignSystem.dark().spacings.xss,
  ];

  static List<double> spacingXS = [
    DesignSystem.light().spacings.xs,
    DesignSystem.dark().spacings.xs,
  ];

  static List<double> editAddressWidgetSpacingXS = spacingXS;

  static List<double> addressWidgetSpacingXS = spacingXS;

  static List<double> spacingS = [
    DesignSystem.light().spacings.s,
    DesignSystem.dark().spacings.s,
  ];
  static List<double> spacingL = [
    DesignSystem.light().spacings.l,
    DesignSystem.dark().spacings.l,
  ];

  static List<double> spacingXL = [
    DesignSystem.light().spacings.xl,
    DesignSystem.dark().spacings.xl,
  ];

  static List<double> spacingXXL = [
    DesignSystem.light().spacings.xxl,
    DesignSystem.dark().spacings.xxl,
  ];

  static List<double> spacingXXXL = [
    DesignSystem.light().spacings.xxxl,
    DesignSystem.dark().spacings.xxxl,
  ];

  ///endregion
  /// region TextStyle
  static List<TextStyle> captionBold = [
    DesignSystem.light().typography.captionBold,
    DesignSystem.dark().typography.captionBold,
  ];
  static List<TextStyle> descriptionThin = [
    DesignSystem.light().typography.descriptionThin,
    DesignSystem.dark().typography.descriptionThin,
  ];
  static List<TextStyle> titleBold = [
    DesignSystem.light().typography.titleBold,
    DesignSystem.dark().typography.titleBold,
  ];

  /// endregion
  ///region Color
  static List<Color> white = [
    DesignSystem.light().colors.editAddressWhite,
    DesignSystem.dark().colors.editAddressWhite,
  ];
  static List<Color> black = [
    DesignSystem.light().colors.editAddressBlack,
    DesignSystem.dark().colors.editAddressBlack,
  ];

  static List<Color> editAddressWidgetColor = [
    DesignSystem.light().colors.editAddressMediumWhite,
    DesignSystem.dark().colors.editAddressWidget,
  ];

  static List<Color> mediumWhite = [
    DesignSystem.light().colors.editAddressMediumWhite,
    DesignSystem.dark().colors.editAddressMediumWhite,
  ];
  static List<Color> green = [
    DesignSystem.light().colors.editAddressGreen,
    DesignSystem.dark().colors.editAddressGreen,
  ];

  static List<Color> blue = [
    DesignSystem.light().colors.editAddressBlue,
    DesignSystem.dark().colors.editAddressBlue,
  ];

  static List<Color> editAddressPageBackgroundColor = [
    DesignSystem.light().colors.white,
    DesignSystem.dark().colors.editAddressBackground,
  ];

  static List<Color> permanentAddressBlueLightColor = [
    DesignSystem.light().colors.permanentAddressBlueLight,
    DesignSystem.dark().colors.permanentAddressBlueLight,
  ];

  static List<Color> disabledFilledButtonBackgroundColor = [
    DesignSystem.light()
        .colors
        .permanentAddressDisabledFilledButtonBackgroundColor,
    DesignSystem.dark()
        .colors
        .permanentAddressDisabledFilledButtonBackgroundColor,
  ];

  static List<Color> editAddressWidgetHighlightTransparent = [
    DesignSystem.light().colors.editAddressWidgetHighlightColor,
    DesignSystem.dark().colors.editAddressWidgetHighlightColor,
  ];

  static List<Color> editAddressWidgetSplashTransparent = [
    DesignSystem.light().colors.editAddressWidgetSplashColor,
    DesignSystem.dark().colors.editAddressWidgetSplashColor,
  ];

  /// endregion
  ///region EdgeInsets
  static List<EdgeInsets> editAddressPageOuterMostPadding = [
    EdgeInsets.symmetric(
      vertical: DesignSystem.light().spacings.s2,
      horizontal: DesignSystem.light().spacings.m,
    ),
    EdgeInsets.symmetric(
      vertical: DesignSystem.dark().spacings.s2,
      horizontal: DesignSystem.dark().spacings.m,
    ),
  ];

  static List<EdgeInsets> editAddressPageOnAddressSavedPadding = [
    EdgeInsets.only(
        left: DesignSystem.light().spacings.xs,
        bottom: DesignSystem.light().spacings.xxl),
    EdgeInsets.only(
        left: DesignSystem.dark().spacings.xs,
        bottom: DesignSystem.dark().spacings.xxl),
  ];

  static List<EdgeInsets> editAddressPageErrorPanelPadding = [
    EdgeInsets.only(
      bottom: DesignSystem.light().spacings.m,
    ),
    EdgeInsets.only(
      bottom: DesignSystem.dark().spacings.m,
    ),
  ];

  static List<EdgeInsets> permanentAddressPadding1 = [
    EdgeInsets.only(
      left: DesignSystem.light().spacings.m,
      top: DesignSystem.light().spacings.s1,
      right: DesignSystem.light().spacings.m,
      bottom: DesignSystem.light().spacings.l,
    ),
    EdgeInsets.only(
      left: DesignSystem.light().spacings.m,
      top: DesignSystem.light().spacings.s1,
      right: DesignSystem.light().spacings.m,
      bottom: DesignSystem.light().spacings.l,
    )
  ];

  static List<EdgeInsets> permanentAddressPadding2 = [
    EdgeInsets.only(
      top: DesignSystem.light().spacings.xl1,
    ),
    EdgeInsets.only(
      top: DesignSystem.dark().spacings.xl1,
    )
  ];

  static List<EdgeInsets> permanentAddressPadding3 = [
    EdgeInsets.only(
      left: DesignSystem.light().spacings.m,
      right: DesignSystem.light().spacings.m,
      top: DesignSystem.light().spacings.l,
      bottom: DesignSystem.light().spacings.l,
    ),
    EdgeInsets.only(
      left: DesignSystem.dark().spacings.m,
      right: DesignSystem.dark().spacings.m,
      top: DesignSystem.dark().spacings.l,
      bottom: DesignSystem.dark().spacings.l,
    ),
  ];

  static List<EdgeInsets> permanentAddressPadding4 = [
    EdgeInsets.only(
      bottom: DesignSystem.light().spacings.m,
    ),
    EdgeInsets.only(
      bottom: DesignSystem.dark().spacings.m,
    ),
  ];

  static List<EdgeInsets> editAddressWidgetPadding1 = [
    EdgeInsets.only(bottom: DesignSystem.light().spacings.s),
    EdgeInsets.only(bottom: DesignSystem.dark().spacings.s),
  ];

  static List<EdgeInsets> editAddressWidgetPadding2 = [
    EdgeInsets.symmetric(
      vertical: DesignSystem.light().spacings.s,
      horizontal: DesignSystem.light().spacings.m,
    ),
    EdgeInsets.symmetric(
      vertical: DesignSystem.dark().spacings.s,
      horizontal: DesignSystem.dark().spacings.m,
    ),
  ];

  static List<EdgeInsets> editAddressWidgetPadding3 = [
    EdgeInsets.only(
      top: DesignSystem.light().spacings.xss,
      bottom: DesignSystem.light().spacings.xss,
    ),
    EdgeInsets.only(
      top: DesignSystem.dark().spacings.xss,
      bottom: DesignSystem.dark().spacings.xss,
    ),
  ];

  static List<EdgeInsets> editAddressWidgetPadding4 = [
    EdgeInsets.only(left: DesignSystem.light().spacings.s),
    EdgeInsets.only(left: DesignSystem.dark().spacings.s),
  ];

  /// endregion
  /// region Icons
  static List<SvgFile> editPenIcon = [
    DesignSystem.dark().icons.editPenIcon,
    DesignSystem.light().icons.editPenIcon,
  ];

  static List<SvgFile> infoCircleIcon = [
    DesignSystem.dark().icons.infoCircleIcon,
    DesignSystem.light().icons.infoCircleIcon,
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
