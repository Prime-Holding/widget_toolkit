import 'package:widget_toolkit/ui_components.dart';

import '../../helpers/golden_helper.dart';
import '../../helpers/models/scenario.dart';
import 'factory/small_button_factory.dart';
// Import your SmallButton widget and other necessary files

void main() {
  runGoldenTests([
    generateDeviceBuilder(
        widget: smallButtonFactory(state: ButtonStateModel.loading),
        scenario: Scenario(name: 'small_button_loading')),
    generateDeviceBuilder(
        widget: smallButtonFactory(state: ButtonStateModel.enabled),
        scenario: Scenario(name: 'small_button_enabled')),
    generateDeviceBuilder(
        widget: smallButtonFactory(state: ButtonStateModel.disabled),
        scenario: Scenario(name: 'small_button_disabled')),
    generateDeviceBuilder(
        widget: smallButtonFactory(state: ButtonStateModel.pressed),
        scenario: Scenario(name: 'small_button_pressed')),
  ]);
}
