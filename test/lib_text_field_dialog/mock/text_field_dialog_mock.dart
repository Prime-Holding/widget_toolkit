import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:widget_toolkit/src/lib_text_field_dialog/blocs/text_field_dialog_bloc.dart';

import '../../mocks/stubs.dart';
import 'text_field_dialog_mock.mocks.dart';

@GenerateMocks([
  TextFieldDialogBlocStates,
  TextFieldDialogBlocEvents,
  TextFieldDialogBlocType,
])
TextFieldDialogBlocType textFieldDialogMockFactory({
  required Result<String> submittedResult,
}) {
  final blocMock = MockTextFieldDialogBlocType();
  final eventsMock = MockTextFieldDialogBlocEvents();
  final statesMock = MockTextFieldDialogBlocStates();

  when(blocMock.events).thenReturn(eventsMock);
  when(blocMock.states).thenReturn(statesMock);

  ///todo add initial string data  to the bloc if needed
  when(statesMock.isErrorVisible).thenAnswer((_) => Stream.value(true));
  when(statesMock.text).thenAnswer((_) =>
      Stream.value(Stubs.textFieldDialogInitialValue).asBroadcastStream());
  when(statesMock.submittedValue).thenAnswer(
    (_) => Stream.value(submittedResult).share(),
  );

  return blocMock;
}
