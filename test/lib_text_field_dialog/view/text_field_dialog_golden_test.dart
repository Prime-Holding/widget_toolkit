import '../../helpers/golden_helper.dart';
import '../../helpers/models/scenario.dart';
import '../../mocks/stubs.dart';
import '../factory/text_field_dialog_factory.dart';

void main() {
  runGoldenTests([
    generateDeviceBuilder(
        widget: textFieldDialogFactory(
          submittedResult: Stubs.textFieldDialogResultLoading,
        ),
        scenario: Scenario(name: 'text_field_dialog_loading')),
    generateDeviceBuilder(
        widget: textFieldDialogFactory(
          submittedResult: Stubs.textFieldDialogResultError,
        ),
        scenario: Scenario(name: 'text_field_dialog_error')),
  ]);
}
