import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../base/extensions/error_model_extensions.dart';
import '../../base/models/errors/error_model.dart';
import '../../base/models/language_model.dart';
import '../models/selected_language_model.dart';
import '../services/language_service.dart';

part 'language_picker_bloc.rxb.g.dart';

/// A contract class containing all events of the LanguagePickerBloC.
abstract class LanguagePickerBlocEvents {
  /// Sets the current language and updates the [currentLanguage] state
  void setCurrent(LanguageModel language);
}

/// A contract class containing all states of the LanguagePickerBloC.
abstract class LanguagePickerBlocStates {
  /// Selected language state
  ConnectableStream<LanguageModel> get currentLanguage;

  /// The error state
  ConnectableStream<ErrorModel?> get errors;

  /// Provides the list of the languages. One of them should be marked as selected
  ConnectableStream<List<SelectedLanguageModel>> get languages;

  /// The loading state
  ConnectableStream<LoadingWithTag> get loading;
}

/// The [LanguagePickerBloc] handles the logic providing a state for the fetched
/// list of languages from the [LanguageService]. It has a state for the currently
/// selected language [currentLanguage] and an event [setCurrent] to update this state.
@RxBloc()
class LanguagePickerBloc extends $LanguagePickerBloc {
  LanguagePickerBloc(
    this._languageService,
  ) {
    currentLanguage.connect().addTo(_compositeSubscription);
    errors.connect().addTo(_compositeSubscription);
    languages.connect().addTo(_compositeSubscription);
    loading.connect().addTo(_compositeSubscription);
  }

  final LanguageService _languageService;

  @override
  ConnectableStream<ErrorModel?> _mapToErrorsState() =>
      errorState.mapToErrorModel().publish();

  @override
  ConnectableStream<LanguageModel> _mapToCurrentLanguageState() =>
      _$setCurrentEvent
          .switchMap(
            (language) => _languageService
                .setCurrent(language)
                .asResultStream(tag: language.asString()),
          )
          .setResultStateHandler(this)
          .whereSuccess()
          .startWith(null)
          .switchMap(
            (value) => _languageService.getCurrent().asResultStream(),
          )
          .setResultStateHandler(this)
          .whereSuccess()
          .publishReplay(maxSize: 1);

  @override
  ConnectableStream<List<SelectedLanguageModel>> _mapToLanguagesState() =>
      Rx.combineLatest2(
        currentLanguage.switchMap(
          (selectedLanguage) =>
              _languageService.getLanguageList().asResultStream(),
        ),
        loading,
        _combineLanguagesWithLoading,
      ).setResultStateHandler(this).whereSuccess().publishReplay(maxSize: 1);

  Result<List<SelectedLanguageModel>> _combineLanguagesWithLoading(
    Result<List<SelectedLanguageModel>> languagesResult,
    LoadingWithTag loadingWithTag,
  ) {
    if (languagesResult is ResultSuccess<List<SelectedLanguageModel>>) {
      return Result.success(
        languagesResult.data.map(
          (language) {
            return language.copyWith(
              isLoading: loadingWithTag.loading &&
                  loadingWithTag.tag.isNotEmpty &&
                  language.language.asString() == loadingWithTag.tag,
            );
          },
        ).toList(),
      );
    }

    if (languagesResult is ResultError<List<SelectedLanguageModel>>) {
      return Result.error(languagesResult.error);
    }

    return Result.loading();
  }

  @override
  ConnectableStream<LoadingWithTag> _mapToLoadingState() =>
      loadingWithTagState.mergeWith([
        errorState.map((event) => LoadingWithTag(loading: false))
      ]).publish();
}
