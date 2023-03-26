import 'package:flutter/material.dart';
import 'package:widget_toolkit/ui_components.dart';
import 'package:widget_toolkit_otp/widget_toolkit_otp.dart';

/// Change the parameters according the the needs of the test
Widget resendCodeButtonFactory({
  String? label,
  void Function()? onPressed,
  TextStyle? textStyle,
  ButtonColorStyle? buttonColorStyle,
  LocalizedStrings? strings,
  dynamic activeStateIcon,
  dynamic pressedStateIcon,
  dynamic disabledStateIcon,
  dynamic loadingStateIcon,
  bool capitalizeLabels = true,
  bool splashEffectEnabled = false,
  ButtonStateModel state = ButtonStateModel.enabled,
  Key? key,
}) =>
    Scaffold(
      body: Center(
        child: SizedBox(
          height: 100,
          child: Builder(
            builder: (context) => ResendCodeButton(
              useInternalCommunication: false,
              label: label,
              onPressed: onPressed,
              textStyle: textStyle,
              buttonColorStyle: buttonColorStyle,
              strings: strings,
              activeStateIcon: activeStateIcon,
              pressedStateIcon: pressedStateIcon,
              disabledStateIcon: disabledStateIcon,
              loadingStateIcon: loadingStateIcon,
              capitalizeLabels: capitalizeLabels,
              splashEffectEnabled: splashEffectEnabled,
              state: state,
              key: key,
            ),
          ),
        ),
      ),
    );
