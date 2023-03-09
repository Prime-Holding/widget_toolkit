import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:rx_bloc_test/rx_bloc_test.dart';
import 'package:widget_toolkit/language_picker.dart';
import 'package:widget_toolkit/src/lib_search_picker/blocs/search_picker_bloc.dart';

import '../../mocks/stubs.dart';
import '../models/search_model_mock.dart';
import '../repositories/search_repository_mock.dart';
import '../services/search_picker_service_mock.dart';
import 'search_picker_test.mocks.dart';

late SearchRepositoryMock _repository;

@GenerateMocks([SearchRepositoryMock])
void main() {
  setUp(() {
    _repository = MockSearchRepositoryMock();
  });

  group('test search_picker_bloc state', () {
    rxBlocTest<SearchPickerBlocType<SearchModelMock>,
            Result<List<SearchModelMock>>>(
        'test search_picker_bloc state itemsList',
        build: () async {
          _defineWhen();
          return searchPickerBloc();
        },
        act: (bloc) async {},
        state: (bloc) => bloc.states.itemsList,
        expect: [
          Result.loading(),
          Result.success(Stubs.searchPickerData),
        ]);

    rxBlocTest<SearchPickerBlocType<SearchModelMock>,
            Result<List<SearchModelMock>>>(
        'test search_picker_bloc state itemsList - query with success result',
        build: () async {
          _defineWhen();
          return searchPickerBloc();
        },
        act: (bloc) async {
          bloc.events.filterByQuery(query: Stubs.searchPickerFilterSuccess);
        },
        state: (bloc) => bloc.states.itemsList,
        expect: [
          Result.loading(),
          Result.success(Stubs.searchPickerFilterSuccessResult),
        ]);

    rxBlocTest<SearchPickerBlocType<SearchModelMock>,
            Result<List<SearchModelMock>>>(
        'test search_picker_bloc state itemsList - query with no results',
        build: () async {
          _defineWhen();
          return searchPickerBloc();
        },
        act: (bloc) async {
          bloc.events.filterByQuery(query: Stubs.searchPickerFilterNotExisting);
        },
        state: (bloc) => bloc.states.itemsList,
        expect: [
          Result.loading(),
          Result.success(Stubs.searchPickerFilterEmptyResult),
        ]);

    rxBlocTest<SearchPickerBlocType<SearchModelMock>,
            Result<List<SearchModelMock>>>(
        'test search_picker_bloc state itemsList with error',
        build: () async {
          when(_repository.searchList)
              .thenAnswer((_) => throw GenericErrorModel());

          return searchPickerBloc();
        },
        act: (bloc) async {},
        state: (bloc) => bloc.states.itemsList,
        expect: [
          Result.loading(),
          Result.error(GenericErrorModel()),
        ]);
  });
}

void _defineWhen() {
  when(_repository.searchList).thenAnswer((_) => Future.value(
        (Stubs.searchPickerData),
      ));
}

SearchPickerBloc<SearchModelMock> searchPickerBloc() =>
    SearchPickerBloc<SearchModelMock>(
      SearchPickerServiceMock(_repository),
    );
