import 'package:flutter/services.dart';

import '../models/biometrics_authentication_type.dart';
import '../models/biometrics_setting_message_types.dart';
import '../repositories/biometrics_repository.dart';

/// Do all the work regarding changing and checking the state of biometrics.
/// Under the hood uses [local_auth] plugin to handle the platform specific logic.
/// Needs implementation of [BiometricsRepository] provided into the context above,
/// so the service will update and read the latest user's biometrics settings.
class BiometricsService {
  final BiometricsRepository _biometricAuthenticationRepository;

  BiometricsService(this._biometricAuthenticationRepository);

  Future<bool> get canCheckBiometrics =>
      _biometricAuthenticationRepository.canCheckBiometrics;

  Future<bool> get isDeviceSupported =>
      _biometricAuthenticationRepository.isDeviceSupported;

  Future<bool> authenticate(String localizedReason) =>
      _biometricAuthenticationRepository.authenticate(localizedReason);

  Future<bool> areBiometricsEnabled() =>
      _biometricAuthenticationRepository.areBiometricsEnabled();

  Future<void> setBiometricsEnabled(bool areBiometricsEnabled) =>
      _biometricAuthenticationRepository
          .setBiometricsEnabled(areBiometricsEnabled);

  /// This method is not used in the current package, but it is exposed
  /// in order to be available for use in other parts of the main project
  Future<List<BiometricsAuthType>> get availableBiometrics =>
      _biometricAuthenticationRepository.availableBiometrics;

  Future<BiometricsSettingMessageType?> enableBiometrics(
    bool value,
    String localizedMessage,
  ) async {
    if (value) {
      //are biometrics enabled by the user device settings
      var isDeviceSupportedFlag = await isDeviceSupported;
      if (!isDeviceSupportedFlag) {
        return BiometricsSettingMessageType.noBiometricsSupportedDevice;
      }

      //are biometrics enabled by the user device settings
      var canCheckBiometricsFlag = await canCheckBiometrics;
      if (!canCheckBiometricsFlag) {
        return BiometricsSettingMessageType.noBiometricsAvailable;
      }

      try {
        var authenticateFlag = await authenticate(localizedMessage);

        if (!authenticateFlag) {
          //no biometrics settings set up available
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
