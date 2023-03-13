import '../../../edit_address.dart';

/// The class provides API for saving the address, editing the values of the address:
/// city name and street name,fetching and filtering the countries list for the address.
/// Some methods does not have implementation and implementation for them should
/// be provided in your project, while some of the methods provide default
/// implementation, which if you want you can override with yours.
///
/// A class which method's [saveAddress] implementation should provide logic for
/// the saving of the edited address
///
/// The implementation of [getCountries] should provide a list of countries to be
/// loaded in the search picker
///
/// The implementation of [getCountryPlaceholderList] should provide a list
/// of empty country model, to be loaded while the actual list is being loaded
///
/// The implementation of [filteredCountriesByName] should provide a logic for
/// filtering the countries list by the searchParam and returning the list of
/// the matching countries
///
/// The implementation of [validateCityOnSubmit] should provide a logic for
/// validating the value of the city name when pressing the save button
///
/// The implementation of [validateStreetOnSubmit] should provide a logic for
/// validating the value of the street name when pressing the save button
///
/// The implementation of [validateCityOnType] should provide a logic for
/// validating the value of the city name while typing
///
/// The implementation of [validateStreetOnType] should provide a logic for
/// validating the value of the street name while typing
///
abstract class EditAddressService<T> {
  Future<AddressModel> saveAddress(AddressModel addressModel);

  Future<List<T>> getCountries();

  List<T> getCountryPlaceholderList();

  Future<List<T>> filteredCountriesByName(
      List<T> list, String? searchParam) async {
    if (searchParam == null) {
      return list;
    }
    return list
        .where((item) =>
            (item.toString()).toLowerCase().contains(searchParam.toLowerCase()))
        .toList();
  }

  Future<String> validateCityOnSubmit(String text) async {
    await Future.delayed(const Duration(seconds: 1));
    if (text.trim().isEmpty) {
      await Future.delayed(const Duration(seconds: 1));
      throw Exception('A value should be provided');
    }
    return text;
  }

  Future<String> validateStreetOnSubmit(String text) async {
    if (text.trim().isEmpty) {
      await Future.delayed(const Duration(seconds: 1));
      throw Exception('A value should be provided');
    }
    return text;
  }

  void validateCityOnType(String text) {
    if (text.trim().isEmpty) {
      throw Exception('A value should be provided');
    }
  }

  void validateStreetOnType(String text) {
    if (text.trim().isEmpty) {
      throw Exception('A value should be provided');
    }
  }
}
