import 'package:flutter/material.dart';
import 'pin_code_key.dart';

class PinCodeBiometricKey extends StatefulWidget {
  const PinCodeBiometricKey({
    required this.onPressedDefault,
    this.isFingerScan = false,
    this.isFaceScan = false,
    this.isLoading = false,
    super.key,
  });

  final bool isFingerScan;
  final bool isFaceScan;
  final bool isLoading;
  final void Function(int?) onPressedDefault;

  @override
  State<PinCodeBiometricKey> createState() => _PinCodeBiometricKeyState();
}

class _PinCodeBiometricKeyState extends State<PinCodeBiometricKey> {
  @override
  Widget build(BuildContext context) => PinCodeKey(
        onPressed: (key) => widget.onPressedDefault(key),
        isFingerScan: widget.isFingerScan,
        isFaceScan: widget.isFaceScan,
        isLoading: widget.isLoading,
        showDefaultIcon: true,
      );
}
