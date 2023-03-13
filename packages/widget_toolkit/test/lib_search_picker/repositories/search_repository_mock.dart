import '../models/search_model_mock.dart';

class SearchRepositoryMock {
  Future<List<SearchModelMock>> get searchList => Future.value(
      List.generate(10, (index) => SearchModelMock('Dummy data $index'))
          .toList());
}
