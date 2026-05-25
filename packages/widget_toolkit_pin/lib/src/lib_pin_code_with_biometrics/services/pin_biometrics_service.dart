import 'package:widget_toolkit_biometrics/widget_toolkit_biometrics.dart';

import '../models/biometrics_authentication_type.dart';
import '../repositories/pin_biometrics_repository.dart';

/// Thin [BiometricsService] specialization that exposes provider-mapped [PinBiometricsRepository]
/// helpers such as modality discovery alongside the shared base contract.
class PinBiometricsService extends BiometricsService {
  PinBiometricsService(this.biometricAuthenticationRepository)
      : super(biometricAuthenticationRepository);

  /// Repository wired from [PinCodeDependencies]; hosts rarely replace this directly because
  /// [PinCodeKeyboard] builds the provider graph automatically when [addDependencies] is true.
  PinBiometricsRepository biometricAuthenticationRepository;

  Future<List<BiometricsAuthType>> get availableBiometrics =>
      biometricAuthenticationRepository.availableBiometrics;
}
