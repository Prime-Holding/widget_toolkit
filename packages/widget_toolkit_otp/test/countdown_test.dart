import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/widget_builders.dart';
import 'stubs.dart';

void main() {
  group('countdown_widget_test', () {
    testWidgets('countdown_widget_success', (tester) async {
      int duration = 5;
      final key = ValueKey(duration.toString());
      await tester.pumpWidget(
        buildCountdown(
          countdownTime: duration,
          key: key,
        ),
      );
      expect(duration, 5);
    });
    testWidgets('countdown_widget_success_1sec', (tester) async {
      int duration = 5;
      final key = ValueKey(duration.toString());
      void decreaseDuration() => duration--;
      await tester.pumpWidget(
        buildCountdown(
          countdownTime: duration,
          key: key,
          onCountdownTick: (_) {
            decreaseDuration();
          },
        ),
      );
      await tester.pump(Stubs.durationOneSecond);
      expect(duration, 4);
    });
  });
}
