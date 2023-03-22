import 'package:flutter/services.dart';

import '../models/biometrics_setting_message_type.dart';
import '../repositories/biometrics_repository.dart';

/// Do all the work regarding changing and checking the state of biometrics.
/// Under the hood uses [local_auth] plugin to handle the platform specific logic.
/// Needs implementation of [BiometricsRepository] provided into the context above,
/// so the service will update and read the latest user's biometrics settings.
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

  Future<bool> authenticate(String localizedReason) =>
      _biometricAuthenticationRepository.authenticate(localizedReason);

  Future<bool> areBiometricsEnabled() =>
      _biometricAuthenticationRepository.areBiometricsEnabled();

  Future<void> setBiometricsEnabled(bool areBiometricsEnabled) =>
      _biometricAuthenticationRepository
          .setBiometricsEnabled(areBiometricsEnabled);

  Future<BiometricsSettingMessageType> enableBiometrics(
    bool value,
    String localizedMessage,
  ) async {
    if (value) {
      // Is the device capable of checking biometrics or able to
      // fail over to device credentials.
      final isDeviceSupportedFlag = await isDeviceSupported;
      if (!isDeviceSupportedFlag) {
        return BiometricsSettingMessageType.noBiometricsSupportedDevice;
      }

      // Is the device capable of checking biometrics.
      final canCheckBiometricsFlag = await canCheckBiometrics;
      if (!canCheckBiometricsFlag) {
        return BiometricsSettingMessageType.noBiometricsAvailable;
      }

      try {
        final authenticateFlag = await authenticate(localizedMessage);
        if (!authenticateFlag) {
          //The user hasn't setup biometric authentication in their device settings
          return BiometricsSettingMessageType.biometricsAreDisabled;
        }
      } on PlatformException catch (_) {
        return BiometricsSettingMessageType.noBiometricsAvailable;
      }

      //finally, set the settings.
      await setBiometricsEnabled(value);
      return BiometricsSettingMessageType.biometricEnabledSuccess;
    } else {
      await setBiometricsEnabled(false);
      return BiometricsSettingMessageType.biometricDisabledSuccess;
    }
  }
}
