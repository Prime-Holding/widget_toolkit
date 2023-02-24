import 'package:widget_toolkit/item_picker.dart';

import '../models/item_picker_data_mock.dart';

class ItemPickerServiceMock extends ItemPickerService<ItemPickerDataMock> {
  ItemPickerServiceMock(this.data);

  final List<ItemPickerDataMock> data;

  @override
  Future<List<ItemPickerDataMock>> getItems() => Future.value(data);
}
