import 'package:flutter/services.dart';

import '../models/biometrics_authentication_type.dart';
import '../models/biometrics_setting_message_type.dart';
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

  /*todo(Toncho): Since this feature isn't used by [widget_toolkit_biometrics],
      either remove it, and duplicate the needed logic in the pin package,
      or discuss the possibility of extracting the [BiometricsService] and
      all of it's dependencies into a separate package that would be shared
      between [widget_toolkit_biometrics] and [widget_toolkit_pin]*/
  /// This method is not used in the current package, but it is exposed
  /// in order to be available for use in other parts of the main project
  Future<List<BiometricsAuthType>> get availableBiometrics =>
      _biometricAuthenticationRepository.availableBiometrics;

  Future<BiometricsSettingMessageType> enableBiometrics(
    bool value,
    String localizedMessage,
  ) async {
    if (value) {
      //are biometrics enabled by the user device settings
      final isDeviceSupportedFlag = await isDeviceSupported;
      if (!isDeviceSupportedFlag) {
        return BiometricsSettingMessageType.noBiometricsSupportedDevice;
      }

      //are biometrics enabled by the user device settings
      final canCheckBiometricsFlag = await canCheckBiometrics;
      if (!canCheckBiometricsFlag) {
        return BiometricsSettingMessageType.noBiometricsAvailable;
      }

      try {
        final authenticateFlag = await authenticate(localizedMessage);
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
