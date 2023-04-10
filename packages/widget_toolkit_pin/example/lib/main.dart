import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_toolkit/theme_data.dart';
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
          WidgetToolkitTheme.light,
        ],
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch(),
        extensions: [
          PrimePinTheme.dark,
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
                      child: PinCodeKeyboard.withBiometrics(
                        // error: ErrorPinAttemptsModel(remainingAttempts: 2),
                        keyLength: 3,
                        onApplyPressed: (onApplyPressed) {},
                        pinCodeService: context.read<PinCodeService>(),
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

class AppPinCodeService implements PinCodeService {
  AppPinCodeService();

  @override
  Future<String?> getPinCode() => Future.value('1111');
}
