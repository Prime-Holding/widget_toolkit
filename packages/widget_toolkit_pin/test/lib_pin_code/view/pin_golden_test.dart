import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widget_toolkit_biometrics/widget_toolkit_biometrics.dart';
import 'package:widget_toolkit_pin/widget_toolkit_pin.dart';

import '../../helpers/golden_helper.dart';
import '../../helpers/models/scenario.dart';

///todo add loading, error, success tests
void main() {
  runGoldenTests([
    generateDeviceBuilder(
      widget: pinCodePageFactory(
          // pinCodeService: MockPinCodeService(),
          ),
      scenario: Scenario(name: 'pin_empty_loading'),
    ),
    generateDeviceBuilder(
      widget: pinCodePageFactory(
        // pinCodeService: MockPinCodeService(),
      ),
      scenario: Scenario(name: 'pin_empty_success'),
    ),
    // generateDeviceBuilder(
    //   widget: pinCodePageFactory(
    // pinCodeService: MockPinCodeService(),
    // isLoading: true),
    // scenario: Scenario(name: 'pin_loading'),
    // ),
  ], );
}

Widget pinCodePageFactory() => Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: MultiProvider(
          providers: [
            Provider<InMemoryInstance>(
              create: (context) => InMemoryInstance(),
            ),
            Provider(
              create: (context) => AppPinCodeService(
                inMemoryInstance: context.read<InMemoryInstance>(),
              ),
            ),
            Provider(
              create: (context) => AppLocalDataSource(
                inMemoryInstance: context.read<InMemoryInstance>(),
              ),
            ),
          ],
          child: Builder(
            builder: (context) => PinCodeKeyboard(
              keyLength: 6,
              pinCodeService: context.read<AppPinCodeService>(),
              biometricsLocalDataSource: context.read<AppLocalDataSource>(),
            ),
          ),
        ),
      ),
    );

class AppPinCodeService implements PinCodeService {
  AppPinCodeService({required this.inMemoryInstance});

  final InMemoryInstance inMemoryInstance;

  static const _isPinCodeInStorage = 'pinCode';

  @override
  Future<bool> isPinCodeInSecureStorage() async {
    var isPinCodeInSecureStorage =
        inMemoryInstance.getString(_isPinCodeInStorage);

    if (isPinCodeInSecureStorage.isEmpty) {
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Future<String> encryptPinCode(String pinCode) async {
    inMemoryInstance.setString(_isPinCodeInStorage, pinCode);
    return Future.value(pinCode);
  }

  @override
  Future<int> getPinLength() => Future.value(6);

  @override
  Future<bool> verifyPinCode(String pinCode) {
    if (pinCode.length == 6) {
      return Future.value(true);
    }
    return Future.value(false);
  }
}

/// you can use this to store the value, for example in [SharedPreferences]
class AppLocalDataSource implements BiometricsLocalDataSource {
  AppLocalDataSource({required this.inMemoryInstance});

  final InMemoryInstance inMemoryInstance;

  static const _areBiometricsEnabled = 'areBiometricsEnabled';

  @override
  Future<bool> areBiometricsEnabled() async {
    var areBiometricsEnabled = inMemoryInstance.getBool(_areBiometricsEnabled);
    return areBiometricsEnabled;
  }

  @override
  Future<void> setBiometricsEnabled(bool enable) async {
    inMemoryInstance.setBool(_areBiometricsEnabled, enable);
  }
}

class InMemoryInstance {
  final Map<String, dynamic> _data = {};

  bool getBool(String key) => _data[key] ?? false;

  void setBool(String key, bool value) {
    _data[key] = value;
  }

  String getString(String key) => _data[key] ?? '';

  void setString(String key, String value) {
    _data[key] = value;
  }
}
