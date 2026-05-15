import '../data_sources/biometrics_auth_data_source.dart';
import '../data_sources/biometrics_local_data_source.dart';

/// Coordinates reading device biometrics capability, running an authentication
/// prompt, and persisting whether the app should treat biometrics as enabled.
/// [BiometricsService] in `biometrics_service.dart` calls this abstraction so
/// feature code stays independent from [local_auth] and from your storage layer.
/// A typical binding wires [biometricAuthenticationDataSource] to platform
/// auth and [localDataSource] to your profile or settings store, matching the
/// providers assembled inside [BiometricsSwitch] in `biometrics_switch.dart`.
abstract class BiometricsRepository {
  /// Platform auth client that answers capability questions and presents the
  /// system biometric prompt, as implemented by [BiometricsAuthDataSourceImpl]
  /// in `biometrics_auth_data_source_impl.dart` when you use the default
  /// [BiometricsSwitch] dependency graph.
  BiometricsAuthDataSource get biometricAuthenticationDataSource;

  /// Persistent store for the user opt-in flag that [BiometricsService] reads
  /// and updates when toggling succeeds, usually backed by secure storage or a
  /// settings API you provide to [BiometricsSwitch].
  BiometricsLocalDataSource get localDataSource;

  /// Forwards to [BiometricsAuthDataSource.canCheckBiometrics] so callers can
  /// gate enrollment flows before [BiometricsService.enableBiometrics] runs.
  Future<bool> get canCheckBiometrics;

  /// Forwards to [BiometricsAuthDataSource.isDeviceSupported] so hosts can tell
  /// whether the OS will allow biometric or device-credential authentication.
  Future<bool> get isDeviceSupported;

  /// Forwards to [BiometricsAuthDataSource.authenticate] with the same
  /// [localizedReason] string that [BiometricsSwitch] passes from
  /// [BiometricsSwitch.localizedReason] or the default activate prompt in
  /// `constants.dart`.
  Future<bool> authenticate(String localizedReason);

  /// Persists the new opt-in value through [BiometricsLocalDataSource] after a
  /// successful enable flow or immediately when disabling from
  /// [BiometricsService.enableBiometrics].
  Future<void> setBiometricsEnabled(bool areBiometricsEnabled);

  /// Reads the stored opt-in flag so [BiometricsSwitch] can initialize the
  /// switch position and stream updates after successful toggles.
  Future<bool> areBiometricsEnabled();
}
