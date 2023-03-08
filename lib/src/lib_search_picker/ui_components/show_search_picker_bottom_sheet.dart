import 'package:flutter/cupertino.dart';

import '../../base/models/item_builder.dart';
import '../../base/models/picker_item_model.dart';
import '../../lib_ui_components/show_blurred_bottom_sheet.dart';
import '../services/search_picker_service.dart';
import '../views/search_picker_page.dart';

/// Displays search field and a list inside modal bottom sheet with a background blur effect.
///
/// Requires a [context], also the user need to specify the [title], [hintText] and [retryText].
/// Also needs [onItemTap] and [service].
/// You can also specify a [itemBuilder] builder method that returns a widget
/// which will create the items inside the list.
/// If custom error widget needs to be presented, then setting [errorBuilder] is what you need.
/// If custom empty widget needs to be presented, then setting [emptyBuilder] is what you need.
/// There is possibility to change the separator by setting [separatorBuilder].
/// An instance of the [selectedItem] can be passed in order to have a selected state.
/// Flag for showing empty widget when there is no results can be toggled by
/// setting[showEmptyWidgetWhenNoResultsAreFound] (defaults to `true`).
/// Flag for toggle to full screen can be changed by setting [fullScreen]
/// flag (defaults to `true`).
/// If you want to have more than one sheet opened at the same time, set
/// [haveOnlyOneSheet] in the [modalConfiguration] to false.
void showSearchPickerBottomSheet<T extends PickerItemModel>({
  required BuildContext context,
  required String title,
  required String hintText,
  required String retryText,
  required Function(T?) onItemTap,
  required SearchPickerService<T> service,
  ItemPickerItemBuilder<T>? itemBuilder,
  Widget Function(Exception)? errorBuilder,
  Widget Function()? emptyBuilder,
  Widget Function(int index)? separatorBuilder,
  T? selectedItem,
  bool showEmptyWidgetWhenNoResultsAreFound = true,
  double loadingItemHeight = 60,
  SearchPickerModalConfiguration modalConfiguration =
      const SearchPickerModalConfiguration(),
}) {
  showBlurredBottomSheet(
    context: context,
    configuration: modalConfiguration,
    onCancelPressed: () => Navigator.of(context).pop(),
    builder: (context) => SearchPickerPage.withDependencies<T>(
      context,
      title: title,
      hintText: hintText,
      retryText: retryText,
      selectedItem: selectedItem,
      onItemTap: (item) {
        onItemTap.call(item);
        Navigator.of(context).pop();
      },
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

class SearchPickerModalConfiguration extends ModalConfiguration {
  const SearchPickerModalConfiguration(
      {bool safeAreaBottom = true,
      MainAxisAlignment? contentAlignment,
      double? additionalBottomPadding,
      bool? fullScreen = true,
      bool haveOnlyOneSheet = true,
      bool showHeaderPill = true,
      bool showCloseButton = false,
      double? heightFactor,
      bool dialogHasBottomPadding = true,
      bool isDismissible = true})
      : super(
            safeAreaBottom: safeAreaBottom,
            contentAlignment: contentAlignment,
            additionalBottomPadding: additionalBottomPadding,
            fullScreen: fullScreen,
            haveOnlyOneSheet: haveOnlyOneSheet,
            showHeaderPill: showHeaderPill,
            showCloseButton: showCloseButton,
            heightFactor: heightFactor,
            dialogHasBottomPadding: dialogHasBottomPadding,
            isDismissible: isDismissible);
}
