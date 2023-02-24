import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../asset_classes.dart';
import '../../../utils/theme/prime_components_theme.dart';
import '../../models/button_state.dart';
import '../app_icon.dart';
import '../app_loading_indicator.dart';
import 'app_button_color_style.dart';

enum SmallButtonType { filled, outline }

class AppSmallButton extends StatelessWidget {
  final String? tooltip;
  final VoidCallback onPressed;

  /// Provide an IconData or SvgPicture
  final dynamic icon;
  final ButtonStateModel state;
  final PrimeButtonColorStyle? colorStyle;
  final SmallButtonType type;

  AppSmallButton(
      {Key? key,
      this.tooltip,
      required this.onPressed,
      required this.icon,
      this.type = SmallButtonType.outline,
      this.state = ButtonStateModel.enabled,
      this.colorStyle})
      : super(key: key) {
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
                context.primeComponentsTheme.primaryGradientStart)
            .withOpacity(state == ButtonStateModel.pressed ? 0.5 : 1.0)

        //disabled
        : context.primeComponentsTheme.appFilledButtonTextColorDisabled;

    final colorGradientEnd = state != ButtonStateModel.disabled
        ? (colorStyle?.activeGradientColorEnd ??
                context.primeComponentsTheme.primaryGradientEnd)
            .withOpacity(state == ButtonStateModel.pressed ? 0.5 : 1.0)
        : context.primeComponentsTheme.appFilledButtonTextColorDisabled;

    var gradient = LinearGradient(colors: [
      color,
      colorGradientEnd,
    ]);

    final text = Ink(
      padding: context.primeComponentsTheme.smallEdgeInsets,
      decoration: BoxDecoration(
        color: state != ButtonStateModel.disabled
            ? context.primeComponentsTheme.appSmallButtonBackgroundColor
            : null,
        shape: BoxShape.circle,
        border: type == SmallButtonType.outline
            ? Border.all(
                color: color,
              )
            : null,
        gradient: type == SmallButtonType.filled ? gradient : null,
      ),
      child: AppIcon(
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
      return AppLoadingIndicator.textButtonValue();
    }

    switch (type) {
      case SmallButtonType.filled:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: primaryColor,
            backgroundColor: context
                .primeComponentsTheme.appSmallButtonFilledBackgroundColor,
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
              color: context
                  .primeComponentsTheme.appSmallButtonOutlinedBorderColor,
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
          ? context.primeComponentsTheme.appButtonTextColor
          : color;
}
