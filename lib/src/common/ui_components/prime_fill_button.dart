import 'package:flutter/material.dart';

import '../../base/ui_components/button/app_button_color_style.dart';
import '../../base/ui_components/button/app_fill_button.dart';

/// Button widget which can be used as a regular button or one with a gradient.
///
/// Besides the [text] and the [onPressed] method, you can also include one icon
/// on the left and right of the button by providing the [iconLeft] and the
/// [iconRight] parameters respectively.
class PrimeFillButton extends StatelessWidget {
  const PrimeFillButton({
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.iconLeft,
    this.iconRight,
    this.padding,
    this.colorStyle,
    this.areIconsClose = false,
    super.key,
  });

  /// The [text] value to be displayed
  final String text;

  /// Callback triggered once the button has been pressed
  final VoidCallback onPressed;

  /// The style of the [text]
  final TextStyle? textStyle;

  /// Icon displayed on the leftmost side
  final IconData? iconLeft;

  /// Icon displayed on the rightmost side
  final IconData? iconRight;

  /// The [colorStyle] of the button
  final PrimeButtonColorStyle? colorStyle;

  /// The padding around the content
  final EdgeInsets? padding;

  /// Flag indicating whether or not to place icons closer to the text
  final bool areIconsClose;

  @override
  Widget build(BuildContext context) => AppFillButton(
        text: text,
        onPressed: onPressed,
        textStyle: textStyle,
        iconLeft: iconLeft,
        iconRight: iconRight,
        padding: padding,
        areIconsClose: areIconsClose,
      );
}
