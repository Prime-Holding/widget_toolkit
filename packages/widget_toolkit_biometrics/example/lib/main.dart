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
      theme: ThemeData.light()
          .copyWith(colorScheme: ColorScheme.fromSwatch(), extensions: [
        WidgetToolkitTheme.light,
      ]),
      darkTheme: ThemeData.dark()
          .copyWith(colorScheme: ColorScheme.fromSwatch(), extensions: [
        WidgetToolkitTheme.dark,
      ]),
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
        body: Center(
          child: Container(
            child: BiometricsSwitch(
              biometricsLocalDataSource: ProfileLocalDataSource(),
            ),
          ),
        ),
      );
}

///You have to implement and provide a [BiometricsLocalDataSource]
///you can use this to store the value, for example in [SharedPreferences]
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
