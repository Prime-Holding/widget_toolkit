import 'package:widget_toolkit/widget_toolkit.dart';

class TextFieldDialogServiceMock extends TextFieldValidator<String> {
  static const int minLengthRequired = 2;
  static const int maxLengthRequired = 6;

  @override
  Future<String> validateOnSubmit(String text) async {
    if (text.length >= maxLengthRequired) {
      throw GenericErrorModel(
        customMessage: 'Server side message, enter at most 6 symbols',
      );
    }
    return text;
  }

  @override
  void validateOnType(String text) {
    if (text.length < minLengthRequired) {
      throw Exception('Min Length required');
    }
  }
}
