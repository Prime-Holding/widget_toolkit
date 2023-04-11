import 'package:flutter/material.dart';

class CallbackWidget extends StatelessWidget {
  final Function(String) onCreated;
  final Widget child;

  const CallbackWidget({
    required this.onCreated,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onCreated;
    });

    return child;
  }
}
