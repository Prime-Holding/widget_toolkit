import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:widget_toolkit/src/lib_item_picker/blocs/item_picker_bloc.dart';
import 'package:widget_toolkit/src/lib_item_picker/views/item_picker_page.dart';

import '../mock/item_picker_mock.dart';
import '../models/item_picker_data_mock.dart';
import '../services/item_picker_service_mock.dart';

/// Change the parameters according the needs of the test
Widget itemPickerFactory({
  required Result<List<ItemPickerDataMock>> itemsResult,
  required ItemPickerServiceMock itemPickerServiceMock,
}) =>
    Scaffold(
      body: MultiProvider(
          providers: [
            RxBlocProvider<ItemPickerBlocType<ItemPickerDataMock>>.value(
              value: itemPickerMockFactory(
                itemsResult: itemsResult,
              ),
            ),
          ],
          child: Builder(
            builder: (context) {
              return ItemPickerPage.withDependencies<ItemPickerDataMock>(
                context,
                title: 'Testing',
                saveButtonText: 'Save Button',
                emptyBuilder: () => const Text('Empty'),
                errorBuilder: (error) => Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.red[100],
                    child: Text('Error :$error')),
                footerBuilder: (context) => Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text('Footer'),
                ),
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, model, isSelected, isLoading) =>
                    Container(
                  margin: const EdgeInsets.all(4),
                  padding: const EdgeInsets.all(10),
                  color: Colors.grey[100],
                  child: Text('Item ${model?.value}'),
                ),
                selectedItems: [],
                onTap: (data) {},
                service: itemPickerServiceMock,
                isMultiSelect: true,
                isStatic: true,
                isItemSelectionRequired: false,
                loadingItemsCount: 3,
                loadingItemHeight: 60,
              );
            },
          )),
    );
