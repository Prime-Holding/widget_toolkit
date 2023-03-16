import 'package:local_auth/local_auth.dart';

import '../models/biometrics_authentication_type.dart';

/// [BiometricsAuthDataSource] is a wrapper of the plugin [local_auth] and
/// expose its properties, to be used from [BiometricsService]
class BiometricsAuthDataSource {
  final LocalAuthentication auth;

  BiometricsAuthDataSource({required this.auth});

  Future<bool> get canCheckBiometrics => auth.canCheckBiometrics;

  Future<bool> get isDeviceSupported => auth.isDeviceSupported();

  Future<bool> authenticate(String localizedReason) => auth.authenticate(
        localizedReason: localizedReason,
        options: const AuthenticationOptions(biometricOnly: true),
      );

  Future<List<BiometricsAuthType>> get availableBiometrics => auth
      .getAvailableBiometrics()
      .then((list) => list.map((e) => mapBiometric(e)).toList());

  BiometricsAuthType mapBiometric(BiometricType type) {
    switch (type) {
      case BiometricType.face:
        return BiometricsAuthType.face;
      case BiometricType.fingerprint:
        return BiometricsAuthType.fingerprint;
      case BiometricType.iris:
        return BiometricsAuthType.iris;

      ///TODO: https://pub.dev/packages/local_auth/changelog#200
      case BiometricType.strong:
        return BiometricsAuthType.face;

      ///TODO: https://pub.dev/packages/local_auth/changelog#200
      case BiometricType.weak:
        return BiometricsAuthType.face;
    }
  }
}
