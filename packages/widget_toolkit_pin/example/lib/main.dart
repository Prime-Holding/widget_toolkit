import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widget_toolkit/models.dart';
import 'package:widget_toolkit/theme_data.dart';
import 'package:widget_toolkit/ui_components.dart';
import 'package:widget_toolkit_biometrics/widget_toolkit_biometrics.dart';
import 'package:widget_toolkit_pin/widget_toolkit_pin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Toolkit Pin Demo',
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSwatch(),
        extensions: [
          PinCodeTheme.light().copyWith(
            pinCodeKeyTextColorPressed: Colors.lightBlue.withOpacity(0.5),
          ),
          WidgetToolkitTheme.light(),
        ],
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch(),
        extensions: [
          PinCodeTheme.dark().copyWith(
            pinCodeKeyTextColorPressed: Colors.blue[700],
          ),
          WidgetToolkitTheme.dark(),
        ],
      ),
      home: const MyHomePage(title: 'Widget Toolkit Pin Demo'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          Provider<PinCodeService>(
            create: (context) => AppPinCodeService(),
          ),
          Provider<BiometricsLocalDataSource>(
            create: (context) => ProfileLocalDataSource(),
          )
        ],
        child: Builder(
          builder: (context) => Scaffold(
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Expanded(
                    child: PinCodeKeyboard(
                      mapBiometricMessageToString:
                          _exampleMapBiometricMessageToString,
                      pinCodeService: context.read<PinCodeService>(),
                      // Optionally you can provide a [biometricsLocalDataSource],
                      // which enables the usage of biometrics authentication
                      biometricsLocalDataSource:
                          context.read<BiometricsLocalDataSource>(),
                      translateError: _translateError,
                      // Optionally you can provide a [localizedReason], this should be
                      // a localized message, which would get shown to the user when they
                      // are prompted to confirm that they want to enable biometrics
                      localizedReason: 'Activate the biometrics of your device',
                      // Optionally you can provide [addDependencies] and set it to false. In
                      // this case you will have to provide and implementation of the [LocalAuthentication],
                      // [PinBiometricsAuthDataSource], [PinBiometricsRepository],[PinCodeBloc]
                      addDependencies: true,
                      // Optionally you can provide [onAuthenticated] where the
                      // function is invoked when the user is authenticated.
                      // The callback accepts a dynamic value which is the
                      // result returned from the [PinCodeService.verifyPinCode()]
                      onAuthenticated: (dynamic result) {
                        _onAuthenticated(context);
                      },

                      // Optionally you can provide [onError] to handle errors out of the package,
                      // or to show a notification, in practice this would only get called if the
                      // implementations of [BiometricsLocalDataSource.areBiometricsEnabled()],
                      // [BiometricsLocalDataSource.setBiometricsEnabled(enable)],
                      // [PinCodeService.encryptPinCode()],
                      // [PinCodeService.getPinLength()], [PinCodeService.verifyPinCode()],
                      // [PinCodeService.getPinCode()], throw.
                      onError: (error, translatedError) =>
                          _onError(error, translatedError, context),
                      // Optionally you can provide [autoPromptBiometric] and set it to true.
                      // In this case the biometric authentication will be triggered automatically
                      autoPromptBiometric: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  void _onAuthenticated(BuildContext context) {
    showBlurredBottomSheet(
      context: context,
      configuration: const ModalConfiguration(safeAreaBottom: false),
      builder: (context) => const MessagePanelWidget(
        message: 'You authenticated successfully',
        messageState: MessagePanelState.positive,
      ),
    );
  }

  void _onError(Object error, String strValue, BuildContext context) {
    showBlurredBottomSheet(
      context: context,
      configuration: const ModalConfiguration(safeAreaBottom: false),
      builder: (context) => MessagePanelWidget(
        message: _translateError(error),
        messageState: MessagePanelState.important,
      ),
    );
  }

  String _translateError(Object error) =>
      error is ErrorModel ? error.toString() : 'An error has occurred';

  String _exampleMapBiometricMessageToString(BiometricsMessage message) {
    switch (message) {
      case BiometricsMessage.notSetup:
        return 'To use biometrics, you need to turn it on in your device settings!';

      case BiometricsMessage.notSupported:
        return 'Biometric features aren’t supported on this device!';

      case BiometricsMessage.enabled:
        return 'Your biometrics are enabled!';

      case BiometricsMessage.disabled:
        return 'Your biometrics are disabled!';
    }
  }
}

/// You have to implement and provide a [PinCodeService], you can use this to
/// store the value of [_pinCode], for example in [SharedPreferences]
class AppPinCodeService implements PinCodeService {
  AppPinCodeService();

  /// This pin is intended to be stored in the secured storage for production
  /// applications
  final String _pinCode = '1111';

  @override
  Future<String> encryptPinCode(String pinCode) async {
    return Future.value(pinCode);
  }

  @override
  Future<int> getPinLength() async => Future.value(4);

  @override
  Future<dynamic> verifyPinCode(String pinCode) async {
    await Future.delayed(const Duration(seconds: 1));
    if (pinCode != '1111') {
      throw WrongPinCodeException(pinCode);
    }

    return pinCode;
  }

  @override
  Future<String?> getPinCode() async {
    return Future.value(_pinCode);
  }

  @override
  Future<bool> savePinCodeInSecureStorage(String pinCode) async {
    return true;
  }
}

/// You have to implement and provide a [BiometricsLocalDataSource], you can
/// store the value of [_areBiometricsEnabled], for example in [SharedPreferences]
class ProfileLocalDataSource implements BiometricsLocalDataSource {
  ProfileLocalDataSource();

  /// This bool check is intended to be stored in the secured storage for production
  /// applications
  bool _areBiometricsEnabled = true;

  @override
  Future<bool> areBiometricsEnabled() async => _areBiometricsEnabled;

  @override
  Future<void> setBiometricsEnabled(bool enable) async =>
      _areBiometricsEnabled = enable;
}

/// Exception thrown when the pin code is wrong
class WrongPinCodeException implements ErrorModel {
  final String pinCode;

  WrongPinCodeException(this.pinCode);

  @override
  String toString() => 'Invalid pin code: $pinCode';
}
