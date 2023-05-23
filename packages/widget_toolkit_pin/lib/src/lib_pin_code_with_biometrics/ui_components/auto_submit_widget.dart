import 'package:flutter/material.dart';

class AutoSubmitWidget extends StatefulWidget {
  final Function() onAutoSubmit;
  final Widget child;

  const AutoSubmitWidget({
    required this.onAutoSubmit,
    required this.child,
    super.key,
  });

  @override
  State<AutoSubmitWidget> createState() => _AutoSubmitWidgetState();
}

class _AutoSubmitWidgetState extends State<AutoSubmitWidget> {
  @override
  void initState() {
    widget.onAutoSubmit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
