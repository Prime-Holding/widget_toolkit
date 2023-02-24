import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:flutter_rx_bloc/rx_form.dart';
import 'package:provider/provider.dart';
import 'package:rx_bloc/rx_bloc.dart';

import '../../../widget_toolkit.dart';
import '../../base/extensions/stream_translate_field_extension.dart';
import '../../base/models/common/input_text_field_state.dart';
import '../blocs/text_field_dialog_bloc.dart';
import '../ui_components/prime_input_text_field.dart';

/// This widget shows the content the [PrimeTextFieldDialog]
/// [callback] the function, which receives the ResultSuccess value from the bloc's
/// submittedValue state, after the save button has been pressed and the value
/// has been validated
///
/// [label] is the value of the text label of the widget, which when pressed loads the
/// text field dialog
///
/// [fillButtonText] the text in the button, which is in the dialog
///
/// [errorMapper] provide a function which maps the error from the service
/// to the appropriate ui error with text
///
/// [header] is a value displayed above the text field in the dialog
///
/// [maxLines] is the value of maximum lines the [PrimeInputTextField] widget
/// can have, if the number is increased, the input field becomes bigger.
///
/// [dialogHasBottomPadding] by default is should be true, which moves the dialog
/// up with the height of the keyboard, when it is visible, so the dialog appears
/// above it
class TextFieldDialogPage<T> extends StatelessWidget {
  const TextFieldDialogPage({
    Key? key,
    required this.callback,
    required this.label,
    required this.fillButtonText,
    required this.errorMapper,
    this.keyBoardType,
    this.header,
    this.inputFormatters,
    this.isMultiLinedInputField = false,
    this.dialogHasBottomPadding = false,
    this.maxLines,
  }) : super(key: key);

  final String label;
  final String fillButtonText;
  final String? header;
  final Function(T value) callback;
  final TextInputType? keyBoardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool isMultiLinedInputField;
  final bool dialogHasBottomPadding;
  final int? maxLines;
  final RxFieldException<T> Function(Object error, BuildContext context)
      errorMapper;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.textFieldDialogTheme.textFieldDialog2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(context.textFieldDialogTheme.spacingM),
          topRight: Radius.circular(context.textFieldDialogTheme.spacingM),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (header != null && header!.isNotEmpty)
            Padding(
              padding: context.textFieldDialogTheme.textFieldDialog3,
              child: Text(
                header!,
                style: context.textFieldDialogTheme.titleBold,
              ),
            ),
          RxBlocListener<TextFieldDialogBlocType, Result<T>>(
            state: (bloc) => (bloc.states.submittedValue as Stream<Result<T>>),
            listener: (context, state) {
              if (state is ResultSuccess<T>) {
                callback.call(state.data);
                Navigator.of(context).pop();
              }
            },
          ),
          RxTextFormFieldBuilder<TextFieldDialogBlocType>(
            state: (bloc) =>
                bloc.states.text.translateErrors(errorMapper, context),
            showErrorState: (bloc) => bloc.states.isErrorVisible,
            onChanged: (bloc, value) => bloc.events.setText(value),
            cursorBehaviour: RxTextFormFieldCursorBehaviour.end,
            builder: (fieldState) => PrimeInputTextField(
              isFocused: true,
              keyBoardType: keyBoardType,
              label: label,
              isMultiLinedInputField: isMultiLinedInputField,
              maxLines: maxLines,
              controller: fieldState.controller,
              inputFormatters: inputFormatters,
              suffixIcon: _isFieldErrorVisible(fieldState)
                  ? null
                  : context.textFieldDialogTheme.editPenIcon.copyWith(
                      color: context.textFieldDialogTheme.blue,
                    ),
              state: _getFieldState(fieldState),
              errorMessage: fieldState.error ?? '',
            ),
          ),
          Padding(
            padding: context.textFieldDialogTheme.textFieldDialog4,
            child: RxBlocBuilder<TextFieldDialogBlocType, Result<T>>(
              state: (bloc) => bloc.states.submittedValue as Stream<Result<T>>,
              builder: (context, snapshot, bloc) => AppFillButton(
                elevation: 0,
                text: fillButtonText,
                state: snapshot.data is ResultLoading<T>
                    ? ButtonStateModel.loading
                    : ButtonStateModel.enabled,
                areIconsClose: true,
                onPressed: () =>
                    context.read<TextFieldDialogBlocType>().events.submit(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputTextFieldStateModel _getFieldState(
    RxTextFormFieldBuilderState<TextFieldDialogBlocType> fieldState,
  ) =>
      _isFieldErrorVisible(fieldState)
          ? InputTextFieldStateModel.error
          : InputTextFieldStateModel.type;

  bool _isFieldErrorVisible(
    RxTextFormFieldBuilderState<TextFieldDialogBlocType> fieldState,
  ) =>
      (fieldState.showError &&
          fieldState.error != null &&
          fieldState.error!.isNotEmpty);
}
