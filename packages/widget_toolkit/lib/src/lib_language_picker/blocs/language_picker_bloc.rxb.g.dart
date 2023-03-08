// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'language_picker_bloc.dart';

/// Used as a contractor for the bloc, events and states classes
/// {@nodoc}
abstract class LanguagePickerBlocType extends RxBlocTypeBase {
  LanguagePickerBlocEvents get events;
  LanguagePickerBlocStates get states;
}

/// [$LanguagePickerBloc] extended by the [LanguagePickerBloc]
/// {@nodoc}
abstract class $LanguagePickerBloc extends RxBlocBase
    implements
        LanguagePickerBlocEvents,
        LanguagePickerBlocStates,
        LanguagePickerBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// Тhe [Subject] where events sink to by calling [setCurrent]
  final _$setCurrentEvent = PublishSubject<LanguageModel>();

  /// The state of [currentLanguage] implemented in [_mapToCurrentLanguageState]
  late final ConnectableStream<LanguageModel> _currentLanguageState =
      _mapToCurrentLanguageState();

  /// The state of [errors] implemented in [_mapToErrorsState]
  late final ConnectableStream<ErrorModel?> _errorsState = _mapToErrorsState();

  /// The state of [languages] implemented in [_mapToLanguagesState]
  late final ConnectableStream<List<SelectedLanguageModel>> _languagesState =
      _mapToLanguagesState();

  /// The state of [loading] implemented in [_mapToLoadingState]
  late final ConnectableStream<LoadingWithTag> _loadingState =
      _mapToLoadingState();

  @override
  void setCurrent(LanguageModel language) => _$setCurrentEvent.add(language);

  @override
  ConnectableStream<LanguageModel> get currentLanguage => _currentLanguageState;

  @override
  ConnectableStream<ErrorModel?> get errors => _errorsState;

  @override
  ConnectableStream<List<SelectedLanguageModel>> get languages =>
      _languagesState;

  @override
  ConnectableStream<LoadingWithTag> get loading => _loadingState;

  ConnectableStream<LanguageModel> _mapToCurrentLanguageState();

  ConnectableStream<ErrorModel?> _mapToErrorsState();

  ConnectableStream<List<SelectedLanguageModel>> _mapToLanguagesState();

  ConnectableStream<LoadingWithTag> _mapToLoadingState();

  @override
  LanguagePickerBlocEvents get events => this;

  @override
  LanguagePickerBlocStates get states => this;

  @override
  void dispose() {
    _$setCurrentEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}
