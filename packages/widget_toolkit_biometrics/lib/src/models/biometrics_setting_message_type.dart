import 'package:widget_toolkit/language_picker.dart';

enum BiometricsMessage {
  ///Biometrics have been enabled successfully
  enabled,

  ///Biometrics have been disabled successfully
  disabled,

  ///The device doesn't support biometrics
  notSupported,

  ///The user hasn't setup biometric authentication in their device settings
  notSetup,
}

extension ReadableMessage on BiometricsMessage {
  String translate() {
    switch (this) {
      case BiometricsMessage.notSetup:
        return 'To use biometrics, you need to turn it on in your device settings!';

      case BiometricsMessage.notSupported:
        return 'You don\'t have biometric feature on your device!';

      case BiometricsMessage.enabled:
        return 'Your biometrics are enabled!';

      case BiometricsMessage.disabled:
        return 'Your biometrics are disabled!';
    }
  }

  MessagePanelState state() {
    switch (this) {
      case BiometricsMessage.notSetup:
      case BiometricsMessage.notSupported:
        return MessagePanelState.important;
      case BiometricsMessage.enabled:
      case BiometricsMessage.disabled:
        return MessagePanelState.positiveCheck;
    }
  }
}
