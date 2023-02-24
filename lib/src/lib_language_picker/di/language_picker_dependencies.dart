import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../blocs/language_picker_bloc.dart';
import '../services/language_service.dart';

class LanguagePickerDependencies {
  LanguagePickerDependencies._(this.service);

  factory LanguagePickerDependencies.from(LanguageService service) =>
      LanguagePickerDependencies._(service);

  final LanguageService service;

  late List<SingleChildWidget> providers = [
    ..._services,
    ..._blocs,
  ];

  late final List<Provider> _services = [];

  late final List<RxBlocProvider> _blocs = [
    RxBlocProvider<LanguagePickerBlocType>(
      create: (context) => LanguagePickerBloc(service),
    ),
  ];
}
