import 'package:widget_toolkit_biometrics/widget_toolkit_biometrics.dart';

import '../data_source/pin_biometrics_auth_data_source.dart';
import '../models/biometrics_authentication_type.dart';

class PinBiometricsRepository extends BiometricsRepository {
  PinBiometricsRepository(
      this.biometricAuthenticationDataSource, this.localDataSource);

  @override
  final PinBiometricsAuthDataSource biometricAuthenticationDataSource;

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
