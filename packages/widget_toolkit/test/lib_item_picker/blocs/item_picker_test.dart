import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:rx_bloc_test/rx_bloc_test.dart';
import 'package:widget_toolkit/src/base/models/errors/error_model.dart';
import 'package:widget_toolkit/src/lib_item_picker/blocs/item_picker_bloc.dart';

import '../../mocks/stubs.dart';
import '../models/item_picker_data_mock.dart';
import '../services/item_picker_service_mock.dart';
import 'item_picker_test.mocks.dart';

late ItemPickerServiceMock service;

@GenerateMocks([ItemPickerServiceMock])
void main() {
  setUp(() {
    service = MockItemPickerServiceMock();
  });

  group('test item_picker_bloc state', () {
    rxBlocTest<ItemPickerBlocType<ItemPickerDataMock>,
            Result<List<ItemPickerDataMock>>>(
        'test item_picker_bloc state getItems',
        build: () async {
          _defineWhen();
          return itemPickerBloc();
        },
        act: (bloc) async {},
        state: (bloc) => bloc.states.items,
        expect: [
          Stubs.itemPickerLoading,
          Stubs.itemPickerDataSuccessResult,
        ]);

    rxBlocTest<ItemPickerBlocType<ItemPickerDataMock>,
            Result<List<ItemPickerDataMock>>>(
        'test item_picker_bloc state loadItems',
        build: () async {
          _defineWhen();
          return itemPickerBloc();
        },
        act: (bloc) async {
          bloc.events.loadItems();
        },
        state: (bloc) => bloc.states.items,
        expect: [
          Stubs.itemPickerLoading,
          Stubs.itemPickerLoading,
          Stubs.itemPickerDataSuccessResult,
        ]);

    rxBlocTest<ItemPickerBlocType<ItemPickerDataMock>,
            Result<List<ItemPickerDataMock>>>(
        'test item_picker_bloc state getItems with error',
        build: () async {
          when(service.getItems())
              .thenAnswer((_) => throw GenericErrorModel(''));

          return itemPickerBloc();
        },
        act: (bloc) async {},
        state: (bloc) => bloc.states.items,
        expect: [
          Stubs.itemPickerError,
        ]);
  });
}

void _defineWhen() {
  when(service.getItems()).thenAnswer((_) => Future.value(
        (Stubs.itemPickerData),
      ));
}

ItemPickerBloc<ItemPickerDataMock> itemPickerBloc() =>
    ItemPickerBloc<ItemPickerDataMock>(
      service,
    );
