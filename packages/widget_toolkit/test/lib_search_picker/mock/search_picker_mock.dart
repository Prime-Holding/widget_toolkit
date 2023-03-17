import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:widget_toolkit/src/lib_search_picker/blocs/search_picker_bloc.dart';

import '../../mocks/stubs.dart';
import '../models/search_model_mock.dart';
import 'search_picker_mock.mocks.dart';

@GenerateMocks([
  SearchPickerBlocStates,
  SearchPickerBlocEvents,
  SearchPickerBlocType,
])
SearchPickerBlocType<SearchModelMock> searchPickerMockFactory({
  required Result<List<SearchModelMock>> searchResult,
  String searchFilter = Stubs.searchPickerFilterEmpty,
}) {
  final blocMock = MockSearchPickerBlocType<SearchModelMock>();
  final eventsMock = MockSearchPickerBlocEvents();
  final statesMock = MockSearchPickerBlocStates<SearchModelMock>();

  when(blocMock.events).thenReturn(eventsMock);
  when(blocMock.states).thenReturn(statesMock);

  when(statesMock.queryFilter).thenAnswer(
    (_) => Stream.value(searchFilter).asBroadcastStream(),
  );
  when(statesMock.itemsList).thenAnswer(
    (_) => Stream.value(searchResult),
  );

  return blocMock;
}
