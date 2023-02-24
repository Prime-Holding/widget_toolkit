import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../utils/theme/prime_components_theme.dart';
import '../../models/button_state.dart';
import '../app_loading_indicator.dart';
import 'app_button_color_style.dart';

/// Button widget which can be used as a regular button or one with a gradient.
///
/// Besides the [text] and the [onPressed] method, you can also include one icon
/// on the left and right of the button by providing the [iconLeft] and the
/// [iconRight] parameters respectively.
class AppFillButton extends StatelessWidget {
  const AppFillButton({
    required this.text,
    required this.onPressed,
    this.radius = 32,
    this.elevation = 32,
    this.padding,
    this.iconLeft,
    this.iconRight,
    this.state = ButtonStateModel.enabled,
    this.colorStyle,
    this.textStyle,
    this.areIconsClose = false,
    super.key,
  });

  /// The [text] value to be displayed
  final String text;

  /// Callback triggered once the button has been pressed
  final VoidCallback? onPressed;

  /// Icon displayed on the leftmost side
  final IconData? iconLeft;

  /// Icon displayed on the rightmost side
  final IconData? iconRight;

  /// The button state
  final ButtonStateModel state;

  /// The [colorStyle] of the button
  final PrimeButtonColorStyle? colorStyle;

  /// The [elevation] of the button
  final double elevation;

  /// The [radius] of the button corner
  final double radius;

  /// Flag indicating whether or not to place icons closer to the text
  final bool areIconsClose;

  /// The padding around the content
  final EdgeInsets? padding;

  /// The style of the [text]
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final gradient = activeState()
        ? LinearGradient(
            colors: [
              activeGradientColorStart(context),
              colorStyle?.activeGradientColorEnd ??
                  context.primeComponentsTheme.primaryGradientEnd,
            ],
            transform: const GradientRotation((16.94 * math.pi) / 180),
          )
        : LinearGradient(colors: [
            context.primeComponentsTheme.appFilledButtonBackgroundColorDisabled,
            context.primeComponentsTheme.appFilledButtonBackgroundColorDisabled,
          ]);

    final textColor = activeState()
        ? colorStyle?.activeButtonTextColor ??
            context.primeComponentsTheme.appFilledButtonTextColorEnabled
        : context.primeComponentsTheme.appFilledButtonTextColorDisabled;

    final textWidget = Ink(
      decoration: BoxDecoration(
        gradient: padding != null ? null : gradient,
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ),
      child: Container(
        padding: padding != null
            ? EdgeInsets.zero
            : context.primeComponentsTheme.mediumEdgeInsets,
        color: state == ButtonStateModel.pressed
            ? getPressedInnerBackgroundColor(context)
            : Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: padding != null ? MainAxisSize.min : MainAxisSize.max,
          children: [
            if (state == ButtonStateModel.loading)
              AppLoadingIndicator.textButtonValue(color: textColor),
            if (state == ButtonStateModel.loading) const SizedBox(width: 12),
            if (iconLeft != null &&
                iconLeft is IconData &&
                state != ButtonStateModel.loading)
              Icon(iconLeft),
            if (areIconsClose) const SizedBox(width: 12),
            if (areIconsClose || padding != null)
              _buildTextWithColor(context, textColor)
            else
              Expanded(
                child: _buildTextWithColor(context, textColor),
              ),
            if (iconRight != null && iconRight is IconData) Icon(iconRight),
          ],
        ),
      ),
    );

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child:
          _buildChild(context, textWidget, activeGradientColorStart(context)),
    );
  }

  Color getPressedInnerBackgroundColor(context) => (colorStyle?.pressedColor ??
          context.designSystem.colors.procreditGradientRedEnd)
      .withOpacity(0.5);

  /// region Builders

  Widget _buildTextWithColor(BuildContext context, Color color) => Text(
        text,
        textAlign: TextAlign.center,
        style: textStyle?.copyWith(color: color) ??
            context.primeComponentsTheme.descriptionBold.copyWith(
              color: color,
            ),
      );

  Widget _buildChild(
    BuildContext context,
    Widget text,
    Color primary,
  ) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        padding: padding ?? EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        elevation: activeState() ? elevation : 0,
        shadowColor: activeGradientColorStart(context).withOpacity(0.2),
      ),
      onPressed: (state == ButtonStateModel.loading) ? null : onPressed,
      child: text,
    );
  }

  Color activeGradientColorStart(BuildContext context) =>
      colorStyle?.activeGradientColorStart ??
      context.primeComponentsTheme.primaryGradientStart;

  bool activeState() =>
      state != ButtonStateModel.disabled && state != ButtonStateModel.loading;

  /// endregion
}
