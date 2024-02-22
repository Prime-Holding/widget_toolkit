import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../asset_classes.dart';
import '../../base/theme/widget_toolkit_theme.dart';
import '../dynamic_icon.dart';
import '../sized_loading_indicator.dart';
import 'button_color_style.dart';
import 'button_state.dart';

enum SmallButtonType { filled, outline }

class SmallButton extends StatelessWidget {
  final String? tooltip;
  final VoidCallback onPressed;

  /// Provide an IconData or SvgPicture
  final dynamic icon;
  final ButtonStateModel state;
  final ButtonColorStyle? colorStyle;
  final SmallButtonType type;

  SmallButton({
    this.tooltip,
    required this.onPressed,
    required this.icon,
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

    final text = Ink(
      padding: context.widgetToolkitTheme.smallEdgeInsets,
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
      child: DynamicIcon(
        icon,
        color:
            colorStyle?.activeButtonTextColor ?? getColorByType(color, context),
        semanticLabel: tooltip,
      ),
    );

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: _buildChild(context, text, color),
    );
  }

  Widget _buildChild(BuildContext context, Widget icon, Color primaryColor) {
    if (state == ButtonStateModel.loading) {
      return SizedLoadingIndicator.textButtonValue();
    }

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
    }
  }

  Color getColorByType(Color color, BuildContext context) =>
      type == SmallButtonType.filled
          ? context.widgetToolkitTheme.buttonTextColor
          : color;
}
