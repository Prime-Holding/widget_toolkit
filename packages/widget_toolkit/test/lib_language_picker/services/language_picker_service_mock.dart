import 'package:widget_toolkit/language_picker.dart';

class LanguagePickerServiceMock extends LanguageService {
  LanguagePickerServiceMock({
    required this.languages,
    required this.selected,
  });

  final List<LanguageModel> languages;
  LanguageModel selected;

  @override
  Future<List<LanguageModel>> getAll() async => await Future.value(languages);

  @override
  Future<LanguageModel> getCurrent() async => await Future.value(selected);

  @override
  Future<void> setCurrent(LanguageModel language) async {
    selected = language;
    return Future.value();
  }
}
