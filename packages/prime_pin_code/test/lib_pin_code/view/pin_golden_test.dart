import 'package:flutter/material.dart';
import 'package:prime_pin_code/prime_pin_code.dart';

import '../../helpers/golden_helper.dart';
import '../../helpers/models/scenario.dart';

void main() {
  // AppBarExtension.fullscreenDialog = true;
  runGoldenTests([
    generateDeviceBuilder(
      widget: buildInScaffold(
        PinCodeKeyboard.generic(
          onApplyPressed: (p0) {},
          onChangePin: () {},
          keyLength: 6,
        ),
      ), //example: Stubs.emptyList
      scenario: Scenario(name: 'pin_empty_close'),
    ),
    generateDeviceBuilder(
      widget: buildInScaffold(
        PinCodeKeyboard.generic(
          isLoading: true,
          onApplyPressed: (p0) {},
          onChangePin: () {},
          keyLength: 6,
        ),
      ), //example: Stubs.emptyList
      scenario: Scenario(name: 'pin_loading'),
    ),
  ], awaitPump: true);
}

Widget buildInScaffold(Widget child) => Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: child,
      ),
    );
