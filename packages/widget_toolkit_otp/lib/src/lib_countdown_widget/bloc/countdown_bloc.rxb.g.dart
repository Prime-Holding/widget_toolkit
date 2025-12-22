// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'countdown_bloc.dart';

/// Used as a contractor for the bloc, events and states classes
/// @nodoc
abstract class CountdownBlocType extends RxBlocTypeBase {
  CountdownBlocEvents get events;
  CountdownBlocStates get states;
}

/// [$CountdownBloc] extended by the [CountdownBloc]
/// @nodoc
abstract class $CountdownBloc extends RxBlocBase
    implements CountdownBlocEvents, CountdownBlocStates, CountdownBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// Тhe [Subject] where events sink to by calling [resetTimer]
  final _$resetTimerEvent = PublishSubject<int>();

  /// The state of [remainingTime] implemented in [_mapToRemainingTimeState]
  late final Stream<Result<int>> _remainingTimeState =
      _mapToRemainingTimeState();

  @override
  void resetTimer({int maxTime = defaultCountdownTime}) =>
      _$resetTimerEvent.add(maxTime);

  @override
  Stream<Result<int>> get remainingTime => _remainingTimeState;

  Stream<Result<int>> _mapToRemainingTimeState();

  @override
  CountdownBlocEvents get events => this;

  @override
  CountdownBlocStates get states => this;

  @override
  void dispose() {
    _$resetTimerEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}
