import 'package:flutter/material.dart';

class CallbackWidget extends StatelessWidget {
  final Function() onAutoSubmit;
  final Widget child;

  const CallbackWidget({
    required this.onAutoSubmit,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onAutoSubmit();
    });

    return child;
  }
}
