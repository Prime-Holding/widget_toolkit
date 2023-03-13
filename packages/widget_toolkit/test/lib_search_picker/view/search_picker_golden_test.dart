import 'package:mockito/annotations.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:widget_toolkit/widget_toolkit.dart';

import '../../helpers/golden_helper.dart';
import '../../helpers/models/scenario.dart';
import '../../mocks/stubs.dart';
import '../factory/search_picker_factory.dart';
import '../repositories/search_repository_mock.dart';
import 'search_picker_golden_test.mocks.dart';

@GenerateMocks([SearchRepositoryMock])
void main() {
  late SearchRepositoryMock searchRepository = MockSearchRepositoryMock();

  runGoldenTests([
    generateDeviceBuilder(
        widget: searchPickerFactory(
          searchPickerRepository: searchRepository,
          searchResult: Result.success(Stubs.searchPickerFilterEmptyResult),
          searchFilter: Stubs.searchPickerFilterEmpty,
        ),
        //example: Stubs.emptyList
        scenario: Scenario(name: 'search_picker_empty')),
    generateDeviceBuilder(
        widget: searchPickerFactory(
          searchPickerRepository: searchRepository,
          searchResult: Result.success(Stubs.searchPickerData),
        ),
        //example:  Stubs.success
        scenario: Scenario(name: 'search_picker_success')),
    generateDeviceBuilder(
        widget: searchPickerFactory(
          searchPickerRepository: searchRepository,
          searchResult: Result.loading(),
        ),
        //loading
        scenario: Scenario(name: 'search_picker_loading')),
    generateDeviceBuilder(
        widget: searchPickerFactory(
          searchPickerRepository: searchRepository,
          searchResult: Result.error(GenericErrorModel()),
        ),
        scenario: Scenario(name: 'search_picker_error'))
  ]);
}
