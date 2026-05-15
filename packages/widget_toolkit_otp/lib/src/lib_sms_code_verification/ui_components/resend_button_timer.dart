import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';

import '../../base/utils/enums.dart';
import '../../lib_countdown_widget/di/countdown_widget.dart';
import '../bloc/sms_code_bloc.dart';

/// ResendButtonTimer presents how long the resendCode button stays throttled. Provide
/// [SmsCodeBlocType] above this widget, typically via [SmsCodeProvider].
class ResendButtonTimer extends StatelessWidget {
  const ResendButtonTimer({
    this.title,
    this.builder,
    this.placeholder,
    this.timeFormat = CountdownTimeFormat.minutes,
    this.textStyle,
    super.key,
  });

  /// Optional heading shown above whichever child replaces the default layout.
  final String? title;

  /// Supplies a bespoke countdown while exposing the second callback, which calls
  /// [SmsCodeBlocEvents.enableResendButton] in `resend_button_timer.dart`.
  final Widget Function(int remainingTime, void Function() expireValidity)?
      builder;

  /// Shown until the bloc stream in `resend_button_timer.dart` yields a positive throttle sample.
  final Widget? placeholder;

  /// Styles the default [CountdownWidget] built inside `resend_button_timer.dart`.
  final TextStyle? textStyle;

  /// Picks seconds, minutes, or hour formatting before the widget forwards values to
  /// [CountdownWidget] in `resend_button_timer.dart`.
  final CountdownTimeFormat? timeFormat;

  @override
  Widget build(BuildContext context) => RxBlocBuilder<SmsCodeBlocType, int>(
        state: (bloc) => bloc.states.resendButtonThrottleTime,
        builder: (context, resetTime, bloc) => (resetTime.hasData &&
                resetTime.data! >= 1)
            ? builder?.call(resetTime.data!, bloc.events.enableResendButton) ??
                CountdownWidget(
                  countdownTime: resetTime.data!,
                  timeFormat: timeFormat!,
                  textStyle: textStyle,
                  onCountdownTick: (val) => _onCountdownTick(val, bloc),
                )
            : placeholder ?? const SizedBox(),
      );

  void _onCountdownTick(int val, SmsCodeBlocType bloc) {
    if (val <= 0) {
      bloc.events.enableResendButton();
    }
  }
}
