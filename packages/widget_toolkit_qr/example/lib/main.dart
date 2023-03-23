import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
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
      title: 'Widget Toolkit Demo',
      theme: ThemeData.light()
          .copyWith(colorScheme: ColorScheme.fromSwatch(), extensions: [
        WidgetToolkitTheme.light,
        ItemPickerTheme.light,
        SearchPickerTheme.light,
        TextFieldDialogTheme.light,
        EditAddressTheme.light,
        QrScannerTheme.light,
      ]),
      darkTheme: ThemeData.dark()
          .copyWith(colorScheme: ColorScheme.fromSwatch(), extensions: [
        WidgetToolkitTheme.dark,
        ItemPickerTheme.dark,
        SearchPickerTheme.dark,
        TextFieldDialogTheme.dark,
        EditAddressTheme.dark,
        QrScannerTheme.dark,
      ]),
      home: MultiProvider(
        providers: [
          ...QrScannerDependencies.from(
            QrService(),
            QrPermissions(),
          ).providers,
        ],
        child: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Qr Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrScannerPage(
                qrCodeCallback: (qrCode) => context
                    .read<QrScannerBlocType>()
                    .events
                    .checkQRCode(qrCode),
                onErrorCallback: (error) => showErrorBlurredBottomSheet(
                  context: context,
                  error: error.toString(),
                  configuration: const ModalConfiguration(
                    showCloseButton: true,
                  ),
                ),
                onScannedCode: (qrCode) => qrCode != null && qrCode is String
                    ? showBlurredBottomSheet(
                        context: context,
                        builder: (context) => MessagePanelWidget(
                          message: qrCode,
                          messageState: MessagePanelState.positiveCheck,
                        ),
                      )
                    : const SizedBox(),
              ),
            ],
          ),
        ),
      );
}

class QrService extends QrCodeService {
  @override
  Future<Object> checkQrCode(String qrCode) async {
    await Future.delayed(const Duration(seconds: 3));
    return qrCode;
  }
}

class QrPermissions extends SystemPermissionsService {
  @override
  Future<bool> checkForCameraPermissions() async {
    final permissionStatus = await Permission.camera.request();

    return permissionStatus.isGranted;
  }

  @override
  Future<bool> requestCameraPermission() async {
    PermissionStatus status = await Permission.camera.request();
    if (status.isPermanentlyDenied) {
      await openAppSettings();
    }

    await Permission.camera.request();
    if (status.isGranted) return true;
    return false;
  }
}
