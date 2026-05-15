import 'package:flutter/material.dart';

import '../../base/utils/utils.dart';

class PinCodeCustomKey extends StatefulWidget {
  const PinCodeCustomKey({
    required this.buildChild,
    required this.onTap,
    this.isLoading = false,
    super.key,
  });

  /// When true, the entire key fades to half opacity so users know auto-submit or
  /// verification is still running on [PinCodeKeyboard].
  final bool isLoading;
  /// Called on tap down after the internal pressed flag flips, allowing hosts to wire custom
  /// backspace, biometric, or auxiliary actions in place of the defaults in
  /// `pin_code_component.dart`.
  final void Function() onTap;
  /// Builds the visible child for each press state; the boolean argument mirrors the gesture
  /// lifecycle used by the stock delete and biometric keys in `pin_code_component.dart`.
  final Widget Function(bool isPressed) buildChild;

  @override
  PinCodeCustomKeyState createState() => PinCodeCustomKeyState();
}

class PinCodeCustomKeyState extends State<PinCodeCustomKey> {
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
              child: Center(child: widget.buildChild(isPressed)),
            )),
      );
}
