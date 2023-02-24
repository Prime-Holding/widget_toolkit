import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../asset_classes.dart';
import '../../utils/design_system/design_system.dart';

part 'text_field_dialog_theme.tailor.dart';

@Tailor(themeGetter: ThemeGetter.none)
class _$TextFieldDialogTheme {
  //TODO: The properties of the theme extension should be almost always specific just like in the example below.
  // The colors, sizes etc from design system should be used to fill in the values (take for reference PrimeComponentsTheme, ItemPickerTheme, SearchPickerTheme).

  /// region PrimeEditFieldWidget
  static List<Color> primeEditFieldSuccessBackground = [
    PrimeDesignSystem.light().colors.greenLight,
    PrimeDesignSystem.dark().colors.green,
  ];

  static List<Color> primeEditFieldRegularBackground = [
    PrimeDesignSystem.light().colors.mediumWhite,
    PrimeDesignSystem.dark().colors.primeEditFieldWidget,
  ];

  static List<double> primeEditFieldBorderRadius = [
    PrimeDesignSystem.light().spacings.xss,
    PrimeDesignSystem.light().spacings.xss,
  ];

  /// endregion

  ///  region PrimeInputTextField
  static List<Color> primeInputTextFieldSuccessBackground = [
    PrimeDesignSystem.light().colors.greenLight,
    PrimeDesignSystem.dark().colors.green,
  ];

  static List<Color> primeInputTextFieldRegularBackground = [
    PrimeDesignSystem.light().colors.mediumWhite,
    PrimeDesignSystem.dark().colors.darkGray,
  ];
  ///  endregion

  /// region PrimeLabelBoxWidget
  static List<Color> primeLabelBoxOptionalBackground = [
    PrimeDesignSystem.light().colors.white,
    PrimeDesignSystem.dark().colors.darkGray,
  ];

  static List<Color> primeLabelBoxFilledBackground = [
    PrimeDesignSystem.light().colors.mediumWhite,
    PrimeDesignSystem.dark().colors.darkGray,
  ];

  /// endregion

  /// region spacings
  static List<double> spacingXS = [
    PrimeDesignSystem.light().spacings.xs,
    PrimeDesignSystem.dark().spacings.xs,
  ];

  static List<double> spacingXSS = [
    PrimeDesignSystem.light().spacings.xss,
    PrimeDesignSystem.dark().spacings.xss,
  ];
  static List<double> spacingS = [
    PrimeDesignSystem.light().spacings.s,
    PrimeDesignSystem.dark().spacings.s,
  ];

  static List<double> spacingM = [
    PrimeDesignSystem.light().spacings.m,
    PrimeDesignSystem.dark().spacings.m,
  ];
  static List<double> spacingL = [
    PrimeDesignSystem.light().spacings.l,
    PrimeDesignSystem.dark().spacings.l,
  ];

  static List<double> spacingXL = [
    PrimeDesignSystem.light().spacings.xl,
    PrimeDesignSystem.dark().spacings.xl,
  ];
  static List<double> spacingXXXS = [
    PrimeDesignSystem.light().spacings.xxxs,
    PrimeDesignSystem.dark().spacings.xxxs,
  ];

  ///endregion
  /// region TextStyle
  static List<TextStyle> descriptionThin = [
    PrimeDesignSystem.light().typography.descriptionThin,
    PrimeDesignSystem.dark().typography.descriptionThin,
  ];

  static List<TextStyle> titleBold = [
    PrimeDesignSystem.light().typography.titleBold,
    PrimeDesignSystem.dark().typography.titleBold,
  ];

  static List<TextStyle> descriptionBold = [
    PrimeDesignSystem.light().typography.descriptionBold,
    PrimeDesignSystem.dark().typography.descriptionBold,
  ];

  static List<TextStyle> captionBold = [
    PrimeDesignSystem.light().typography.captionBold,
    PrimeDesignSystem.dark().typography.captionBold,
  ];

  static List<TextStyle> smallThin = [
    PrimeDesignSystem.light().typography.smallThin,
    PrimeDesignSystem.dark().typography.smallThin,
  ];

  ///endregion

  ///region Color
  static List<Color> black = [
    PrimeDesignSystem.light().colors.textFieldDialogBlack,
    PrimeDesignSystem.dark().colors.textFieldDialogBlack,
  ];

  static List<Color> defaultWhite = [
    PrimeDesignSystem.light().colors.white,
    PrimeDesignSystem.dark().colors.white,
  ];

  static List<Color> white = [
    PrimeDesignSystem.light().colors.textFieldDialogWhite,
    PrimeDesignSystem.dark().colors.textFieldDialogWhite,
  ];

  static List<Color> blue = [
    PrimeDesignSystem.light().colors.darkBlue,
    PrimeDesignSystem.dark().colors.blue,
  ];

  static List<Color> disabledFilledButtonBackgroundColor = [
    PrimeDesignSystem.light().colors.disabledFilledButtonBackgroundColor,
    PrimeDesignSystem.dark().colors.disabledFilledButtonBackgroundColor,
  ];

  static List<Color> gradientRedEnd = [
    PrimeDesignSystem.light().colors.gradientRedEnd,
    PrimeDesignSystem.dark().colors.gradientRedEnd,
  ];

  static List<Color> mediumWhite = [
    PrimeDesignSystem.light().colors.lightGray,
    PrimeDesignSystem.dark().colors.lightGray,
  ];

  static List<Color> gray = [
    PrimeDesignSystem.light().colors.gray,
    PrimeDesignSystem.dark().colors.gray,
  ];

  static List<Color> green = [
    PrimeDesignSystem.light().colors.darkGreen,
    PrimeDesignSystem.dark().colors.darkGreen,
  ];

  static List<Color> redLight = [
    PrimeDesignSystem.light().colors.lightRed,
    PrimeDesignSystem.dark().colors.lightRed,
  ];

  static List<Color> orangeLight = [
    PrimeDesignSystem.light().colors.orangeLight,
    PrimeDesignSystem.dark().colors.orangeLight,
  ];

  static List<Color> orange = [
    PrimeDesignSystem.light().colors.orange,
    PrimeDesignSystem.dark().colors.orange,
  ];

  static List<Color> transparent = [
    PrimeDesignSystem.light().colors.textFieldDialogTransparent,
    PrimeDesignSystem.dark().colors.textFieldDialogTransparent,
  ];

  static List<Color> greenLight = [
    PrimeDesignSystem.light().colors.greenLight,
    PrimeDesignSystem.dark().colors.greenLight,
  ];

  static List<Color> red = [
    PrimeDesignSystem.light().colors.red,
    PrimeDesignSystem.dark().colors.red,
  ];

  static List<Color> mediumBlack = [
    PrimeDesignSystem.light().colors.mediumBlack,
    PrimeDesignSystem.dark().colors.mediumBlack,
  ];

  ///endregion

  ///region SvgFile
  static List<SvgFile> closeIcon = [
    PrimeDesignSystem.dark().icons.closeIcon,
    PrimeDesignSystem.light().icons.closeIcon,
  ];

  static List<SvgFile> dangerIcon = [
    PrimeDesignSystem.dark().icons.dangerIcon,
    PrimeDesignSystem.light().icons.dangerIcon,
  ];

  static List<SvgFile> addIcon = [
    PrimeDesignSystem.dark().icons.addIcon,
    PrimeDesignSystem.light().icons.addIcon,
  ];

  static List<SvgFile> addDisabledIcon = [
    PrimeDesignSystem.dark().icons.addDisabledIcon,
    PrimeDesignSystem.light().icons.addDisabledIcon,
  ];

  static List<SvgFile> arrowRightSquareIcon = [
    PrimeDesignSystem.dark().icons.arrowRightSquareIcon,
    PrimeDesignSystem.light().icons.arrowRightSquareIcon,
  ];

  static List<SvgFile> editPenIcon = [
    PrimeDesignSystem.dark().icons.editPenIcon,
    PrimeDesignSystem.light().icons.editPenIcon,
  ];

  static List<SvgFile> infoCircleIcon = [
    PrimeDesignSystem.dark().icons.infoCircleIcon,
    PrimeDesignSystem.light().icons.infoCircleIcon,
  ];

  static List<SvgFile> loadingIcon = [
    PrimeDesignSystem.dark().icons.loadingIcon,
    PrimeDesignSystem.light().icons.loadingIcon,
  ];

  static List<SvgFile> tickCircleSuccessIcon = [
    PrimeDesignSystem.dark().icons.tickCircleSuccessIcon,
    PrimeDesignSystem.light().icons.tickCircleSuccessIcon,
  ];

  ///endregion
  ///region EdgeInsets

  static List<EdgeInsets> textFieldDialog2 = [
    EdgeInsets.only(
      bottom: PrimeDesignSystem.light().spacings.xs1,
      top: PrimeDesignSystem.light().spacings.l,
      left: PrimeDesignSystem.light().spacings.m,
      right: PrimeDesignSystem.light().spacings.m,
    ),
    EdgeInsets.only(
      bottom: PrimeDesignSystem.dark().spacings.xs1,
      top: PrimeDesignSystem.dark().spacings.l,
      left: PrimeDesignSystem.dark().spacings.m,
      right: PrimeDesignSystem.dark().spacings.m,
    ),
  ];

  static List<EdgeInsets> textFieldDialog4 = [
    EdgeInsets.only(
      top: PrimeDesignSystem.light().spacings.xl,
      bottom: PrimeDesignSystem.light().spacings.xxxxs,
    ),
    EdgeInsets.only(
      top: PrimeDesignSystem.light().spacings.xl,
      bottom: PrimeDesignSystem.light().spacings.xxxxs,
    ),
  ];

  static List<EdgeInsets> textFieldDialog3 = [
    EdgeInsets.only(
      left: PrimeDesignSystem.light().spacings.xs,
      bottom: PrimeDesignSystem.light().spacings.m,
    ),
    EdgeInsets.only(
      left: PrimeDesignSystem.dark().spacings.xs,
      bottom: PrimeDesignSystem.dark().spacings.m,
    )
  ];

  static List<EdgeInsets> appLabeledBoxWidgetPadding1 = [
    EdgeInsets.symmetric(
      vertical: PrimeDesignSystem.light().spacings.m,
      horizontal: PrimeDesignSystem.light().spacings.s,
    ),
    EdgeInsets.symmetric(
      vertical: PrimeDesignSystem.dark().spacings.m,
      horizontal: PrimeDesignSystem.dark().spacings.s,
    )
  ];

  static List<EdgeInsets> appLabeledBoxWidgetPadding2 = [
    EdgeInsets.only(right: PrimeDesignSystem.dark().spacings.xs),
    EdgeInsets.only(right: PrimeDesignSystem.dark().spacings.xs)
  ];

  static List<EdgeInsets> appLabeledBoxWidgetPadding3 = [
    EdgeInsets.only(right: PrimeDesignSystem.light().spacings.m),
    EdgeInsets.only(right: PrimeDesignSystem.dark().spacings.m)
  ];

  static List<EdgeInsets> appInputTextFieldPadding1 = [
    EdgeInsets.only(
      left: PrimeDesignSystem.light().spacings.m,
      top: PrimeDesignSystem.light().spacings.xxxs,
    ),
    EdgeInsets.only(
      left: PrimeDesignSystem.dark().spacings.m,
      top: PrimeDesignSystem.dark().spacings.xxxs,
    )
  ];
  static List<EdgeInsets> appInputTextFieldPadding2 = [
    EdgeInsets.only(right: PrimeDesignSystem.light().spacings.xs),
    EdgeInsets.only(right: PrimeDesignSystem.dark().spacings.xs)
  ];

  static List<EdgeInsets> appInputTextFieldPadding3 = [
    EdgeInsets.only(right: PrimeDesignSystem.light().spacings.xs),
    EdgeInsets.only(right: PrimeDesignSystem.dark().spacings.xs)
  ];

  static List<EdgeInsets> appInputTextFieldPaddingLoading = [
    EdgeInsets.only(right: PrimeDesignSystem.light().spacings.s),
    EdgeInsets.only(right: PrimeDesignSystem.dark().spacings.s)
  ];

  static List<EdgeInsets> appInputTextFieldPaddingSuccess = [
    EdgeInsets.only(right: PrimeDesignSystem.light().spacings.s),
    EdgeInsets.only(right: PrimeDesignSystem.dark().spacings.s)
  ];

  static List<EdgeInsets> appInputTextFieldPaddingWarning = [
    EdgeInsets.only(right: PrimeDesignSystem.light().spacings.s),
    EdgeInsets.only(right: PrimeDesignSystem.dark().spacings.s)
  ];

  static List<EdgeInsets> appInputTextFieldPaddingError = [
    EdgeInsets.only(right: PrimeDesignSystem.light().spacings.s),
    EdgeInsets.only(right: PrimeDesignSystem.dark().spacings.s)
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
