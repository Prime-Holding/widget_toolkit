import 'package:example/keys_testing/edit_field_page_keys.dart' as keys;

import 'base_page.dart';

class EditFieldsPage extends BasePage {
  EditFieldsPage(super.$);

  Future<void> tapSaveButton() async => tapWidget(keys.saveButton);

  Future<void> tapFirstNameDialog() async => tapWidget(keys.firstNameDialog);

  Future<void> setFirstName(String firstName) async =>
      setInputField(keys.firstNameTextField, firstName);
}
