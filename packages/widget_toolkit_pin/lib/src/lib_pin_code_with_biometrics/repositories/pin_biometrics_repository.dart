import 'package:widget_toolkit_biometrics/widget_toolkit_biometrics.dart';

import '../data_source/pin_biometrics_auth_data_source.dart';
import '../models/biometrics_authentication_type.dart';

/// Bridges [PinBiometricsAuthDataSource] hardware calls with [BiometricsLocalDataSource]
/// feature flags so [PinBiometricsService] can present enrollment prompts and availability
/// streams to [PinCodeBloc].
class PinBiometricsRepository extends BiometricsRepository {
  PinBiometricsRepository(
    this.biometricAuthenticationDataSource,
    this.localDataSource,
  );

  /// Underlying authenticator that performs platform biometric prompts (typically through
  /// LocalAuthentication from package local_auth, or a test double).
  @override
  final PinBiometricsAuthDataSource biometricAuthenticationDataSource;

  /// Persistent store that remembers whether the user opted into biometric unlock for PIN.
  @override
  final BiometricsLocalDataSource localDataSource;

  Future<List<BiometricsAuthType>> get availableBiometrics =>
      biometricAuthenticationDataSource.availableBiometrics;

  @override
  Future<bool> areBiometricsEnabled() => localDataSource.areBiometricsEnabled();

  @override
  Future<bool> authenticate(String localizedReason) =>
      biometricAuthenticationDataSource.authenticate(localizedReason);

  @override
  Future<bool> get canCheckBiometrics =>
      biometricAuthenticationDataSource.canCheckBiometrics;

  @override
  Future<bool> get isDeviceSupported =>
      biometricAuthenticationDataSource.isDeviceSupported;

  @override
  Future<void> setBiometricsEnabled(bool areBiometricsEnabled) =>
      localDataSource.setBiometricsEnabled(areBiometricsEnabled);
}
