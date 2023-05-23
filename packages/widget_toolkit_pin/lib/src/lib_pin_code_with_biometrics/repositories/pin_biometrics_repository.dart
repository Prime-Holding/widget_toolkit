import 'package:widget_toolkit_biometrics/widget_toolkit_biometrics.dart';

import '../data_source/pin_biometrics_auth_data_source.dart';
import '../models/biometrics_authentication_type.dart';

class PinBiometricsRepository extends BiometricsRepository {
  PinBiometricsRepository(
      this.biometricAuthenticationDataSource, this.localDataSource)
      : super(biometricAuthenticationDataSource, localDataSource);

  PinBiometricsAuthDataSource biometricAuthenticationDataSource;
  BiometricsLocalDataSource localDataSource;

  Future<List<BiometricsAuthType>> get availableBiometrics =>
      biometricAuthenticationDataSource.availableBiometrics;
}
