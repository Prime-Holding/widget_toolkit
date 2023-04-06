import 'package:prime_biometrics/prime_biometrics.dart';

class Stubs {
  static const someBiometrics = <BiometricsAuthType>[
    BiometricsAuthType.iris,
    BiometricsAuthType.fingerprint
  ];
  static const noBiometrics = <BiometricsAuthType>[];
  static const authMessage =
      'The app whats to integrate with the biometrics of your device';
  static const pinCode2 = '123567';
  static const pinCode = '000000';
}
