import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widget_toolkit.dart';
import '../../base/models/item_builder.dart';
import '../di/item_picker_dependencies.dart';
import 'item_picker_page.dart';

class ItemPickerPageWithDependencies<T extends PickerItemModel>
    extends StatelessWidget {
  const ItemPickerPageWithDependencies({
    super.key,
    required this.onTap,
    required this.service,
    this.selectedItems,
    this.isMultiSelect,
    this.isStatic,
    this.isItemSelectionRequired,
    this.loadingItemsCount,
    this.loadingItemHeight,
    this.title,
    this.saveButtonText,
    this.footerBuilder,
    this.itemBuilder,
    this.errorBuilder,
    this.emptyBuilder,
    this.separatorBuilder,
  });

  final List<T>? selectedItems;
  final Function(List<T?>) onTap;
  final ItemPickerService<T> service;
  final bool? isMultiSelect;
  final bool? isStatic;
  final bool? isItemSelectionRequired;
  final int? loadingItemsCount;
  final double? loadingItemHeight;
  final String? title;
  final String? saveButtonText;
  final WidgetBuilder? footerBuilder;
  final ItemPickerItemBuilder<T>? itemBuilder;
  final Widget Function(Exception)? errorBuilder;
  final Widget Function()? emptyBuilder;
  final Widget Function(BuildContext context, int index)? separatorBuilder;

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: ItemPickerDependencies<T>.from(context, service).providers,
        child: ItemPickerPage<T>(
          key: key,
          isMultiSelect: isMultiSelect,
          isStatic: isStatic,
          isItemSelectionRequired: isItemSelectionRequired,
          onTap: onTap,
          selectedItems: selectedItems,
          title: title,
          saveButtonText: saveButtonText,
          itemBuilder: itemBuilder,
          errorBuilder: errorBuilder,
          emptyBuilder: emptyBuilder,
          separatorBuilder: separatorBuilder,
          footerBuilder: footerBuilder,
          loadingItemsCount: loadingItemsCount,
          loadingItemHeight: loadingItemHeight,
        ),
      );
}
