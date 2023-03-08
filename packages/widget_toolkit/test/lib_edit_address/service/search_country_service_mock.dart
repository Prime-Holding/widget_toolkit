import 'package:widget_toolkit/edit_address.dart';
import 'package:widget_toolkit/search_picker.dart';

import '../repository/search_country_repository_mock.dart';

/// Provides logic for the country search picker
class SearchCountryServiceMock implements SearchPickerService<CountryModel> {
  SearchCountryServiceMock(this._searchRepository, this.showError);

  final SearchCountryRepositoryMock _searchRepository;
  final bool showError;

  @override
  Future<List<CountryModel>> filteredListByName(
      List<CountryModel> list, String? searchParam) async {
    if (searchParam == null) {
      return list;
    }

    return list
        .where((item) => (item.countryName)
            .toLowerCase()
            .contains(searchParam.toLowerCase()))
        .toList();
  }

  @override
  Future<List<CountryModel>> getItems() async =>
      showError ? throw Exception() : await _searchRepository.searchList;

  @override
  List<CountryModel> getPlaceholderList() =>
      List.generate(5, (index) => CountryModel.empty());
}
