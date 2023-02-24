import 'package:mockito/annotations.dart';

import '../../helpers/golden_helper.dart';
import '../../helpers/models/scenario.dart';
import '../../mocks/stubs.dart';
import '../blocs/item_picker_test.mocks.dart';
import '../factory/item_picker_factory.dart';
import '../services/item_picker_service_mock.dart';

//TODO: golden tests are not working as expected. They need to be fixed at near future
@GenerateMocks([ItemPickerServiceMock])
void main() {
  late ItemPickerServiceMock itemPickerService = MockItemPickerServiceMock();

  runGoldenTests([
    generateDeviceBuilder(
      widget: itemPickerFactory(
        itemsResult: Stubs.itemPickerDataEmpty,
        itemPickerServiceMock: itemPickerService,
      ),
      scenario: Scenario(name: 'item_picker_empty'),
    ),
    generateDeviceBuilder(
      widget: itemPickerFactory(
        itemsResult: Stubs.itemPickerDataSuccessResult,
        itemPickerServiceMock: itemPickerService,
      ),
      scenario: Scenario(name: 'item_picker_success'),
    ),
    generateDeviceBuilder(
      widget: itemPickerFactory(
        itemsResult: Stubs.itemPickerLoading,
        itemPickerServiceMock: itemPickerService,
      ),
      scenario: Scenario(name: 'item_picker_loading'),
    ),
    generateDeviceBuilder(
      widget: itemPickerFactory(
        itemsResult: Stubs.itemPickerError,
        itemPickerServiceMock: itemPickerService,
      ),
      scenario: Scenario(name: 'item_picker_error'),
    )
  ]);
}
