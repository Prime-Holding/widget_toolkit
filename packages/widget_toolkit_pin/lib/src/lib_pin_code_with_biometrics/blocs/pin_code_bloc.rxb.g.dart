// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'pin_code_bloc.dart';

/// Used as a contractor for the bloc, events and states classes
/// {@nodoc}
abstract class PinCodeBlocType extends RxBlocTypeBase {
  PinCodeBlocEvents get events;
  PinCodeBlocStates get states;
}

/// [$PinCodeBloc] extended by the [PinCodeBloc]
/// {@nodoc}
abstract class $PinCodeBloc extends RxBlocBase
    implements PinCodeBlocEvents, PinCodeBlocStates, PinCodeBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// Тhe [Subject] where events sink to by calling [checkBiometricsEnabled]
  final _$checkBiometricsEnabledEvent = BehaviorSubject<void>();

  /// Тhe [Subject] where events sink to by calling [checkPinCodeInStorage]
  final _$checkPinCodeInStorageEvent = BehaviorSubject<void>();

  /// Тhe [Subject] where events sink to by calling [requestBiometricAuth]
  final _$requestBiometricAuthEvent = PublishSubject<String>();

  /// Тhe [Subject] where events sink to by calling [autoSubmit]
  final _$autoSubmitEvent = PublishSubject<String>();

  /// Тhe [Subject] where events sink to by calling [setBiometrics]
  final _$setBiometricsEvent = PublishSubject<_SetBiometricsEventArgs>();

  /// The state of [areBiometricsEnabled] implemented in
  /// [_mapToAreBiometricsEnabledState]
  late final Stream<bool> _areBiometricsEnabledState =
      _mapToAreBiometricsEnabledState();

  /// The state of [isPinCodeVerified] implemented in
  /// [_mapToIsPinCodeVerifiedState]
  late final ConnectableStream<bool> _isPinCodeVerifiedState =
      _mapToIsPinCodeVerifiedState();

  /// The state of [availableBiometrics] implemented in
  /// [_mapToAvailableBiometricsState]
  late final ConnectableStream<List<BiometricsAuthType>>
      _availableBiometricsState = _mapToAvailableBiometricsState();

  /// The state of [isAuthenticatedWithBiometrics] implemented in
  /// [_mapToIsAuthenticatedWithBiometricsState]
  late final ConnectableStream<bool> _isAuthenticatedWithBiometricsState =
      _mapToIsAuthenticatedWithBiometricsState();

  /// The state of [biometricsDialog] implemented in
  /// [_mapToBiometricsDialogState]
  late final Stream<BiometricsMessage?> _biometricsDialogState =
      _mapToBiometricsDialogState();

  /// The state of [isPinCodeInSecureStorage] implemented in
  /// [_mapToIsPinCodeInSecureStorageState]
  late final ConnectableStream<bool> _isPinCodeInSecureStorageState =
      _mapToIsPinCodeInSecureStorageState();

  /// The state of [pinLength] implemented in [_mapToPinLengthState]
  late final ConnectableStream<int> _pinLengthState = _mapToPinLengthState();

  /// The state of [isLoading] implemented in [_mapToIsLoadingState]
  late final Stream<bool> _isLoadingState = _mapToIsLoadingState();

  /// The state of [errors] implemented in [_mapToErrorsState]
  late final Stream<ErrorModel> _errorsState = _mapToErrorsState();

  @override
  void checkBiometricsEnabled() => _$checkBiometricsEnabledEvent.add(null);

  @override
  void checkPinCodeInStorage() => _$checkPinCodeInStorageEvent.add(null);

  @override
  void requestBiometricAuth(String localizedMessage) =>
      _$requestBiometricAuthEvent.add(localizedMessage);

  @override
  void autoSubmit(String pin) => _$autoSubmitEvent.add(pin);

  @override
  void setBiometrics(
    bool enabled,
    String localizedReason,
  ) =>
      _$setBiometricsEvent.add(_SetBiometricsEventArgs(
        enabled,
        localizedReason,
      ));

  @override
  Stream<bool> get areBiometricsEnabled => _areBiometricsEnabledState;

  @override
  ConnectableStream<bool> get isPinCodeVerified => _isPinCodeVerifiedState;

  @override
  ConnectableStream<List<BiometricsAuthType>> get availableBiometrics =>
      _availableBiometricsState;

  @override
  ConnectableStream<bool> get isAuthenticatedWithBiometrics =>
      _isAuthenticatedWithBiometricsState;

  @override
  Stream<BiometricsMessage?> get biometricsDialog => _biometricsDialogState;

  @override
  ConnectableStream<bool> get isPinCodeInSecureStorage =>
      _isPinCodeInSecureStorageState;

  @override
  ConnectableStream<int> get pinLength => _pinLengthState;

  @override
  Stream<bool> get isLoading => _isLoadingState;

  @override
  Stream<ErrorModel> get errors => _errorsState;

  Stream<bool> _mapToAreBiometricsEnabledState();

  ConnectableStream<bool> _mapToIsPinCodeVerifiedState();

  ConnectableStream<List<BiometricsAuthType>> _mapToAvailableBiometricsState();

  ConnectableStream<bool> _mapToIsAuthenticatedWithBiometricsState();

  Stream<BiometricsMessage?> _mapToBiometricsDialogState();

  ConnectableStream<bool> _mapToIsPinCodeInSecureStorageState();

  ConnectableStream<int> _mapToPinLengthState();

  Stream<bool> _mapToIsLoadingState();

  Stream<ErrorModel> _mapToErrorsState();

  @override
  PinCodeBlocEvents get events => this;

  @override
  PinCodeBlocStates get states => this;

  @override
  void dispose() {
    _$checkBiometricsEnabledEvent.close();
    _$checkPinCodeInStorageEvent.close();
    _$requestBiometricAuthEvent.close();
    _$autoSubmitEvent.close();
    _$setBiometricsEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}

/// Helps providing the arguments in the [Subject.add] for
/// [PinCodeBlocEvents.setBiometrics] event
class _SetBiometricsEventArgs {
  const _SetBiometricsEventArgs(
    this.enabled,
    this.localizedReason,
  );

  final bool enabled;

  final String localizedReason;
}
