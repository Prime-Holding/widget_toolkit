import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widget_toolkit.dart';
import '../../base/models/item_builder.dart';
import '../di/search_picker_dependencies.dart';

class SearchPickerPageWithDependencies<T extends PickerItemModel>
    extends StatelessWidget {
  const SearchPickerPageWithDependencies({
    super.key,
    required this.title,
    required this.hintText,
    required this.retryText,
    required this.service,
    required this.loadingItemHeight,
    this.itemBuilder,
    this.selectedItem,
    this.onItemTap,
    this.errorBuilder,
    this.emptyBuilder,
    this.separatorBuilder,
    this.showEmptyWidgetWhenNoResultsAreFound = true,
  });

  final String title;
  final String hintText;
  final String retryText;
  final SearchPickerService<T> service;
  final double loadingItemHeight;
  final ItemPickerItemBuilder<T>? itemBuilder;
  final T? selectedItem;
  final Function(T?)? onItemTap;
  final Widget Function(Exception)? errorBuilder;
  final Widget Function()? emptyBuilder;
  final Widget Function(int)? separatorBuilder;
  final bool showEmptyWidgetWhenNoResultsAreFound;

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: SearchPickerDependencies<T>.from(context, service).providers,
        child: SearchPickerPage(
          title: title,
          hintText: hintText,
          retryText: retryText,
          selectedItem: selectedItem,
          onItemTap: onItemTap,
          itemBuilder: itemBuilder,
          errorBuilder: errorBuilder,
          emptyBuilder: emptyBuilder,
          separatorBuilder: separatorBuilder,
          service: service,
          showEmptyWidgetWhenNoResultsAreFound:
              showEmptyWidgetWhenNoResultsAreFound,
          loadingItemHeight: loadingItemHeight,
        ),
      );
}
