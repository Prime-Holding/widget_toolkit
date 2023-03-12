import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';
import 'package:widget_toolkit/language_picker.dart';

import 'language_picker_mock.mocks.dart';

@GenerateMocks([
  LanguagePickerBlocStates,
  LanguagePickerBlocEvents,
  LanguagePickerBlocType,
])
LanguagePickerBlocType languagePickerMockFactory({
  required List<SelectedLanguageModel> selectedLanguages,
}) {
  final blocMock = MockLanguagePickerBlocType();
  final eventsMock = MockLanguagePickerBlocEvents();
  final statesMock = MockLanguagePickerBlocStates();

  when(blocMock.events).thenReturn(eventsMock);
  when(blocMock.states).thenReturn(statesMock);

  when(statesMock.languages)
      .thenAnswer((_) => Stream.value(selectedLanguages).publish());
  return blocMock;
}
