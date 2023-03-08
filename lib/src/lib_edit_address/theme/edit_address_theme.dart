import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../asset_classes.dart';
import '../../base/theme/design_system/widget_toolkit_design_system.dart';

part 'edit_address_theme.tailor.dart';

@Tailor(themeGetter: ThemeGetter.none)
class _$EditAddressTheme {
  /// region spacings
  static List<double> spacingM = [
    WidgetToolkitDesignSystem.light().spacings.m,
    WidgetToolkitDesignSystem.dark().spacings.m,
  ];
  static List<double> spacingXSS = [
    WidgetToolkitDesignSystem.light().spacings.xss,
    WidgetToolkitDesignSystem.dark().spacings.xss,
  ];

  static List<double> spacingXS = [
    WidgetToolkitDesignSystem.light().spacings.xs,
    WidgetToolkitDesignSystem.dark().spacings.xs,
  ];

  static List<double> editAddressWidgetSpacingXS = spacingXS;

  static List<double> addressWidgetSpacingXS = spacingXS;

  static List<double> spacingS = [
    WidgetToolkitDesignSystem.light().spacings.s,
    WidgetToolkitDesignSystem.dark().spacings.s,
  ];
  static List<double> spacingL = [
    WidgetToolkitDesignSystem.light().spacings.l,
    WidgetToolkitDesignSystem.dark().spacings.l,
  ];

  static List<double> spacingXL = [
    WidgetToolkitDesignSystem.light().spacings.xl,
    WidgetToolkitDesignSystem.dark().spacings.xl,
  ];

  static List<double> spacingXXL = [
    WidgetToolkitDesignSystem.light().spacings.xxl,
    WidgetToolkitDesignSystem.dark().spacings.xxl,
  ];

  static List<double> spacingXXXL = [
    WidgetToolkitDesignSystem.light().spacings.xxxl,
    WidgetToolkitDesignSystem.dark().spacings.xxxl,
  ];

  ///endregion
  /// region TextStyle
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

  /// endregion
  ///region Color
  static List<Color> white = [
    WidgetToolkitDesignSystem.light().colors.editAddressWhite,
    WidgetToolkitDesignSystem.dark().colors.editAddressWhite,
  ];
  static List<Color> black = [
    WidgetToolkitDesignSystem.light().colors.editAddressBlack,
    WidgetToolkitDesignSystem.dark().colors.editAddressBlack,
  ];

  static List<Color> editAddressWidgetColor = [
    WidgetToolkitDesignSystem.light().colors.editAddressMediumWhite,
    WidgetToolkitDesignSystem.dark().colors.editAddressWidget,
  ];

  static List<Color> mediumWhite = [
    WidgetToolkitDesignSystem.light().colors.editAddressMediumWhite,
    WidgetToolkitDesignSystem.dark().colors.editAddressMediumWhite,
  ];
  static List<Color> green = [
    WidgetToolkitDesignSystem.light().colors.editAddressGreen,
    WidgetToolkitDesignSystem.dark().colors.editAddressGreen,
  ];

  static List<Color> blue = [
    WidgetToolkitDesignSystem.light().colors.editAddressBlue,
    WidgetToolkitDesignSystem.dark().colors.editAddressBlue,
  ];

  static List<Color> editAddressPageBackgroundColor = [
    WidgetToolkitDesignSystem.light().colors.white,
    WidgetToolkitDesignSystem.dark().colors.editAddressBackground,
  ];

  static List<Color> permanentAddressBlueLightColor = [
    WidgetToolkitDesignSystem.light().colors.permanentAddressBlueLight,
    WidgetToolkitDesignSystem.dark().colors.permanentAddressBlueLight,
  ];

  static List<Color> disabledFilledButtonBackgroundColor = [
    WidgetToolkitDesignSystem.light()
        .colors
        .permanentAddressDisabledFilledButtonBackgroundColor,
    WidgetToolkitDesignSystem.dark()
        .colors
        .permanentAddressDisabledFilledButtonBackgroundColor,
  ];

  static List<Color> editAddressWidgetHighlightTransparent = [
    WidgetToolkitDesignSystem.light().colors.editAddressWidgetHighlightColor,
    WidgetToolkitDesignSystem.dark().colors.editAddressWidgetHighlightColor,
  ];

  static List<Color> editAddressWidgetSplashTransparent = [
    WidgetToolkitDesignSystem.light().colors.editAddressWidgetSplashColor,
    WidgetToolkitDesignSystem.dark().colors.editAddressWidgetSplashColor,
  ];

  /// endregion
  ///region EdgeInsets
  static List<EdgeInsets> editAddressPageOuterMostPadding = [
    EdgeInsets.symmetric(
      vertical: WidgetToolkitDesignSystem.light().spacings.s2,
      horizontal: WidgetToolkitDesignSystem.light().spacings.m,
    ),
    EdgeInsets.symmetric(
      vertical: WidgetToolkitDesignSystem.dark().spacings.s2,
      horizontal: WidgetToolkitDesignSystem.dark().spacings.m,
    ),
  ];

  static List<EdgeInsets> editAddressPageOnAddressSavedPadding = [
    EdgeInsets.only(
        left: WidgetToolkitDesignSystem.light().spacings.xs,
        bottom: WidgetToolkitDesignSystem.light().spacings.xxl),
    EdgeInsets.only(
        left: WidgetToolkitDesignSystem.dark().spacings.xs,
        bottom: WidgetToolkitDesignSystem.dark().spacings.xxl),
  ];

  static List<EdgeInsets> editAddressPageErrorPanelPadding = [
    EdgeInsets.only(
      bottom: WidgetToolkitDesignSystem.light().spacings.m,
    ),
    EdgeInsets.only(
      bottom: WidgetToolkitDesignSystem.dark().spacings.m,
    ),
  ];

  static List<EdgeInsets> permanentAddressPadding1 = [
    EdgeInsets.only(
      left: WidgetToolkitDesignSystem.light().spacings.m,
      top: WidgetToolkitDesignSystem.light().spacings.s1,
      right: WidgetToolkitDesignSystem.light().spacings.m,
      bottom: WidgetToolkitDesignSystem.light().spacings.l,
    ),
    EdgeInsets.only(
      left: WidgetToolkitDesignSystem.light().spacings.m,
      top: WidgetToolkitDesignSystem.light().spacings.s1,
      right: WidgetToolkitDesignSystem.light().spacings.m,
      bottom: WidgetToolkitDesignSystem.light().spacings.l,
    )
  ];

  static List<EdgeInsets> permanentAddressPadding2 = [
    EdgeInsets.only(
      top: WidgetToolkitDesignSystem.light().spacings.xl1,
    ),
    EdgeInsets.only(
      top: WidgetToolkitDesignSystem.dark().spacings.xl1,
    )
  ];

  static List<EdgeInsets> permanentAddressPadding3 = [
    EdgeInsets.only(
      left: WidgetToolkitDesignSystem.light().spacings.m,
      right: WidgetToolkitDesignSystem.light().spacings.m,
      top: WidgetToolkitDesignSystem.light().spacings.l,
      bottom: WidgetToolkitDesignSystem.light().spacings.l,
    ),
    EdgeInsets.only(
      left: WidgetToolkitDesignSystem.dark().spacings.m,
      right: WidgetToolkitDesignSystem.dark().spacings.m,
      top: WidgetToolkitDesignSystem.dark().spacings.l,
      bottom: WidgetToolkitDesignSystem.dark().spacings.l,
    ),
  ];

  static List<EdgeInsets> permanentAddressPadding4 = [
    EdgeInsets.only(
      bottom: WidgetToolkitDesignSystem.light().spacings.m,
    ),
    EdgeInsets.only(
      bottom: WidgetToolkitDesignSystem.dark().spacings.m,
    ),
  ];

  static List<EdgeInsets> editAddressWidgetPadding1 = [
    EdgeInsets.only(bottom: WidgetToolkitDesignSystem.light().spacings.s),
    EdgeInsets.only(bottom: WidgetToolkitDesignSystem.dark().spacings.s),
  ];

  static List<EdgeInsets> editAddressWidgetPadding2 = [
    EdgeInsets.symmetric(
      vertical: WidgetToolkitDesignSystem.light().spacings.s,
      horizontal: WidgetToolkitDesignSystem.light().spacings.m,
    ),
    EdgeInsets.symmetric(
      vertical: WidgetToolkitDesignSystem.dark().spacings.s,
      horizontal: WidgetToolkitDesignSystem.dark().spacings.m,
    ),
  ];

  static List<EdgeInsets> editAddressWidgetPadding3 = [
    EdgeInsets.only(
      top: WidgetToolkitDesignSystem.light().spacings.xss,
      bottom: WidgetToolkitDesignSystem.light().spacings.xss,
    ),
    EdgeInsets.only(
      top: WidgetToolkitDesignSystem.dark().spacings.xss,
      bottom: WidgetToolkitDesignSystem.dark().spacings.xss,
    ),
  ];

  static List<EdgeInsets> editAddressWidgetPadding4 = [
    EdgeInsets.only(left: WidgetToolkitDesignSystem.light().spacings.s),
    EdgeInsets.only(left: WidgetToolkitDesignSystem.dark().spacings.s),
  ];

  /// endregion
  /// region Icons
  static List<SvgFile> editPenIcon = [
    WidgetToolkitDesignSystem.dark().icons.editPenIcon,
    WidgetToolkitDesignSystem.light().icons.editPenIcon,
  ];

  static List<SvgFile> infoCircleIcon = [
    WidgetToolkitDesignSystem.dark().icons.infoCircleIcon,
    WidgetToolkitDesignSystem.light().icons.infoCircleIcon,
  ];

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
