import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../base/extensions/error_model_extensions.dart';
import '../services/prime_text_field_validator_use_case.dart';

part 'text_field_dialog_bloc.rxb.g.dart';

/// A contract class containing all events of the TextFieldDialogBloC.
abstract class TextFieldDialogBlocEvents {
  /// The event called, when the value in the text input field is changed.
  @RxBlocEvent(type: RxBlocEventType.behaviour, seed: '')
  void setText(String value);

  /// The event called, when the submit button is pressed.
  void submit();
}

/// A contract class containing all states of the TextFieldDialogBloC.
abstract class TextFieldDialogBlocStates<T> {
  /// The Result state with the submitted value in the text field dialog, after
  /// the service validation
  Stream<Result<T>> get submittedValue;

  Stream<bool> get isErrorVisible;

  Stream<String> get text;
}

@RxBloc()
class TextFieldDialogBloc<T> extends $TextFieldDialogBloc<T> {
  TextFieldDialogBloc(
    this.validator,
    this.initialValue,
  );

  final TextFieldValidator<T> validator;
  final T? initialValue;

  @override
  Stream<Result<T>> _mapToSubmittedValueState() => _$submitEvent
      .switchMap((_) => _validate(_$setTextEvent.value).asResultStream())
      .doOnData(_sendErrorToTextSubject)
      .share();

  @override
  Stream<bool> _mapToIsErrorVisibleState() => _$submitEvent
      .map((_) => true)
      .startWith(false)
      .distinct()
      .shareReplay(maxSize: 1);

  @override
  Stream<String> _mapToTextState() => _$setTextEvent
      .startWith(initialValue?.toString() ?? '')
      .map((text) {
        validator.validateOnType(text);
        return text;
      })
      .where((event) => event.isNotEmpty)
      .shareReplay(maxSize: 1);

  Future<T> _validate(String text) async {
    validator.validateOnType(text);
    return await validator.validateOnSubmit(text);
  }

  void _sendErrorToTextSubject(Result<T> event) {
    if (event is ResultError<T>) {
      _$setTextEvent.sink.addError(event.error.asErrorModel());
    }
  }
}
