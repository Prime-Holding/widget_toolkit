import 'package:prime_biometrics/prime_biometrics.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../services/pin_code_service.dart';

part 'pin_code_bloc.rxb.g.dart';

/// A contract class containing all events of the AppPinCodeWithBiometricsPageBloC.
abstract class PinCodeBlocEvents {
  void requestBiometricAuth(String localizedMessage);
}

/// A contract class containing all states of the AppPinCodeWithBiometricsPageBloC.
abstract class PinCodeBlocStates {
  Stream<bool> get areBiometricsEnabled;

  Stream<List<BiometricsAuthType>> get availableBiometrics;

  ConnectableStream<String?> get pinFromBiometricAuthentication;
}

@RxBloc()
class PinCodeBloc extends $PinCodeBloc {
  PinCodeBloc(
    this._biometricAuthenticationService,
    this._pinCodeService,
    this._localizedBiometricsMessage,
  ) {
    pinFromBiometricAuthentication.connect().addTo(_compositeSubscription);
  }

  final BiometricsService _biometricAuthenticationService;
  final PinCodeService _pinCodeService;
  final String _localizedBiometricsMessage;

  @override
  Stream<bool> _mapToAreBiometricsEnabledState() => getAreBiometricsEnabled()
          .asResultStream()
          .setResultStateHandler(this)
          .whereSuccess()
          .doOnData((event) {
        if (event) {
          requestBiometricAuth(_localizedBiometricsMessage);
        }
      });

  Future<bool> getAreBiometricsEnabled() async {
    var isDeviceSupported =
        await _biometricAuthenticationService.isDeviceSupported;
    var canCheckBiometrics =
        await _biometricAuthenticationService.canCheckBiometrics;
    var biometricsEnabled =
        await _biometricAuthenticationService.areBiometricsEnabled();

    var pinCode = await _pinCodeService.getPinCode();
    return isDeviceSupported &&
        canCheckBiometrics &&
        biometricsEnabled &&
        pinCode != null;
  }

  @override
  Stream<List<BiometricsAuthType>> _mapToAvailableBiometricsState() =>
      _biometricAuthenticationService.availableBiometrics
          .asResultStream()
          .setResultStateHandler(this)
          .whereSuccess();

  @override
  ConnectableStream<String?> _mapToPinFromBiometricAuthenticationState() =>
      _$requestBiometricAuthEvent
          .switchMap(
              (value) => _biometricAuthentication(value).asResultStream())
          .setResultStateHandler(this)
          .whereSuccess()
          .publishReplay(maxSize: 1);

  Future<String?> _biometricAuthentication(String localizedReason) async {
    var success =
        await _biometricAuthenticationService.authenticate(localizedReason);
    if (success) {
      return await _pinCodeService.getPinCode();
    } else {
      return null;
    }
  }
}
