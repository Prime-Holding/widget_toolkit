import './biometrics_repository.dart';
import '../data_sources/biometrics_auth_data_source.dart';
import '../data_sources/biometrics_local_data_source.dart';

class BiometricsRepositoryImpl extends BiometricsRepository {
  BiometricsRepositoryImpl(
    this._biometricAuthenticationDataSource,
    this._localDataSource,
  );

  final BiometricsAuthDataSource _biometricAuthenticationDataSource;
  final BiometricsLocalDataSource _localDataSource;

  @override
  BiometricsAuthDataSource get biometricAuthenticationDataSource =>
      _biometricAuthenticationDataSource;

  @override
  BiometricsLocalDataSource get localDataSource => _localDataSource;

  @override
  Future<bool> get canCheckBiometrics =>
      biometricAuthenticationDataSource.canCheckBiometrics;

  @override
  Future<bool> get isDeviceSupported =>
      biometricAuthenticationDataSource.isDeviceSupported;

  @override
  Future<bool> authenticate(String localizedReason) =>
      biometricAuthenticationDataSource.authenticate(localizedReason);

  @override
  Future<void> setBiometricsEnabled(bool areBiometricsEnabled) =>
      localDataSource.setBiometricsEnabled(areBiometricsEnabled);

  @override
  Future<bool> areBiometricsEnabled() => localDataSource.areBiometricsEnabled();
}
