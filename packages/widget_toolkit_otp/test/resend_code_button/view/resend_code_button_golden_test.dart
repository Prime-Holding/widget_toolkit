import 'package:widget_toolkit/ui_components.dart';

import '../../helpers/golden_helper.dart';
import '../../helpers/models/scenario.dart';
import 'factory/resend_code_button_factory.dart';

void main() {
  runGoldenTests([
    generateDeviceBuilder(
        widget: resendCodeButtonFactory(),
        scenario: Scenario(name: 'resend_code_button')),
    generateDeviceBuilder(
        widget: resendCodeButtonFactory(state: ButtonStateModel.disabled),
        scenario: Scenario(name: 'resend_code_button_disabled')),
  ]);
}
