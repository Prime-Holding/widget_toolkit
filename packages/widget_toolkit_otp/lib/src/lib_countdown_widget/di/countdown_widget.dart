import 'package:flutter/cupertino.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';

import '../../base/utils/constants.dart';
import '../../base/utils/enums.dart';
import '../bloc/countdown_bloc.dart';
import '../services/countdown_service.dart';
import '../widgets/countdown_component.dart';

/// Countdown dependencies that the CountdownWidget requires in order to
/// perform properly. Includes the bloc containing the states and events to
/// which the CountdownWidget can react to or manipulate.
class CountdownWidget extends StatelessWidget {
  const CountdownWidget({
    this.countdownService,
    this.countdownTime = defaultCountdownTime,
    this.controller,
    this.textStyle,
    this.onCountdownTick,
    this.timeFormat = CountdownTimeFormat.seconds,
    this.translateError,
    super.key,
  });

  /// Supplies tick streams to [CountdownBloc] created inside `countdown_widget.dart`.
  final CountdownService? countdownService;

  /// Seconds used when constructing [CountdownBloc] and when no controller reset overrides it.
  final int countdownTime;

  /// Optional controller the nested [CountdownComponent] subscribes to so host code can read
  /// elapsed time or call [CountdownController.reset] from `countdown_component.dart`.
  final CountdownController? controller;

  /// Overrides the [Text] style wrapping the formatted countdown string in [CountdownComponent].
  final TextStyle? textStyle;

  /// Fires after each rebuild in [CountdownComponent] once the remaining seconds are known.
  final void Function(int)? onCountdownTick;

  /// Selects how remaining time is split into seconds, minutes, or hours when
  /// `countdown_component.dart` formats the label.
  final CountdownTimeFormat timeFormat;

  /// Matches the [CountdownComponent.preferDoubleDigitsForTime] default so this wrapper keeps leading
  /// zero padding on the largest time unit without extra constructor wiring.
  final bool preferDoubleDigitsForTime = true;

  /// Formats the error object shown on [ErrorCardWidget] when the bloc reports a failure in
  /// `countdown_component.dart`.
  final String Function(Object error)? translateError;

  /// Wraps [CountdownBloc] provisioning around [CountdownComponent] so host code can drop in a self-contained timer.
  @override
  Widget build(BuildContext context) => MultiProvider(
        key: key,
        providers: [
          ..._blocs,
        ],
        child: CountdownComponent(
          textStyle: textStyle,
          onCountdownTick: onCountdownTick,
          countdownTime: countdownTime,
          controller: controller,
          timeFormat: timeFormat,
          preferDoubleDigitsForTime: preferDoubleDigitsForTime,
          translateError: translateError,
        ),
      );

  List<RxBlocProvider> get _blocs => [
        RxBlocProvider<CountdownBlocType>(
          create: (context) => CountdownBloc(
            startTime: countdownTime,
            countdownService: countdownService,
          ),
        ),
      ];
}
