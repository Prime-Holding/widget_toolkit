import '../../common/models/picker_item_model.dart';

abstract class ItemPickerService<T extends PickerItemModel> {
  Future<List<T>> getItems();
}
