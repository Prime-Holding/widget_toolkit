import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../asset_classes.dart';
import '../../base/theme/design_system/design_system.dart';

part 'text_field_dialog_theme.tailor.dart';

@Tailor(themeGetter: ThemeGetter.none)
class _$TextFieldDialogTheme {
  //TODO: The properties of the theme extension should be almost always specific just like in the example below.
  // The colors, sizes etc from design system should be used to fill in the values (take for reference PrimeComponentsTheme, ItemPickerTheme, SearchPickerTheme).

  /// region PrimeEditFieldWidget
  static List<Color> primeEditFieldSuccessBackground = [
    DesignSystem.light().colors.greenLight,
    DesignSystem.dark().colors.green,
  ];

  static List<Color> primeEditFieldRegularBackground = [
    DesignSystem.light().colors.mediumWhite,
    DesignSystem.dark().colors.primeEditFieldWidget,
  ];

  static List<double> primeEditFieldBorderRadius = [
    DesignSystem.light().spacings.xss,
    DesignSystem.light().spacings.xss,
  ];

  /// endregion

  ///  region PrimeInputTextField
  static List<Color> primeInputTextFieldSuccessBackground = [
    DesignSystem.light().colors.greenLight,
    DesignSystem.dark().colors.green,
  ];

  static List<Color> primeInputTextFieldRegularBackground = [
    DesignSystem.light().colors.mediumWhite,
    DesignSystem.dark().colors.darkGray,
  ];

  ///  endregion

  /// region PrimeLabelBoxWidget
  static List<Color> primeLabelBoxOptionalBackground = [
    DesignSystem.light().colors.white,
    DesignSystem.dark().colors.darkGray,
  ];

  static List<Color> primeLabelBoxFilledBackground = [
    DesignSystem.light().colors.mediumWhite,
    DesignSystem.dark().colors.darkGray,
  ];

  /// endregion

  /// region spacings
  static List<double> spacingXS = [
    DesignSystem.light().spacings.xs,
    DesignSystem.dark().spacings.xs,
  ];

  static List<double> spacingXSS = [
    DesignSystem.light().spacings.xss,
    DesignSystem.dark().spacings.xss,
  ];
  static List<double> spacingS = [
    DesignSystem.light().spacings.s,
    DesignSystem.dark().spacings.s,
  ];

  static List<double> spacingM = [
    DesignSystem.light().spacings.m,
    DesignSystem.dark().spacings.m,
  ];
  static List<double> spacingL = [
    DesignSystem.light().spacings.l,
    DesignSystem.dark().spacings.l,
  ];

  static List<double> spacingXL = [
    DesignSystem.light().spacings.xl,
    DesignSystem.dark().spacings.xl,
  ];
  static List<double> spacingXXXS = [
    DesignSystem.light().spacings.xxxs,
    DesignSystem.dark().spacings.xxxs,
  ];

  ///endregion
  /// region TextStyle
  static List<TextStyle> descriptionThin = [
    DesignSystem.light().typography.descriptionThin,
    DesignSystem.dark().typography.descriptionThin,
  ];

  static List<TextStyle> titleBold = [
    DesignSystem.light().typography.titleBold,
    DesignSystem.dark().typography.titleBold,
  ];

  static List<TextStyle> descriptionBold = [
    DesignSystem.light().typography.descriptionBold,
    DesignSystem.dark().typography.descriptionBold,
  ];

  static List<TextStyle> captionBold = [
    DesignSystem.light().typography.captionBold,
    DesignSystem.dark().typography.captionBold,
  ];

  static List<TextStyle> smallThin = [
    DesignSystem.light().typography.smallThin,
    DesignSystem.dark().typography.smallThin,
  ];

  ///endregion

  ///region Color
  static List<Color> black = [
    DesignSystem.light().colors.textFieldDialogBlack,
    DesignSystem.dark().colors.textFieldDialogBlack,
  ];

  static List<Color> defaultWhite = [
    DesignSystem.light().colors.white,
    DesignSystem.dark().colors.white,
  ];

  static List<Color> white = [
    DesignSystem.light().colors.textFieldDialogWhite,
    DesignSystem.dark().colors.textFieldDialogWhite,
  ];

  static List<Color> blue = [
    DesignSystem.light().colors.darkBlue,
    DesignSystem.dark().colors.blue,
  ];

  static List<Color> disabledFilledButtonBackgroundColor = [
    DesignSystem.light().colors.disabledFilledButtonBackgroundColor,
    DesignSystem.dark().colors.disabledFilledButtonBackgroundColor,
  ];

  static List<Color> gradientRedEnd = [
    DesignSystem.light().colors.gradientRedEnd,
    DesignSystem.dark().colors.gradientRedEnd,
  ];

  static List<Color> mediumWhite = [
    DesignSystem.light().colors.lightGray,
    DesignSystem.dark().colors.lightGray,
  ];

  static List<Color> gray = [
    DesignSystem.light().colors.gray,
    DesignSystem.dark().colors.gray,
  ];

  static List<Color> green = [
    DesignSystem.light().colors.darkGreen,
    DesignSystem.dark().colors.darkGreen,
  ];

  static List<Color> redLight = [
    DesignSystem.light().colors.lightRed,
    DesignSystem.dark().colors.lightRed,
  ];

  static List<Color> orangeLight = [
    DesignSystem.light().colors.orangeLight,
    DesignSystem.dark().colors.orangeLight,
  ];

  static List<Color> orange = [
    DesignSystem.light().colors.orange,
    DesignSystem.dark().colors.orange,
  ];

  static List<Color> transparent = [
    DesignSystem.light().colors.textFieldDialogTransparent,
    DesignSystem.dark().colors.textFieldDialogTransparent,
  ];

  static List<Color> greenLight = [
    DesignSystem.light().colors.greenLight,
    DesignSystem.dark().colors.greenLight,
  ];

  static List<Color> red = [
    DesignSystem.light().colors.red,
    DesignSystem.dark().colors.red,
  ];

  static List<Color> mediumBlack = [
    DesignSystem.light().colors.mediumBlack,
    DesignSystem.dark().colors.mediumBlack,
  ];

  ///endregion

  ///region SvgFile
  static List<SvgFile> closeIcon = [
    DesignSystem.dark().icons.closeIcon,
    DesignSystem.light().icons.closeIcon,
  ];

  static List<SvgFile> dangerIcon = [
    DesignSystem.dark().icons.dangerIcon,
    DesignSystem.light().icons.dangerIcon,
  ];

  static List<SvgFile> addIcon = [
    DesignSystem.dark().icons.addIcon,
    DesignSystem.light().icons.addIcon,
  ];

  static List<SvgFile> addDisabledIcon = [
    DesignSystem.dark().icons.addDisabledIcon,
    DesignSystem.light().icons.addDisabledIcon,
  ];

  static List<SvgFile> arrowRightSquareIcon = [
    DesignSystem.dark().icons.arrowRightSquareIcon,
    DesignSystem.light().icons.arrowRightSquareIcon,
  ];

  static List<SvgFile> editPenIcon = [
    DesignSystem.dark().icons.editPenIcon,
    DesignSystem.light().icons.editPenIcon,
  ];

  static List<SvgFile> infoCircleIcon = [
    DesignSystem.dark().icons.infoCircleIcon,
    DesignSystem.light().icons.infoCircleIcon,
  ];

  static List<SvgFile> loadingIcon = [
    DesignSystem.dark().icons.loadingIcon,
    DesignSystem.light().icons.loadingIcon,
  ];

  static List<SvgFile> tickCircleSuccessIcon = [
    DesignSystem.dark().icons.tickCircleSuccessIcon,
    DesignSystem.light().icons.tickCircleSuccessIcon,
  ];

  ///endregion
  ///region EdgeInsets

  static List<EdgeInsets> textFieldDialog2 = [
    EdgeInsets.only(
      bottom: DesignSystem.light().spacings.xs1,
      top: DesignSystem.light().spacings.l,
      left: DesignSystem.light().spacings.m,
      right: DesignSystem.light().spacings.m,
    ),
    EdgeInsets.only(
      bottom: DesignSystem.dark().spacings.xs1,
      top: DesignSystem.dark().spacings.l,
      left: DesignSystem.dark().spacings.m,
      right: DesignSystem.dark().spacings.m,
    ),
  ];

  static List<EdgeInsets> textFieldDialog4 = [
    EdgeInsets.only(
      top: DesignSystem.light().spacings.xl,
      bottom: DesignSystem.light().spacings.xxxxs,
    ),
    EdgeInsets.only(
      top: DesignSystem.light().spacings.xl,
      bottom: DesignSystem.light().spacings.xxxxs,
    ),
  ];

  static List<EdgeInsets> textFieldDialog3 = [
    EdgeInsets.only(
      left: DesignSystem.light().spacings.xs,
      bottom: DesignSystem.light().spacings.m,
    ),
    EdgeInsets.only(
      left: DesignSystem.dark().spacings.xs,
      bottom: DesignSystem.dark().spacings.m,
    )
  ];

  static List<EdgeInsets> appLabeledBoxWidgetPadding1 = [
    EdgeInsets.symmetric(
      vertical: DesignSystem.light().spacings.m,
      horizontal: DesignSystem.light().spacings.s,
    ),
    EdgeInsets.symmetric(
      vertical: DesignSystem.dark().spacings.m,
      horizontal: DesignSystem.dark().spacings.s,
    )
  ];

  static List<EdgeInsets> appLabeledBoxWidgetPadding2 = [
    EdgeInsets.only(right: DesignSystem.dark().spacings.xs),
    EdgeInsets.only(right: DesignSystem.dark().spacings.xs)
  ];

  static List<EdgeInsets> appLabeledBoxWidgetPadding3 = [
    EdgeInsets.only(right: DesignSystem.light().spacings.m),
    EdgeInsets.only(right: DesignSystem.dark().spacings.m)
  ];

  static List<EdgeInsets> appInputTextFieldPadding1 = [
    EdgeInsets.only(
      left: DesignSystem.light().spacings.m,
      top: DesignSystem.light().spacings.xxxs,
    ),
    EdgeInsets.only(
      left: DesignSystem.dark().spacings.m,
      top: DesignSystem.dark().spacings.xxxs,
    )
  ];
  static List<EdgeInsets> appInputTextFieldPadding2 = [
    EdgeInsets.only(right: DesignSystem.light().spacings.xs),
    EdgeInsets.only(right: DesignSystem.dark().spacings.xs)
  ];

  static List<EdgeInsets> appInputTextFieldPadding3 = [
    EdgeInsets.only(right: DesignSystem.light().spacings.xs),
    EdgeInsets.only(right: DesignSystem.dark().spacings.xs)
  ];

  static List<EdgeInsets> appInputTextFieldPaddingLoading = [
    EdgeInsets.only(right: DesignSystem.light().spacings.s),
    EdgeInsets.only(right: DesignSystem.dark().spacings.s)
  ];

  static List<EdgeInsets> appInputTextFieldPaddingSuccess = [
    EdgeInsets.only(right: DesignSystem.light().spacings.s),
    EdgeInsets.only(right: DesignSystem.dark().spacings.s)
  ];

  static List<EdgeInsets> appInputTextFieldPaddingWarning = [
    EdgeInsets.only(right: DesignSystem.light().spacings.s),
    EdgeInsets.only(right: DesignSystem.dark().spacings.s)
  ];

  static List<EdgeInsets> appInputTextFieldPaddingError = [
    EdgeInsets.only(right: DesignSystem.light().spacings.s),
    EdgeInsets.only(right: DesignSystem.dark().spacings.s)
  ];

  ///endregion
}

extension TextFieldDialogThemeContextExtension on BuildContext {
  /// Returns a reference to the [TextFieldDialogTheme] theme extension of the current [Theme]
  TextFieldDialogTheme get textFieldDialogTheme {
    final theme = Theme.of(this).extension<TextFieldDialogTheme>();
    if (theme == null) {
      throw UnimplementedError(
        'Not Implemented TextFieldDialogTheme. '
        'Please add it as extension to the MaterialApp -> ThemeData',
      );
    }

    return theme;
  }
}
