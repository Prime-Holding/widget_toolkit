import 'package:flutter/material.dart';
import 'auto_submit_widget.dart';
import 'pin_code_key.dart';

class PinCodeBiometricKeyWithAutoSubmit extends StatefulWidget {
  const PinCodeBiometricKeyWithAutoSubmit({
    required this.autoSubmit,
    required this.onPressedAutoSubmit,
    required this.onPressedDefault,
    required this.startWithAutoSubmit,
    this.withAutoSubmitOnInitState = true,
    this.isFingerScan = false,
    this.isFaceScan = false,
    this.isLoading = false,
    super.key,
  });

  final Function autoSubmit;
  final bool withAutoSubmitOnInitState;
  final bool isFingerScan;
  final bool startWithAutoSubmit;
  final bool isFaceScan;
  final bool isLoading;
  final void Function(int?) onPressedAutoSubmit;
  final void Function(int?) onPressedDefault;

  @override
  State<PinCodeBiometricKeyWithAutoSubmit> createState() =>
      _PinCodeBiometricKeyWithAutoSubmitState();
}

class _PinCodeBiometricKeyWithAutoSubmitState
    extends State<PinCodeBiometricKeyWithAutoSubmit> {
  bool isPressed = false;
  late bool startWithAutoSubmit;

  @override
  void initState() {
    startWithAutoSubmit = widget.startWithAutoSubmit;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant PinCodeBiometricKeyWithAutoSubmit oldWidget) {
    if (startWithAutoSubmit) {
      setState(() {
        startWithAutoSubmit = !startWithAutoSubmit;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) => startWithAutoSubmit
      ? AutoSubmitWidget(
          onAutoSubmit: () => widget.autoSubmit(),
          child: PinCodeKey(
            onPressed: widget.onPressedAutoSubmit,
            isFingerScan: widget.isFingerScan,
            isFaceScan: widget.isFaceScan,
            isLoading: widget.isLoading,
          ),
        )
      : PinCodeKey(
          onPressed: (_) => widget.onPressedDefault(_),
          isFingerScan: widget.isFingerScan,
          isFaceScan: widget.isFaceScan,
          isLoading: widget.isLoading,
          showDefaultIcon: true,
        );
}
