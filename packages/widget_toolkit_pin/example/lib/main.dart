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
          PinCodeTheme.light,
          WidgetToolkitTheme.light,
        ],
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch(),
        extensions: [
          PinCodeTheme.dark,
          WidgetToolkitTheme.dark,
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
            appBar: AppBar(
              title: Text(title),
            ),
            extendBodyBehindAppBar: true,
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Expanded(
                    child: _buildPinCodeWithBiometrics(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget _buildPinCodeWithBiometrics(BuildContext context) => PinCodeKeyboard(
        translateError: _translateError,
        mapMessageToString: _exampleMapMessageToString,
        // keyLength: 3,
        pinCodeService: context.read<PinCodeService>(),
        biometricsLocalDataSource: context.read<BiometricsLocalDataSource>(),
        onError: (error, translatedError) =>
            _exampleOnError(context, error, translatedError),
      );

  /// todo this to be deleted probably
  String _translateError(Object error) => 'translated error';

  void _exampleOnError(
      BuildContext context, Object error, String translatedError) {
    showBlurredBottomSheet(
      context: context,
      configuration: const ModalConfiguration(safeAreaBottom: false),
      builder: (context) => MessagePanelWidget(
        message: translatedError,
        messageState: MessagePanelState.important,
      ),
    );
  }

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
}

/// You have to implement and provide a [PinCodeService], you can use this to
/// store the value of [_pinCode], for example in [SharedPreferences]
class AppPinCodeService implements PinCodeService {
  AppPinCodeService();

  /// This pin is intended to be stored in the secured storage for production
  /// applications
  String? _pinCode;

  @override
  Future<bool> isPinCodeInSecureStorage() async {
    if (_pinCode == null) {
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Future<String> encryptPinCode(String pinCode) async {
    _pinCode = pinCode;
    return Future.value(pinCode);
  }

  @override
  Future<int> getPinLength() async {
    await Future.value(const Duration(seconds: 10));
    return Future.value(3);}

  @override
  Future<bool> verifyPinCode(String pinCode) {
    if (pinCode == '111') {
      return Future.value(true);
    }
    return Future.value(false);
  }

  @override
  Future<String?> getPinCode() async {
    if (_pinCode == null) {
      return Future.value(null);
    }
    return Future.value(_pinCode);
  }
}

/// You have to implement and provide a [BiometricsLocalDataSource], you can
/// store the value of [_areBiometricsEnabled], for example in [SharedPreferences]
class ProfileLocalDataSource implements BiometricsLocalDataSource {
  ProfileLocalDataSource();

  /// This bool check is intended to be stored in the secured storage for production
  /// applications
  bool? _areBiometricsEnabled;

  @override
  Future<bool> areBiometricsEnabled() async => _areBiometricsEnabled ?? false;

  @override
  Future<void> setBiometricsEnabled(bool enable) async =>
      _areBiometricsEnabled = enable;
}

