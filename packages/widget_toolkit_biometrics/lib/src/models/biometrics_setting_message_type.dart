import 'package:widget_toolkit/language_picker.dart';

/// Outcome of an opt-in change from [BiometricsService.enableBiometrics], used
/// by [BiometricsSwitch] to pick confirmation copy and [MessagePanelWidget]
/// styling in `biometrics_switch.dart`.
enum BiometricsMessage {
  /// Confirms that enrollment finished and the repository stored biometrics as
  /// enabled so the switch should remain on.
  enabled,

  /// Confirms that the repository cleared the opt-in so the switch should show
  /// off after a successful disable path.
  disabled,

  /// Indicates hardware or OS policy blocks the biometric flow before any
  /// prompt, which maps to an important panel state in the default notification.
  notSupported,

  /// Indicates the device can use biometrics but no enrolled template exists,
  /// which triggers the settings shortcut button in the default bottom sheet.
  notSetup,
}

extension ReadableMessage on BiometricsMessage {
  /// Supplies built-in English sentences for hosts that omit
  /// [BiometricsSwitch.mapMessageToString]; the same strings power the default
  /// [BiometricsSwitch] snack-style bottom sheet when [BiometricsSwitch.onStateChanged]
  /// is null.
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

  /// Selects the semantic tone for [MessagePanelWidget] from widget_toolkit,
  /// pairing with [translate] when the default bottom sheet in
  /// `biometrics_switch.dart` builds so success paths read as positive and
  /// blocking issues read as important.
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
