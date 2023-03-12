abstract class SearchPickerService<T> {
  Future<List<T>> getItems();

  /// By default this function checks if the item.toString() contains the searchParam.
  /// Not case-sensitive
  Future<List<T>> filteredListByName(List<T> list, String? searchParam) async {
    if (searchParam == null) {
      return list;
    }
    return list
        .where((item) =>
            (item.toString()).toLowerCase().contains(searchParam.toLowerCase()))
        .toList();
  }

  List<T> getPlaceholderList();
}
