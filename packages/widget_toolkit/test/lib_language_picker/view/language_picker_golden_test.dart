import '../../helpers/golden_helper.dart';
import '../../helpers/models/scenario.dart';
import '../factory/language_picker_page_factory.dart';

void main() {
  runGoldenTests([
    generateDeviceBuilder(
        widget: languagePickerSuccessPageFactory(
          showError: false,
          isLoading: false,
        ),
        scenario: Scenario(name: 'language_picker_success')),
  ]);
}
