import 'package:widget_toolkit/src/common/models/picker_item_model.dart';

class SearchModelMock extends PickerItemModel{
  SearchModelMock(this.value);

  final String value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is SearchModelMock &&
              runtimeType == other.runtimeType &&
              other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String get itemDisplayName => value;
}
