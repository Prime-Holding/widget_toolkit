import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:widget_toolkit/search_picker.dart';
import 'package:widget_toolkit/src/lib_search_picker/blocs/search_picker_bloc.dart';

import '../../mocks/stubs.dart';
import '../mock/search_picker_mock.dart';
import '../models/search_model_mock.dart';
import '../repositories/search_repository_mock.dart';
import '../services/search_picker_service_mock.dart';

/// Change the parameters according the the needs of the test
Widget searchPickerFactory({
  required SearchRepositoryMock searchPickerRepository,
  required Result<List<SearchModelMock>> searchResult,
  String searchFilter = Stubs.searchPickerFilterEmpty,
}) =>
    Scaffold(
      body: MultiProvider(
          providers: [
            Provider<SearchPickerServiceMock>(
              create: (context) =>
                  SearchPickerServiceMock(searchPickerRepository),
            ),
            RxBlocProvider<SearchPickerBlocType<SearchModelMock>>.value(
              value: searchPickerMockFactory(
                searchResult: searchResult,
                searchFilter: searchFilter,
              ),
            ),
          ],
          child: Builder(builder: (context) {
            return SearchPickerPage(
              title: 'Title',
              hintText: 'Search...',
              retryText: 'Retry',
              itemBuilder: (ctx, item, isSelected, isLoading) => Container(
                padding: const EdgeInsets.all(12),
                child: Text(item?.value ?? ''),
              ),
              service: context.read<SearchPickerServiceMock>(),
              onItemTap: (item) {},
              showEmptyWidgetWhenNoResultsAreFound: true,
              loadingItemHeight: 60,
            );
          })),
    );
