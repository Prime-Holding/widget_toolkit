import '../data_sources/biometrics_auth_data_source.dart';
import '../data_sources/biometrics_local_data_source.dart';

abstract class BiometricsRepository {
  BiometricsAuthDataSource get biometricAuthenticationDataSource;

  BiometricsLocalDataSource get localDataSource;

  Future<bool> get canCheckBiometrics;

  Future<bool> get isDeviceSupported;

  Future<bool> authenticate(String localizedReason);

  Future<void> setBiometricsEnabled(bool areBiometricsEnabled);

  Future<bool> areBiometricsEnabled();
}
