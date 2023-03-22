import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';

import '../../base/utils/constants.dart';
import '../../base/utils/enums.dart';
import '../bloc/countdown_bloc.dart';
import '../di/countdown_dependencies.dart';
import '../services/countdown_service.dart';

part 'countdown_controller.dart';

/// Countdown widget used to keep track of and present the remaining time.
///
/// An [onCountdownTick] callback can be provided to keep track of any changes
/// happening. This callback accepts the remaining countdown time to which the
/// user of the widget can react. This callback is triggered after the frame
/// has been rendered in order to prevent any potential setStates happening and
/// modifying the widget during its build phase.
///
/// You can also access the remaining time, as well as the elapsed time of the
/// countdown via a [controller]. The [controller] also gives you the
/// possibility to reset the countdown and start it from a custom time (provided
/// in seconds).
///
/// By default, every countdown is presented in the format of remaining seconds.
/// However, you can change this to include minutes and hours by changing the
/// [timeFormat] parameter of the widget.
///
/// By default, the highest number (minutes in the minutes format, hours in the
/// hours format) will be displayed with double digits (even if a single digit
/// number is presented). In case you want to disable this behaviour, you can
/// set the [preferDoubleDigitsForTime] parameter to `false`.
class CountdownWidget extends StatefulWidget {
  const CountdownWidget({
    this.onCountdownTick,
    this.controller,
    this.textStyle,
    this.timeFormat = CountdownTimeFormat.seconds,
    this.countdownTime = defaultCountdownTime,
    this.preferDoubleDigitsForTime = true,
    super.key,
  });

  /// The time which will be used for the initial countdown
  final int countdownTime;

  /// Callback called every second with the remaining countdown time. This event
  /// will be called after the frame has been rendered.
  final void Function(int)? onCountdownTick;

  /// Countdown controller which allows for more control over the countdown
  final CountdownController? controller;

  /// The time format used for displaying the countdown
  final CountdownTimeFormat timeFormat;

  /// Use double digits for minutes and hours when one would be used instead
  ///
  /// example:
  /// 0:15 -> 00:15
  /// 10:30 -> 10:30
  /// 1:13:28 -> 01:13:28
  /// 52:20:09 -> 52:20:09
  final bool preferDoubleDigitsForTime;

  /// Text style of the countdown text
  final TextStyle? textStyle;

  /// Convenience builder method that initializes CountdownWidget dependencies
  /// right above the widget.
  static Widget withDependencies({
    CountdownController? controller,
    CountdownService? countdownService,
    TextStyle? textStyle,
    void Function(int)? onCountdownTick,
    CountdownTimeFormat timeFormat = CountdownTimeFormat.seconds,
    int countdownTime = defaultCountdownTime,
    bool preferDoubleDigitsForTime = true,
    Key? key,
  }) =>
      MultiProvider(
        key: key,
        providers: CountdownDependencies.from(
          countdownService: countdownService,
          countdownTime: countdownTime,
        ).providers,
        child: CountdownWidget(
          textStyle: textStyle,
          onCountdownTick: onCountdownTick,
          countdownTime: countdownTime,
          controller: controller,
          timeFormat: timeFormat,
          preferDoubleDigitsForTime: preferDoubleDigitsForTime,
        ),
      );

  @override
  State<CountdownWidget> createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  late final CountdownController _controller;

  bool get _preferDoubleDigits => widget.preferDoubleDigitsForTime;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? CountdownController();
    _controller.addListener(_onControllerNotified);
    _controller._setCountdownTime(widget.countdownTime);
  }

  @override
  void dispose() {
    _controller.removeListener(_onControllerNotified);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => RxBlocBuilder<CountdownBlocType, int>(
        state: (bloc) => bloc.states.remainingTime,
        builder: (context, remainingTimeState, bloc) {
          final remainingTime = remainingTimeState.data;
          if (remainingTime == null) return const SizedBox.shrink();

          _controller._updateRemainingTime(remainingTime);
          // Perform an update every second
          WidgetsBinding.instance.addPostFrameCallback((_) {
            widget.onCountdownTick?.call(remainingTime);
          });

          return Text(
            _convertRemainingTime(remainingTime),
            style: widget.textStyle,
          );
        },
      );

  /// Countdown controller callback happening every time the controller notifies
  /// some new changes to the external world.
  void _onControllerNotified() {
    switch (_controller._state) {
      case _CountdownControllerState.reset:
        final resetTime = _controller._countdownTime;
        context.read<CountdownBlocType>().events.resetTimer(maxTime: resetTime);
        _controller._state = _CountdownControllerState.normal;
        break;
      case _CountdownControllerState.normal:
      default:
        break;
    }
  }

  /// Convenience method for converting an integer into double digits number
  /// mostly used for hours and minutes presentation.
  String _formatToDoubleDigitValue(int val) {
    if (val < 10) return '0$val';
    return val.toString();
  }

  /// Convert the time into a presentable format
  String _convertRemainingTime(int time) {
    String output = '';

    switch (widget.timeFormat) {
      case CountdownTimeFormat.minutes:
        final mins = time ~/ 60;
        final secs = time - mins * 60;

        final minOut =
            _preferDoubleDigits ? _formatToDoubleDigitValue(mins) : mins;
        output = '$minOut:${_formatToDoubleDigitValue(secs)}';
        break;
      case CountdownTimeFormat.hours:
        final hours = time ~/ 3600;
        final mins = (time - hours * 3600) ~/ 60;
        final secs = (time - hours * 3600) % 60;

        final hoursOut =
            _preferDoubleDigits ? _formatToDoubleDigitValue(hours) : hours;
        output = '$hoursOut'
            ':${_formatToDoubleDigitValue(mins)}'
            ':${_formatToDoubleDigitValue(secs)}';
        break;
      case CountdownTimeFormat.seconds:
      default:
        output = time.toString();
    }
    return output;
  }
}
