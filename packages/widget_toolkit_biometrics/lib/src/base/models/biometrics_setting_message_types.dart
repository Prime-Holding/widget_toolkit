import 'package:widget_toolkit/language_picker.dart';

enum BiometricsSettingMessageType {
  biometricsAreDisabled,
  noBiometricsAvailable,
  biometricEnabledSuccess,
  biometricDisabledSuccess,
  noBiometricsSupportedDevice,
  none,
}

extension ReadableMessage on BiometricsSettingMessageType {
  String translate() {
    switch (this) {
      case BiometricsSettingMessageType.biometricsAreDisabled:
        return 'To use biometrics, you need to turn it on in your device settings!';

      case BiometricsSettingMessageType.noBiometricsAvailable:
        return 'No biometrics enrolled on this device.';
      case BiometricsSettingMessageType.noBiometricsSupportedDevice:
        return 'You don\'t have biometric feature on your device!';

      case BiometricsSettingMessageType.biometricEnabledSuccess:
        return 'Your biometrics are successfully enabled!';
      case BiometricsSettingMessageType.biometricDisabledSuccess:
        return 'Your biometrics are successfully disabled!';
      case BiometricsSettingMessageType.none:
        break;
    }

    return '';
  }

  MessagePanelState state() {
    switch (this) {
      case BiometricsSettingMessageType.biometricsAreDisabled:
      case BiometricsSettingMessageType.noBiometricsAvailable:
      case BiometricsSettingMessageType.noBiometricsSupportedDevice:
        return MessagePanelState.important;
      case BiometricsSettingMessageType.biometricEnabledSuccess:
      case BiometricsSettingMessageType.biometricDisabledSuccess:
        return MessagePanelState.positiveCheck;
      case BiometricsSettingMessageType.none:
        break;
    }
    return MessagePanelState.positiveCheck;
  }
}
