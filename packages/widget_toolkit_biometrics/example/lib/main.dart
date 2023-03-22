import 'package:flutter/material.dart';
import 'package:widget_toolkit/widget_toolkit.dart';
import 'package:widget_toolkit_biometrics/widget_toolkit_biometrics.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Toolkit Biometrics Demo',
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSwatch(),
        // You have to provide the [WidgetToolkitTheme]s in order for the
        // [BiometricsSwitch] to work
        extensions: [
          WidgetToolkitTheme.light,
        ],
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch(),
        extensions: [
          // You have to provide the [WidgetToolkitTheme]s in order for the
          // [BiometricsSwitch] to work
          WidgetToolkitTheme.dark,
        ],
      ),
      home: const MyHomePage(title: 'Widget Toolkit Biometrics Demo'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: SafeArea(
          child: Center(
            child: BiometricsSwitch(
              // You are required to provide an implementations of [BiometricsLocalDataSource]
              biometricsLocalDataSource: ProfileLocalDataSource(),
              // optionally you can provide a [enabledMessage], this should be
              // a localized message, which would get shown to the user when they
              // are prompted to confirm that they want to enable biometrics
              enabledMessage: 'Activate the biometrics of your device',
              // optionally you can provide [mapMessageToString],
              // which will be used to translate the [BiometricsSettingMessageType]
              // to human readable text and will be used in the default notification
              mapMessageToString: (message) {
                switch (message) {
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
                }
              },
              // Optionally, use [onStateChanged] to execute custom callback or present custom notification
              // to the user whenever the biometrics are enabled or disabled successfully.
              //
              // If you have defined [mapMessageToString] the result from that would be
              // passed in as [localizedMessage], otherwise the default mapping of the
              // message to an english string would be passed in.
              onStateChanged: (context, message, localizedMessage) {
                showBlurredBottomSheet(
                  context: context,
                  configuration:
                      const ModalConfiguration(safeAreaBottom: false),
                  builder: (context) => Padding(
                    padding: EdgeInsets.only(
                      left: 16,
                      top: 16,
                      right: 16,
                      bottom: 16 + MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: MessagePanelWidget(
                      message: localizedMessage,
                      messageState: message.state(),
                    ),
                  ),
                );
              },
              // Optionally provide [builder] if you want to build the element
              // in your own way using the implemented business logic.
              builder: (context, enabled, setBiometrics) {
                return Switch(
                  value: enabled,
                  onChanged: setBiometrics,
                );
              },
              // Optionally you can provide [onError] to handle errors out of the
              // package, or to show a notification
              onError: (error) {
                showBlurredBottomSheet(
                  context: context,
                  configuration:
                      const ModalConfiguration(safeAreaBottom: false),
                  builder: (context) => Padding(
                    padding: EdgeInsets.only(
                      left: 16,
                      top: 16,
                      right: 16,
                      bottom: 16 + MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: const MessagePanelWidget(
                      message: 'We\'re sorry we couldn\'t enable biometric'
                          'authentication at this time',
                      messageState: MessagePanelState.important,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );
}

/// You have to implement and provide a [BiometricsLocalDataSource]
/// you can use this to store the value, for example in [SharedPreferences]
class ProfileLocalDataSource implements BiometricsLocalDataSource {
  bool _areBiometricsEnabled = false;

  ProfileLocalDataSource();

  @override
  Future<bool> areBiometricsEnabled() async => _areBiometricsEnabled;

  @override
  Future<void> setBiometricsEnabled(bool enable) async {
    _areBiometricsEnabled = enable;
  }
}
