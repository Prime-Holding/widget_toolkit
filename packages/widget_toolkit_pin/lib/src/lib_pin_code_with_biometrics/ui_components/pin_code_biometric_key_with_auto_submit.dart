import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../blocs/pin_code_bloc.dart';
import 'auto_submit_widget.dart';
import 'pin_code_key.dart';

class PinCodeBiometricKeyWithAutoSubmit extends StatefulWidget {
  const PinCodeBiometricKeyWithAutoSubmit({
    required this.onPressed,
    required this.localizedReason,
    this.withAutoSubmitOnInitState = true,
    this.number,
    this.isFingerScan = false,
    this.isFaceScan = false,
    this.isLoading = false,
    this.showDefaultIcon = false,
    super.key,
  });

  final bool withAutoSubmitOnInitState;
  final int? number;
  final bool isFingerScan;
  final bool isFaceScan;
  final bool isLoading;
  final String localizedReason;

  /// Shows the face scan icon if set to true
  final bool showDefaultIcon;
  final void Function(int?) onPressed;

  @override
  State<PinCodeBiometricKeyWithAutoSubmit> createState() =>
      _PinCodeBiometricKeyWithAutoSubmitState();
}

class _PinCodeBiometricKeyWithAutoSubmitState
    extends State<PinCodeBiometricKeyWithAutoSubmit> {
  bool isPressed = false;
  bool notAutoSubmitted = false;

  @override
  void didUpdateWidget(covariant PinCodeBiometricKeyWithAutoSubmit oldWidget) {
    print('didUpdateWidget');
    if (notAutoSubmitted) {
      setState(() {
        notAutoSubmitted = true;
      });
    }
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    ///todo  test that only on initstate the auto submit is called
    if (notAutoSubmitted) {
      return AutoSubmitWidget(
        onAutoSubmit: () {
          context
              .read<PinCodeBlocType>()
              .events
              .requestBiometricAuth(widget.localizedReason);
              // .setBiometrics(true, widget.localizedReason);
          // context.read<PinCodeBlocType>().events.requestBiometricAuth('');
          print('PinCodeBiometricKey_onAutoSubmit');
        },
        child: PinCodeKey(
          onPressed: widget.onPressed,
          isFingerScan: widget.isFingerScan,
          isFaceScan: widget.isFaceScan,
          isLoading: widget.isLoading,
          // showDefaultIcon: widget.showDefaultIcon,
        ),
      );
    } else {
      return PinCodeKey(
        onPressed: (_) {
          print('setBiometrics MANUALLY');
          context
              .read<PinCodeBlocType>()
              .events
              .setBiometrics(true, widget.localizedReason);
        },
        isFingerScan: widget.isFingerScan,
        isFaceScan: widget.isFaceScan,
        isLoading: widget.isLoading,
        showDefaultIcon: true,
      );
    }
  }
}
