import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widget_toolkit/widget_toolkit.dart';
import 'package:widget_toolkit_qr/widget_toolkit_qr.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Toolkit QR Demo',
      theme: ThemeData.light()
          .copyWith(colorScheme: ColorScheme.fromSwatch(), extensions: [
        WidgetToolkitTheme.light(),
        QrScannerTheme.light(),
      ]),
      darkTheme: ThemeData.dark()
          .copyWith(colorScheme: ColorScheme.fromSwatch(), extensions: [
        WidgetToolkitTheme.dark(),
        QrScannerTheme.dark(),
      ]),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Qr Example'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.widgetToolkitTheme.spacingXXXXL,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrScannerWidget<String>(
                qrValidationService: QrService(),
                onCodeValidated: (result) => showBlurredBottomSheet(
                  context: context,
                  builder: (ctx) => MessagePanelWidget(
                    message: result ?? '',
                    messageState: MessagePanelState.positiveCheck,
                  ),
                ),
                onError: (error) => showErrorBlurredBottomSheet(
                  context: context,
                  error: TranslateErrorUtil.translateError(error),
                  configuration:
                      const ModalConfiguration(showCloseButton: true),
                ),
              ),
            ],
          ),
        ),
      );
}

class QrService extends QrValidationService<String> {
  @override
  Future<String> validateQrCode(String qrCode) async {
    await Future.delayed(const Duration(seconds: 3));
    return qrCode;
  }
}

class TranslateErrorUtil {
  static String translateError(Object error) {
    /// Translate your error here
    return error.toString();
  }
}
