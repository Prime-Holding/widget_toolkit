import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widget_toolkit_biometrics/widget_toolkit_biometrics.dart';
import 'package:widget_toolkit_pin/widget_toolkit_pin.dart';

import '../../helpers/golden_helper.dart';
import '../../helpers/models/scenario.dart';
import '../../mocks/mock_pin_code_service.dart';

void main() {
  runGoldenTests([
    generateDeviceBuilder(
      widget: pinCodePageFactory(
        pinCodeService: MockPinCodeService(),
      ),
      scenario: Scenario(name: 'pin_empty_close'),
    ),
    generateDeviceBuilder(
      widget: pinCodePageFactory(
          pinCodeService: MockPinCodeService(), isLoading: true),
      scenario: Scenario(name: 'pin_loading'),
    ),
  ], awaitPump: true);
}

Widget pinCodePageFactory(
        {required PinCodeService pinCodeService, bool isLoading = false}) =>
    Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: PinCodeKeyboard(
          // isLoading: isLoading,
          // onAutoSubmit: (p0) {},
          onChangePin: () {},
          keyLength: 6, pinCodeService:pinCodeService, biometricsLocalDataSource: ProfileLocalDataSource(),
          // pinCodeService: pinCodeService,
        ),
      ),
    );
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