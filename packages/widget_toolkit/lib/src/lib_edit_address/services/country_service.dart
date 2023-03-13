import '../../../edit_address.dart';
import '../../../search_picker.dart';

/// The class should be used only in the library
///
/// The implementation of [getItems] should provide a list of countries to be
/// loaded in the search picker
///
/// The implementation of [getPlaceholderList] should provide a list
/// of empty country model, to be loaded while the actual list is being loaded
///
/// The implementation of [filteredListByName] should provide a logic for
/// filtering the countries list by the searchParam and returning the list of
/// the matching countries
class CountryService<T> extends SearchPickerService<T> {
  CountryService({required this.editAddressService});

  final EditAddressService<T> editAddressService;

  @override
  Future<List<T>> getItems() {
    return editAddressService.getCountries();
  }

  @override
  Future<List<T>> filteredListByName(List<T> list, String? searchParam) async {
    return editAddressService.filteredCountriesByName(list, searchParam);
  }

  @override
  List<T> getPlaceholderList() {
    return editAddressService.getCountryPlaceholderList();
  }
}
