// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'text_field_dialog_bloc.dart';

/// Used as a contractor for the bloc, events and states classes
/// {@nodoc}
abstract class TextFieldDialogBlocType extends RxBlocTypeBase {
  TextFieldDialogBlocEvents get events;
  TextFieldDialogBlocStates get states;
}

/// [$TextFieldDialogBloc<T>] extended by the [TextFieldDialogBloc<T>]
/// {@nodoc}
abstract class $TextFieldDialogBloc<T> extends RxBlocBase
    implements
        TextFieldDialogBlocEvents,
        TextFieldDialogBlocStates,
        TextFieldDialogBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// Тhe [Subject] where events sink to by calling [setText]
  final _$setTextEvent = BehaviorSubject<String>.seeded('');

  /// Тhe [Subject] where events sink to by calling [submit]
  final _$submitEvent = PublishSubject<void>();

  /// The state of [submittedValue] implemented in [_mapToSubmittedValueState]
  late final Stream<Result<T>> _submittedValueState =
      _mapToSubmittedValueState();

  /// The state of [isErrorVisible] implemented in [_mapToIsErrorVisibleState]
  late final Stream<bool> _isErrorVisibleState = _mapToIsErrorVisibleState();

  /// The state of [text] implemented in [_mapToTextState]
  late final Stream<String> _textState = _mapToTextState();

  @override
  void setText(String value) => _$setTextEvent.add(value);

  @override
  void submit() => _$submitEvent.add(null);

  @override
  Stream<Result<T>> get submittedValue => _submittedValueState;

  @override
  Stream<bool> get isErrorVisible => _isErrorVisibleState;

  @override
  Stream<String> get text => _textState;

  Stream<Result<T>> _mapToSubmittedValueState();

  Stream<bool> _mapToIsErrorVisibleState();

  Stream<String> _mapToTextState();

  @override
  TextFieldDialogBlocEvents get events => this;

  @override
  TextFieldDialogBlocStates get states => this;

  @override
  void dispose() {
    _$setTextEvent.close();
    _$submitEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}
