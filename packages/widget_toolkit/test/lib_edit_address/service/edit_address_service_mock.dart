import 'package:widget_toolkit/widget_toolkit.dart';

/// Provides validation for the input values of the city and address
class EditAddressServiceMock<T> extends EditAddressService<T> {
  EditAddressServiceMock({required this.showError});

  final bool showError;

  static const int minLengthRequired = 2;
  static const int maxLengthRequired = 6;

  @override
  Future<AddressModel> saveAddress(AddressModel addressModel) async {
    if (showError) {
      throw Exception('Could not save the address');
    } else {
      return addressModel;
    }
  }

  @override
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

  @override
  Future<List<T>> getCountries() => Future.delayed(
        const Duration(seconds: 1),
        () => _countriesList
            .map((country) =>
                CountryModel(countryCode: 'US', countryName: country) as T)
            .toList(),
      );

  final _countriesList = [
    'Afghanistan',
    'Albania',
    'Algeria',
    'Andorra',
    'Angola',
    'Anguilla',
    'Antigua &amp; Barbuda',
    'Argentina',
    'Armenia',
  ];

  @override
  List<T> getCountryPlaceholderList() =>
      List.generate(3, (index) => CountryModel.empty() as T);
}
