abstract class PickerItemModel {
  const PickerItemModel();
  String? get itemDisplayName;

  @override
  String toString() => itemDisplayName ?? super.toString();
}
