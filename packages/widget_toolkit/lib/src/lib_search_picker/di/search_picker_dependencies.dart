import 'package:flutter/widgets.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/single_child_widget.dart';

import '../blocs/search_picker_bloc.dart';
import '../services/search_picker_service.dart';

class SearchPickerDependencies<T> {
  SearchPickerDependencies._(this.context, this._service);

  factory SearchPickerDependencies.from(
    BuildContext context,
    SearchPickerService<T> service,
  ) =>
      SearchPickerDependencies._(context, service);

  final BuildContext context;

  final SearchPickerService<T> _service;

  late List<SingleChildWidget> providers = [
    ..._blocs,
  ];

  late final List<RxBlocProvider> _blocs = [
    RxBlocProvider<SearchPickerBlocType<T>>(
      create: (context) => SearchPickerBloc<T>(_service),
    ),
  ];
}
