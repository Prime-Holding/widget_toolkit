import '../configuration/build_app.dart';
import '../configuration/patrol_base_config.dart';
import '../pages/edit_fields_page.dart';

void main() {
  final patrolBaseConfig = PatrolBaseConfig();

  patrolBaseConfig.patrol('TextFieldDialog debug test', ($) async {
    const testInput = 'Test Input';

    final editFieldsPage = EditFieldsPage($);

    await BuildApp($).buildApp();

    await editFieldsPage.tapNextButton();
    await editFieldsPage.tapNextButton();
    await editFieldsPage.tapFirstNameDialog();
    await editFieldsPage.setFirstName(testInput);
    await editFieldsPage.tapSaveButton();
    await Future.delayed(const Duration(seconds: 30));
  });
}
