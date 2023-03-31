import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_toolkit_otp/widget_toolkit_otp.dart';

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
          timeFormat: CountdownTimeFormat.minutes,
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
          timeFormat: CountdownTimeFormat.minutes,
          key: key,
          onCountdownTick: (_) {
            decreaseDuration();
          },
        ),
      );
      await tester.pump(Stubs.durationOneSecond);
      expect(duration, 4);
    });
    testWidgets('countdown_widget_success_1sec_hours', (tester) async {
      int duration = 11;
      final key = ValueKey(duration.toString());
      void decreaseDuration() => duration--;
      await tester.pumpWidget(
        buildCountdown(
          countdownTime: duration,
          timeFormat: CountdownTimeFormat.hours,
          key: key,
          onCountdownTick: (_) {
            decreaseDuration();
          },
        ),
      );
      await tester.pump(Stubs.durationOneSecond);
      expect(duration, 10);
    });
  });
}
