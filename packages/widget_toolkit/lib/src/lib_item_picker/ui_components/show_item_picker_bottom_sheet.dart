import 'package:flutter/cupertino.dart';

import '../../../ui_components.dart';
import '../../base/models/item_builder.dart';
import '../../base/models/picker_item_model.dart';
import '../service/item_picker_service.dart';
import '../views/item_picker_page_with_dependencies.dart';

/// Display an bottom sheet with list content where the user can pick single or multiple items
///
/// It required an [context], [title], a list of the possible selected items as [selectedItems],
/// on tap function as [callback] and a [service]
///
/// Additionally you can specify an custom [itemBuilder], custom [errorBuilder], custom [emptyBuilder],
/// custom [separatorBuilder] and a custom [footerBuilder].
///
/// The user can specify more specific configurations inside [configuration]. There is one extra field
/// to set the [saveButtonText].
///
void showItemPickerBottomSheet<T extends PickerItemModel>({
  required BuildContext context,
  required ItemPickerService<T> service,
  List<T>? selectedItems,
  Function(List<T>)? callback,
  ItemPickerItemBuilder<T>? itemBuilder,
  Widget Function(Exception)? errorBuilder,
  Widget Function()? emptyBuilder,
  Widget Function(BuildContext context, int index)? separatorBuilder,
  String? title,
  WidgetBuilder? footerBuilder,
  ItemPickerConfiguration configuration = const ItemPickerConfiguration(),
  ItemPickerModalConfiguration modalConfiguration =
      const ItemPickerModalConfiguration(),
  String? saveButtonText,
}) {
  showBlurredBottomSheet(
    context: context,
    configuration: modalConfiguration,
    onCancelPressed: () => Navigator.of(context).pop(),
    builder: (context) => ItemPickerPageWithDependencies<T>(
      title: title,
      saveButtonText: saveButtonText,
      itemBuilder: itemBuilder,
      errorBuilder: errorBuilder,
      emptyBuilder: emptyBuilder,
      separatorBuilder: separatorBuilder,
      footerBuilder: footerBuilder,
      selectedItems: selectedItems,
      onTap: (items) {
        callback?.call(items.whereType<T>().toList());
        Navigator.of(context).pop();
      },
      service: service,
      isMultiSelect: configuration.isMultiSelect,
      isStatic: configuration.isStatic,
      isItemSelectionRequired: configuration.isItemSelectionRequired,
      loadingItemsCount: configuration.loadingItemsCount,
      loadingItemHeight: configuration.loadingItemHeight,
    ),
  );
}

/// Item Picker Configuration holder
///
/// Keeps the Item Picker specific configurations.
///
class ItemPickerConfiguration {
  const ItemPickerConfiguration({
    this.isMultiSelect = true,
    this.isItemSelectionRequired = true,
    this.isStatic = false,
    this.loadingItemsCount = 3,
    this.loadingItemHeight = 60,
  });

  /// Toggle between single select and multi select
  final bool isMultiSelect;

  /// Toggle between mandatory choice or not
  final bool isItemSelectionRequired;

  /// If the content is set as static, then no loading will appear
  final bool isStatic;

  /// Pass the number of loading indicators
  final int loadingItemsCount;

  /// If the loading items height doesn't match the design you can specify custom height
  final double loadingItemHeight;
}

class ItemPickerModalConfiguration extends ModalConfiguration {
  const ItemPickerModalConfiguration({
    super.safeAreaBottom = false,
    super.contentAlignment,
    super.fullScreen = false,
    super.haveOnlyOneSheet = true,
    super.showHeaderPill = true,
    super.showCloseButton = true,
    super.heightFactor,
    super.dialogHasBottomPadding = true,
    super.isDismissible = true,
  });
}
