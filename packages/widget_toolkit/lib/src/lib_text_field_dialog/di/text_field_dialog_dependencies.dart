import 'package:flutter/widgets.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/single_child_widget.dart';

import '../blocs/text_field_dialog_bloc.dart';
import '../services/text_field_validator.dart';

class TextFieldDialogDependencies<T> {
  TextFieldDialogDependencies._(
    this.context,
    this.validator,
    this.initialValue,
  );

  factory TextFieldDialogDependencies.from(
    BuildContext context, {
    required TextFieldValidator<T> validator,
    required T? initialValue,
  }) =>
      TextFieldDialogDependencies._(
        context,
        validator,
        initialValue,
      );

  final BuildContext context;

  late List<SingleChildWidget> providers = [
    ..._blocs,
  ];

  final TextFieldValidator<T> validator;

  final T? initialValue;

  late final List<RxBlocProvider> _blocs = [
    RxBlocProvider<TextFieldDialogBlocType>(
      create: (context) => TextFieldDialogBloc<T>(
        validator,
        initialValue,
      ),
    ),
  ];
}
