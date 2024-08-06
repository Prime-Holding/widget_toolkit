import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../asset_classes.dart';
import '../../base/theme/widget_toolkit_theme.dart';
import '../dynamic_icon.dart';
import '../sized_loading_indicator.dart';
import 'button_color_style.dart';
import 'button_state.dart';

enum SmallButtonType { filled, outline, icon }

class SmallButton extends StatelessWidget {
  final String? tooltip;
  final VoidCallback onPressed;

  /// Provide an IconData or SvgPicture
  final dynamic icon;
  final ButtonStateModel state;
  final ButtonColorStyle? colorStyle;
  final SmallButtonType type;

  SmallButton({
    required this.onPressed,
    required this.icon,
    this.tooltip,
    this.type = SmallButtonType.outline,
    this.state = ButtonStateModel.enabled,
    this.colorStyle,
    super.key,
  }) {
    assert(icon == null ||
        icon is IconData ||
        icon is SvgPicture ||
        icon is String ||
        icon is SvgFile);
  }

  @override
  Widget build(BuildContext context) {
    //2) normal, pressed, disabled

    final color = state != ButtonStateModel.disabled
        ?
        //pressed or normal
        (colorStyle?.activeGradientColorStart ??
                context.widgetToolkitTheme.primaryGradientStart)
            .withOpacity(state == ButtonStateModel.pressed ? 0.5 : 1.0)

        //disabled
        : context.widgetToolkitTheme.filledButtonTextColorDisabled;

    final colorGradientEnd = state != ButtonStateModel.disabled
        ? (colorStyle?.activeGradientColorEnd ??
                context.widgetToolkitTheme.primaryGradientEnd)
            .withOpacity(state == ButtonStateModel.pressed ? 0.5 : 1.0)
        : context.widgetToolkitTheme.filledButtonTextColorDisabled;

    var gradient = LinearGradient(colors: [
      color,
      colorGradientEnd,
    ]);

    final icon = state == ButtonStateModel.loading
        ? SizedLoadingIndicator.textButtonValue()
        : DynamicIcon(
            this.icon,
            color: colorStyle?.activeButtonTextColor ??
                getColorByType(color, context),
            semanticLabel: tooltip,
          );

    final text = Ink(
      padding: context.widgetToolkitTheme.smallButtonPadding,
      decoration: BoxDecoration(
        color: state != ButtonStateModel.disabled
            ? context.widgetToolkitTheme.smallButtonBackgroundColor
            : null,
        shape: BoxShape.circle,
        border: type == SmallButtonType.outline
            ? Border.all(
                color: color,
              )
            : null,
        gradient: type == SmallButtonType.filled ? gradient : null,
      ),
      child: icon,
    );

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: _buildChild(context, text, color),
    );
  }

  Widget _buildChild(BuildContext context, Widget icon, Color primaryColor) {
    switch (type) {
      case SmallButtonType.filled:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: primaryColor,
            backgroundColor:
                context.widgetToolkitTheme.smallButtonFilledBackgroundColor,
            padding: const EdgeInsets.all(0),
            shape: const CircleBorder(),
            fixedSize: const Size(48, 48),
          ),
          onPressed: onPressed,
          child: icon,
        );
      case SmallButtonType.outline:
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            side: BorderSide(
              width: 2,
              color: context.widgetToolkitTheme.smallButtonOutlinedBorderColor,
            ),
            shape: const CircleBorder(),
            fixedSize: const Size(48, 48),
          ),
          onPressed: onPressed,
          child: icon,
        );
      case SmallButtonType.icon:
        return Material(
          shape: CircleBorder(
            side: BorderSide(
              color: context.widgetToolkitTheme.smallButtonBackgroundColor,
              width: 0,
            ),
          ),
          color: primaryColor,
          child: Ink(
            decoration: ShapeDecoration(
              color: context.widgetToolkitTheme.smallButtonBackgroundColor,
              shape: const CircleBorder(),
            ),
            child: IconButton(
              style: IconButton.styleFrom(
                padding: const EdgeInsets.all(0),
                shape: const CircleBorder(),
                fixedSize: const Size(48, 48),
              ),
              icon: icon,
              onPressed: onPressed,
            ),
          ),
        );
    }
  }

  Color getColorByType(Color color, BuildContext context) =>
      type == SmallButtonType.filled
          ? context.widgetToolkitTheme.buttonTextColor
          : color;
}
