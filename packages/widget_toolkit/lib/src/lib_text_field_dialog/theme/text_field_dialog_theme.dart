import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../../asset_classes.dart';
import '../../base/theme/design_system/widget_toolkit_design_system.dart';

part 'text_field_dialog_theme.tailor.dart';

@TailorMixinComponent()
class TextFieldDialogTheme extends ThemeExtension<TextFieldDialogTheme>
    with _$TextFieldDialogThemeTailorMixin {
  TextFieldDialogTheme({
    required this.editFieldSuccessBackground,
    required this.editFieldRegularBackground,
    required this.inputTextFieldSuccessBackground,
    required this.inputTextFieldRegularBackground,
    required this.labelBoxOptionalBackground,
    required this.labelBoxFilledBackground,
    required this.editFieldBorderRadius,
    required this.spacingXS,
    required this.spacingXSS,
    required this.spacingS,
    required this.spacingM,
    required this.spacingL,
    required this.spacingXL,
    required this.spacingXXXS,
    required this.descriptionThin,
    required this.titleBold,
    required this.descriptionBold,
    required this.captionBold,
    required this.smallThin,
    required this.black,
    required this.defaultWhite,
    required this.white,
    required this.blue,
    required this.disabledFilledButtonBackgroundColor,
    required this.mediumWhite,
    required this.gray,
    required this.green,
    required this.redLight,
    required this.orangeLight,
    required this.orange,
    required this.transparent,
    required this.greenLight,
    required this.red,
    required this.mediumBlack,
    required this.closeIcon,
    required this.dangerIcon,
    required this.addIcon,
    required this.addDisabledIcon,
    required this.arrowRightSquareIcon,
    required this.editPenIcon,
    required this.infoCircleIcon,
    required this.loadingIcon,
    required this.tickCircleSuccessIcon,
    required this.textFieldDialog2,
    required this.textFieldDialog4,
    required this.textFieldDialog3,
    required this.labeledBoxWidgetPadding1,
    required this.labeledBoxWidgetPadding2,
    required this.labeledBoxWidgetPadding3,
    required this.inputTextFieldPadding1,
    required this.inputTextFieldPadding2,
    required this.inputTextFieldPadding3,
    required this.inputTextFieldPaddingLoading,
    required this.inputTextFieldPaddingSuccess,
    required this.inputTextFieldPaddingWarning,
    required this.inputTextFieldPaddingError,
  });

  /// region Theme

  TextFieldDialogTheme.light()
      : editFieldSuccessBackground =
            WidgetToolkitDesignSystem.light().colors.greenLight,
        editFieldRegularBackground =
            WidgetToolkitDesignSystem.light().colors.mediumWhite,
        inputTextFieldSuccessBackground =
            WidgetToolkitDesignSystem.light().colors.greenLight,
        inputTextFieldRegularBackground =
            WidgetToolkitDesignSystem.light().colors.mediumWhite,
        labelBoxOptionalBackground =
            WidgetToolkitDesignSystem.light().colors.white,
        labelBoxFilledBackground =
            WidgetToolkitDesignSystem.light().colors.mediumWhite,
        editFieldBorderRadius = WidgetToolkitDesignSystem.light().spacings.xss,
        spacingXS = WidgetToolkitDesignSystem.light().spacings.xs,
        spacingXSS = WidgetToolkitDesignSystem.light().spacings.xss,
        spacingS = WidgetToolkitDesignSystem.light().spacings.s,
        spacingM = WidgetToolkitDesignSystem.light().spacings.m,
        spacingL = WidgetToolkitDesignSystem.light().spacings.l,
        spacingXL = WidgetToolkitDesignSystem.light().spacings.xl,
        spacingXXXS = WidgetToolkitDesignSystem.light().spacings.xxxs,
        descriptionThin =
            WidgetToolkitDesignSystem.light().typography.descriptionThin,
        titleBold = WidgetToolkitDesignSystem.light().typography.titleBold,
        descriptionBold =
            WidgetToolkitDesignSystem.light().typography.descriptionBold,
        captionBold = WidgetToolkitDesignSystem.light().typography.captionBold,
        smallThin = WidgetToolkitDesignSystem.light().typography.smallThin,
        black = WidgetToolkitDesignSystem.light().colors.textFieldDialogBlack,
        defaultWhite = WidgetToolkitDesignSystem.light().colors.white,
        white = WidgetToolkitDesignSystem.light().colors.textFieldDialogWhite,
        blue = WidgetToolkitDesignSystem.light().colors.darkBlue,
        disabledFilledButtonBackgroundColor =
            WidgetToolkitDesignSystem.light().colors.gray,
        mediumWhite = WidgetToolkitDesignSystem.light().colors.lightGray,
        gray = WidgetToolkitDesignSystem.light().colors.gray,
        green = WidgetToolkitDesignSystem.light().colors.darkGreen,
        redLight = WidgetToolkitDesignSystem.light().colors.lightRed,
        orangeLight = WidgetToolkitDesignSystem.light().colors.orangeLight,
        orange = WidgetToolkitDesignSystem.light().colors.orange,
        transparent =
            WidgetToolkitDesignSystem.light().colors.textFieldDialogTransparent,
        greenLight = WidgetToolkitDesignSystem.light().colors.greenLight,
        red = WidgetToolkitDesignSystem.light().colors.red,
        mediumBlack = WidgetToolkitDesignSystem.light().colors.mediumBlack,
        closeIcon = WidgetToolkitDesignSystem.dark().icons.closeIcon,
        dangerIcon = WidgetToolkitDesignSystem.dark().icons.dangerIcon,
        addIcon = WidgetToolkitDesignSystem.dark().icons.addIcon,
        addDisabledIcon =
            WidgetToolkitDesignSystem.dark().icons.addDisabledIcon,
        arrowRightSquareIcon =
            WidgetToolkitDesignSystem.dark().icons.arrowRightSquareIcon,
        editPenIcon = WidgetToolkitDesignSystem.dark().icons.editPenIcon,
        infoCircleIcon = WidgetToolkitDesignSystem.dark().icons.infoCircleIcon,
        loadingIcon = WidgetToolkitDesignSystem.dark().icons.loadingIcon,
        tickCircleSuccessIcon =
            WidgetToolkitDesignSystem.dark().icons.tickCircleSuccessIcon,
        textFieldDialog2 = EdgeInsets.zero,
        textFieldDialog4 = EdgeInsets.only(
          top: WidgetToolkitDesignSystem.light().spacings.xl,
          bottom: WidgetToolkitDesignSystem.light().spacings.xxxxs,
        ),
        textFieldDialog3 = EdgeInsets.only(
          left: WidgetToolkitDesignSystem.light().spacings.xs,
          bottom: WidgetToolkitDesignSystem.light().spacings.m,
        ),
        labeledBoxWidgetPadding1 = EdgeInsets.symmetric(
          vertical: WidgetToolkitDesignSystem.light().spacings.m,
          horizontal: WidgetToolkitDesignSystem.light().spacings.s,
        ),
        labeledBoxWidgetPadding2 = EdgeInsets.only(
            right: WidgetToolkitDesignSystem.dark().spacings.xs),
        labeledBoxWidgetPadding3 = EdgeInsets.only(
            right: WidgetToolkitDesignSystem.light().spacings.m),
        inputTextFieldPadding1 = EdgeInsets.only(
          left: WidgetToolkitDesignSystem.light().spacings.m,
          top: WidgetToolkitDesignSystem.light().spacings.xxxs,
        ),
        inputTextFieldPadding2 = EdgeInsets.only(
            right: WidgetToolkitDesignSystem.light().spacings.xs),
        inputTextFieldPadding3 = EdgeInsets.only(
            right: WidgetToolkitDesignSystem.light().spacings.xs),
        inputTextFieldPaddingLoading = EdgeInsets.only(
            right: WidgetToolkitDesignSystem.light().spacings.s),
        inputTextFieldPaddingSuccess = EdgeInsets.only(
            right: WidgetToolkitDesignSystem.light().spacings.s),
        inputTextFieldPaddingWarning = EdgeInsets.only(
            right: WidgetToolkitDesignSystem.light().spacings.s),
        inputTextFieldPaddingError = EdgeInsets.only(
            right: WidgetToolkitDesignSystem.light().spacings.s);

  TextFieldDialogTheme.dark()
      : editFieldSuccessBackground =
            WidgetToolkitDesignSystem.dark().colors.green,
        editFieldRegularBackground =
            WidgetToolkitDesignSystem.dark().colors.black45,
        inputTextFieldSuccessBackground =
            WidgetToolkitDesignSystem.dark().colors.green,
        inputTextFieldRegularBackground =
            WidgetToolkitDesignSystem.dark().colors.darkGray,
        labelBoxOptionalBackground =
            WidgetToolkitDesignSystem.dark().colors.darkGray,
        labelBoxFilledBackground =
            WidgetToolkitDesignSystem.dark().colors.darkGray,
        editFieldBorderRadius = WidgetToolkitDesignSystem.dark().spacings.xss,
        spacingXS = WidgetToolkitDesignSystem.dark().spacings.xs,
        spacingXSS = WidgetToolkitDesignSystem.dark().spacings.xss,
        spacingS = WidgetToolkitDesignSystem.dark().spacings.s,
        spacingM = WidgetToolkitDesignSystem.dark().spacings.m,
        spacingL = WidgetToolkitDesignSystem.dark().spacings.l,
        spacingXL = WidgetToolkitDesignSystem.dark().spacings.xl,
        spacingXXXS = WidgetToolkitDesignSystem.dark().spacings.xxxs,
        descriptionThin =
            WidgetToolkitDesignSystem.dark().typography.descriptionThin,
        titleBold = WidgetToolkitDesignSystem.dark().typography.titleBold,
        descriptionBold =
            WidgetToolkitDesignSystem.dark().typography.descriptionBold,
        captionBold = WidgetToolkitDesignSystem.dark().typography.captionBold,
        smallThin = WidgetToolkitDesignSystem.dark().typography.smallThin,
        black = WidgetToolkitDesignSystem.dark().colors.textFieldDialogBlack,
        defaultWhite = WidgetToolkitDesignSystem.dark().colors.white,
        white = WidgetToolkitDesignSystem.dark().colors.textFieldDialogWhite,
        blue = WidgetToolkitDesignSystem.dark().colors.blue,
        disabledFilledButtonBackgroundColor =
            WidgetToolkitDesignSystem.dark().colors.gray,
        mediumWhite = WidgetToolkitDesignSystem.dark().colors.lightGray,
        gray = WidgetToolkitDesignSystem.dark().colors.gray,
        green = WidgetToolkitDesignSystem.dark().colors.darkGreen,
        redLight = WidgetToolkitDesignSystem.dark().colors.lightRed,
        orangeLight = WidgetToolkitDesignSystem.dark().colors.orangeLight,
        orange = WidgetToolkitDesignSystem.dark().colors.orange,
        transparent =
            WidgetToolkitDesignSystem.dark().colors.textFieldDialogTransparent,
        greenLight = WidgetToolkitDesignSystem.dark().colors.greenLight,
        red = WidgetToolkitDesignSystem.dark().colors.red,
        mediumBlack = WidgetToolkitDesignSystem.dark().colors.mediumBlack,
        closeIcon = WidgetToolkitDesignSystem.light().icons.closeIcon,
        dangerIcon = WidgetToolkitDesignSystem.light().icons.dangerIcon,
        addIcon = WidgetToolkitDesignSystem.light().icons.addIcon,
        addDisabledIcon =
            WidgetToolkitDesignSystem.light().icons.addDisabledIcon,
        arrowRightSquareIcon =
            WidgetToolkitDesignSystem.light().icons.arrowRightSquareIcon,
        editPenIcon = WidgetToolkitDesignSystem.light().icons.editPenIcon,
        infoCircleIcon = WidgetToolkitDesignSystem.light().icons.infoCircleIcon,
        loadingIcon = WidgetToolkitDesignSystem.light().icons.loadingIcon,
        tickCircleSuccessIcon =
            WidgetToolkitDesignSystem.light().icons.tickCircleSuccessIcon,
        textFieldDialog2 = EdgeInsets.zero,
        textFieldDialog4 = EdgeInsets.only(
          top: WidgetToolkitDesignSystem.light().spacings.xl,
          bottom: WidgetToolkitDesignSystem.light().spacings.xxxxs,
        ),
        textFieldDialog3 = EdgeInsets.only(
          left: WidgetToolkitDesignSystem.dark().spacings.xs,
          bottom: WidgetToolkitDesignSystem.dark().spacings.m,
        ),
        labeledBoxWidgetPadding1 = EdgeInsets.symmetric(
          vertical: WidgetToolkitDesignSystem.dark().spacings.m,
          horizontal: WidgetToolkitDesignSystem.dark().spacings.s,
        ),
        labeledBoxWidgetPadding2 = EdgeInsets.only(
            right: WidgetToolkitDesignSystem.dark().spacings.xs),
        labeledBoxWidgetPadding3 =
            EdgeInsets.only(right: WidgetToolkitDesignSystem.dark().spacings.m),
        inputTextFieldPadding1 = EdgeInsets.only(
          left: WidgetToolkitDesignSystem.dark().spacings.m,
          top: WidgetToolkitDesignSystem.dark().spacings.xxxs,
        ),
        inputTextFieldPadding2 = EdgeInsets.only(
            right: WidgetToolkitDesignSystem.dark().spacings.xs),
        inputTextFieldPadding3 = EdgeInsets.only(
            right: WidgetToolkitDesignSystem.dark().spacings.xs),
        inputTextFieldPaddingLoading =
            EdgeInsets.only(right: WidgetToolkitDesignSystem.dark().spacings.s),
        inputTextFieldPaddingSuccess =
            EdgeInsets.only(right: WidgetToolkitDesignSystem.dark().spacings.s),
        inputTextFieldPaddingWarning =
            EdgeInsets.only(right: WidgetToolkitDesignSystem.dark().spacings.s),
        inputTextFieldPaddingError =
            EdgeInsets.only(right: WidgetToolkitDesignSystem.dark().spacings.s);

  /// endregion

  @override
  final Color editFieldSuccessBackground;
  @override
  final Color editFieldRegularBackground;
  @override
  final Color inputTextFieldSuccessBackground;
  @override
  final Color inputTextFieldRegularBackground;
  @override
  final Color labelBoxOptionalBackground;
  @override
  final Color labelBoxFilledBackground;

  @override
  final double editFieldBorderRadius;
  @override
  final double spacingXS;
  @override
  final double spacingXSS;
  @override
  final double spacingS;
  @override
  final double spacingM;
  @override
  final double spacingL;
  @override
  final double spacingXL;
  @override
  final double spacingXXXS;

  @override
  final TextStyle descriptionThin;
  @override
  final TextStyle titleBold;
  @override
  final TextStyle descriptionBold;
  @override
  final TextStyle captionBold;
  @override
  final TextStyle smallThin;

  @override
  final Color black;
  @override
  final Color defaultWhite;
  @override
  final Color white;
  @override
  final Color blue;
  @override
  final Color disabledFilledButtonBackgroundColor;
  @override
  final Color mediumWhite;
  @override
  final Color gray;
  @override
  final Color green;
  @override
  final Color redLight;
  @override
  final Color orangeLight;
  @override
  final Color orange;
  @override
  final Color transparent;
  @override
  final Color greenLight;
  @override
  final Color red;
  @override
  final Color mediumBlack;

  @override
  final SvgFile closeIcon;
  @override
  final SvgFile dangerIcon;
  @override
  final SvgFile addIcon;
  @override
  final SvgFile addDisabledIcon;
  @override
  final SvgFile arrowRightSquareIcon;
  @override
  final SvgFile editPenIcon;
  @override
  final SvgFile infoCircleIcon;
  @override
  final SvgFile loadingIcon;
  @override
  final SvgFile tickCircleSuccessIcon;

  @override
  final EdgeInsets textFieldDialog2;
  @override
  final EdgeInsets textFieldDialog4;
  @override
  final EdgeInsets textFieldDialog3;
  @override
  final EdgeInsets labeledBoxWidgetPadding1;
  @override
  final EdgeInsets labeledBoxWidgetPadding2;
  @override
  final EdgeInsets labeledBoxWidgetPadding3;
  @override
  final EdgeInsets inputTextFieldPadding1;
  @override
  final EdgeInsets inputTextFieldPadding2;
  @override
  final EdgeInsets inputTextFieldPadding3;
  @override
  final EdgeInsets inputTextFieldPaddingLoading;
  @override
  final EdgeInsets inputTextFieldPaddingSuccess;
  @override
  final EdgeInsets inputTextFieldPaddingWarning;
  @override
  final EdgeInsets inputTextFieldPaddingError;
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
