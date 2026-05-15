import 'package:local_auth/local_auth.dart';
import './biometrics_auth_data_source.dart';

/// Bridges [BiometricsAuthDataSource] to the [LocalAuthentication] plugin with
/// biometric-only authentication options, matching the stock provider created
/// for [BiometricsSwitch] in `biometrics_switch.dart`.
class BiometricsAuthDataSourceImpl extends BiometricsAuthDataSource {
  BiometricsAuthDataSourceImpl({required this.localAuthentication});

  /// Plugin client invoked for capability checks and for [authenticate]; hosts
  /// may inject a test double when they construct their own repository graph
  /// alongside [BiometricsSwitch.withoutDependencies].
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
