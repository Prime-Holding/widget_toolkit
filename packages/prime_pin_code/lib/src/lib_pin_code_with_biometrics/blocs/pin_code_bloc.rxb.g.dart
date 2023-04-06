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

  /// Тhe [Subject] where events sink to by calling [requestBiometricAuth]
  final _$requestBiometricAuthEvent = PublishSubject<String>();

  /// The state of [areBiometricsEnabled] implemented in
  /// [_mapToAreBiometricsEnabledState]
  late final Stream<bool> _areBiometricsEnabledState =
      _mapToAreBiometricsEnabledState();

  /// The state of [availableBiometrics] implemented in
  /// [_mapToAvailableBiometricsState]
  late final Stream<List<BiometricsAuthType>> _availableBiometricsState =
      _mapToAvailableBiometricsState();

  /// The state of [pinFromBiometricAuthentication] implemented in
  /// [_mapToPinFromBiometricAuthenticationState]
  late final ConnectableStream<String?> _pinFromBiometricAuthenticationState =
      _mapToPinFromBiometricAuthenticationState();

  @override
  void requestBiometricAuth(String localizedMessage) =>
      _$requestBiometricAuthEvent.add(localizedMessage);

  @override
  Stream<bool> get areBiometricsEnabled => _areBiometricsEnabledState;

  @override
  Stream<List<BiometricsAuthType>> get availableBiometrics =>
      _availableBiometricsState;

  @override
  ConnectableStream<String?> get pinFromBiometricAuthentication =>
      _pinFromBiometricAuthenticationState;

  Stream<bool> _mapToAreBiometricsEnabledState();

  Stream<List<BiometricsAuthType>> _mapToAvailableBiometricsState();

  ConnectableStream<String?> _mapToPinFromBiometricAuthenticationState();

  @override
  PinCodeBlocEvents get events => this;

  @override
  PinCodeBlocStates get states => this;

  @override
  void dispose() {
    _$requestBiometricAuthEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}
