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
    required this.inputFieldBackgroundSuccessColor,
    required this.labelBoxFilledPrimary,
    required this.labelBoxFilledSecondary,
    required this.labelBoxFilledBackground,
    required this.labelBoxFilledBorder,
    required this.labelBoxOptionalPrimary,
    required this.labelBoxOptionalSecondary,
    required this.labelBoxOptionalBackground,
    required this.labelBoxOptionalBorder,
    required this.editFieldBorderRadius,
    required this.spacingXXXS,
    required this.spacingXSS,
    required this.spacingXS,
    required this.spacingS,
    required this.spacingM,
    required this.spacingXL,
    required this.descriptionThin,
    required this.titleBold,
    required this.descriptionBold,
    required this.captionBold,
    required this.smallThin,
    required this.disabledFilledButtonBackgroundColor,
    required this.inputFieldBorderErrorColor,
    required this.inputFieldBorderTypeColor,
    required this.inputFieldBorderDisabledColor,
    required this.inputFieldBorderLoadingColor,
    required this.inputFieldBorderWarningColor,
    required this.inputFieldValueColor,
    required this.inputFieldValueDisabledColor,
    required this.textFieldDialogIconColor,
    required this.editFieldLabelEditedColor,
    required this.editFieldLabelNotEditedColor,
    required this.editFieldLabelLoadingColor,
    required this.editFieldLabelSuccessColor,
    required this.editFieldValueEditedColor,
    required this.editFieldValueNotEditedColor,
    required this.editFieldValueLoadingColor,
    required this.editFieldValueSuccessColor,
    required this.editFieldTextEditedTextStyle,
    required this.editFieldTextNotEditedTextStyle,
    required this.editFieldTextLoadingTextStyle,
    required this.editFieldTextSuccessTextStyle,
    required this.inputFieldTextDefaultFieldColor,
    required this.inputFieldTextDefaultDisabledColor,
    required this.inputFieldTextDisabledColor,
    required this.inputFieldTextErrorColor,
    required this.inputFieldTextFilledColor,
    required this.inputFieldTextLoadingColor,
    required this.inputFieldTextSuccessColor,
    required this.inputFieldTextTypeColor,
    required this.inputFieldTextWarningColor,
    required this.inputFieldTextPlainColor,
    required this.inputFieldBackgroundFilledColor,
    required this.inputFieldBackgroundPlainColor,
    required this.inputFieldBackgroundDefaultFieldColor,
    required this.inputFieldBackgroundDefaultDisabledColor,
    required this.inputFieldBackgroundDefaultColor,
    required this.inputFieldHintColor,
    required this.inputFieldErrorTextColor,
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
        inputFieldBackgroundSuccessColor =
            WidgetToolkitDesignSystem.light().colors.greenLight,
        labelBoxFilledPrimary = WidgetToolkitDesignSystem.light().colors.blue,
        labelBoxFilledSecondary =
            WidgetToolkitDesignSystem.light().colors.black,
        labelBoxFilledBackground =
            WidgetToolkitDesignSystem.light().colors.mediumWhite,
        labelBoxFilledBorder =
            WidgetToolkitDesignSystem.light().colors.textFieldDialogTransparent,
        labelBoxOptionalPrimary =
            WidgetToolkitDesignSystem.light().colors.black,
        labelBoxOptionalSecondary =
            WidgetToolkitDesignSystem.light().colors.gray,
        labelBoxOptionalBackground =
            WidgetToolkitDesignSystem.light().colors.white,
        labelBoxOptionalBorder =
            WidgetToolkitDesignSystem.light().colors.lightGray,
        editFieldBorderRadius = WidgetToolkitDesignSystem.light().spacings.xss,
        spacingXS = WidgetToolkitDesignSystem.light().spacings.xs,
        spacingXSS = WidgetToolkitDesignSystem.light().spacings.xss,
        spacingS = WidgetToolkitDesignSystem.light().spacings.s,
        spacingM = WidgetToolkitDesignSystem.light().spacings.m,
        spacingXL = WidgetToolkitDesignSystem.light().spacings.xl,
        spacingXXXS = WidgetToolkitDesignSystem.light().spacings.xxxs,
        descriptionThin =
            WidgetToolkitDesignSystem.light().typography.descriptionThin,
        titleBold = WidgetToolkitDesignSystem.light().typography.titleBold,
        descriptionBold =
            WidgetToolkitDesignSystem.light().typography.descriptionBold,
        captionBold = WidgetToolkitDesignSystem.light().typography.captionBold,
        smallThin = WidgetToolkitDesignSystem.light().typography.smallThin,
        textFieldDialogIconColor =
            WidgetToolkitDesignSystem.light().colors.darkBlue,
        disabledFilledButtonBackgroundColor =
            WidgetToolkitDesignSystem.light().colors.gray,
        inputFieldBorderErrorColor =
            WidgetToolkitDesignSystem.light().colors.lightRed,
        inputFieldBorderTypeColor =
            WidgetToolkitDesignSystem.light().colors.darkBlue,
        inputFieldBorderDisabledColor =
            WidgetToolkitDesignSystem.light().colors.lightGray,
        inputFieldBorderLoadingColor =
            WidgetToolkitDesignSystem.light().colors.darkBlue,
        inputFieldBorderWarningColor =
            WidgetToolkitDesignSystem.light().colors.orangeLight,
        inputFieldValueColor =
            WidgetToolkitDesignSystem.light().colors.highlightColor,
        inputFieldValueDisabledColor =
            WidgetToolkitDesignSystem.light().colors.gray,
        editFieldLabelEditedColor = null,
        editFieldLabelLoadingColor =
            WidgetToolkitDesignSystem.light().colors.gray,
        editFieldLabelNotEditedColor =
            WidgetToolkitDesignSystem.light().colors.gray,
        editFieldLabelSuccessColor =
            WidgetToolkitDesignSystem.light().colors.green,
        editFieldValueEditedColor =
            WidgetToolkitDesignSystem.light().colors.darkBlue,
        editFieldValueNotEditedColor =
            WidgetToolkitDesignSystem.light().colors.highlightColor,
        editFieldValueLoadingColor =
            WidgetToolkitDesignSystem.light().colors.gray,
        editFieldValueSuccessColor =
            WidgetToolkitDesignSystem.light().colors.highlightColor,
        editFieldTextEditedTextStyle =
            WidgetToolkitDesignSystem.light().typography.descriptionBold,
        editFieldTextNotEditedTextStyle =
            WidgetToolkitDesignSystem.light().typography.descriptionThin,
        editFieldTextLoadingTextStyle =
            WidgetToolkitDesignSystem.light().typography.descriptionBold,
        editFieldTextSuccessTextStyle =
            WidgetToolkitDesignSystem.light().typography.descriptionBold,
        inputFieldTextDefaultFieldColor =
            WidgetToolkitDesignSystem.light().colors.darkBlue,
        inputFieldTextDefaultDisabledColor =
            WidgetToolkitDesignSystem.light().colors.gray,
        inputFieldTextDisabledColor =
            WidgetToolkitDesignSystem.light().colors.mediumBlack,
        inputFieldTextErrorColor = WidgetToolkitDesignSystem.light().colors.red,
        inputFieldTextFilledColor =
            WidgetToolkitDesignSystem.light().colors.darkGreen,
        inputFieldTextLoadingColor =
            WidgetToolkitDesignSystem.light().colors.darkBlue,
        inputFieldTextSuccessColor =
            WidgetToolkitDesignSystem.light().colors.darkGreen,
        inputFieldTextTypeColor =
            WidgetToolkitDesignSystem.light().colors.darkBlue,
        inputFieldTextWarningColor =
            WidgetToolkitDesignSystem.light().colors.orange,
        inputFieldTextPlainColor =
            WidgetToolkitDesignSystem.light().colors.gray,
        inputFieldBackgroundFilledColor =
            WidgetToolkitDesignSystem.light().colors.mediumWhite,
        inputFieldBackgroundPlainColor =
            WidgetToolkitDesignSystem.light().colors.mediumWhite,
        inputFieldBackgroundDefaultFieldColor =
            WidgetToolkitDesignSystem.light().colors.mediumWhite,
        inputFieldBackgroundDefaultDisabledColor =
            WidgetToolkitDesignSystem.light().colors.mediumWhite,
        inputFieldBackgroundDefaultColor =
            WidgetToolkitDesignSystem.light().colors.mediumWhite,
        inputFieldHintColor = WidgetToolkitDesignSystem.light().colors.gray,
        inputFieldErrorTextColor = WidgetToolkitDesignSystem.light().colors.red,
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
        inputFieldBackgroundSuccessColor =
            WidgetToolkitDesignSystem.dark().colors.green,
        labelBoxFilledPrimary = WidgetToolkitDesignSystem.light().colors.blue,
        labelBoxFilledSecondary =
            WidgetToolkitDesignSystem.light().colors.black,
        labelBoxFilledBackground =
            WidgetToolkitDesignSystem.light().colors.darkGray,
        labelBoxFilledBorder =
            WidgetToolkitDesignSystem.light().colors.textFieldDialogTransparent,
        labelBoxOptionalPrimary =
            WidgetToolkitDesignSystem.light().colors.black,
        labelBoxOptionalSecondary =
            WidgetToolkitDesignSystem.light().colors.gray,
        labelBoxOptionalBackground =
            WidgetToolkitDesignSystem.light().colors.darkGray,
        labelBoxOptionalBorder =
            WidgetToolkitDesignSystem.light().colors.lightGray,
        editFieldBorderRadius = WidgetToolkitDesignSystem.dark().spacings.xss,
        spacingXS = WidgetToolkitDesignSystem.dark().spacings.xs,
        spacingXSS = WidgetToolkitDesignSystem.dark().spacings.xss,
        spacingS = WidgetToolkitDesignSystem.dark().spacings.s,
        spacingM = WidgetToolkitDesignSystem.dark().spacings.m,
        spacingXL = WidgetToolkitDesignSystem.dark().spacings.xl,
        spacingXXXS = WidgetToolkitDesignSystem.dark().spacings.xxxs,
        descriptionThin =
            WidgetToolkitDesignSystem.dark().typography.descriptionThin,
        titleBold = WidgetToolkitDesignSystem.dark().typography.titleBold,
        descriptionBold =
            WidgetToolkitDesignSystem.dark().typography.descriptionBold,
        captionBold = WidgetToolkitDesignSystem.dark().typography.captionBold,
        smallThin = WidgetToolkitDesignSystem.dark().typography.smallThin,
        textFieldDialogIconColor =
            WidgetToolkitDesignSystem.light().colors.darkBlue,
        disabledFilledButtonBackgroundColor =
            WidgetToolkitDesignSystem.dark().colors.gray,
        inputFieldBorderErrorColor =
            WidgetToolkitDesignSystem.dark().colors.lightRed,
        inputFieldBorderTypeColor =
            WidgetToolkitDesignSystem.dark().colors.blue,
        inputFieldBorderDisabledColor =
            WidgetToolkitDesignSystem.dark().colors.lightGray,
        inputFieldBorderLoadingColor =
            WidgetToolkitDesignSystem.dark().colors.blue,
        inputFieldBorderWarningColor =
            WidgetToolkitDesignSystem.dark().colors.orangeLight,
        inputFieldValueColor =
            WidgetToolkitDesignSystem.dark().colors.highlightColor,
        inputFieldValueDisabledColor =
            WidgetToolkitDesignSystem.dark().colors.gray,
        editFieldLabelEditedColor = null,
        editFieldLabelNotEditedColor =
            WidgetToolkitDesignSystem.dark().colors.gray,
        editFieldLabelLoadingColor =
            WidgetToolkitDesignSystem.dark().colors.gray,
        editFieldLabelSuccessColor =
            WidgetToolkitDesignSystem.dark().colors.green,
        editFieldValueEditedColor =
            WidgetToolkitDesignSystem.light().colors.darkBlue,
        editFieldValueNotEditedColor =
            WidgetToolkitDesignSystem.light().colors.highlightColor,
        editFieldValueLoadingColor =
            WidgetToolkitDesignSystem.light().colors.gray,
        editFieldValueSuccessColor =
            WidgetToolkitDesignSystem.light().colors.highlightColor,
        editFieldTextEditedTextStyle =
            WidgetToolkitDesignSystem.dark().typography.descriptionBold,
        editFieldTextNotEditedTextStyle =
            WidgetToolkitDesignSystem.dark().typography.descriptionThin,
        editFieldTextLoadingTextStyle =
            WidgetToolkitDesignSystem.dark().typography.descriptionBold,
        editFieldTextSuccessTextStyle =
            WidgetToolkitDesignSystem.dark().typography.descriptionBold,
        inputFieldTextDefaultFieldColor =
            WidgetToolkitDesignSystem.dark().colors.darkBlue,
        inputFieldTextDefaultDisabledColor =
            WidgetToolkitDesignSystem.dark().colors.gray,
        inputFieldTextDisabledColor =
            WidgetToolkitDesignSystem.dark().colors.mediumBlack,
        inputFieldTextErrorColor = WidgetToolkitDesignSystem.dark().colors.red,
        inputFieldTextFilledColor =
            WidgetToolkitDesignSystem.dark().colors.darkGreen,
        inputFieldTextLoadingColor =
            WidgetToolkitDesignSystem.dark().colors.darkBlue,
        inputFieldTextSuccessColor =
            WidgetToolkitDesignSystem.dark().colors.darkGreen,
        inputFieldTextTypeColor =
            WidgetToolkitDesignSystem.dark().colors.darkBlue,
        inputFieldTextWarningColor =
            WidgetToolkitDesignSystem.dark().colors.orange,
        inputFieldTextPlainColor = WidgetToolkitDesignSystem.dark().colors.gray,
        inputFieldBackgroundFilledColor =
            WidgetToolkitDesignSystem.dark().colors.mediumWhite,
        inputFieldBackgroundPlainColor =
            WidgetToolkitDesignSystem.dark().colors.mediumWhite,
        inputFieldBackgroundDefaultFieldColor =
            WidgetToolkitDesignSystem.dark().colors.mediumWhite,
        inputFieldBackgroundDefaultDisabledColor =
            WidgetToolkitDesignSystem.dark().colors.mediumWhite,
        inputFieldBackgroundDefaultColor =
            WidgetToolkitDesignSystem.dark().colors.mediumWhite,
        inputFieldHintColor = WidgetToolkitDesignSystem.dark().colors.gray,
        inputFieldErrorTextColor = WidgetToolkitDesignSystem.dark().colors.red,
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
  final Color inputFieldBackgroundSuccessColor;
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
  final Color disabledFilledButtonBackgroundColor;
  @override
  final Color textFieldDialogIconColor;
  @override
  final Color inputFieldBorderErrorColor;
  @override
  final Color inputFieldBorderTypeColor;
  @override
  final Color inputFieldBorderDisabledColor;
  @override
  final Color inputFieldBorderLoadingColor;
  @override
  final Color inputFieldBorderWarningColor;
  @override
  final Color inputFieldValueColor;
  @override
  final Color inputFieldValueDisabledColor;

  @override
  final Color labelBoxOptionalPrimary;
  @override
  final Color labelBoxFilledPrimary;
  @override
  final Color labelBoxOptionalSecondary;
  @override
  final Color labelBoxFilledSecondary;
  @override
  final Color labelBoxOptionalBorder;
  @override
  final Color labelBoxFilledBorder;

  @override
  final Color? editFieldLabelEditedColor;
  @override
  final Color editFieldLabelNotEditedColor;
  @override
  final Color editFieldLabelLoadingColor;
  @override
  final Color editFieldLabelSuccessColor;
  @override
  final Color editFieldValueEditedColor;
  @override
  final Color editFieldValueNotEditedColor;
  @override
  final Color editFieldValueLoadingColor;
  @override
  final Color editFieldValueSuccessColor;

  @override
  final TextStyle editFieldTextEditedTextStyle;
  @override
  final TextStyle editFieldTextNotEditedTextStyle;
  @override
  final TextStyle editFieldTextLoadingTextStyle;
  @override
  final TextStyle editFieldTextSuccessTextStyle;

  @override
  final Color inputFieldTextDefaultFieldColor;
  @override
  final Color inputFieldTextDefaultDisabledColor;
  @override
  final Color inputFieldTextDisabledColor;
  @override
  final Color inputFieldTextErrorColor;
  @override
  final Color inputFieldTextFilledColor;
  @override
  final Color inputFieldTextLoadingColor;
  @override
  final Color inputFieldTextSuccessColor;
  @override
  final Color inputFieldTextTypeColor;
  @override
  final Color inputFieldTextWarningColor;
  @override
  final Color inputFieldTextPlainColor;

  @override
  final Color inputFieldBackgroundFilledColor;
  @override
  final Color inputFieldBackgroundPlainColor;
  @override
  final Color inputFieldBackgroundDefaultFieldColor;
  @override
  final Color inputFieldBackgroundDefaultDisabledColor;
  @override
  final Color inputFieldBackgroundDefaultColor;

  @override
  final Color inputFieldHintColor;
  @override
  final Color inputFieldErrorTextColor;

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
