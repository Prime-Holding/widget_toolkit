import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:widget_toolkit/open_url.dart';

void main() {
  group('OpenUrl widget tests', () {
    const url = 'https://primeholding.com/';
    const pumpDuration = Duration(seconds: 1);
    const debounceTime = Duration(milliseconds: 300);

    const childKey = Key('childKey');
    final childWidget = Container(
      key: childKey,
      width: 100,
      height: 100,
      color: Colors.transparent,
    );

    testWidgets('OpenUrl widget withDependencies', (tester) async {
      const openUrlKey = Key('openUrlKey');

      int callbacksCalled = 0;
      void callback() => callbacksCalled++;

      await tester.pumpWidget(
        OpenUrlWidgetWithDependencies(
          key: openUrlKey,
          url: url,
          onTap: callback,
          child: childWidget,
        ),
      );

      await tester.pump(pumpDuration);

      expect(find.byKey(openUrlKey), findsOneWidget);
      expect(find.byKey(childKey), findsOneWidget);
      expect(callbacksCalled, 0);

      await tester.tap(find.byKey(childKey));
      await tester.pump(debounceTime);

      expect(callbacksCalled, 1);
    });

    testWidgets('OpenUrl widget with manually provided dependencies',
        (tester) async {
      const openUrlKey = Key('openUrlKey');

      int callbacksCalled = 0;
      void callback() => callbacksCalled++;

      await tester.pumpWidget(
        MultiProvider(
          providers: OpenUrlDependencies.from().providers,
          child: OpenUrlWidget(
            key: openUrlKey,
            url: url,
            onTap: callback,
            child: childWidget,
          ),
        ),
      );

      await tester.pump(pumpDuration);

      expect(find.byKey(openUrlKey), findsOneWidget);
      expect(find.byKey(childKey), findsOneWidget);
      expect(callbacksCalled, 0);

      await tester.tap(find.byKey(childKey));
      await tester.pump(debounceTime);

      expect(callbacksCalled, 1);
    });
  });
}
