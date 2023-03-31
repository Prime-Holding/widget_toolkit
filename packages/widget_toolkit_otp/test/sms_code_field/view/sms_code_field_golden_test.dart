import 'package:mockito/annotations.dart';

import '../../helpers/golden_helper.dart';
import '../../helpers/models/scenario.dart';
import '../../stubs.dart';
import 'factory/sms_code_field_factory.dart';

@GenerateMocks([])
void main() {
  runGoldenTests([
    generateDeviceBuilder(
        widget: smsCodeFieldFactory(
          key: Stubs.smsCodeFieldKey,
          obscureText: true,
          controller: Stubs.controllerEmpty,
          pinLength: 6,
        ),
        scenario: Scenario(name: 'sms_code_field_golden_empty')),
    generateDeviceBuilder(
        widget: smsCodeFieldFactory(
          key: Stubs.smsCodeFieldKey,
          obscureText: true,
          controller: Stubs.controllerFourDigits,
          pinLength: 6,
        ),
        scenario: Scenario(name: 'sms_code_field_golden_inProgress')),
    generateDeviceBuilder(
        widget: smsCodeFieldFactory(
          key: Stubs.smsCodeFieldKey,
          obscureText: true,
          controller: Stubs.controllerSixDigits,
          pinLength: 6,
        ),
        scenario: Scenario(name: 'sms_code_field_golden_success')),
    generateDeviceBuilder(
        widget: smsCodeFieldFactory(
          key: Stubs.smsCodeFieldKey,
          obscureText: false,
          controller: Stubs.controllerSixDigits,
          pinLength: 6,
        ),
        scenario: Scenario(name: 'sms_code_field_golden_success_non_obscured')),
    generateDeviceBuilder(
        widget: smsCodeFieldFactory(
            key: Stubs.smsCodeFieldKey,
            obscureText: true,
            controller: Stubs.controllerSixDigits,
            pinLength: 6,
            validator: (_, __) => 'An error occur!',
            autoValidate: true,
            forceErrorState: true),
        scenario: Scenario(name: 'sms_code_field_golden_error')),
  ]);
}
