import 'package:flutter/material.dart';

import '../../base/theme/widget_toolkit_theme.dart';
import '../sized_loading_indicator.dart';
import 'button_color_style.dart';
import 'button_state.dart';

enum IconTextButtonAppearance { regular, appBar }

class IconTextButton extends StatelessWidget {
  const IconTextButton({
    required this.text,
    required this.onPressed,
    this.colorStyle,
    this.textStyle,
    this.icon,
    this.iconColor,
    this.appearance = IconTextButtonAppearance.regular,
    this.state = ButtonStateModel.enabled,
    this.splashEffectEnabled = false,
    super.key,
  });

  /// The text to be displayed
  final String text;

  /// The callback triggered once the button has been pressed
  final VoidCallback? onPressed;

  /// The current state of the button
  final ButtonStateModel state;

  /// The color style of the button
  final ButtonColorStyle? colorStyle;

  /// The text style of the [text]
  final TextStyle? textStyle;

  /// The color of the icon
  final Color? iconColor;

  /// Provide an IconData or other widget
  final dynamic icon;

  /// The appearance of the button
  final IconTextButtonAppearance appearance;

  /// Flag indicating the displaying of the splash effect
  final bool splashEffectEnabled;

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ButtonStyle(
      splashFactory: !splashEffectEnabled ? NoSplash.splashFactory : null,
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed) ||
            state == ButtonStateModel.pressed) {
          return colorStyle?.pressedColor ??
              context.widgetToolkitTheme.gradientRedEnd;
        }
        return colorStyle?.activeGradientColorStart ??
            context.widgetToolkitTheme.textButtonBackgroundColor;
      }),
    );
    final button = TextButton(
      style: buttonStyle,
      onPressed: state != ButtonStateModel.disabled ? onPressed : null,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _buildChild(context),
      ),
    );

    if (appearance == IconTextButtonAppearance.appBar) {
      return Padding(
        padding: EdgeInsets.only(
            right: context.widgetToolkitTheme.appBarTextButtonPadding),
        child: button,
      );
    }
    return button;
  }

  Widget _buildChild(BuildContext context) {
    if (state == ButtonStateModel.loading) {
      return SizedLoadingIndicator.textButtonValue(
        color: iconColor ?? getTextColor(context),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.widgetToolkitTheme.textButtonPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null && icon is IconData)
            Icon(
              icon,
              color: getIconColor(context),
            ),
          if (icon != null && icon is! IconData) icon,
          if (icon != null)
            SizedBox(
              width: context.widgetToolkitTheme.textButtonIconRightPadding,
            ),
          Text(text,
              textAlign: appearance == IconTextButtonAppearance.appBar
                  ? TextAlign.right
                  : TextAlign.center,
              style:
                  (textStyle ?? context.widgetToolkitTheme.textButtonTextStyle)
                      .copyWith(color: getTextColor(context)))
        ],
      ),
    );
  }

  Color getTextColor(BuildContext context) {
    if (state != ButtonStateModel.disabled) {
      return colorStyle?.activeButtonTextColor ??
          context.widgetToolkitTheme.activeButtonTextColor;
    } else {
      return colorStyle?.disabledButtonTextColor ??
          context.widgetToolkitTheme.textButtonTextColorDisabled;
    }
  }

  Color getIconColor(BuildContext context) {
    if (state != ButtonStateModel.disabled) {
      return textStyle?.color ?? getTextColor(context);
    } else {
      return iconColor ?? (textStyle?.color ?? getTextColor(context));
    }
  }
}
