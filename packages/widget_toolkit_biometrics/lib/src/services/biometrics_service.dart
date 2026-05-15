import 'package:flutter/services.dart';

import '../models/biometrics_setting_message_type.dart';
import '../repositories/biometrics_repository.dart';

/// Coordinates capability checks, biometric authentication, and persisting the
/// opt-in flag through a [BiometricsRepository], encapsulating the branching
/// that [BiometricsSwitch] and other entry points would otherwise duplicate. The
/// implementation ultimately relies on [local_auth] through [BiometricsAuthDataSource].
class BiometricsService {
  final BiometricsRepository _biometricAuthenticationRepository;

  BiometricsService(this._biometricAuthenticationRepository);

  /// Returns true if device is capable of checking biometrics.
  Future<bool> get canCheckBiometrics =>
      _biometricAuthenticationRepository.canCheckBiometrics;

  /// Returns true if device is capable of checking biometrics or is able to
  /// fail over to device credentials.
  Future<bool> get isDeviceSupported =>
      _biometricAuthenticationRepository.isDeviceSupported;

  /// Presents the platform biometric sheet using [localizedReason] and returns
  /// whether the user authenticated successfully, delegating to
  /// [BiometricsRepository.authenticate] for the underlying [local_auth] call.
  Future<bool> authenticate(String localizedReason) =>
      _biometricAuthenticationRepository.authenticate(localizedReason);

  /// Reads the persisted opt-in from [BiometricsRepository] so UI such as
  /// [BiometricsSwitch] can reflect the stored value on first build.
  Future<bool> areBiometricsEnabled() =>
      _biometricAuthenticationRepository.areBiometricsEnabled();

  /// Writes the opt-in flag through [BiometricsRepository] when hosts manage
  /// storage directly; [enableBiometrics] already invokes this after a
  /// successful enable or when turning biometrics off.
  Future<void> setBiometricsEnabled(bool areBiometricsEnabled) =>
      _biometricAuthenticationRepository
          .setBiometricsEnabled(areBiometricsEnabled);

  /// Enables or disables biometrics: when [value] is true, verifies device
  /// support, runs [authenticate] with [localizedReason], persists on success,
  /// and returns a [BiometricsMessage] for notifications; when false, clears
  /// the flag and returns [BiometricsMessage.disabled]. A null result means
  /// the user dismissed the prompt without authenticating. [BiometricsMessage]
  /// values surface through [BiometricsSwitch.onStateChanged] and the default
  /// blurred bottom sheet built in `biometrics_switch.dart`.
  Future<BiometricsMessage?> enableBiometrics(
    bool value,
    String localizedReason,
  ) async {
    if (value) {
      // Is the device capable of checking biometrics or able to
      // fail over to device credentials.
      final isDeviceSupportedFlag = await isDeviceSupported;
      if (!isDeviceSupportedFlag) {
        return BiometricsMessage.notSupported;
      }

      // Is the device capable of checking biometrics.
      final canCheckBiometricsFlag = await canCheckBiometrics;
      if (!canCheckBiometricsFlag) {
        return BiometricsMessage.notSupported;
      }

      try {
        final authenticateFlag = await authenticate(localizedReason);
        if (!authenticateFlag) {
          //The user canceled authentication
          return null;
        }
      } on PlatformException catch (_) {
        // the device has biometric capabilities, but the user hasn't set them up
        return BiometricsMessage.notSetup;
      }

      //finally, set the settings.
      await setBiometricsEnabled(value);
      return BiometricsMessage.enabled;
    } else {
      await setBiometricsEnabled(false);
      return BiometricsMessage.disabled;
    }
  }
}
