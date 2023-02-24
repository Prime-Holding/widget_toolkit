import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rx_bloc_test/rx_bloc_test.dart';
import 'package:widget_toolkit/language_picker.dart';
import 'package:widget_toolkit/widget_toolkit.dart';

import '../../mocks/stubs.dart';
import '../services/language_picker_service_mock.dart';
import 'language_picker_test.mocks.dart';

late LanguagePickerServiceMock service;

@GenerateMocks([LanguagePickerServiceMock])
void main() {
  setUp(() {
    service = MockLanguagePickerServiceMock();
  });

  group('test language_picker_bloc states', () {
    rxBlocTest<LanguagePickerBlocType, List<SelectedLanguageModel>>(
        'test language_picker_bloc state languages',
        build: () async {
          _defineWhenGetLanguageList();
          _defineWhenCurrentLanguage();
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
          _defineWhenGetLanguageList();
          _defineWhenCurrentLanguage();
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

void _defineWhenCurrentLanguage() {
  when(service.getCurrent()).thenAnswer((_) => Future.value(
        (Stubs.selectedLanguageBulgarian),
      ));
}

void _defineWhenGetLanguageList() {
  when(service.getLanguageList()).thenAnswer((_) => Future.value(
        (Stubs.languagesState),
      ));
}

LanguagePickerBloc languagePickerBloc() => LanguagePickerBloc(
      service,
    );
