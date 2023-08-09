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

  /// Тhe [Subject] where events sink to by calling [addDigit]
  final _$addDigitEvent = PublishSubject<String>();

  /// Тhe [Subject] where events sink to by calling [deleteDigit]
  final _$deleteDigitEvent = PublishSubject<void>();

  /// Тhe [Subject] where events sink to by calling [biometricsButtonPressed]
  final _$biometricsButtonPressedEvent = PublishSubject<String>();

  /// Тhe [Subject] where events sink to by calling [getPinLength]
  final _$getPinLengthEvent = PublishSubject<int?>();

  /// Тhe [Subject] where events sink to by calling [checkBiometricsEnabled]
  final _$checkBiometricsEnabledEvent = BehaviorSubject<void>();

  /// Тhe [Subject] where events sink to by calling [checkPinCodeInStorage]
  final _$checkPinCodeInStorageEvent = BehaviorSubject<void>();

  /// Тhe [Subject] where events sink to by calling [requestBiometricAuth]
  final _$requestBiometricAuthEvent = PublishSubject<String>();

  /// Тhe [Subject] where events sink to by calling [autoSubmit]
  final _$autoSubmitEvent = PublishSubject<String>();

  /// Тhe [Subject] where events sink to by calling [setBiometrics]
  final _$setBiometricsEvent =
      PublishSubject<({bool enabled, String localizedReason})>();

  /// The state of [digitsCount] implemented in [_mapToDigitsCountState]
  late final Stream<int> _digitsCountState = _mapToDigitsCountState();

  /// The state of [showBiometricsButton] implemented in
  /// [_mapToShowBiometricsButtonState]
  late final ConnectableStream<bool> _showBiometricsButtonState =
      _mapToShowBiometricsButtonState();

  /// The state of [requestBiometricsAuthentication] implemented in
  /// [_mapToRequestBiometricsAuthenticationState]
  late final ConnectableStream<void> _requestBiometricsAuthenticationState =
      _mapToRequestBiometricsAuthenticationState();

  /// The state of [authenticated] implemented in [_mapToAuthenticatedState]
  late final ConnectableStream<void> _authenticatedState =
      _mapToAuthenticatedState();

  /// The state of [pin] implemented in [_mapToPinState]
  late final Stream<String> _pinState = _mapToPinState();

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

  /// The state of [biometricsDialog] implemented in
  /// [_mapToBiometricsDialogState]
  late final Stream<BiometricsMessage?> _biometricsDialogState =
      _mapToBiometricsDialogState();

  /// The state of [isPinCodeInSecureStorage] implemented in
  /// [_mapToIsPinCodeInSecureStorageState]
  late final ConnectableStream<bool> _isPinCodeInSecureStorageState =
      _mapToIsPinCodeInSecureStorageState();

  /// The state of [isLoading] implemented in [_mapToIsLoadingState]
  late final Stream<bool> _isLoadingState = _mapToIsLoadingState();

  /// The state of [errors] implemented in [_mapToErrorsState]
  late final Stream<ErrorModel> _errorsState = _mapToErrorsState();

  @override
  void addDigit(String digit) => _$addDigitEvent.add(digit);

  @override
  void deleteDigit() => _$deleteDigitEvent.add(null);

  @override
  void biometricsButtonPressed(String reason) =>
      _$biometricsButtonPressedEvent.add(reason);

  @override
  void getPinLength(int? length) => _$getPinLengthEvent.add(length);

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
      _$setBiometricsEvent.add((
        enabled: enabled,
        localizedReason: localizedReason,
      ));

  @override
  Stream<int> get digitsCount => _digitsCountState;

  @override
  ConnectableStream<bool> get showBiometricsButton =>
      _showBiometricsButtonState;

  @override
  ConnectableStream<void> get requestBiometricsAuthentication =>
      _requestBiometricsAuthenticationState;

  @override
  ConnectableStream<void> get authenticated => _authenticatedState;

  @override
  Stream<String> get pin => _pinState;

  @override
  Stream<bool> get areBiometricsEnabled => _areBiometricsEnabledState;

  @override
  ConnectableStream<bool> get isPinCodeVerified => _isPinCodeVerifiedState;

  @override
  ConnectableStream<List<BiometricsAuthType>> get availableBiometrics =>
      _availableBiometricsState;

  @override
  Stream<BiometricsMessage?> get biometricsDialog => _biometricsDialogState;

  @override
  ConnectableStream<bool> get isPinCodeInSecureStorage =>
      _isPinCodeInSecureStorageState;

  @override
  Stream<bool> get isLoading => _isLoadingState;

  @override
  Stream<ErrorModel> get errors => _errorsState;

  Stream<int> _mapToDigitsCountState();

  ConnectableStream<bool> _mapToShowBiometricsButtonState();

  ConnectableStream<void> _mapToRequestBiometricsAuthenticationState();

  ConnectableStream<void> _mapToAuthenticatedState();

  Stream<String> _mapToPinState();

  Stream<bool> _mapToAreBiometricsEnabledState();

  ConnectableStream<bool> _mapToIsPinCodeVerifiedState();

  ConnectableStream<List<BiometricsAuthType>> _mapToAvailableBiometricsState();

  Stream<BiometricsMessage?> _mapToBiometricsDialogState();

  ConnectableStream<bool> _mapToIsPinCodeInSecureStorageState();

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
    _$getPinLengthEvent.close();
    _$checkBiometricsEnabledEvent.close();
    _$checkPinCodeInStorageEvent.close();
    _$requestBiometricAuthEvent.close();
    _$autoSubmitEvent.close();
    _$setBiometricsEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}

// ignore: unused_element
typedef _SetBiometricsEventArgs = ({bool enabled, String localizedReason});
