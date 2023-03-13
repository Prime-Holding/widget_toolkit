import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';

import '../../base/models/errors/error_model.dart';
import '../../base/models/item_builder.dart';
import '../../base/models/picker_item_model.dart';
import '../../base/utils/easy_fade_transition.dart';
import '../../lib_ui_components/buttons/button_state.dart';
import '../../lib_ui_components/buttons/gradient_fill_button.dart';
import '../../lib_ui_components/error_card_widget.dart';
import '../blocs/item_picker_bloc.dart';
import '../di/item_picker_dependencies.dart';
import '../service/item_picker_service.dart';
import '../theme/item_picker_theme.dart';
import '../ui_components/picker_list_item.dart';

class ItemPickerPage<T extends PickerItemModel> extends StatefulWidget {
  const ItemPickerPage({
    required this.onTap,
    List<T>? selectedItems,
    bool? isMultiSelect,
    bool? isStatic,
    bool? isItemSelectionRequired,
    int? loadingItemsCount,
    double? loadingItemHeight,
    Key? key,
    this.title,
    this.saveButtonText,
    this.itemBuilder,
    this.separatorBuilder,
    this.footerBuilder,
    this.errorBuilder,
    this.emptyBuilder,
    this.loadingBuilder,
  })  : selectedItems = selectedItems ?? const [],
        isMultiSelect = isMultiSelect ?? false,
        isStatic = isStatic ?? true,
        isItemSelectionRequired = isItemSelectionRequired ?? true,
        loadingItemsCount = loadingItemsCount ?? 3,
        loadingItemHeight = loadingItemHeight ?? 60,
        super(key: key);

  final String? title;
  final String? saveButtonText;
  final List<T> selectedItems;
  final bool isMultiSelect;
  final bool isStatic;
  final bool isItemSelectionRequired;
  final Function(List<T?>) onTap;
  final WidgetBuilder? footerBuilder;
  final Widget Function(Exception)? errorBuilder;
  final Widget Function()? emptyBuilder;
  final WidgetBuilder? loadingBuilder;
  final ItemPickerItemBuilder<T>? itemBuilder;
  final Widget Function(BuildContext context, int index)? separatorBuilder;
  final int loadingItemsCount;
  final double loadingItemHeight;

  static Widget withDependencies<T extends PickerItemModel>(
    BuildContext context, {
    List<T>? selectedItems,
    required Function(List<T?>) onTap,
    required ItemPickerService<T> service,
    bool? isMultiSelect,
    bool? isStatic,
    bool? isItemSelectionRequired,
    int? loadingItemsCount,
    double? loadingItemHeight,
    Key? key,
    String? title,
    String? saveButtonText,
    WidgetBuilder? footerBuilder,
    ItemPickerItemBuilder<T>? itemBuilder,
    Widget Function(Exception)? errorBuilder,
    Widget Function()? emptyBuilder,
    Widget Function(BuildContext context, int index)? separatorBuilder,
  }) =>
      MultiProvider(
        providers: ItemPickerDependencies<T>.from(context, service).providers,
        child: ItemPickerPage<T>(
          isMultiSelect: isMultiSelect,
          isStatic: isStatic,
          isItemSelectionRequired: isItemSelectionRequired,
          onTap: onTap,
          selectedItems: selectedItems,
          key: key,
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

  @override
  State<ItemPickerPage<T>> createState() => _ItemPickerPageState<T>();
}

class _ItemPickerPageState<T extends PickerItemModel>
    extends State<ItemPickerPage<T>> {
  late List<T> selectedItems;

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedItems = [...widget.selectedItems];
    });
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildHeader(),
                _buildContent(),
              ],
            ),
          ),
          _buildFooter(),
        ],
      );

  Widget _buildHeader() => widget.title != null
      ? Padding(
          padding: context.itemPickerTheme.titlePadding,
          child: Row(
            children: [
              Text(
                widget.title!,
                style: context.itemPickerTheme.titleStyle,
              )
            ],
          ),
        )
      : const SizedBox.shrink();

  Widget _buildContent() => Flexible(
        child: RxResultBuilder<ItemPickerBlocType, List>(
          state: (bloc) => bloc.states.items,
          buildError: (context, error, bloc) => Padding(
            padding: context.itemPickerTheme.errorPadding,
            child: widget.errorBuilder?.call(error) ??

                /// TODO (david.djordjevic): Find a way to pass an error message directly
                ErrorCardWidget(
                  text: GenericErrorModel().toString(),
                  retryButtonVisible: true,
                  onRetryPressed: () => bloc.events.loadItems(),
                ),
          ),
          buildSuccess: (context, list, bloc) => list.isEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: widget.emptyBuilder?.call() ??

                      /// TODO (david.djordjevic): Find a way to pass an error message directly
                      ErrorCardWidget(
                        text: EmptyListErrorModel().toString(),
                      ),
                )
              : _buildList(list as List<T>),
          buildLoading: (context, bloc) => widget.isStatic
              ? const SizedBox.shrink()
              : _buildList(
                  [],
                  isLoading: true,
                ),
        ),
      );

  Widget _buildFooter() => RxResultBuilder<ItemPickerBlocType, List>(
        state: (bloc) => bloc.states.items,
        buildError: (context, error, bloc) => _buildFooterButtons(),
        buildSuccess: (context, list, bloc) => _buildFooterButtons(),
        buildLoading: (context, bloc) => _buildFooterButtons(
          isLoading: true,
        ),
      );

  Widget _buildList(List<T> list, {bool isLoading = false}) {
    double? height =
        isLoading ? widget.loadingItemsCount * widget.loadingItemHeight : null;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 900),
      transitionBuilder: (child, animation) =>
          easyFadeTransition(child: child, animation: animation),
      child: SizedBox(
        key: Key('appItemSizedBox-$height'),
        height: height,
        child: ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: isLoading ? widget.loadingItemsCount : list.length,
          itemBuilder: (context, index) {
            final model = list.isEmpty ? null : list[index];

            return PickerListItem(
              text: model?.itemDisplayName,
              onTap: isLoading ? null : () => _onTap(model),
              isSelected: selectedItems.contains(model),
              isLoading: isLoading,
              overrideStyle: widget.itemBuilder != null,
              child: widget.itemBuilder?.call(
                context,
                model,
                selectedItems.contains(model),
                isLoading,
              ),
            );
          },
          separatorBuilder: widget.separatorBuilder ??
              (context, index) => const SizedBox.shrink(),
        ),
      ),
    );
  }

  Widget _buildFooterButtons({bool isLoading = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.footerBuilder != null) widget.footerBuilder!(context),
          if (widget.isMultiSelect)
            Padding(
              padding: const EdgeInsets.only(
                top: 12,
                bottom: 2,
              ),
              child: GradientFillButton(
                elevation: 0,
                state: _saveState(isLoading: isLoading),
                text: widget.saveButtonText ?? 'Save',
                onPressed: () =>
                    _saveState(isLoading: isLoading) == ButtonStateModel.enabled
                        ? widget.onTap(selectedItems)
                        : null,
              ),
            ),
        ],
      ),
    );
  }

  void _onTap(T? model) {
    if (widget.isMultiSelect) {
      setState(() {
        if (selectedItems.contains(model)) {
          selectedItems.remove(model);
        } else if (model != null) {
          selectedItems.add(model);
        }
      });
    } else {
      widget.onTap([model]);
    }
  }

  ButtonStateModel _saveState({bool isLoading = false}) {
    if ((widget.isItemSelectionRequired && selectedItems.isEmpty) ||
        isLoading) {
      return ButtonStateModel.disabled;
    }
    return ButtonStateModel.enabled;
  }
}
