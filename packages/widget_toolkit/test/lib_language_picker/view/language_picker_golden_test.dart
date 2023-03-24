import '../../helpers/golden_helper.dart';
import '../../helpers/models/scenario.dart';
import '../factory/language_picker_page_factory.dart';

void main() {
  runGoldenTests([
    generateDeviceBuilder(
        widget: languagePickerSuccessPageFactory(
          showError: false,
          hasLeftIcon: false,
          isLoading: false,
        ),
        scenario: Scenario(name: 'language_picker_success')),
    generateDeviceBuilder(
        widget: languagePickerSuccessPageFactory(
          showError: false,
          hasLeftIcon: true,
          isLoading: false,
        ),
        scenario: Scenario(name: 'language_picker_has_left_icon')),
  ]);
}
