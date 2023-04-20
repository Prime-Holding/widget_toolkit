import 'package:flutter/material.dart';

class CallbackWidget extends StatefulWidget {
  final Function() onAutoSubmit;
  final Widget child;

  const CallbackWidget({
    required this.onAutoSubmit,
    required this.child,
    super.key,
  });

  @override
  State<CallbackWidget> createState() => _CallbackWidgetState();
}

class _CallbackWidgetState extends State<CallbackWidget> {
  @override
  void initState() {
    print('CallbackWidget initState');
    widget.onAutoSubmit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    // widget.onAutoSubmit();
    // });

    return widget.child;
  }
}
