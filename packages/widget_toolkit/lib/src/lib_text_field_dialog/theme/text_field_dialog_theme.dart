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
    required this.textFieldDialogPadding,
    required this.textFieldDialogButtonPadding,
    required this.textFieldDialogHeaderPadding,
    required this.labeledBoxWidgetContentPadding,
    required this.labeledBoxWidgetIconPadding,
    required this.labeledBoxWidgetOptionalTextPadding,
    required this.inputTextFieldErrorPadding,
    required this.inputTextFieldIconPadding,
    required this.inputTextFieldIconDisabledPadding,
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
            WidgetToolkitDesignSystem.light().colors.blue,
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
        textFieldDialogPadding = EdgeInsets.zero,
        textFieldDialogButtonPadding = EdgeInsets.only(
          top: WidgetToolkitDesignSystem.light().spacings.xl,
          bottom: WidgetToolkitDesignSystem.light().spacings.xxxxs,
        ),
        textFieldDialogHeaderPadding = EdgeInsets.only(
          left: WidgetToolkitDesignSystem.light().spacings.xs,
          bottom: WidgetToolkitDesignSystem.light().spacings.m,
        ),
        labeledBoxWidgetContentPadding = EdgeInsets.symmetric(
          vertical: WidgetToolkitDesignSystem.light().spacings.m,
          horizontal: WidgetToolkitDesignSystem.light().spacings.s,
        ),
        labeledBoxWidgetIconPadding = EdgeInsets.only(
            right: WidgetToolkitDesignSystem.dark().spacings.xs),
        labeledBoxWidgetOptionalTextPadding = EdgeInsets.only(
            right: WidgetToolkitDesignSystem.light().spacings.m),
        inputTextFieldErrorPadding = EdgeInsets.only(
          left: WidgetToolkitDesignSystem.light().spacings.m,
          top: WidgetToolkitDesignSystem.light().spacings.xxxs,
        ),
        inputTextFieldIconPadding = EdgeInsets.only(
            right: WidgetToolkitDesignSystem.light().spacings.xs),
        inputTextFieldIconDisabledPadding = EdgeInsets.only(
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
        labelBoxFilledPrimary = WidgetToolkitDesignSystem.dark().colors.blue,
        labelBoxFilledSecondary = WidgetToolkitDesignSystem.dark().colors.black,
        labelBoxFilledBackground =
            WidgetToolkitDesignSystem.dark().colors.darkGray,
        labelBoxFilledBorder =
            WidgetToolkitDesignSystem.dark().colors.textFieldDialogTransparent,
        labelBoxOptionalPrimary = WidgetToolkitDesignSystem.dark().colors.black,
        labelBoxOptionalSecondary =
            WidgetToolkitDesignSystem.dark().colors.gray,
        labelBoxOptionalBackground =
            WidgetToolkitDesignSystem.dark().colors.darkGray,
        labelBoxOptionalBorder =
            WidgetToolkitDesignSystem.dark().colors.lightGray,
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
        textFieldDialogIconColor = WidgetToolkitDesignSystem.dark().colors.blue,
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
            WidgetToolkitDesignSystem.dark().colors.blue,
        editFieldValueNotEditedColor =
            WidgetToolkitDesignSystem.dark().colors.highlightColor,
        editFieldValueLoadingColor =
            WidgetToolkitDesignSystem.dark().colors.gray,
        editFieldValueSuccessColor =
            WidgetToolkitDesignSystem.dark().colors.highlightColor,
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
            WidgetToolkitDesignSystem.dark().colors.blue,
        inputFieldTextSuccessColor =
            WidgetToolkitDesignSystem.dark().colors.darkGreen,
        inputFieldTextTypeColor = WidgetToolkitDesignSystem.dark().colors.blue,
        inputFieldTextWarningColor =
            WidgetToolkitDesignSystem.dark().colors.orange,
        inputFieldTextPlainColor = WidgetToolkitDesignSystem.dark().colors.gray,
        inputFieldBackgroundFilledColor =
            WidgetToolkitDesignSystem.dark().colors.darkGray,
        inputFieldBackgroundPlainColor =
            WidgetToolkitDesignSystem.dark().colors.darkGray,
        inputFieldBackgroundDefaultFieldColor =
            WidgetToolkitDesignSystem.dark().colors.darkGray,
        inputFieldBackgroundDefaultDisabledColor =
            WidgetToolkitDesignSystem.dark().colors.darkGray,
        inputFieldBackgroundDefaultColor =
            WidgetToolkitDesignSystem.dark().colors.darkGray,
        inputFieldHintColor = WidgetToolkitDesignSystem.dark().colors.gray,
        inputFieldErrorTextColor = WidgetToolkitDesignSystem.dark().colors.red,
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
        textFieldDialogPadding = EdgeInsets.zero,
        textFieldDialogButtonPadding = EdgeInsets.only(
          top: WidgetToolkitDesignSystem.dark().spacings.xl,
          bottom: WidgetToolkitDesignSystem.dark().spacings.xxxxs,
        ),
        textFieldDialogHeaderPadding = EdgeInsets.only(
          left: WidgetToolkitDesignSystem.dark().spacings.xs,
          bottom: WidgetToolkitDesignSystem.dark().spacings.m,
        ),
        labeledBoxWidgetContentPadding = EdgeInsets.symmetric(
          vertical: WidgetToolkitDesignSystem.dark().spacings.m,
          horizontal: WidgetToolkitDesignSystem.dark().spacings.s,
        ),
        labeledBoxWidgetIconPadding = EdgeInsets.only(
            right: WidgetToolkitDesignSystem.dark().spacings.xs),
        labeledBoxWidgetOptionalTextPadding =
            EdgeInsets.only(right: WidgetToolkitDesignSystem.dark().spacings.m),
        inputTextFieldErrorPadding = EdgeInsets.only(
          left: WidgetToolkitDesignSystem.dark().spacings.m,
          top: WidgetToolkitDesignSystem.dark().spacings.xxxs,
        ),
        inputTextFieldIconPadding = EdgeInsets.only(
            right: WidgetToolkitDesignSystem.dark().spacings.xs),
        inputTextFieldIconDisabledPadding = EdgeInsets.only(
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

  /// Highlight fill signaling a completed edit journey on [EditFieldWidget] capsules inside `edit_field_widget.dart`.
  @override
  final Color editFieldSuccessBackground;
  /// Neutral fill for dormant edit capsules before reviewers expand them inside `edit_field_widget.dart`.
  @override
  final Color editFieldRegularBackground;
  /// Success halo applied to textured input canvases whenever [InputTextFieldStateModel.success] activates in `input_text_field.dart`.
  @override
  final Color inputFieldBackgroundSuccessColor;
  /// Surfaces beneath optional labeled rows inside `labeled_box_widget.dart`.
  @override
  final Color labelBoxOptionalBackground;
  /// Surfaces beneath required labeled rows that expect primary emphasis inside `labeled_box_widget.dart`.
  @override
  final Color labelBoxFilledBackground;

  /// Corner rounding shared by capsule editors and bordered inputs orchestrated inside `edit_field_widget.dart`.
  @override
  final double editFieldBorderRadius;
  /// Tight gutters around dot separators and intra-row gaps in `labeled_box_widget.dart` and `input_text_field.dart`.
  @override
  final double spacingXS;
  /// Micro vertical rhythm between captions and glyphs within `edit_field_widget.dart`.
  @override
  final double spacingXSS;
  /// Comfortable horizontal gutters between adornments managed in `edit_field_widget.dart` and `input_text_field.dart`.
  @override
  final double spacingS;
  /// Larger rhythm for dialog curvature math on `text_field_dialog_page.dart` when computing sheet corner radii.
  @override
  final double spacingM;
  /// Dialog-scale spacing token mirrored from the xl step on [DesignSystemSpacings] for hosts customizing stacked sections around `text_field_dialog_page.dart`.
  @override
  final double spacingXL;
  /// Hairline separators inside `labeled_box_widget.dart`.
  @override
  final double spacingXXXS;

  /// Auxiliary body style reused for hinted values on `edit_field_widget.dart` and subdued rows in form summaries.
  @override
  final TextStyle descriptionThin;
  /// Title treatment for headline rows on `text_field_dialog_page.dart`.
  @override
  final TextStyle titleBold;
  /// Semi-bold explanatory copy on `labeled_box_widget.dart` headings and anchored labels.
  @override
  final TextStyle descriptionBold;
  /// Caption labels on `labeled_box_widget.dart` chips and adornment badges.
  @override
  final TextStyle captionBold;
  /// Compact secondary copy leveraged for helper lines under validators in `input_text_field.dart`.
  @override
  final TextStyle smallThin;

  /// Disabled primary button fill surfaced when companion actions sit beside dialogs that collect field data.
  @override
  final Color disabledFilledButtonBackgroundColor;
  /// Tint applied to inline SVG glyphs such as the edit affordance rendered on `text_field_dialog_page.dart` and `text_field_dialog.dart`.
  @override
  final Color textFieldDialogIconColor;
  /// Outline stroke mapped to problematic validation transitions on `input_text_field.dart`.
  @override
  final Color inputFieldBorderErrorColor;
  /// Outline stroke when fields await structured input types inside `input_text_field.dart`.
  @override
  final Color inputFieldBorderTypeColor;
  /// Outline stroke for disabled-but-visible rows within `input_text_field.dart`.
  @override
  final Color inputFieldBorderDisabledColor;
  /// Outline stroke while spinner adornments occupy trailing slots inside `input_text_field.dart`.
  @override
  final Color inputFieldBorderLoadingColor;
  /// Outline stroke warning path before operators confirm risky edits in `input_text_field.dart`.
  @override
  final Color inputFieldBorderWarningColor;
  /// Value text tint for untouched enabled fields surfaced through `edit_field_widget.dart`.
  @override
  final Color inputFieldValueColor;
  /// Value tint when reviewers cannot mutate the row inside `edit_field_widget.dart`.
  @override
  final Color inputFieldValueDisabledColor;

  /// Leading label pigment for optional [LabeledBoxWidget] headings via `labeled_box_widget.dart`.
  @override
  final Color labelBoxOptionalPrimary;
  /// Leading label pigment for required headings within `labeled_box_widget.dart`.
  @override
  final Color labelBoxFilledPrimary;
  /// Secondary label pigment clarifying subtitles on optional headings in `labeled_box_widget.dart`.
  @override
  final Color labelBoxOptionalSecondary;
  /// Matching secondary pigment for filled headings inside `labeled_box_widget.dart`.
  @override
  final Color labelBoxFilledSecondary;
  /// Border stroke distinguishing optional bordered panels in `labeled_box_widget.dart`.
  @override
  final Color labelBoxOptionalBorder;
  /// Border stroke around emphasized filled headings in `labeled_box_widget.dart`.
  @override
  final Color labelBoxFilledBorder;

  /// Explicit override tint for captions after edits finalize; defaults to null so rows inherit typography-only styling within `edit_field_widget.dart`.
  @override
  final Color? editFieldLabelEditedColor;
  /// Label pigment when reviewers have yet to mutate a row inside `edit_field_widget.dart`.
  @override
  final Color editFieldLabelNotEditedColor;
  /// Label pigment while bloc-driven loading freezes interaction in `edit_field_widget.dart`.
  @override
  final Color editFieldLabelLoadingColor;
  /// Label pigment once validation glows green in `edit_field_widget.dart`.
  @override
  final Color editFieldLabelSuccessColor;
  /// Inline value pigment highlighting unsaved deltas in `edit_field_widget.dart`.
  @override
  final Color editFieldValueEditedColor;
  /// Baseline value pigment before edits begin in `edit_field_widget.dart`.
  @override
  final Color editFieldValueNotEditedColor;
  /// Value pigment while asynchronous work streams into the row in `edit_field_widget.dart`.
  @override
  final Color editFieldValueLoadingColor;
  /// Value pigment after server confirmation matches local edits in `edit_field_widget.dart`.
  @override
  final Color editFieldValueSuccessColor;

  /// Typography for edited captions within `edit_field_widget.dart`.
  @override
  final TextStyle editFieldTextEditedTextStyle;
  /// Typography for idle captions ahead of edits in `edit_field_widget.dart`.
  @override
  final TextStyle editFieldTextNotEditedTextStyle;
  /// Typography for spinner-backed captions in `edit_field_widget.dart`.
  @override
  final TextStyle editFieldTextLoadingTextStyle;
  /// Typography for success captions in `edit_field_widget.dart`.
  @override
  final TextStyle editFieldTextSuccessTextStyle;

  /// Default typography color inside enabled structured fields surfaced through extension methods on [InputTextFieldStateModel] near the bottom of `input_text_field.dart`.
  @override
  final Color inputFieldTextDefaultFieldColor;
  /// Disabled structured field typography color resolved through the same [InputTextFieldStateModel] extension in `input_text_field.dart`.
  @override
  final Color inputFieldTextDefaultDisabledColor;
  /// Muted typography for rows that temporarily lose interactivity modeled through those [InputTextFieldStateModel] helpers in `input_text_field.dart`.
  @override
  final Color inputFieldTextDisabledColor;
  /// Typography when validators fail, as returned from the color mapping on [InputTextFieldStateModel] in `input_text_field.dart`.
  @override
  final Color inputFieldTextErrorColor;
  /// Typography when rows collect committed values, as returned from the color mapping on [InputTextFieldStateModel] in `input_text_field.dart`.
  @override
  final Color inputFieldTextFilledColor;
  /// Typography while loaders borrow the row chrome, as returned from the color mapping on [InputTextFieldStateModel] in `input_text_field.dart`.
  @override
  final Color inputFieldTextLoadingColor;
  /// Typography on success transitions, as returned from the color mapping on [InputTextFieldStateModel] in `input_text_field.dart`.
  @override
  final Color inputFieldTextSuccessColor;
  /// Typography for typed-but-uncommitted states, as returned from the color mapping on [InputTextFieldStateModel] in `input_text_field.dart`.
  @override
  final Color inputFieldTextTypeColor;
  /// Typography for advisory warnings, as returned from the color mapping on [InputTextFieldStateModel] in `input_text_field.dart`.
  @override
  final Color inputFieldTextWarningColor;
  /// Typography for plain unstructured rows, as returned from the color mapping on [InputTextFieldStateModel] in `input_text_field.dart`.
  @override
  final Color inputFieldTextPlainColor;

  /// Background wash when structured fields accumulate user input according to the background selector on the [InputTextFieldStateModel] extension in `input_text_field.dart`.
  @override
  final Color inputFieldBackgroundFilledColor;
  /// Background wash for unstructured rows from the same helper in `input_text_field.dart`.
  @override
  final Color inputFieldBackgroundPlainColor;
  /// Elevated baseline fill tied to untouched structured rows from the same helper in `input_text_field.dart`.
  @override
  final Color inputFieldBackgroundDefaultFieldColor;
  /// Baseline fill for disabled structured rows from the same helper in `input_text_field.dart`.
  @override
  final Color inputFieldBackgroundDefaultDisabledColor;
  /// Neutral fill for default states before that helper resolves specialty colors in `input_text_field.dart`.
  @override
  final Color inputFieldBackgroundDefaultColor;

  /// Hint copy tone inside text areas orchestrated by `input_text_field.dart`.
  @override
  final Color inputFieldHintColor;
  /// Inline validation copy tone under fields within `input_text_field.dart`.
  @override
  final Color inputFieldErrorTextColor;

  /// Hosts override this asset when adding custom leading dismiss actions that should match toolkit dialog iconography.
  @override
  final SvgFile closeIcon;
  /// Asset mapped to destructive validator rows in `input_text_field.dart`.
  @override
  final SvgFile dangerIcon;
  /// Active trailing add affordance within `input_text_field.dart`.
  @override
  final SvgFile addIcon;
  /// Disabled trailing add affordance paired with locked rows in `input_text_field.dart`.
  @override
  final SvgFile addDisabledIcon;
  /// Directional affordance on idle edit capsules before reviewers commit inside `edit_field_widget.dart`.
  @override
  final SvgFile arrowRightSquareIcon;
  /// Primary inline edit glyph on `text_field_dialog_page.dart` and `edit_field_widget.dart`.
  @override
  final SvgFile editPenIcon;
  /// Advisory icon treatment for warning rows in `input_text_field.dart`.
  @override
  final SvgFile infoCircleIcon;
  /// Spinner replacement while submissions stream through `input_text_field.dart`.
  @override
  final SvgFile loadingIcon;
  /// Positive confirmation glyph when structured rows finish successfully within `input_text_field.dart`.
  @override
  final SvgFile tickCircleSuccessIcon;

  /// Outermost padding wrapping the scrollable column on `text_field_dialog_page.dart`.
  @override
  final EdgeInsets textFieldDialogPadding;
  /// Padding framing CTA rows under the field stack on `text_field_dialog_page.dart`.
  @override
  final EdgeInsets textFieldDialogButtonPadding;
  /// Padding aligning title rows and inline actions on `text_field_dialog_page.dart`.
  @override
  final EdgeInsets textFieldDialogHeaderPadding;
  /// Interior padding for text and icons inside `labeled_box_widget.dart`.
  @override
  final EdgeInsets labeledBoxWidgetContentPadding;
  /// Trailing inset before optional icons on `labeled_box_widget.dart`.
  @override
  final EdgeInsets labeledBoxWidgetIconPadding;
  /// Trailing inset before optional helper copy on `labeled_box_widget.dart`.
  @override
  final EdgeInsets labeledBoxWidgetOptionalTextPadding;
  /// Offset for inline validation copy below editors within `input_text_field.dart`.
  @override
  final EdgeInsets inputTextFieldErrorPadding;
  /// Trailing padding hosting active add icons on `input_text_field.dart`.
  @override
  final EdgeInsets inputTextFieldIconPadding;
  /// Padding variant when add icons appear disabled on `input_text_field.dart`.
  @override
  final EdgeInsets inputTextFieldIconDisabledPadding;
  /// Slot padding while loader icons spin within `input_text_field.dart`.
  @override
  final EdgeInsets inputTextFieldPaddingLoading;
  /// Slot padding when success icons appear within `input_text_field.dart`.
  @override
  final EdgeInsets inputTextFieldPaddingSuccess;
  /// Slot padding when warning icons appear within `input_text_field.dart`.
  @override
  final EdgeInsets inputTextFieldPaddingWarning;
  /// Slot padding when danger icons appear within `input_text_field.dart`.
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
