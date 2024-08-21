import 'package:example/keys_testing/base_page_keys.dart' as keys;
import 'package:patrol/patrol.dart';

abstract class BasePage {
  late PatrolIntegrationTester $;

  BasePage(this.$);

  Future<void> tapWidget(var widget) async => $(widget).tap();

  Future<void> setInputField(var widget, String inputText) async =>
      $(widget).enterText(inputText);

  Future<void> tapNextButton() async => $(keys.nextButton).tap();
}
