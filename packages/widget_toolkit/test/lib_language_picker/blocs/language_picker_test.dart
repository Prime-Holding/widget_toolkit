import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rx_bloc_test/rx_bloc_test.dart';
import 'package:widget_toolkit/language_picker.dart';
import 'package:widget_toolkit/widget_toolkit.dart';

import '../../mocks/stubs.dart';

import 'language_picker_test.mocks.dart';

@GenerateMocks([LanguageService])
void main() {
  late LanguageService service;

  setUp(() {
    service = MockLanguageService();
  });

  void defineWhenCurrentLanguage() {
    when(service.getCurrent()).thenAnswer((_) => Future.value(
          (Stubs.selectedLanguageBulgarian),
        ));
  }

  void defineWhenGetLanguageList() {
    when(service.getLanguageList()).thenAnswer((_) => Future.value(
          (Stubs.languagesState),
        ));
  }

  LanguagePickerBloc languagePickerBloc() => LanguagePickerBloc(
        service,
      );

  group('test language_picker_bloc states', () {
    rxBlocTest<LanguagePickerBlocType, List<SelectedLanguageModel>>(
        'test language_picker_bloc state languages',
        build: () async {
          defineWhenGetLanguageList();
          defineWhenCurrentLanguage();
          return languagePickerBloc();
        },
        act: (bloc) async {},
        state: (bloc) => bloc.states.languages,
        expect: [
          Stubs.languagesState,
        ]);

    rxBlocTest<LanguagePickerBlocType, LanguageModel>(
        'test item_picker_bloc state currentLanguage',
        build: () async {
          defineWhenGetLanguageList();
          defineWhenCurrentLanguage();
          return languagePickerBloc();
        },
        act: (bloc) async {
          bloc.events.setCurrent(Stubs.selectedLanguageEnglish);
        },
        state: (bloc) => bloc.states.currentLanguage,
        expect: [
          Stubs.selectedLanguageEnglish,
        ]);
  });
}
