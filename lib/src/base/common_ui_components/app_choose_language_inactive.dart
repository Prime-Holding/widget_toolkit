import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../asset_classes.dart';
import '../../lib_language_picker/models/selected_language_model.dart';
import '../../lib_language_picker/theme/language_picker_theme.dart';
import 'app_icon.dart';
import 'app_loading_indicator.dart';
import 'buttons/app_button_color_style.dart';
import 'buttons/button_state.dart';

/// The class is used to display the inactive(not selected) [languageModel] in the list
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
/// button is loading and display a loading indicator instead of the right icon.
///
/// [languageModel] receives a selected language model, which has a language model
/// inside it. By the LanguageModel translate() method override in you project
/// you provide the logic to translate the name of the provided language in this
/// widget
///
/// [colorStyle] receives the color style of the button.
///
/// [radius] is the border radius of the button
class AppChooseLanguageInactive extends StatelessWidget {
  final String languageKey;
  final String code;
  final VoidCallback? onPressed;
  final dynamic iconLeft;
  final dynamic iconRight;
  final ButtonStateModel state;
  final PrimeButtonColorStyle? colorStyle;
  final double radius;
  final SelectedLanguageModel languageModel;

  AppChooseLanguageInactive(
      {Key? key,
      required this.languageKey,
      required this.code,
      required this.languageModel,
      this.onPressed,
      this.radius = 8,

      /// Provide an IconData or SvgPicture
      this.iconLeft,

      /// Provide an IconData or SvgPicture
      this.iconRight,
      this.state = ButtonStateModel.enabled,
      this.colorStyle})
      : super(key: key) {
    assert(iconLeft == null || iconLeft is IconData || iconLeft is SvgPicture);
    assert(iconRight == null ||
        iconRight is IconData ||
        iconRight is SvgPicture ||
        iconRight is SvgFile);
  }

  @override
  Widget build(BuildContext context) {
    final textColor = getTextColor(context);

    final textWidget = Container(
        height: context.languagePickerTheme.spacingXXXXL1,
        padding: context.languagePickerTheme.chooseLanguageInactiveEdgeInsets,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (iconLeft != null && iconLeft is IconData)
              Icon(iconLeft, color: textColor),
            if (iconLeft != null && iconLeft is SvgPicture) iconLeft,
            Text(
              code,
              style: context
                  .languagePickerTheme.languageCodeInLanguagePickerTitleBold
                  .copyWith(color: context.languagePickerTheme.bodyTextColor2),
            ),
            SizedBox(
              width: context.languagePickerTheme.spacingM,
            ),
            Expanded(
                child: Text(languageModel.language.translate(context),
                    textAlign: TextAlign.left,
                    style: context.languagePickerTheme.descriptionThin
                        .copyWith(color: textColor))),
            if (state == ButtonStateModel.loading)
              AppLoadingIndicator.textButtonValue(
                color:
                    context.languagePickerTheme.textButtonLoadingIndicatorColor,
              ),
            if (state != ButtonStateModel.loading) AppIcon(iconRight),
          ],
        ));

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: _buildChild(context, textWidget),
    );
  }

  Widget _buildChild(BuildContext context, Widget text) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: colorStyle?.pressedColor ??
              context.languagePickerTheme.buttonBlueGradientEnd,
          backgroundColor:
              context.languagePickerTheme.elevatedButtonBackgroundColor,
          padding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
              side: BorderSide(
                color:
                    context.languagePickerTheme.elevatedButtonBackgroundColor,
                width: 2.0,
              )),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: text,
      );

  Color getInnerButtonColor(BuildContext context) {
    if (state != ButtonStateModel.disabled) {
      if (state == ButtonStateModel.pressed) {
        return colorStyle?.pressedColor ??
            context.languagePickerTheme.buttonBlueGradientEnd;
      } else {
        return context.languagePickerTheme.appOutlineButtonBackgroundColor;
      }
    } else {
      return colorStyle?.activeGradientColorEnd ??
          context.languagePickerTheme.appOutlineButtonBackgroundColor;
    }
  }

  Color getTextColor(BuildContext context) {
    if (state != ButtonStateModel.disabled) {
      return colorStyle?.activeButtonTextColor ??
          context.languagePickerTheme.buttonTextColor;
    } else {
      return context.languagePickerTheme.appFilledButtonTextColorDisabled;
    }
  }
}
