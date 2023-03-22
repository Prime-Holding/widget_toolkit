import '../data_sources/biometrics_auth_data_source.dart';
import '../data_sources/biometrics_local_data_source.dart';

class BiometricsRepository {
  final BiometricsAuthDataSource _biometricAuthenticationDataSource;
  final BiometricsLocalDataSource _localDataSource;

  BiometricsRepository(
    this._biometricAuthenticationDataSource,
    this._localDataSource,
  );

  Future<bool> get canCheckBiometrics =>
      _biometricAuthenticationDataSource.canCheckBiometrics;

  Future<bool> get isDeviceSupported =>
      _biometricAuthenticationDataSource.isDeviceSupported;

  Future<bool> authenticate(String localizedReason) =>
      _biometricAuthenticationDataSource.authenticate(localizedReason);

  Future<void> setBiometricsEnabled(bool areBiometricsEnabled) =>
      _localDataSource.setBiometricsEnabled(areBiometricsEnabled);

  Future<bool> areBiometricsEnabled() =>
      _localDataSource.areBiometricsEnabled();
}
