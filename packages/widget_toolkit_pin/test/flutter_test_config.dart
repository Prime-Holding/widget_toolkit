import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'helpers/widget_toolkit_pin_file_comparator.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async =>
    GoldenToolkit.runWithConfiguration(
      () async {
        WidgetsApp.debugAllowBannerOverride = false;

        await loadAppFonts();
        return testMain();
      },
      config: GoldenToolkitConfiguration(
        enableRealShadows: true,
        fileNameFactory: (String name) {
          final fileName = 'goldens/$name.png';

          goldenFileComparator = WidgetToolkitPinFileComparator(fileName);

          return fileName;
        },
      ),
    );
