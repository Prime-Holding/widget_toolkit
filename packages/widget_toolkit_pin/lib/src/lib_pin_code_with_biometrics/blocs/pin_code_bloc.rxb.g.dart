// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'pin_code_bloc.dart';

/// Used as a contractor for the bloc, events and states classes
/// @nodoc
abstract class PinCodeBlocType extends RxBlocTypeBase {
  PinCodeBlocEvents get events;
  PinCodeBlocStates get states;
}

/// [$PinCodeBloc] extended by the [PinCodeBloc]
/// @nodoc
abstract class $PinCodeBloc extends RxBlocBase
    implements PinCodeBlocEvents, PinCodeBlocStates, PinCodeBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// Тhe [Subject] where events sink to by calling [addDigit]
  final _$addDigitEvent = PublishSubject<String>();

  /// Тhe [Subject] where events sink to by calling [deleteDigit]
  final _$deleteDigitEvent = PublishSubject<void>();

  /// Тhe [Subject] where events sink to by calling [biometricsButtonPressed]
  final _$biometricsButtonPressedEvent = PublishSubject<void>();

  /// The state of [digitsCount] implemented in [_mapToDigitsCountState]
  late final Stream<int> _digitsCountState = _mapToDigitsCountState();

  /// The state of [placeholderDigitsCount] implemented in
  /// [_mapToPlaceholderDigitsCountState]
  late final Stream<int> _placeholderDigitsCountState =
      _mapToPlaceholderDigitsCountState();

  /// The state of [showBiometricsButton] implemented in
  /// [_mapToShowBiometricsButtonState]
  late final Stream<Result<bool>> _showBiometricsButtonState =
      _mapToShowBiometricsButtonState();

  /// The state of [authenticated] implemented in [_mapToAuthenticatedState]
  late final ConnectableStream<dynamic> _authenticatedState =
      _mapToAuthenticatedState();

  /// The state of [isLoading] implemented in [_mapToIsLoadingState]
  late final Stream<bool> _isLoadingState = _mapToIsLoadingState();

  /// The state of [errors] implemented in [_mapToErrorsState]
  late final Stream<ErrorModel> _errorsState = _mapToErrorsState();

  @override
  void addDigit(String digit) => _$addDigitEvent.add(digit);

  @override
  void deleteDigit() => _$deleteDigitEvent.add(null);

  @override
  void biometricsButtonPressed() => _$biometricsButtonPressedEvent.add(null);

  @override
  Stream<int> get digitsCount => _digitsCountState;

  @override
  Stream<int> get placeholderDigitsCount => _placeholderDigitsCountState;

  @override
  Stream<Result<bool>> get showBiometricsButton => _showBiometricsButtonState;

  @override
  ConnectableStream<dynamic> get authenticated => _authenticatedState;

  @override
  Stream<bool> get isLoading => _isLoadingState;

  @override
  Stream<ErrorModel> get errors => _errorsState;

  Stream<int> _mapToDigitsCountState();

  Stream<int> _mapToPlaceholderDigitsCountState();

  Stream<Result<bool>> _mapToShowBiometricsButtonState();

  ConnectableStream<dynamic> _mapToAuthenticatedState();

  Stream<bool> _mapToIsLoadingState();

  Stream<ErrorModel> _mapToErrorsState();

  @override
  PinCodeBlocEvents get events => this;

  @override
  PinCodeBlocStates get states => this;

  @override
  void dispose() {
    _$addDigitEvent.close();
    _$deleteDigitEvent.close();
    _$biometricsButtonPressedEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}
