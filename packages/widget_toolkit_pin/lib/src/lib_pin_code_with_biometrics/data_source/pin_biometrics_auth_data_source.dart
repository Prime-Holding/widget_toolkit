import 'package:local_auth/local_auth.dart';
import 'package:widget_toolkit_biometrics/widget_toolkit_biometrics.dart';

import '../models/biometrics_authentication_type.dart';

class PinBiometricsAuthDataSource extends BiometricsAuthDataSource {
  PinBiometricsAuthDataSource({required super.localAuthentication});

  Future<List<BiometricsAuthType>> get availableBiometrics =>
      localAuthentication.getAvailableBiometrics().then((list) {
        // print('SS');
        return list.map((e) {
          // print('E: $e');
          return mapBiometric(e);
        }).toList();
      });

  BiometricsAuthType mapBiometric(BiometricType type) {
    // print('mapBiometric4 $type');
    switch (type) {
      case BiometricType.face:
        return BiometricsAuthType.face;
      case BiometricType.fingerprint:
        return BiometricsAuthType.fingerprint;
      case BiometricType.iris:
        return BiometricsAuthType.iris;
      case BiometricType.strong:
        return BiometricsAuthType.face;
      case BiometricType.weak:
        return BiometricsAuthType.face;
    }
  }
}
