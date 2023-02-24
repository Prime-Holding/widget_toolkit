import 'package:widget_toolkit/language_picker.dart';

class LanguagePickerServiceMock extends LanguageService {
  LanguagePickerServiceMock(
    this.languages,
  );

  final List<LanguageModel> languages;
  late LanguageModel _selected;

  @override
  Future<List<LanguageModel>> getAll() async {
    return await Future.value(languages);
  }

  @override
  Future<LanguageModel> getCurrent() async {
    return await Future.value(_selected);
  }

  @override
  Future<void> setCurrent(LanguageModel language) async {
    _selected = language;
    return Future.value();
  }
}
