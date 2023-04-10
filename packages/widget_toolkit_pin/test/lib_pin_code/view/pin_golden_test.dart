import 'package:flutter/material.dart';
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
        child: PinCodeKeyboard.generic(
          isLoading: isLoading,
          onApplyPressed: (p0) {},
          onChangePin: () {},
          keyLength: 6,
          pinCodeService: pinCodeService,
        ),
      ),
    );
