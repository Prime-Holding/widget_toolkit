// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'biometrics_bloc.dart';

/// Used as a contractor for the bloc, events and states classes
/// @nodoc
abstract class BiometricsBlocType extends RxBlocTypeBase {
  BiometricsBlocEvents get events;
  BiometricsBlocStates get states;
}

/// [$BiometricsBloc] extended by the [BiometricsBloc]
/// @nodoc
abstract class $BiometricsBloc extends RxBlocBase
    implements BiometricsBlocEvents, BiometricsBlocStates, BiometricsBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// Тhe [Subject] where events sink to by calling [setBiometrics]
  final _$setBiometricsEvent =
      PublishSubject<({bool enabled, String localizedReason})>();

  /// The state of [isLoading] implemented in [_mapToIsLoadingState]
  late final Stream<bool> _isLoadingState = _mapToIsLoadingState();

  /// The state of [errors] implemented in [_mapToErrorsState]
  late final Stream<ErrorModel> _errorsState = _mapToErrorsState();

  /// The state of [biometricsDialog] implemented in
  /// [_mapToBiometricsDialogState]
  late final Stream<BiometricsMessage?> _biometricsDialogState =
      _mapToBiometricsDialogState();

  /// The state of [areBiometricsEnabled] implemented in
  /// [_mapToAreBiometricsEnabledState]
  late final Stream<bool> _areBiometricsEnabledState =
      _mapToAreBiometricsEnabledState();

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
  Stream<bool> get isLoading => _isLoadingState;

  @override
  Stream<ErrorModel> get errors => _errorsState;

  @override
  Stream<BiometricsMessage?> get biometricsDialog => _biometricsDialogState;

  @override
  Stream<bool> get areBiometricsEnabled => _areBiometricsEnabledState;

  Stream<bool> _mapToIsLoadingState();

  Stream<ErrorModel> _mapToErrorsState();

  Stream<BiometricsMessage?> _mapToBiometricsDialogState();

  Stream<bool> _mapToAreBiometricsEnabledState();

  @override
  BiometricsBlocEvents get events => this;

  @override
  BiometricsBlocStates get states => this;

  @override
  void dispose() {
    _$setBiometricsEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}

// ignore: unused_element
typedef _SetBiometricsEventArgs = ({bool enabled, String localizedReason});
