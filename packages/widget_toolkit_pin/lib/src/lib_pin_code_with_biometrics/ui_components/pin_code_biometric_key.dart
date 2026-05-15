import 'package:flutter/material.dart';
import 'pin_code_key.dart';

/// Convenience wrapper around [PinCodeKey] that always shows the face-scan glyph path while
/// forwarding biometric tap handling to the bloc from `pin_code_component.dart`.
class PinCodeBiometricKey extends StatefulWidget {
  const PinCodeBiometricKey({
    required this.onPressedDefault,
    this.isFingerScan = false,
    this.isFaceScan = false,
    this.isLoading = false,
    super.key,
  });

  /// When true, [PinCodeKey] renders fingerprint artwork; when false and [isFaceScan] is false,
  /// the key still shows face glyphs because [PinCodeKey.showDefaultIcon] is forced to true in
  /// the build method below.
  final bool isFingerScan;
  /// When true, [PinCodeKey] renders face artwork using the pressed and idle icons from
  /// [PinCodeTheme].
  final bool isFaceScan;
  /// Mirrors the loading opacity behavior on [PinCodeKey] while biometric unlock waits on the
  /// platform prompt or on [PinCodeService.verifyPinCode].
  final bool isLoading;
  /// Handler wired to [PinCodeBlocEvents.biometricsButtonPressed] after the inner [PinCodeKey]
  /// validates taps.
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
