import 'package:flutter/material.dart';

import '../../base/utils/utils.dart';

class PinCodeCustomKey extends StatefulWidget {
  const PinCodeCustomKey({
    required this.buildChild,
    required this.onTap,
    this.isLoading = false,
    Key? key,
  }) : super(key: key);

  final bool isLoading;
  final void Function() onTap;
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
