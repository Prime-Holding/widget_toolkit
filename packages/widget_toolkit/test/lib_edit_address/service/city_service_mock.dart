import 'package:widget_toolkit/src/lib_edit_address/services/city_service.dart';

class CityServiceMock extends CityService {
  CityServiceMock({required editAddressService})
      : super(editAddressService: editAddressService);

  @override
  Future<String> validateOnSubmit(String text) =>
      editAddressService.validateCityOnSubmit(text);

  @override
  void validateOnType(String text) =>
      editAddressService.validateCityOnType(text);
}
