import 'package:widget_toolkit/widget_toolkit.dart';

/// Provides validation for the input values of the city and address
class EditAddressFieldsServiceMock extends TextFieldValidator<String> {
  static const int minLengthRequired = 2;
  static const int maxLengthRequired = 6;

  @override
  Future<String> validateOnSubmit(String text) async {
    if (text.length >= maxLengthRequired) {
      throw Exception();
    }
    return text;
  }

  @override
  void validateOnType(String text) {
    if (text.length < minLengthRequired) {
      throw Exception();
    }
  }
}
