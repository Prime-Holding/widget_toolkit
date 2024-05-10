import 'package:flutter/material.dart';
import 'package:widget_toolkit/widget_toolkit.dart';
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
      theme: ThemeData().copyWith(extensions: [
        SmsCodeTheme.light(),
        SmsCodeTheme.dark(),
        WidgetToolkitTheme.light(),
        WidgetToolkitTheme.dark(),
      ]),
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
      CountdownWidget(
          controller: CountdownController(),
          countdownService: countdownService,
          onCountdownTick: onCountdownTick,
          timeFormat: timeFormat,
          countdownTime: countdownTime,
          key: key),
    );

Widget _materialWrapper(Widget child) => MaterialApp(
      theme: ThemeData().copyWith(extensions: [
        SmsCodeTheme.light(),
        SmsCodeTheme.dark(),
        WidgetToolkitTheme.light(),
        WidgetToolkitTheme.dark(),
      ]),
      home: Scaffold(
        body: Center(
          child: child,
        ),
      ),
    );
