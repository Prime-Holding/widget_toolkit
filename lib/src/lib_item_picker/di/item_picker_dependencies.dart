import 'package:flutter/widgets.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/single_child_widget.dart';

import '../../common/models/picker_item_model.dart';
import '../blocs/item_picker_bloc.dart';
import '../service/item_picker_service.dart';

class ItemPickerDependencies<T extends PickerItemModel> {
  ItemPickerDependencies._(this.context, this.service);

  factory ItemPickerDependencies.from(
          BuildContext context, ItemPickerService<T> service) =>
      ItemPickerDependencies._(context, service);

  final ItemPickerService<T> service;
  final BuildContext context;

  late List<SingleChildWidget> providers = [
    ..._blocs,
  ];

  late final List<RxBlocProvider> _blocs = [
    RxBlocProvider<ItemPickerBlocType>(
      create: (context) => ItemPickerBloc<T>(service),
    ),
  ];
}
