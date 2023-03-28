import 'package:flutter/material.dart';

import '../../base/models/language_model.dart';
import '../../base/theme/widget_toolkit_theme.dart';
import '../../lib_ui_components/buttons/button_color_style.dart';
import '../../lib_ui_components/buttons/button_state.dart';
import '../../lib_ui_components/dynamic_icon.dart';
import '../../lib_ui_components/sized_loading_indicator.dart';
import '../models/selected_language_model.dart';
import '../theme/language_picker_theme.dart';

/// The class is used to display the [languageModel] in the list
/// of languages
///
/// The [onPressed] VoidCallback should be used to set the selected language
/// as the currently selected one in the LanguagePickerBloc
///
/// [code] is the shortly written language code, for example: for 'English', should be 'EN'
///
/// [state] receives the state of the button, it can be used to check whether the
/// button is loading and display a loading indicator instead of the right icon from
/// ButtonStateModel.loading
///
/// [languageModel] receives a selected language model, which has a language model
/// inside it. By the LanguageModel translate() method override in you project
/// you provide the logic to translate the name of the provided language in this
/// widget
///
/// [colorStyle] receives the color style of the button.
///
/// [radius] is the border radius of the button
class SelectLanguageItem extends StatelessWidget {
  final String languageKey;
  final String code;
  final VoidCallback? onPressed;
  final ButtonStateModel state;
  final ButtonColorStyle? colorStyle;
  final double radius;
  final SelectedLanguageModel languageModel;
  final bool isSelected;
  final String Function(LanguageModel) translate;

  const SelectLanguageItem._({
    Key? key,
    required this.languageKey,
    required this.code,
    required this.languageModel,
    required this.isSelected,
    required this.translate,
    this.onPressed,
    this.radius = 8,
    this.state = ButtonStateModel.enabled,
    this.colorStyle,
  }) : super(key: key);

  factory SelectLanguageItem.selected({
    Key? key,
    required String languageKey,
    required String code,
    required SelectedLanguageModel languageModel,
    required String Function(LanguageModel) translate,
    VoidCallback? onPressed,
    double radius = 8,
    ButtonStateModel state = ButtonStateModel.enabled,
    ButtonColorStyle? colorStyle,
  }) =>
      SelectLanguageItem._(
        languageKey: languageKey,
        code: code,
        languageModel: languageModel,
        isSelected: true,
        onPressed: onPressed,
        state: state,
        radius: radius,
        colorStyle: colorStyle,
        translate: translate,
        key: key,
      );

  factory SelectLanguageItem.unSelected({
    Key? key,
    required String languageKey,
    required String code,
    required SelectedLanguageModel languageModel,
    required String Function(LanguageModel) translate,
    VoidCallback? onPressed,
    double radius = 8,
    ButtonStateModel state = ButtonStateModel.enabled,
    ButtonColorStyle? colorStyle,
  }) =>
      SelectLanguageItem._(
        languageKey: languageKey,
        code: code,
        languageModel: languageModel,
        isSelected: false,
        onPressed: onPressed,
        state: state,
        radius: radius,
        colorStyle: colorStyle,
        translate: translate,
        key: key,
      );

  @override
  Widget build(BuildContext context) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: isSelected
            ? _buildActiveChild(context, _getTextWidget(context))
            : _buildInactiveChild(context, _getTextWidget(context)),
      );

  Widget _getTextWidget(BuildContext context) => isSelected
      ? Ink(
          decoration: BoxDecoration(
              gradient: _getGradient(context),
              borderRadius: BorderRadius.all(Radius.circular(radius))),
          child: Container(
            padding: context.languagePickerTheme.chooseLanguageActiveEdgeInsets,
            color: state == ButtonStateModel.pressed
                ? getPressedInnerBackgroundColor(context)
                : Colors.transparent,
            child: _buildContent(context),
          ))
      : Container(
          height: context.languagePickerTheme.spacingXXXXL1,
          padding: context.languagePickerTheme.chooseLanguageInactiveEdgeInsets,
          child: _buildContent(context),
        );

  Widget _buildContent(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: context.languagePickerTheme.spacingM,
          ),
          Text(
            code,
            style: context
                .languagePickerTheme.languageCodeInLanguagePickerTitleBold
                .copyWith(color: _getTextColor(context)),
          ),
          SizedBox(
            width: context.languagePickerTheme.spacingM,
          ),
          Expanded(
            child: Text(
              translate(languageModel.language),
              textAlign: TextAlign.left,
              style: context.languagePickerTheme.descriptionThin.copyWith(
                color: _getTextColor(context),
              ),
            ),
          ),
          if (state == ButtonStateModel.loading)
            SizedLoadingIndicator.textButtonValue(
                color: context.languagePickerTheme.textColorWhite),
          if (state != ButtonStateModel.loading && isSelected)
            DynamicIcon(
              context.languagePickerTheme.checkIcon,
              color: _getTextColor(context),
            ),
        ],
      );

  LinearGradient _getGradient(BuildContext context) =>
      state != ButtonStateModel.disabled
          ? LinearGradient(colors: [
              colorStyle?.activeGradientColorStart ??
                  context.languagePickerTheme.languageGradientStart,
              colorStyle?.activeGradientColorEnd ??
                  context.languagePickerTheme.languageGradientEnd,
            ])
          : LinearGradient(colors: [
              context.languagePickerTheme.filledButtonBackgroundColorDisabled,
              context.languagePickerTheme.filledButtonBackgroundColorDisabled,
            ]);

  Color _getTextColor(BuildContext context) =>
      state == ButtonStateModel.disabled
          ? context.languagePickerTheme.filledButtonTextColorDisabled
          : colorStyle?.activeButtonTextColor ??
              (isSelected
                  ? context.languagePickerTheme.buttonTextColor
                  : context.languagePickerTheme.bodyTextColor2);

  Color getPressedInnerBackgroundColor(BuildContext context) =>
      (colorStyle?.pressedColor ??
              context.widgetToolkitTheme.filledButtonBackgroundColorPressed)
          .withOpacity(0.5);

  Color getInnerButtonColor(BuildContext context) =>
      (state != ButtonStateModel.disabled)
          ? (state == ButtonStateModel.pressed)
              ? colorStyle?.pressedColor ??
                  context.languagePickerTheme.buttonBlueGradientEnd
              : context.languagePickerTheme.outlineButtonBackgroundColor
          : colorStyle?.activeGradientColorEnd ??
              context.languagePickerTheme.outlineButtonBackgroundColor;

  Widget _buildInactiveChild(BuildContext context, Widget text) =>
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: colorStyle?.pressedColor ??
              context.languagePickerTheme.buttonBlueGradientEnd,
          backgroundColor:
              context.languagePickerTheme.elevatedButtonBackgroundColor,
          padding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: BorderSide(
              color: context.languagePickerTheme.elevatedButtonBackgroundColor,
              width: 2.0,
            ),
          ),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: text,
      );

  Widget _buildActiveChild(BuildContext context, Widget text) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: colorStyle?.shadowColor == Colors.transparent
            ? null
            : [
                BoxShadow(
                  color: colorStyle?.shadowColor ??
                      context.languagePickerTheme.boxShadowColor
                          .withOpacity(0.2),
                  blurRadius: context.languagePickerTheme.spacingS,
                  spreadRadius: 0,
                  offset: const Offset(0, 4),
                ),
              ],
      ),
      child: TextButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        onPressed: null,
        child: text,
      ),
    );
  }
}
