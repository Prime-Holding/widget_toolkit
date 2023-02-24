import 'package:widget_toolkit/src/common/models/picker_item_model.dart';

class ItemPickerDataMock extends PickerItemModel {
  ItemPickerDataMock(this.value);

  final String value;

  @override
  String get itemDisplayName => value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemPickerDataMock &&
          runtimeType == other.runtimeType &&
          other.value == value;

  @override
  int get hashCode => value.hashCode;
}
