import 'package:flutter/material.dart';

import '../../base/utils/theme/pin_code_theme.dart';
import '../../base/utils/utils.dart';

class PinCodeDeleteKey extends StatefulWidget {
  const PinCodeDeleteKey({
    this.isLoading = false,
    required this.onTap,
    super.key,
  });

  /// When true, the key renders with reduced opacity while [PinCodeService.verifyPinCode] or
  /// related work keeps the [PinCodeKeyboard] in a busy state.
  final bool isLoading;
  /// Handler invoked on tap down; the bloc subtracts the last digit when this widget replaces
  /// the bottom-right affordance during entry in `pin_code_component.dart`.
  final void Function() onTap;

  @override
  PinCodeDeleteKeyState createState() => PinCodeDeleteKeyState();
}

class PinCodeDeleteKeyState extends State<PinCodeDeleteKey> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTapDown: (_) {
          setState(() {
            isPressed = true;
          });
          widget.onTap();
        },
        onTapUp: (_) => setState(() {
          isPressed = false;
        }),
        child: Opacity(
          opacity: widget.isLoading ? 0.5 : 1,
          child: SizedBox(
            height: calculateKeyboardButtonSize(context),
            width: calculateKeyboardButtonSize(context),
            child: Center(
              child: isPressed
                  ? context.pinCodeTheme.pinDeleteActionIcon
                  : context.pinCodeTheme.pinDeleteDefaultIcon,
            ),
          ),
        ),
      );
}
