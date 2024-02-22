import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../base/theme/widget_toolkit_theme.dart';
import '../dynamic_icon.dart';
import '../sized_loading_indicator.dart';
import 'button_color_style.dart';
import 'button_state.dart';

class OutlineFillButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final dynamic iconLeft;
  final dynamic iconRight;
  final ButtonStateModel state;
  final ButtonColorStyle? colorStyle;
  final double radius;
  final bool areIconsClose;
  final double elevation;

  OutlineFillButton({
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
    super.key,
  }) {
    assert(iconLeft == null || iconLeft is IconData || iconLeft is SvgPicture);
    assert(
        iconRight == null || iconRight is IconData || iconRight is SvgPicture);
  }

  @override
  Widget build(BuildContext context) {
    final textColor = getTextColor(context);

    final textWidget = Container(
        padding: context.widgetToolkitTheme.outlineButtonContentPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconLeft != null) DynamicIcon(iconLeft, color: textColor),
            if (areIconsClose)
              SizedBox(
                width: context.widgetToolkitTheme.spacingS,
              ),
            if (areIconsClose)
              Text(text,
                  textAlign: TextAlign.center,
                  style: context.widgetToolkitTheme.outlineButtonTextStyle
                      .copyWith(color: textColor, letterSpacing: 0))
            else
              Expanded(
                  child: Text(text,
                      textAlign: TextAlign.center,
                      style: context
                          .widgetToolkitTheme.outlineButtonDescriptionTextStyle
                          .copyWith(color: textColor, letterSpacing: 0))),
            if (iconRight != null) DynamicIcon(iconRight, color: textColor),
          ],
        ));

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: _buildChild(context, textWidget),
    );
  }

  Widget _buildChild(BuildContext context, Widget text) {
    if (state == ButtonStateModel.loading) {
      return SizedLoadingIndicator.textButtonValue();
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: colorStyle?.pressedColor ??
            context.widgetToolkitTheme.outlineButtonForegroundColor,
        backgroundColor: colorStyle?.activeGradientColorStart ??
            context.widgetToolkitTheme.outlineButtonBackgroundColor,
        padding: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: BorderSide(
            color: colorStyle?.borderColor ??
                context.widgetToolkitTheme.outlineButtonBorderColor,
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
            context.widgetToolkitTheme.outlineButtonPressedColor;
      } else {
        return context.widgetToolkitTheme.outlineButtonBackgroundColor;
      }
    } else {
      return colorStyle?.activeGradientColorEnd ??
          context.widgetToolkitTheme.outlineButtonBackgroundColor;
    }
  }

  Color getTextColor(BuildContext context) {
    if (state != ButtonStateModel.disabled) {
      return colorStyle?.activeButtonTextColor ??
          context.widgetToolkitTheme.outlineButtonTextColor;
    } else {
      return context.widgetToolkitTheme.outlineButtonTextColorDisabled;
    }
  }
}
