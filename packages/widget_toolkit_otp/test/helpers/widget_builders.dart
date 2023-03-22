import 'package:flutter/material.dart';
import 'package:widget_toolkit/widget_toolkit.dart';
// import 'package:prime_sms_code/prime_sms_code.dart';
import 'package:widget_toolkit_otp/widget_toolkit_otp.dart';

Widget resendButtonFactory({
  required Future Function() onPressed,
  void Function(String)? onError,
  int sentStateDuration = 1,
  int errorStateDuration = 1,
  int disabledDuration = 1,
  Key? key,
}) =>
    MaterialApp(
      theme: ThemeData().copyWith(
          extensions: [...SmsCodeTheme.themes, ...WidgetToolkitTheme.themes]),
      home: Scaffold(
        body: Center(
          child: AutomatedResendCodeButton(
            onPressed: onPressed,
            onError: onError,
            disabledDuration: disabledDuration,
            errorStateDuration: errorStateDuration,
            sentStateDuration: sentStateDuration,
            key: key,
          ),
        ),
      ),
    );

Widget buildCountdown({
  CountdownController? controller,
  CountdownService? countdownService,
  void Function(int)? onCountdownTick,
  CountdownTimeFormat timeFormat = CountdownTimeFormat.seconds,
  int countdownTime = 5,
  Key? key,
}) =>
    _materialWrapper(
      CountdownWidget.withDependencies(
          controller: CountdownController(),
          countdownService: countdownService,
          onCountdownTick: onCountdownTick,
          timeFormat: timeFormat,
          countdownTime: countdownTime,
          key: key),
    );

Widget _materialWrapper(Widget child) => MaterialApp(
      theme: ThemeData().copyWith(
          extensions: [...SmsCodeTheme.themes, ...WidgetToolkitTheme.themes]),
      home: Scaffold(
        body: Center(
          child: child,
        ),
      ),
    );
