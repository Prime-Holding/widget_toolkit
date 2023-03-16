import '../../../edit_address.dart';
import '../../../text_field_dialog.dart';

/// The class should be used only in the library
///
/// The method [validateOnSubmit] is used for the validation of the street value when
/// pressing the save button
///
/// The method [validateOnSubmit] is used for the validation of the street value when
/// while typing
class StreetService extends TextFieldValidator<String> {
  StreetService({required this.editAddressService});

  final EditAddressService editAddressService;

  @override
  Future<String> validateOnSubmit(String text) =>
      editAddressService.validateStreetOnSubmit(text);

  @override
  void validateOnType(String text) =>
      editAddressService.validateStreetOnType(text);
}
