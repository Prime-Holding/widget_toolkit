import 'package:local_auth/local_auth.dart';
import 'package:widget_toolkit_biometrics/widget_toolkit_biometrics.dart';

import '../models/biometrics_authentication_type.dart';

class PinBiometricsAuthDataSource extends BiometricsAuthDataSource {
  PinBiometricsAuthDataSource({LocalAuthentication? localAuthentication})
      : _localAuthentication = localAuthentication ?? LocalAuthentication();

  final LocalAuthentication _localAuthentication;

  Future<List<BiometricsAuthType>> get availableBiometrics =>
      _localAuthentication
          .getAvailableBiometrics()
          .then((list) => list.map((e) => mapBiometric(e)).toList());

  BiometricsAuthType mapBiometric(BiometricType type) {
    switch (type) {
      case BiometricType.fingerprint:
        return BiometricsAuthType.fingerprint;
      case BiometricType.iris:
        return BiometricsAuthType.iris;
      case BiometricType.strong:
      case BiometricType.weak:
      case BiometricType.face:
        return BiometricsAuthType.face;
    }
  }

  @override
  Future<bool> get canCheckBiometrics =>
      _localAuthentication.canCheckBiometrics;

  @override
  Future<bool> get isDeviceSupported =>
      _localAuthentication.isDeviceSupported();

  @override
  Future<bool> authenticate(String localizedReason) =>
      _localAuthentication.authenticate(
        localizedReason: localizedReason,
        options: const AuthenticationOptions(
          biometricOnly: false,
          useErrorDialogs: false,
        ),
      );
}
