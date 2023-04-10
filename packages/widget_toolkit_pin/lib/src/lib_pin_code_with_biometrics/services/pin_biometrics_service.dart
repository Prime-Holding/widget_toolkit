import 'package:widget_toolkit_biometrics/widget_toolkit_biometrics.dart';

import '../models/biometrics_authentication_type.dart';
import '../repositories/pin_biometrics_repository.dart';

class PinBiometricsService extends BiometricsService {
  PinBiometricsService(this.biometricAuthenticationRepository)
      : super(biometricAuthenticationRepository);

  PinBiometricsRepository biometricAuthenticationRepository;

  Future<List<BiometricsAuthType>> get availableBiometrics =>
      biometricAuthenticationRepository.availableBiometrics;
}
