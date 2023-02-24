import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:widget_toolkit/src/lib_item_picker/blocs/item_picker_bloc.dart';

import '../models/item_picker_data_mock.dart';
import 'item_picker_mock.mocks.dart';

@GenerateMocks([
  ItemPickerBlocStates,
  ItemPickerBlocEvents,
  ItemPickerBlocType,
])
ItemPickerBlocType<ItemPickerDataMock> itemPickerMockFactory({
  required Result<List<ItemPickerDataMock>> itemsResult,
}) {
  final blocMock = MockItemPickerBlocType<ItemPickerDataMock>();
  final eventsMock = MockItemPickerBlocEvents();
  final statesMock = MockItemPickerBlocStates<ItemPickerDataMock>();

  when(blocMock.events).thenReturn(eventsMock);
  when(blocMock.states).thenReturn(statesMock);

  when(statesMock.items).thenAnswer((_) => Stream.value(itemsResult));
  return blocMock;
}
