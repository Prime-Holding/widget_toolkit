import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_toolkit/widget_toolkit.dart';

import 'helpers/golden_helper.dart';

void main() {
  group('Shimmer types tests', () {
    // Default values for shimmer types
    const defaultShimmerTypeFixedLength = 12;
    const defaultShimmerTypeProportionalFlexLeading = 3;
    const defaultShimmerTypeProportionalFlexTrailing = 5;
    const defaultShimmerTypeRandomFlexMinLeading = 3;
    const defaultShimmerTypeRandomFlexMaxLeading = 5;
    const defaultShimmerTypeRandomFlexTrailing = 2;

    // Custom values for shimmer types
    const shimmerTypeFixedLength = 10;
    const shimmerTypeProportionalFlexLeading = 10;
    const shimmerTypeProportionalFlexTrailing = 1;
    const shimmerTypeRandomFlexMinLeading = 10;
    const shimmerTypeRandomFlexMaxLeading = 20;
    const shimmerTypeRandomFlexTrailing = 5;
    const shimmerTypeRandomFlexStaticLeading = 19;

    test('Default ShimmerTypeFixed shimmer type', () {
      final shimmerType = ShimmerType.fixed();

      expect(shimmerType.placeholderLength, defaultShimmerTypeFixedLength);
      expect(shimmerType.placeholderText, '------------');
    });

    test('Custom ShimmerTypeFixed shimmer type', () {
      final shimmerType =
          ShimmerType.fixed(placeholderLength: shimmerTypeFixedLength);

      expect(shimmerType.placeholderLength, shimmerTypeFixedLength);
      expect(shimmerType.placeholderText, '----------');
    });

    test('Default ShimmerTypeProportional shimmer type', () {
      final shimmerType = ShimmerType.proportional();

      expect(
        shimmerType.leadingFlex,
        defaultShimmerTypeProportionalFlexLeading,
      );
      expect(
        shimmerType.trailingFlex,
        defaultShimmerTypeProportionalFlexTrailing,
      );

      expect(shimmerType.placeholderText, '-');
    });

    test('Custom ShimmerTypeProportional shimmer type', () {
      final shimmerType = ShimmerType.proportional(
        leadingFlex: shimmerTypeProportionalFlexLeading,
        trailingFlex: shimmerTypeProportionalFlexTrailing,
      );

      expect(
        shimmerType.leadingFlex,
        shimmerTypeProportionalFlexLeading,
      );
      expect(
        shimmerType.trailingFlex,
        shimmerTypeProportionalFlexTrailing,
      );

      expect(shimmerType.placeholderText, '-');
    });

    test('Default ShimmerTypeRandom shimmer type', () {
      final shimmerType = ShimmerType.random();

      // Check for expected parameters
      expect(shimmerType.placeholderText, '-');
      expect(
        shimmerType.trailingFlex,
        defaultShimmerTypeRandomFlexTrailing,
      );
      expect(
        shimmerType.minLeadingFlex,
        defaultShimmerTypeRandomFlexMinLeading,
      );
      expect(
        shimmerType.maxLeadingFlex,
        defaultShimmerTypeRandomFlexMaxLeading,
      );

      // Check first for case where we generate the leading flex when there is
      // no static leading flex.
      ShimmerTypeRandom.leadingFlex = null;
      expect(ShimmerTypeRandom.leadingFlex, isNull);
      expect(
        shimmerType.generateLeadingFlex(),
        allOf(
          greaterThanOrEqualTo(defaultShimmerTypeRandomFlexMinLeading),
          lessThanOrEqualTo(defaultShimmerTypeRandomFlexMaxLeading),
        ),
      );

      // Now check first for case where we generate the leading flex when there
      // is a static leading flex.
      ShimmerTypeRandom.leadingFlex = shimmerTypeRandomFlexStaticLeading;
      expect(ShimmerTypeRandom.leadingFlex, isNotNull);
      expect(
        shimmerType.generateLeadingFlex(),
        shimmerTypeRandomFlexStaticLeading,
      );
    });

    test('Custom ShimmerTypeRandom shimmer type', () {
      final shimmerType = ShimmerType.random(
        minLeadingFlex: shimmerTypeRandomFlexMinLeading,
        maxLeadingFlex: shimmerTypeRandomFlexMaxLeading,
        trailingFlex: shimmerTypeRandomFlexTrailing,
      );

      // Check for expected parameters
      expect(shimmerType.placeholderText, '-');
      expect(
        shimmerType.trailingFlex,
        shimmerTypeRandomFlexTrailing,
      );
      expect(
        shimmerType.minLeadingFlex,
        shimmerTypeRandomFlexMinLeading,
      );
      expect(
        shimmerType.maxLeadingFlex,
        shimmerTypeRandomFlexMaxLeading,
      );

      // Check first for case where we generate the leading flex when there is
      // no static leading flex.
      ShimmerTypeRandom.leadingFlex = null;
      expect(ShimmerTypeRandom.leadingFlex, isNull);
      expect(
        shimmerType.generateLeadingFlex(),
        allOf(
          greaterThanOrEqualTo(shimmerTypeRandomFlexMinLeading),
          lessThanOrEqualTo(shimmerTypeRandomFlexMaxLeading),
        ),
      );

      // Now check first for case where we generate the leading flex when there
      // is a static leading flex.
      ShimmerTypeRandom.leadingFlex = shimmerTypeRandomFlexStaticLeading;
      expect(ShimmerTypeRandom.leadingFlex, isNotNull);
      expect(
        shimmerType.generateLeadingFlex(),
        shimmerTypeRandomFlexStaticLeading,
      );
    });
  });

  group('Shimmer widget tests', () {
    const pumpDuration = Duration(seconds: 1);
    const String? missingShimmerText = null;
    const shimmerText = 'Placeholder text';

    testWidgets('App Shimmer with shimmer enabled', (tester) async {
      const childKey = Key('childKey');
      await tester.pumpWidget(
        MaterialApp(
          theme: getThemeData(true),
          home: const AppShimmer(
            showShimmer: true,
            child: SizedBox(key: childKey),
          ),
        ),
      );

      await tester.pump(pumpDuration);

      // Make sure the child is there
      expect(
        tester.widget<SizedBox>(find.byKey(childKey)),
        isNotNull,
      );

      // Make sure we are performing the shimmer animation (the shimmer
      // container exists in the widget tree).
      expect(
        tester.widget<Container>(find.byKey(AppShimmer.shimmerContainerKey)),
        isNotNull,
      );
    });

    testWidgets('App Shimmer with shimmer disabled', (tester) async {
      const childKey = Key('childKey');
      await tester.pumpWidget(
        MaterialApp(
          theme: getThemeData(true),
          home: const AppShimmer(
            showShimmer: false,
            child: SizedBox(key: childKey),
          ),
        ),
      );

      await tester.pump(pumpDuration);

      // Make sure the child is there
      expect(
        tester.widget<SizedBox>(find.byKey(childKey)),
        isNotNull,
      );

      // Make sure we are NOT performing the shimmer animation (the shimmer
      // container does not exist in the widget tree).
      expect(find.byKey(AppShimmer.shimmerContainerKey), findsNothing);
    });

    testWidgets('App Shimmer Text with shimmer enabled', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: getThemeData(true),
          home: const AppShimmerText(missingShimmerText),
        ),
      );

      await tester.pump(pumpDuration);

      // Whenever the AppShimmerText text field is null, we display the shimmer
      // animation.
      expect(
        tester.widget<Container>(find.byKey(AppShimmer.shimmerContainerKey)),
        isNotNull,
      );
    });

    testWidgets('App Shimmer Text with shimmer disabled', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: getThemeData(true),
          home: const AppShimmerText(shimmerText),
        ),
      );

      await tester.pump(pumpDuration);

      expect(tester.widget<Text>(find.text(shimmerText)), isNotNull);
      expect(find.byKey(AppShimmer.shimmerContainerKey), findsNothing);
    });
  });
}
