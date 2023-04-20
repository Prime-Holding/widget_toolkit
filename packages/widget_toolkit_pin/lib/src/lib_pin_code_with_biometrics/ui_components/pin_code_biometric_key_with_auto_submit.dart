import 'package:flutter/material.dart';
import 'auto_submit_widget.dart';
import 'pin_code_key.dart';

class PinCodeBiometricKeyWithAutoSubmit extends StatefulWidget {
  const PinCodeBiometricKeyWithAutoSubmit({
    required this.autoSubmit,
    required this.onPressedAutoSubmit,
    required this.onPressedDefault,
    required this.startWithAutoSubmit,
    // required this.localizedReason,
    this.withAutoSubmitOnInitState = true,
    this.isFingerScan = false,
    this.isFaceScan = false,
    this.isLoading = false,
    // this.showDefaultIcon = false,
    super.key,
  });

  final Function autoSubmit;
  final bool withAutoSubmitOnInitState;
  final bool isFingerScan;
  final bool startWithAutoSubmit;
  final bool isFaceScan;
  final bool isLoading;
  // final String localizedReason;

  /// Shows the face scan icon if set to true
  // final bool showDefaultIcon;
  final void Function(int?) onPressedAutoSubmit;
  final void Function(int?) onPressedDefault;

  @override
  State<PinCodeBiometricKeyWithAutoSubmit> createState() =>
      _PinCodeBiometricKeyWithAutoSubmitState();
}

class _PinCodeBiometricKeyWithAutoSubmitState
    extends State<PinCodeBiometricKeyWithAutoSubmit> {
  bool isPressed = false;
  // bool notAutoSubmitted = false;
  late bool startWithAutoSubmit;
  @override
  void initState() {
    startWithAutoSubmit = widget.startWithAutoSubmit;
    print('init startWithAutoSubmit $startWithAutoSubmit');
    // TODO: implement initState
    super.initState();
  }
  @override
  void didUpdateWidget(covariant PinCodeBiometricKeyWithAutoSubmit oldWidget) {
    if (startWithAutoSubmit) {
      setState(() {
        startWithAutoSubmit = !startWithAutoSubmit;
        print('didUpdateWidget startWithAutoSubmit $startWithAutoSubmit');
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    ///todo  test that only on initstate the auto submit is called
    if (startWithAutoSubmit) {
      return AutoSubmitWidget(
        onAutoSubmit: () {
          widget.autoSubmit();
          // context
          //     .read<PinCodeBlocType>()
          //     .events
          //     .requestBiometricAuth(widget.localizedReason);
              // .setBiometrics(true, widget.localizedReason);
          // context.read<PinCodeBlocType>().events.requestBiometricAuth('');
          print('PinCodeBiometricKey_onAutoSubmit');
        },
        child: PinCodeKey(
          onPressed: widget.onPressedAutoSubmit,
          isFingerScan: widget.isFingerScan,
          isFaceScan: widget.isFaceScan,
          isLoading: widget.isLoading,
          // showDefaultIcon: widget.showDefaultIcon,
        ),
      );
    } else {
      return PinCodeKey(
        onPressed: (_) {
          widget.onPressedDefault(_);
          print('setBiometrics MANUALLY');
          // context
          //     .read<PinCodeBlocType>()
          //     .events
          //     .setBiometrics(true, widget.localizedReason);
        },
        isFingerScan: widget.isFingerScan,
        isFaceScan: widget.isFaceScan,
        isLoading: widget.isLoading,
        showDefaultIcon: true,
      );
    }
  }
}
