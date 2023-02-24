abstract class SearchPickerService<T> {
  Future<List<T>> getItems();

  Future<List<T>> filteredListByName(List<T> list, String? searchParam);

  List<T> getPlaceholderList();
}
