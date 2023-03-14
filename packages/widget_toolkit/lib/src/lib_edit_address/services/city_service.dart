import '../../../edit_address.dart';
import '../../../text_field_dialog.dart';

/// The class should be used only in the library
///
/// The method [validateOnSubmit] is used for the validation of the city value when
/// pressing the save button
///
/// The method [validateOnSubmit] is used for the validation of the city value when
/// while typing
class CityService extends TextFieldValidator<String> {
  CityService({required this.editAddressService});

  final EditAddressService editAddressService;

  @override
  Future<String> validateOnSubmit(String text) =>
      editAddressService.validateCityOnSubmit(text);

  @override
  void validateOnType(String text) =>
      editAddressService.validateCityOnType(text);
}
