import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:flutter_rx_bloc/rx_form.dart';

import '../../../ui_components.dart';
import '../../base/models/item_builder.dart';
import '../../base/models/picker_item_model.dart';
import '../../base/utils/easy_fade_transition.dart';
import '../../lib_item_picker/ui_components/picker_list_item.dart';
import '../blocs/search_picker_bloc.dart';
import '../services/search_picker_service.dart';
import '../theme/search_picker_theme.dart';
import '../ui_components/search_picker_text_field.dart';

class SearchPickerPage<T extends PickerItemModel> extends StatelessWidget {
  const SearchPickerPage({
    required this.title,
    required this.hintText,
    required this.retryText,
    required this.service,
    required this.loadingItemHeight,
    this.itemBuilder,
    this.selectedItem,
    this.onItemTap,
    this.separatorBuilder,
    this.emptyBuilder,
    this.errorBuilder,
    this.showEmptyWidgetWhenNoResultsAreFound = true,
    super.key,
  });

  ///Search picker title
  final String title;

  ///Search field hint text
  final String hintText;

  ///Retry button text
  final String retryText;

  ///Selected item from the list
  final T? selectedItem;

  ///Callback for selecting an item from the list
  final Function(T?)? onItemTap;

  ///Custom widget item builder
  final ItemPickerItemBuilder<T>? itemBuilder;

  ///Custom widget separator builder
  final Widget Function(int)? separatorBuilder;

  ///Custom widget empty state builder
  final Widget Function()? emptyBuilder;

  ///Custom widget error builder
  final Widget Function(Exception)? errorBuilder;

  ///Search picker service implementation
  final SearchPickerService<T> service;

  ///Flag indicating to show or not the empty widget if no results are found
  final bool showEmptyWidgetWhenNoResultsAreFound;

  /// Specify a custom loading item height
  final double loadingItemHeight;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: context.searchPickerTheme.titlePadding,
            child: Text(
              title,
              style: context.searchPickerTheme.titleStyle,
            ),
          ),
          Padding(
            padding: context.searchPickerTheme.searchFieldOuterEdgeInsets,
            child: RxTextFormFieldBuilder<SearchPickerBlocType<T>>(
              state: (bloc) => bloc.states.queryFilter,
              showErrorState: (bloc) => Stream.value(true),
              onChanged: (bloc, value) =>
                  bloc.events.filterByQuery(query: value),
              builder: (fieldState) => SearchPickerTextField(
                isFocused: true,
                hintText: hintText,
                controller: fieldState.controller,
              ),
            ),
          ),
          Flexible(
            child: RxResultBuilder<SearchPickerBlocType<T>, List<T>>(
              state: (bloc) => bloc.states.itemsList,
              buildError: (context, error, bloc) =>
                  errorBuilder?.call(error) ??
                  Padding(
                    padding: context.searchPickerTheme.errorEdgeInsets,
                    child: ErrorCardWidget(
                      text: error.toString(),
                      retryButtonVisible: true,
                      retryButtonText: retryText,
                      onRetryPressed: bloc.events.loadItems,
                    ),
                  ),
              buildSuccess: (context, list, bloc) =>
                  list.isEmpty && showEmptyWidgetWhenNoResultsAreFound
                      ? emptyBuilder?.call() ??
                          Padding(
                            padding: context.searchPickerTheme.errorEdgeInsets,
                            child: const ErrorCardWidget(
                              text: 'No results',
                            ),
                          )
                      : _buildList(list),
              buildLoading: (context, bloc) => _buildList(
                service.getPlaceholderList(),
                isLoading: true,
              ),
            ),
          ),
        ],
      );

  Widget _buildList(List<T> list, {bool isLoading = false}) {
    double? height = isLoading ? list.length * loadingItemHeight : null;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 900),
      transitionBuilder: (child, animation) =>
          easyFadeTransition(child: child, animation: animation),
      child: SizedBox(
        key: Key('appItemSizedBox-$height'),
        height: height,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) {
            final model = list.isEmpty ? null : list[index];

            return PickerListItem(
              isSelected: model == selectedItem,
              onTap: isLoading ? null : () => onItemTap?.call(model),
              isLoading: isLoading,
              overrideStyle: itemBuilder != null,
              text: model?.itemDisplayName,
              child: itemBuilder?.call(
                context,
                model,
                model == selectedItem,
                isLoading,
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              separatorBuilder?.call(index) ?? const SizedBox(height: 4),
        ),
      ),
    );
  }
}
