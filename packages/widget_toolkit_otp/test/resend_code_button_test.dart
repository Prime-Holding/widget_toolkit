import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/widget_builders.dart';
import 'stubs.dart';

void main() {
  group('resend_code_button_widget_tests', () {
    testWidgets('resend_code_button_success', (tester) async {
      const key = ValueKey('resendButtonKey');
      int tapCounter = 0;
      void tapButton() => tapCounter++;
      await tester.pumpWidget(
        resendButtonFactory(
            onPressed: () async {
              tapButton();
            },
            key: Stubs.buttonKey),
      );
      await tester.tap(
        find.byKey(key),
      );
      await tester.pump(Stubs.durationThreeSeconds);
      expect(tapCounter, 1);
    });

    testWidgets('resend_code_button_success', (tester) async {
      int errorCounter = 0;

      void registerError() => errorCounter++;
      await tester.pumpWidget(
        resendButtonFactory(
            onPressed: () async {
              throw (Exception('No internet connection!'));
            },
            onError: (error) {
              registerError();
            },
            key: Stubs.buttonKey),
      );
      await tester.tap(
        find.byKey(Stubs.buttonKey),
      );
      await tester.pump(Stubs.durationThreeSeconds);
      expect(errorCounter, 1);
    });
  });
}
