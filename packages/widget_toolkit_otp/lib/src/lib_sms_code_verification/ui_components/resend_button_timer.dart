import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';

import '../../base/utils/enums.dart';
import '../../lib_countdown_widget/widgets/countdown_widget.dart';
import '../bloc/sms_code_bloc.dart';

/// ResendButtonTimer presents how long the resendCode button will be disabled.
/// It depends on SmsCodeBlocType, so make sure you have that bloc provided in the
/// context above this widget. It can be customised a bit or implemented on your
/// own way using [builder] method.
class ResendButtonTimer extends StatelessWidget {
  const ResendButtonTimer(
      {this.title,
      this.builder,
      this.placeholder,
      this.timeFormat = CountdownTimeFormat.minutes,
      this.textStyle,
      Key? key})
      : super(key: key);

  /// Text to be displayed on top of the counter
  final String? title;

  /// Use [builder] method to overwrite the widget appearance
  final Widget Function(int remainingTime, void Function() expireValidity)?
      builder;

  /// Widget to be displayed if there is no data from the bloc
  final Widget? placeholder;

  /// Define how to style the counter numbers
  final TextStyle? textStyle;

  /// How to format the time. Choose from predefined values
  final CountdownTimeFormat? timeFormat;

  @override
  Widget build(BuildContext context) => RxBlocBuilder<SmsCodeBlocType, int>(
        bloc: context.read<SmsCodeBlocType>(),
        state: (bloc) => bloc.states.resendButtonThrottleTime,
        builder: (context, resetTime, bloc) =>
            (resetTime.hasData && resetTime.data! >= 1)
                ? builder?.call(
                        resetTime.data!,
                        context
                            .read<SmsCodeBlocType>()
                            .events
                            .enableResendButton) ??
                    _buildValidityWidget(context, resetTime.data!, bloc)
                : placeholder ?? const SizedBox(),
      );

  Widget _buildValidityWidget(
          BuildContext context, int time, SmsCodeBlocType bloc) =>
      CountdownWidget.withDependencies(
          countdownTime: time,
          timeFormat: timeFormat!,
          textStyle: textStyle,
          onCountdownTick: (val) {
            if (val <= 0) {
              context.read<SmsCodeBlocType>().events.enableResendButton();
            }
          });
}
