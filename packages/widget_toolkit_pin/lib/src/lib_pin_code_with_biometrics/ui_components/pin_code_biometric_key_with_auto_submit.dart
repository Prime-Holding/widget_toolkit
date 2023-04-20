import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../blocs/pin_code_bloc.dart';
import 'callback_widget.dart';
import 'pin_code_key.dart';

class PinCodeBiometricKeyWithAutoSubmit extends StatefulWidget {
  const PinCodeBiometricKeyWithAutoSubmit({
    required this.onPressed,
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
  bool notAutoSubmitted = true;

  // @override
  // void initState() {
  // if (widget.withAutoSubmitOnInitState) {
  // setState(() {
  //   notAutoSubmitted = false;
  // });
  /// todo trigger auto authenticate only on initState
  // print('PinCodeBiometricKey_initState showDefaultIcon: ${widget.showDefaultIcon}');
  // }
  // super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    ///todo  test that only on initstate the auto submit is called
    if (notAutoSubmitted) {
      return CallbackWidget(
        onAutoSubmit: () {
          context.read<PinCodeBlocType>().events.requestBiometricAuth('');
          print('PinCodeBiometricKey_onAutoSubmit');
          setState(() {
            notAutoSubmitted = false;
          });
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
        onPressed: widget.onPressed,
        isFingerScan: widget.isFingerScan,
        isFaceScan: widget.isFaceScan,
        isLoading: widget.isLoading,
        // showDefaultIcon: widget.showDefaultIcon,
      );
    }
  }
}
