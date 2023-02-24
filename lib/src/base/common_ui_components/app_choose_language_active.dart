import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../language_picker.dart';
import 'app_loading_indicator.dart';
import 'buttons/app_button_color_style.dart';
import 'buttons/button_state.dart';

/// The class is used to display the active(selected) [languageModel] in the list
/// of languages
///
/// The [onPressed] VoidCallback should be used to set the selected language
/// as the currently selected one in the LanguagePickerBloc
///
/// [code] is the shortly written language code, for example: for 'English', should be 'EN'
///
/// [iconLeft] can receive an icon, which should stay on the left side of the widget.
/// By default there is no such icon, for example, it can be a check icon.
///
/// [iconRight] can receive an icon, which should stay on the right side of the widget
/// By default there is no such icon.
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
class AppChooseLanguage extends StatelessWidget {
  final String languageKey;
  final String code;
  final VoidCallback? onPressed;
  final dynamic iconLeft;
  final dynamic iconRight;
  final ButtonStateModel state;
  final PrimeButtonColorStyle? colorStyle;
  final double radius;
  final SelectedLanguageModel languageModel;

  AppChooseLanguage({
    Key? key,
    required this.languageKey,
    required this.code,
    this.onPressed,
    this.radius = 8,

    /// Provide an IconData or SvgPicture
    this.iconLeft,

    /// Provide an IconData or SvgPicture
    this.iconRight,
    this.state = ButtonStateModel.enabled,
    this.colorStyle,
    required this.languageModel,
  }) : super(key: key) {
    assert(iconLeft == null || iconLeft is IconData || iconLeft is SvgPicture);
    assert(iconRight == null ||
        iconRight is IconData ||
        iconRight is SvgPicture ||
        iconRight is SvgFile);
  }

  @override
  Widget build(BuildContext context) {
    final gradient = state != ButtonStateModel.disabled
        ? LinearGradient(colors: [
            colorStyle?.activeGradientColorStart ??
                context.languagePickerTheme.languageGradientRedStart,
            colorStyle?.activeGradientColorEnd ??
                context.languagePickerTheme.languageGradientRedEnd,
          ])
        : LinearGradient(colors: [
            context.languagePickerTheme.filledButtonBackgroundColorDisabled,
            context.languagePickerTheme.filledButtonBackgroundColorDisabled,
          ]);

    final textColor = state != ButtonStateModel.disabled
        ? colorStyle?.activeButtonTextColor ??
            context.languagePickerTheme.buttonTextColor
        : context.languagePickerTheme.appFilledButtonTextColorDisabled;

    final textWidget = Ink(
      decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.all(Radius.circular(radius))),
      child: Container(
        padding: context.languagePickerTheme.chooseLanguageActiveEdgeInsets,
        color: state == ButtonStateModel.pressed
            ? getPressedInnerBackgroundColor(context)
            : Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconLeft != null && iconLeft is IconData) Icon(iconLeft),
            if (iconLeft != null && iconLeft is SvgPicture) iconLeft,
            Text(
              code,
              style: context
                  .languagePickerTheme.languageCodeInLanguagePickerTitleBold
                  .copyWith(color: context.languagePickerTheme.textColorWhite),
            ),
            SizedBox(
              width: context.languagePickerTheme.spacingM,
            ),
            Expanded(
              child: Text(languageModel.language.translate(context),
                  textAlign: TextAlign.left,
                  style: context.languagePickerTheme.descriptionThin.copyWith(
                    color: textColor,
                  )),
            ),
            if (state == ButtonStateModel.loading)
              AppLoadingIndicator.textButtonValue(
                  color: context.languagePickerTheme.textColorWhite),
            if (iconRight != null &&
                iconRight is IconData &&
                state != ButtonStateModel.loading)
              Icon(iconRight),
            if (iconRight != null &&
                (iconRight is SvgPicture || iconRight is SvgFile) &&
                state != ButtonStateModel.loading)
              iconRight
          ],
        ),
      ),
    );

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: _buildChild(context, textWidget),
    );
  }

  Widget _buildChild(BuildContext context, Widget text) {
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
        onPressed: onPressed,
        child: text,
      ),
    );
  }

  Color getPressedInnerBackgroundColor(context) => (colorStyle?.pressedColor ??
          context.designSystem.colors.procreditGradientRedEnd)
      .withOpacity(0.5);
}
