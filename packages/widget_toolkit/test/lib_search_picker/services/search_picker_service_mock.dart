import 'package:widget_toolkit/search_picker.dart';

import '../models/search_model_mock.dart';
import '../repositories/search_repository_mock.dart';

class SearchPickerServiceMock extends SearchPickerService<SearchModelMock> {
  SearchPickerServiceMock(this._searchRepositoryMock);

  final SearchRepositoryMock _searchRepositoryMock;

  @override
  Future<List<SearchModelMock>> filteredListByName(
      List<SearchModelMock> list, String? searchParam) async {
    if (searchParam == null) {
      return list;
    }

    return list
        .where((item) =>
            item.value.toLowerCase().contains(searchParam.toLowerCase()))
        .toList();
  }

  @override
  Future<List<SearchModelMock>> getItems() async =>
      _searchRepositoryMock.searchList;

  @override
  List<SearchModelMock> getPlaceholderList() =>
      List.generate(5, (index) => SearchModelMock(index.toString())).toList();
}
