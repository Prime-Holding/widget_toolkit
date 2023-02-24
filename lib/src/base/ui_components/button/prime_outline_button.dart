import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/theme/prime_components_theme.dart';
import '../../models/button_state.dart';
import '../app_loading_indicator.dart';
import 'app_button_color_style.dart';

class PrimeOutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final dynamic iconLeft;
  final dynamic iconRight;
  final ButtonStateModel state;
  final PrimeButtonColorStyle? colorStyle;
  final double radius;
  final bool areIconsClose;
  final double elevation;

  PrimeOutlineButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.radius = 24,

    /// Provide an IconData or SvgPicture
    this.iconLeft,

    /// Provide an IconData or SvgPicture
    this.iconRight,
    this.state = ButtonStateModel.enabled,
    this.colorStyle,
    this.areIconsClose = false,
    this.elevation = 1,
  }) : super(key: key) {
    assert(iconLeft == null || iconLeft is IconData || iconLeft is SvgPicture);
    assert(
        iconRight == null || iconRight is IconData || iconRight is SvgPicture);
  }

  @override
  Widget build(BuildContext context) {
    final textColor = getTextColor(context);

    final textWidget = Container(
        padding: context.primeComponentsTheme.outlineButtonContentPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconLeft != null && iconLeft is IconData)
              Icon(iconLeft, color: textColor),
            if (iconLeft != null && iconLeft is SvgPicture) iconLeft,
            if (areIconsClose)
              SizedBox(
                width: context.primeComponentsTheme.spacingS,
              ),
            if (areIconsClose)
              Text(text,
                  textAlign: TextAlign.center,
                  style: context.primeComponentsTheme.outlineButtonTextStyle
                      .copyWith(color: textColor, letterSpacing: 0))
            else
              Expanded(
                  child: Text(text,
                      textAlign: TextAlign.center,
                      style: context.primeComponentsTheme
                          .outlineButtonDescriptionTextStyle
                          .copyWith(color: textColor, letterSpacing: 0))),
            if (iconRight != null && iconRight is IconData)
              Icon(iconRight, color: textColor),
            if (iconRight != null && iconRight is SvgPicture) iconRight,
          ],
        ));

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: _buildChild(context, textWidget),
    );
  }

  Widget _buildChild(BuildContext context, Widget text) {
    if (state == ButtonStateModel.loading) {
      return AppLoadingIndicator.textButtonValue();
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: colorStyle?.pressedColor ??
            context.primeComponentsTheme.outlineButtonForegroundColor,
        backgroundColor: colorStyle?.activeGradientColorStart ??
            context.primeComponentsTheme.outlineButtonBackgroundColor,
        padding: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: BorderSide(
            color: colorStyle?.borderColor ??
                context.primeComponentsTheme.outlineButtonBorderColor,
            width: 2.0,
          ),
        ),
        elevation: elevation,
      ),
      onPressed: onPressed,
      child: text,
    );
  }

  Color getInnerButtonColor(BuildContext context) {
    if (state != ButtonStateModel.disabled) {
      if (state == ButtonStateModel.pressed) {
        return colorStyle?.pressedColor ??
            context.primeComponentsTheme.outlineButtonPressedColor;
      } else {
        return context.primeComponentsTheme.outlineButtonBackgroundColor;
      }
    } else {
      return colorStyle?.activeGradientColorEnd ??
          context.primeComponentsTheme.outlineButtonBackgroundColor;
    }
  }

  Color getTextColor(BuildContext context) {
    if (state != ButtonStateModel.disabled) {
      return colorStyle?.activeButtonTextColor ??
          context.primeComponentsTheme.outlineButtonTextColor;
    } else {
      return context.primeComponentsTheme.outlineButtonTextColorDisabled;
    }
  }
}
