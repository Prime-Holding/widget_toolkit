import '../../../language_picker.dart';

/// This class should be extended in you project and each of its method should
/// have an implementation. It is added as a dependency in the LanguagePickerBloc.
/// In your implementation you can add in the constructor of the class a data source
/// as a dependency from which to get the list of languages used in your app and
/// send requests to update the currently selected language for the user.
///
/// [getAll] method returns the list of all language that the app will use.
///
/// [getLanguageList] returns the list of all languages and marks the currently
/// selected language as selected in the List<SelectedLanguageModel>.
///
/// [getCurrent] returns the currently selected language.
///
/// [setCurrent] receives as parameter the language, that should be set as current.
abstract class LanguageService {
  Future<LanguageModel> getCurrent();

  Future<List<SelectedLanguageModel>> getLanguageList() async {
    final languages = await getAll();
    final currentLanguage = await getCurrent();

    return languages.map(
      (language) {
        return SelectedLanguageModel(
          language: language,
          selected: language == currentLanguage,
        );
      },
    ).toList();
  }

  Future<List<LanguageModel>> getAll();

  Future<void> setCurrent(LanguageModel language);
}
