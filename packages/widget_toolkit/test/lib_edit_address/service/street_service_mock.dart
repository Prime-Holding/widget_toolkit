import 'package:widget_toolkit/src/lib_edit_address/services/street_service.dart';

class StreetServiceMock extends StreetService {
  StreetServiceMock({required super.editAddressService});

  @override
  Future<String> validateOnSubmit(String text) =>
      editAddressService.validateStreetOnSubmit(text);

  @override
  void validateOnType(String text) =>
      editAddressService.validateStreetOnType(text);
}
