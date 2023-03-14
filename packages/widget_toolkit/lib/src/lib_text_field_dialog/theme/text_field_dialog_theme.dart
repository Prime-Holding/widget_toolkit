import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../asset_classes.dart';
import '../../base/theme/design_system/widget_toolkit_design_system.dart';

part 'text_field_dialog_theme.tailor.dart';

@Tailor(themeGetter: ThemeGetter.none)
class _$TextFieldDialogTheme {
  //TODO: The properties of the theme extension should be almost always specific just like in the example below.
  // The colors, sizes etc from design system should be used to fill in the values (take for reference WidgetToolkitTheme, ItemPickerTheme, SearchPickerTheme).

  /// region EditFieldWidget
  static List<Color> editFieldSuccessBackground = [
    WidgetToolkitDesignSystem.light().colors.greenLight,
    WidgetToolkitDesignSystem.dark().colors.green,
  ];

  static List<Color> editFieldRegularBackground = [
    WidgetToolkitDesignSystem.light().colors.mediumWhite,
    WidgetToolkitDesignSystem.dark().colors.black45,
  ];

  static List<double> editFieldBorderRadius = [
    WidgetToolkitDesignSystem.light().spacings.xss,
    WidgetToolkitDesignSystem.light().spacings.xss,
  ];

  /// endregion

  ///  region InputTextField
  static List<Color> inputTextFieldSuccessBackground = [
    WidgetToolkitDesignSystem.light().colors.greenLight,
    WidgetToolkitDesignSystem.dark().colors.green,
  ];

  static List<Color> inputTextFieldRegularBackground = [
    WidgetToolkitDesignSystem.light().colors.mediumWhite,
    WidgetToolkitDesignSystem.dark().colors.darkGray,
  ];

  ///  endregion

  /// region LabelBoxWidget
  static List<Color> labelBoxOptionalBackground = [
    WidgetToolkitDesignSystem.light().colors.white,
    WidgetToolkitDesignSystem.dark().colors.darkGray,
  ];

  static List<Color> labelBoxFilledBackground = [
    WidgetToolkitDesignSystem.light().colors.mediumWhite,
    WidgetToolkitDesignSystem.dark().colors.darkGray,
  ];

  /// endregion

  /// region spacings
  static List<double> spacingXS = [
    WidgetToolkitDesignSystem.light().spacings.xs,
    WidgetToolkitDesignSystem.dark().spacings.xs,
  ];

  static List<double> spacingXSS = [
    WidgetToolkitDesignSystem.light().spacings.xss,
    WidgetToolkitDesignSystem.dark().spacings.xss,
  ];
  static List<double> spacingS = [
    WidgetToolkitDesignSystem.light().spacings.s,
    WidgetToolkitDesignSystem.dark().spacings.s,
  ];

  static List<double> spacingM = [
    WidgetToolkitDesignSystem.light().spacings.m,
    WidgetToolkitDesignSystem.dark().spacings.m,
  ];
  static List<double> spacingL = [
    WidgetToolkitDesignSystem.light().spacings.l,
    WidgetToolkitDesignSystem.dark().spacings.l,
  ];

  static List<double> spacingXL = [
    WidgetToolkitDesignSystem.light().spacings.xl,
    WidgetToolkitDesignSystem.dark().spacings.xl,
  ];
  static List<double> spacingXXXS = [
    WidgetToolkitDesignSystem.light().spacings.xxxs,
    WidgetToolkitDesignSystem.dark().spacings.xxxs,
  ];

  ///endregion
  /// region TextStyle
  static List<TextStyle> descriptionThin = [
    WidgetToolkitDesignSystem.light().typography.descriptionThin,
    WidgetToolkitDesignSystem.dark().typography.descriptionThin,
  ];

  static List<TextStyle> titleBold = [
    WidgetToolkitDesignSystem.light().typography.titleBold,
    WidgetToolkitDesignSystem.dark().typography.titleBold,
  ];

  static List<TextStyle> descriptionBold = [
    WidgetToolkitDesignSystem.light().typography.descriptionBold,
    WidgetToolkitDesignSystem.dark().typography.descriptionBold,
  ];

  static List<TextStyle> captionBold = [
    WidgetToolkitDesignSystem.light().typography.captionBold,
    WidgetToolkitDesignSystem.dark().typography.captionBold,
  ];

  static List<TextStyle> smallThin = [
    WidgetToolkitDesignSystem.light().typography.smallThin,
    WidgetToolkitDesignSystem.dark().typography.smallThin,
  ];

  ///endregion

  ///region Color
  static List<Color> black = [
    WidgetToolkitDesignSystem.light().colors.textFieldDialogBlack,
    WidgetToolkitDesignSystem.dark().colors.textFieldDialogBlack,
  ];

  static List<Color> defaultWhite = [
    WidgetToolkitDesignSystem.light().colors.white,
    WidgetToolkitDesignSystem.dark().colors.white,
  ];

  static List<Color> white = [
    WidgetToolkitDesignSystem.light().colors.textFieldDialogWhite,
    WidgetToolkitDesignSystem.dark().colors.textFieldDialogWhite,
  ];

  static List<Color> blue = [
    WidgetToolkitDesignSystem.light().colors.darkBlue,
    WidgetToolkitDesignSystem.dark().colors.blue,
  ];

  static List<Color> disabledFilledButtonBackgroundColor = [
    WidgetToolkitDesignSystem.light().colors.gray,
    WidgetToolkitDesignSystem.dark().colors.gray,
  ];

  static List<Color> gradientRedEnd = [
    WidgetToolkitDesignSystem.light().colors.gradientRedEnd,
    WidgetToolkitDesignSystem.dark().colors.gradientRedEnd,
  ];

  static List<Color> mediumWhite = [
    WidgetToolkitDesignSystem.light().colors.lightGray,
    WidgetToolkitDesignSystem.dark().colors.lightGray,
  ];

  static List<Color> gray = [
    WidgetToolkitDesignSystem.light().colors.gray,
    WidgetToolkitDesignSystem.dark().colors.gray,
  ];

  static List<Color> green = [
    WidgetToolkitDesignSystem.light().colors.darkGreen,
    WidgetToolkitDesignSystem.dark().colors.darkGreen,
  ];

  static List<Color> redLight = [
    WidgetToolkitDesignSystem.light().colors.lightRed,
    WidgetToolkitDesignSystem.dark().colors.lightRed,
  ];

  static List<Color> orangeLight = [
    WidgetToolkitDesignSystem.light().colors.orangeLight,
    WidgetToolkitDesignSystem.dark().colors.orangeLight,
  ];

  static List<Color> orange = [
    WidgetToolkitDesignSystem.light().colors.orange,
    WidgetToolkitDesignSystem.dark().colors.orange,
  ];

  static List<Color> transparent = [
    WidgetToolkitDesignSystem.light().colors.textFieldDialogTransparent,
    WidgetToolkitDesignSystem.dark().colors.textFieldDialogTransparent,
  ];

  static List<Color> greenLight = [
    WidgetToolkitDesignSystem.light().colors.greenLight,
    WidgetToolkitDesignSystem.dark().colors.greenLight,
  ];

  static List<Color> red = [
    WidgetToolkitDesignSystem.light().colors.red,
    WidgetToolkitDesignSystem.dark().colors.red,
  ];

  static List<Color> mediumBlack = [
    WidgetToolkitDesignSystem.light().colors.mediumBlack,
    WidgetToolkitDesignSystem.dark().colors.mediumBlack,
  ];

  ///endregion

  ///region SvgFile
  static List<SvgFile> closeIcon = [
    WidgetToolkitDesignSystem.dark().icons.closeIcon,
    WidgetToolkitDesignSystem.light().icons.closeIcon,
  ];

  static List<SvgFile> dangerIcon = [
    WidgetToolkitDesignSystem.dark().icons.dangerIcon,
    WidgetToolkitDesignSystem.light().icons.dangerIcon,
  ];

  static List<SvgFile> addIcon = [
    WidgetToolkitDesignSystem.dark().icons.addIcon,
    WidgetToolkitDesignSystem.light().icons.addIcon,
  ];

  static List<SvgFile> addDisabledIcon = [
    WidgetToolkitDesignSystem.dark().icons.addDisabledIcon,
    WidgetToolkitDesignSystem.light().icons.addDisabledIcon,
  ];

  static List<SvgFile> arrowRightSquareIcon = [
    WidgetToolkitDesignSystem.dark().icons.arrowRightSquareIcon,
    WidgetToolkitDesignSystem.light().icons.arrowRightSquareIcon,
  ];

  static List<SvgFile> editPenIcon = [
    WidgetToolkitDesignSystem.dark().icons.editPenIcon,
    WidgetToolkitDesignSystem.light().icons.editPenIcon,
  ];

  static List<SvgFile> infoCircleIcon = [
    WidgetToolkitDesignSystem.dark().icons.infoCircleIcon,
    WidgetToolkitDesignSystem.light().icons.infoCircleIcon,
  ];

  static List<SvgFile> loadingIcon = [
    WidgetToolkitDesignSystem.dark().icons.loadingIcon,
    WidgetToolkitDesignSystem.light().icons.loadingIcon,
  ];

  static List<SvgFile> tickCircleSuccessIcon = [
    WidgetToolkitDesignSystem.dark().icons.tickCircleSuccessIcon,
    WidgetToolkitDesignSystem.light().icons.tickCircleSuccessIcon,
  ];

  ///endregion
  ///region EdgeInsets

  static List<EdgeInsets> textFieldDialog2 = [
    EdgeInsets.zero,
    EdgeInsets.zero,
  ];

  static List<EdgeInsets> textFieldDialog4 = [
    EdgeInsets.only(
      top: WidgetToolkitDesignSystem.light().spacings.xl,
      bottom: WidgetToolkitDesignSystem.light().spacings.xxxxs,
    ),
    EdgeInsets.only(
      top: WidgetToolkitDesignSystem.light().spacings.xl,
      bottom: WidgetToolkitDesignSystem.light().spacings.xxxxs,
    ),
  ];

  static List<EdgeInsets> textFieldDialog3 = [
    EdgeInsets.only(
      left: WidgetToolkitDesignSystem.light().spacings.xs,
      bottom: WidgetToolkitDesignSystem.light().spacings.m,
    ),
    EdgeInsets.only(
      left: WidgetToolkitDesignSystem.dark().spacings.xs,
      bottom: WidgetToolkitDesignSystem.dark().spacings.m,
    )
  ];

  static List<EdgeInsets> labeledBoxWidgetPadding1 = [
    EdgeInsets.symmetric(
      vertical: WidgetToolkitDesignSystem.light().spacings.m,
      horizontal: WidgetToolkitDesignSystem.light().spacings.s,
    ),
    EdgeInsets.symmetric(
      vertical: WidgetToolkitDesignSystem.dark().spacings.m,
      horizontal: WidgetToolkitDesignSystem.dark().spacings.s,
    )
  ];

  static List<EdgeInsets> labeledBoxWidgetPadding2 = [
    EdgeInsets.only(right: WidgetToolkitDesignSystem.dark().spacings.xs),
    EdgeInsets.only(right: WidgetToolkitDesignSystem.dark().spacings.xs)
  ];

  static List<EdgeInsets> labeledBoxWidgetPadding3 = [
    EdgeInsets.only(right: WidgetToolkitDesignSystem.light().spacings.m),
    EdgeInsets.only(right: WidgetToolkitDesignSystem.dark().spacings.m)
  ];

  static List<EdgeInsets> inputTextFieldPadding1 = [
    EdgeInsets.only(
      left: WidgetToolkitDesignSystem.light().spacings.m,
      top: WidgetToolkitDesignSystem.light().spacings.xxxs,
    ),
    EdgeInsets.only(
      left: WidgetToolkitDesignSystem.dark().spacings.m,
      top: WidgetToolkitDesignSystem.dark().spacings.xxxs,
    )
  ];
  static List<EdgeInsets> inputTextFieldPadding2 = [
    EdgeInsets.only(right: WidgetToolkitDesignSystem.light().spacings.xs),
    EdgeInsets.only(right: WidgetToolkitDesignSystem.dark().spacings.xs)
  ];

  static List<EdgeInsets> inputTextFieldPadding3 = [
    EdgeInsets.only(right: WidgetToolkitDesignSystem.light().spacings.xs),
    EdgeInsets.only(right: WidgetToolkitDesignSystem.dark().spacings.xs)
  ];

  static List<EdgeInsets> inputTextFieldPaddingLoading = [
    EdgeInsets.only(right: WidgetToolkitDesignSystem.light().spacings.s),
    EdgeInsets.only(right: WidgetToolkitDesignSystem.dark().spacings.s)
  ];

  static List<EdgeInsets> inputTextFieldPaddingSuccess = [
    EdgeInsets.only(right: WidgetToolkitDesignSystem.light().spacings.s),
    EdgeInsets.only(right: WidgetToolkitDesignSystem.dark().spacings.s)
  ];

  static List<EdgeInsets> inputTextFieldPaddingWarning = [
    EdgeInsets.only(right: WidgetToolkitDesignSystem.light().spacings.s),
    EdgeInsets.only(right: WidgetToolkitDesignSystem.dark().spacings.s)
  ];

  static List<EdgeInsets> inputTextFieldPaddingError = [
    EdgeInsets.only(right: WidgetToolkitDesignSystem.light().spacings.s),
    EdgeInsets.only(right: WidgetToolkitDesignSystem.dark().spacings.s)
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
