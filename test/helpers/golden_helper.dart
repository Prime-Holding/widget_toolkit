import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:widget_toolkit/edit_address.dart';
import 'package:widget_toolkit/search_picker.dart';
import 'package:widget_toolkit/widget_toolkit.dart';

import 'models/labeled_device_builder.dart';
import 'models/scenario.dart';

enum Themes { light, dark }

/// return a [LabeledDeviceBuilder] with a scenario rendered on all device sizes
///
/// [widget] - to be rendered in the golden master
///
/// [scenario] - [Scenario] which will be added to [DeviceBuilder]
LabeledDeviceBuilder generateDeviceBuilder({
  required Widget widget,
  required Scenario scenario,
}) {
  final deviceBuilder = LabeledDeviceBuilder(label: scenario.name)
    ..overrideDevicesForAllScenarios(
      devices: [
        Device.phone,
        Device.iphone11,
        Device.tabletPortrait,
        Device.tabletLandscape,
      ],
    )
    ..addScenario(
      widget: widget,
      name: scenario.name,
      onCreate: scenario.onCreate,
    );
  return deviceBuilder;
}

/// executes golden tests for each [LabeledDeviceBuilder] in every [theme]
///
/// [deviceBuilders] - list of [LabeledDeviceBuilder] to be pumped
///
/// [pumpFunction] (optional) - function for executing custom pumping
/// behavior instead of [pumpDeviceBuilderWithLocalizationsAndTheme]
void runGoldenTests(
  List<LabeledDeviceBuilder> deviceBuilders, {
  Future<void> Function(WidgetTester, DeviceBuilder, Themes? theme)?
      pumpFunction,
}) {
  for (final db in deviceBuilders) {
    //test each DeviceBuilder in both light mode and dark mode
    for (final theme in Themes.values) {
      final themeName = describeEnum(theme);
      final directory = '${themeName}_theme';

      testGoldens('$db - $themeName', (tester) async {
        pumpFunction != null
            ? await pumpFunction.call(tester, db, theme)
            : await pumpDeviceBuilderWithLocalizationsAndTheme(
                tester,
                db,
                theme: theme,
              );

        await screenMatchesGolden(
          tester,
          '$directory/$db',
          autoHeight: true,
          //defaults to pumpAndSettle, causing problems when testing animations
          customPump: db.label.contains('loading')
              ? (tester) async => await tester.pump(const Duration(seconds: 1))
              : null,
        );
      });
    }
  }
}

/// calls [pumpDeviceBuilderWithMaterialApp] with localizations we need in this
/// app, and injects an optional theme
Future<void> pumpDeviceBuilderWithLocalizationsAndTheme(
  WidgetTester tester,
  DeviceBuilder builder, {
  Themes? theme,
}) =>
    pumpDeviceBuilderWithMaterialApp(
      tester,
      builder,
      localizations: [
        ...GlobalMaterialLocalizations.delegates,
      ],
      theme: getThemeData(theme == Themes.light),
    );

ThemeData getThemeData(bool inLightMode) {
  final theme = inLightMode
      ? ThemeData.light().copyWith(extensions: [
          WidgetToolkitTheme.light,
          ItemPickerTheme.light,
          LanguagePickerTheme.light,
          SearchPickerTheme.light,
          TextFieldDialogTheme.light,
          TextFieldDialogTheme.light.copyWith(
            captionBold: const TextStyle(
              inherit: true,
            ),
            descriptionThin: const TextStyle(
              inherit: true,
            ),
          ),
          EditAddressTheme.light.copyWith(
            titleBold: const TextStyle(
              inherit: true,
            ),
          ),
        ])
      : ThemeData.dark().copyWith(extensions: [
          WidgetToolkitTheme.dark,
          ItemPickerTheme.dark,
          LanguagePickerTheme.dark,
          SearchPickerTheme.dark,
          TextFieldDialogTheme.dark.copyWith(
            captionBold: const TextStyle(
              inherit: true,
            ),
            descriptionThin: const TextStyle(
              inherit: true,
            ),
          ),
          EditAddressTheme.dark.copyWith(
            titleBold: const TextStyle(
              inherit: true,
            ),
          ),
        ]);
  return theme;
}

/// Wraps a [DeviceBuilder] in a [materialAppWrapper] using any of the
/// parameters we specify and pumps it
///
/// [tester] - [WidgetTester] DI
///
/// [builder] - [DeviceBuilder] to be pupmped
///
/// [platform] will override Theme's platform.
///
/// [localizations] (optional) -
/// a list of [LocalizationsDelegate] that is required for this test
///
/// [navigatorObserver] (optional) -
/// an interface for observing the behavior of a [Navigator].
///
/// [localeOverrides] (optional) -
/// sets supported supportedLocales, defaults to [Locale('en')]
///
/// [theme] (optional) - Your app theme
Future<void> pumpDeviceBuilderWithMaterialApp(
  WidgetTester tester,
  DeviceBuilder builder, {
  TargetPlatform platform = TargetPlatform.android,
  Iterable<LocalizationsDelegate<dynamic>>? localizations,
  NavigatorObserver? navigatorObserver,
  Iterable<Locale>? localeOverrides,
  ThemeData? theme,
}) async {
  await tester.pumpDeviceBuilder(
    builder,
    wrapper: materialAppWrapper(
      platform: platform,
      localizations: localizations,
      navigatorObserver: navigatorObserver,
      localeOverrides: localeOverrides,
      theme: theme,
    ),
  );
}
