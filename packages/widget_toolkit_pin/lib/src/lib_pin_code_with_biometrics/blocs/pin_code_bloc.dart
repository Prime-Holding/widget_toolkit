import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../models/biometrics_authentication_type.dart';
import '../services/pin_biometrics_service.dart';
import '../services/pin_code_service.dart';

part 'pin_code_bloc.rxb.g.dart';

/// A contract class containing all events of the PinCodeBloc.
abstract class PinCodeBlocEvents {
  void requestBiometricAuth(String localizedMessage);
}

/// A contract class containing all states of the PinCodeBloc.
abstract class PinCodeBlocStates {
  Stream<bool> get areBiometricsEnabled;

  Stream<List<BiometricsAuthType>> get availableBiometrics;

  ConnectableStream<String?> get pinFromBiometricAuthentication;
}

@RxBloc()
class PinCodeBloc extends $PinCodeBloc {
  PinCodeBloc({
    required this.biometricAuthenticationService,
    required this.pinCodeService,
    required this.localizedBiometricsMessage,
  }) {
    pinFromBiometricAuthentication.connect().addTo(_compositeSubscription);
  }

  final PinBiometricsService biometricAuthenticationService;
  final PinCodeService pinCodeService;
  final String localizedBiometricsMessage;

  @override
  Stream<bool> _mapToAreBiometricsEnabledState() => getAreBiometricsEnabled()
          .asResultStream()
          .setResultStateHandler(this)
          .whereSuccess()
          .doOnData((event) {
        if (event) {
          requestBiometricAuth(localizedBiometricsMessage);
        }
      });

  Future<bool> getAreBiometricsEnabled() async {
    var isDeviceSupported =
        await biometricAuthenticationService.isDeviceSupported;
    var canCheckBiometrics =
        await biometricAuthenticationService.canCheckBiometrics;
    var biometricsEnabled =
        await biometricAuthenticationService.areBiometricsEnabled();

    var pinCode = await pinCodeService.getPinCode();
    return isDeviceSupported &&
        canCheckBiometrics &&
        biometricsEnabled &&
        pinCode != null;
  }

  @override
  Stream<List<BiometricsAuthType>> _mapToAvailableBiometricsState() =>
      biometricAuthenticationService.availableBiometrics
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
        await biometricAuthenticationService.authenticate(localizedReason);
    if (success) {
      return await pinCodeService.getPinCode();
    } else {
      return null;
    }
  }
}
