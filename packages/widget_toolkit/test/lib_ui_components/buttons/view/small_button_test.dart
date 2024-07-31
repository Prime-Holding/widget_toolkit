import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:widget_toolkit/ui_components.dart';

import '../../../helpers/golden_helper.dart';
import '../factory/small_button_factory.dart';

void main() {
  runGoldenBuilderTests(
    'small_button_golden_tests',
    surfaceSize: const Size(700, 350),
    matcherCustomPump: (widget) =>
        widget.pump(const Duration(milliseconds: 350)),
    builder: GoldenBuilder.grid(
      columns: 4,
      widthToHeightRatio: 1,
    )
      ..addScenario(
          'loading filled',
          smallButtonFactory(
              type: SmallButtonType.filled, state: ButtonStateModel.loading))
      ..addScenario(
          'enabled filled',
          smallButtonFactory(
              type: SmallButtonType.filled, state: ButtonStateModel.enabled))
      ..addScenario(
          'disabled filled',
          smallButtonFactory(
              type: SmallButtonType.filled, state: ButtonStateModel.disabled))
      ..addScenario(
          'pressed filled',
          smallButtonFactory(
              type: SmallButtonType.filled, state: ButtonStateModel.pressed))
      ..addScenario(
          'loading outlined',
          smallButtonFactory(
              type: SmallButtonType.outline, state: ButtonStateModel.loading))
      ..addScenario(
          'enabled outlined',
          smallButtonFactory(
              type: SmallButtonType.outline, state: ButtonStateModel.enabled))
      ..addScenario(
          'disabled outlined',
          smallButtonFactory(
              type: SmallButtonType.outline, state: ButtonStateModel.disabled))
      ..addScenario(
          'pressed outlined',
          smallButtonFactory(
              type: SmallButtonType.outline, state: ButtonStateModel.pressed)),
  );
}
