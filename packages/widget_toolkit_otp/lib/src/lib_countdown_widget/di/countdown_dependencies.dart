import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/single_child_widget.dart';

import '../../base/utils/constants.dart';
import '../bloc/countdown_bloc.dart';
import '../services/countdown_service.dart';

/// Countdown dependencies that the CountdownWidget requires in order to
/// perform properly. Includes the bloc containing the states and events to
/// which the CountdownWidget can react to or manipulate.
class CountdownDependencies {
  CountdownDependencies._(this._countdownService, this._countdownTime);

  factory CountdownDependencies.from({
    CountdownService? countdownService,
    int countdownTime = defaultCountdownTime,
  }) =>
      CountdownDependencies._(countdownService, countdownTime);

  /// The initial countdown time
  final int _countdownTime;

  /// Optional custom countdown service implementation
  final CountdownService? _countdownService;

  late final List<RxBlocProvider> _blocs = [
    RxBlocProvider<CountdownBlocType>(
      create: (context) => CountdownBloc(
        startTime: _countdownTime,
        countdownService: _countdownService,
      ),
    ),
  ];

  /// The list of providers that can be injected into the widget tree in order
  /// for the CountdownWidget to work properly.
  late List<SingleChildWidget> providers = [
    ..._blocs,
  ];
}
