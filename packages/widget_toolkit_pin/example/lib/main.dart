import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
          PrimePinTheme.light,
        ],
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch(),
        extensions: [
          PrimePinTheme.dark,
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
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      context.primePinTheme.primaryGradientStart,
                      context.primePinTheme.primaryGradientEnd
                    ],
                  ),
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                    vertical: 20),
                child: Column(
                  children: [
                    Expanded(
                      child: buildWithBiometrics(context),
                      // buildGeneric(context)
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget buildGeneric(BuildContext context) => PinCodeKeyboard.generic(
        keyLength: 3,
        onAutoSubmit: (onApplyPressed) {},
      );

  Widget buildWithBiometrics(BuildContext context) =>
      PinCodeKeyboard.withBiometrics(
        // error: ErrorPinAttemptsModel(remainingAttempts: 2),
        keyLength: 4,
        // isConfirmPage:true,
        onAutoSubmit: (onAutoSubmit) {
          print('uiOnAutoSubmit3 $onAutoSubmit');
        },
        pinCodeService: context.read<PinCodeService>(),
        biometricsLocalDataSource: context.read<BiometricsLocalDataSource>(),
        errorModalConfiguration: const ErrorModalConfiguration(
          applySafeArea: true,
          contentAlignment: MainAxisAlignment.end,
          haveOnlyOneSheet: true,
          heightFactor: 0.6,
          isDismissible: true,
          safeAreaBottom: true,
          showCloseButton: false,
          showHeaderPill: true,
          fullScreen: false,
          dialogHasBottomPadding: true,
        ),
      );
}

class AppPinCodeService implements PinCodeService {
  AppPinCodeService();

  @override
  Future<String?> getPinCode() {
    print('getPinCode');
    return Future.value('1111');}
// Future<String?> getPinCode() => Future.value(null);
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
