import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';

import '../../theme/widget_toolkit_theme.dart';

part 'button_color_style.g.dart';

/// Config class used for setting up colors of the different states of the buttons
@CopyWith()
class ButtonColorStyle {
  const ButtonColorStyle({
    required this.activeButtonTextColor,
    required this.disabledButtonTextColor,
    required this.activeGradientColorStart,
    required this.activeGradientColorEnd,
    required this.shadowColor,
    required this.pressedColor,
    required this.borderColor,
  });

  factory ButtonColorStyle.fromContext(
    BuildContext context, {
    Color? activeButtonTextColor,
    Color? disabledButtonTextColor,
    Color? activeGradientColorStart,
    Color? activeGradientColorEnd,
    Color? shadowColor,
    Color? pressedColor,
    Color? borderColor,
  }) =>
      ButtonColorStyle(
        activeButtonTextColor: activeButtonTextColor ??
            context.widgetToolkitTheme.activeButtonTextColor,
        disabledButtonTextColor: disabledButtonTextColor ??
            context.widgetToolkitTheme.disabledButtonTextColor,
        activeGradientColorStart: activeGradientColorStart ??
            context.widgetToolkitTheme.activeGradientColorStart,
        activeGradientColorEnd: activeGradientColorEnd ??
            context.widgetToolkitTheme.activeGradientColorEnd,
        shadowColor:
            shadowColor ?? context.widgetToolkitTheme.buttonShadowColor,
        pressedColor:
            pressedColor ?? context.widgetToolkitTheme.buttonPressedColor,
        borderColor:
            borderColor ?? context.widgetToolkitTheme.buttonBorderColor,
      );

  final Color activeButtonTextColor;
  final Color disabledButtonTextColor;
  final Color activeGradientColorStart;
  final Color activeGradientColorEnd;
  final Color shadowColor;
  final Color pressedColor;
  final Color borderColor;
}
