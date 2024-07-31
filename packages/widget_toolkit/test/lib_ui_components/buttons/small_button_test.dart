import 'package:widget_toolkit/ui_components.dart';

import '../../helpers/golden_helper.dart';
import '../../helpers/models/scenario.dart';
import 'factory/small_button_factory.dart';
// Import your SmallButton widget and other necessary files

void main() {
  runGoldenTests([
    generateDeviceBuilder(
        widget: smallButtonFactory(
            state: ButtonStateModel.loading, type: SmallButtonType.outline),
        scenario: Scenario(name: 'small_button_outlined_loading')),
    generateDeviceBuilder(
        widget: smallButtonFactory(
            state: ButtonStateModel.enabled, type: SmallButtonType.outline),
        scenario: Scenario(name: 'small_button_outlined_enabled')),
    generateDeviceBuilder(
        widget: smallButtonFactory(
            state: ButtonStateModel.disabled, type: SmallButtonType.outline),
        scenario: Scenario(name: 'small_button_outlined_disabled')),
    generateDeviceBuilder(
        widget: smallButtonFactory(
            state: ButtonStateModel.pressed, type: SmallButtonType.outline),
        scenario: Scenario(name: 'small_button_outlined_pressed')),
    generateDeviceBuilder(
        widget: smallButtonFactory(
            state: ButtonStateModel.loading, type: SmallButtonType.filled),
        scenario: Scenario(name: 'small_button_filled_loading')),
    generateDeviceBuilder(
        widget: smallButtonFactory(
            state: ButtonStateModel.enabled, type: SmallButtonType.filled),
        scenario: Scenario(name: 'small_button_filled_enabled')),
    generateDeviceBuilder(
        widget: smallButtonFactory(
            state: ButtonStateModel.disabled, type: SmallButtonType.filled),
        scenario: Scenario(name: 'small_button_filled_disabled')),
    generateDeviceBuilder(
        widget: smallButtonFactory(
            state: ButtonStateModel.pressed, type: SmallButtonType.filled),
        scenario: Scenario(name: 'small_button_filled_pressed')),
  ]);
}
