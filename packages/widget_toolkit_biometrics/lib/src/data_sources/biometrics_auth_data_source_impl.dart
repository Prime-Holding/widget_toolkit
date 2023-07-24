import 'package:local_auth/local_auth.dart';
import './biometrics_auth_data_source.dart';

/// [BiometricsAuthDataSourceImpl] is the implementation of [BiometricsAuthDataSource].
class BiometricsAuthDataSourceImpl extends BiometricsAuthDataSource {
  BiometricsAuthDataSourceImpl({required this.localAuthentication});

  final LocalAuthentication localAuthentication;

  @override
  Future<bool> get canCheckBiometrics async =>
      await localAuthentication.canCheckBiometrics;

  @override
  Future<bool> get isDeviceSupported async =>
      await localAuthentication.isDeviceSupported();

  @override
  Future<bool> authenticate(String localizedReason) =>
      localAuthentication.authenticate(
        localizedReason: localizedReason,
        options: const AuthenticationOptions(
          biometricOnly: true,
          useErrorDialogs: false,
        ),
      );
}
