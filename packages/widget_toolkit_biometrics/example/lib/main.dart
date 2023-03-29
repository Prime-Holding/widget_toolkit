import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
              // You are required to provide an implementation of [BiometricsLocalDataSource]
              biometricsLocalDataSource: ProfileLocalDataSource(),
              // optionally you can provide a [localizedReason], this should be
              // a localized message, which would get shown to the user when they
              // are prompted to confirm that they want to enable biometrics
              localizedReason: 'Activate the biometrics of your device',
              // optionally you can provide [mapMessageToString],
              // which will be used to translate the [BiometricsMessage]
              // to human readable text and will be used in the default notification
              mapMessageToString: _exampleMapMessageToString,
              // Optionally, use [onStateChanged] to execute custom callback or present custom notification
              // to the user whenever the biometrics are enabled or disabled successfully.
              //
              // If you have defined [mapMessageToString] the result from that would be
              // passed in as [localizedMessage], otherwise the default mapping of the
              // message to an English string would be passed in.
              //
              // However if you do override this, you will have to handle
              // the case where the user hasn't setup their biometrics,
              // and needs to be led to the settings page to set them up,
              // for example by using the app_settings library.
              onStateChanged: _exampleOnStateChanged,
              // Optionally provide [builder] if you want to build the element
              // in your own way using the implemented business logic.
              builder: (context, enabled, setBiometrics) {
                return Switch(
                  value: enabled,
                  onChanged: setBiometrics,
                );
              },
              // Optionally you can provide [onError] to handle errors out of the
              // package, or to show a notification, in practice this would only
              // get called if the implementations of
              // [BiometricsLocalDataSource.areBiometricsEnabled()] or
              // [BiometricsLocalDataSource.setBiometricsEnabled(enable)]
              // throw
              onError: (error) => _exampleOnError(context, error),
            ),
          ),
        ),
      );

  String _exampleMapMessageToString(BiometricsMessage message) {
    switch (message) {
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

  void _exampleOnStateChanged(
    BuildContext context,
    BiometricsMessage message,
    String localizedMessage,
  ) {
    showBlurredBottomSheet(
      context: context,
      configuration: const ModalConfiguration(
        safeAreaBottom: false,
        showCloseButton: false,
      ),
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MessagePanelWidget(
            message: localizedMessage,
            messageState: message.state(),
          ),
          Padding(
            padding: context.widgetToolkitTheme.bottomSheetCloseButtonPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SmallButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icons.close,
                  type: SmallButtonType.outline,
                  colorStyle: ButtonColorStyle.fromContext(
                    context,
                    activeGradientColorStart: context
                        .widgetToolkitTheme.disabledFilledButtonBackgroundColor,
                    activeGradientColorEnd:
                        context.widgetToolkitTheme.primaryGradientEnd,
                  ),
                ),
                if (message == BiometricsMessage.notSetup)
                  SmallButton(
                    onPressed: () {
                      AppSettings.openSecuritySettings();
                      Navigator.of(context).pop();
                    },
                    icon: Icons.settings,
                    type: SmallButtonType.outline,
                    colorStyle: ButtonColorStyle.fromContext(
                      context,
                      activeGradientColorStart: context.widgetToolkitTheme
                          .disabledFilledButtonBackgroundColor,
                      activeGradientColorEnd:
                          context.widgetToolkitTheme.primaryGradientEnd,
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _exampleOnError(BuildContext context, ErrorModel error) {
    showBlurredBottomSheet(
      context: context,
      configuration: const ModalConfiguration(safeAreaBottom: false),
      builder: (context) => const MessagePanelWidget(
        message: 'We\'re sorry we couldn\'t enable biometric'
            'authentication at this time',
        messageState: MessagePanelState.important,
      ),
    );
  }
}

/// You have to implement and provide a [BiometricsLocalDataSource]
/// you can use this to store the value, for example in [SharedPreferences]
class ProfileLocalDataSource implements BiometricsLocalDataSource {
  static const _areBiometricsEnabled = 'areBiometricsEnabled';

  Future<SharedPreferences> get _storageInstance =>
      SharedPreferences.getInstance();

  @override
  Future<bool> areBiometricsEnabled() async {
    final storage = await _storageInstance;
    return storage.getBool(_areBiometricsEnabled) ?? false;
  }

  @override
  Future<void> setBiometricsEnabled(bool enable) async {
    final storage = await _storageInstance;
    await storage.setBool(_areBiometricsEnabled, enable);
  }
}
