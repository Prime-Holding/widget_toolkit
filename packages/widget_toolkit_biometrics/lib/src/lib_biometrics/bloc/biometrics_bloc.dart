import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:widget_toolkit/extensions.dart';
import 'package:widget_toolkit/models.dart';

import '../../base/models/biometrics_setting_message_types.dart';
import '../../base/services/biometrics_service.dart';

part '../bloc/biometrics_bloc.rxb.g.dart';

/// A contract class containing all events of the BiometricsBloC.
abstract class BiometricsBlocEvents {
  void setBiometrics(bool enabled, String localizedMessage);
}

/// A contract class containing all states of the BiometricsBloC.
abstract class BiometricsBlocStates {
  /// The loading state
  Stream<bool> get isLoading;

  /// The error state
  Stream<ErrorModel> get errors;

  /// Message to be presented when biometrics setting are updated
  Stream<BiometricsSettingMessageType?> get biometricsDialog;

  /// Flag if the biometrics are currently enabled or not
  Stream<bool> get areBiometricsEnabled;
}

@RxBloc()
class BiometricsBloc extends $BiometricsBloc {
  BiometricsBloc(
    this._biometricAuthenticationService,
  );

  final BiometricsService _biometricAuthenticationService;

  @override
  Stream<ErrorModel> _mapToErrorsState() => errorState.mapToErrorModel();

  @override
  Stream<bool> _mapToIsLoadingState() => loadingState;

  @override
  Stream<bool> _mapToAreBiometricsEnabledState() =>
      Rx.merge(<Stream<Result<bool>>>[
        _biometricAuthenticationService.areBiometricsEnabled().asResultStream(),
        _biometricsDialogState
            .where((event) =>
                event == BiometricsSettingMessageType.biometricEnabledSuccess ||
                event == BiometricsSettingMessageType.biometricDisabledSuccess)
            .map((event) =>
                event == BiometricsSettingMessageType.biometricEnabledSuccess)
            .asResultStream(),
      ]).setErrorStateHandler(this).whereSuccess();

  @override
  Stream<BiometricsSettingMessageType?> _mapToBiometricsDialogState() =>
      _$setBiometricsEvent
          .switchMap((event) => _biometricAuthenticationService
              .enableBiometrics(event.enabled, event.localizedMessage)
              .asResultStream())
          .setResultStateHandler(this)
          .whereSuccess();
}