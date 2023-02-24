import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:rx_bloc_test/rx_bloc_test.dart';
import 'package:widget_toolkit/src/lib_text_field_dialog/blocs/text_field_dialog_bloc.dart';
import 'package:widget_toolkit/widget_toolkit.dart';

import '../../mocks/stubs.dart';
import '../services/text_field_service_mock.dart';
import 'text_field_dialog_test.mocks.dart';

late TextFieldDialogServiceMock serviceValidator;

@GenerateMocks([TextFieldDialogServiceMock])
void main() {
  setUp(() {
    serviceValidator = MockTextFieldDialogServiceMock();
  });

  rxBlocTest<TextFieldDialogBlocType, String>(
      'test text_field_dialog_bloc state text with initial value',
      build: () async {
        return textFieldDialogBlocWithString();
      },
      act: (bloc) async {},
      state: (bloc) => bloc.states.text,
      expect: [
        Stubs.textFieldDialogInitialValue,
      ]);

  rxBlocTest<TextFieldDialogBlocType, String>(
      'test text_field_dialog_bloc setText event and text state',
      build: () async {
        return textFieldDialogBlocWithNull();
      },
      act: (bloc) async {
        bloc.events.setText(Stubs.textFieldDialogInitialValue);
      },
      state: (bloc) => bloc.states.text,
      expect: [Stubs.textFieldDialogInitialValue]);

  rxBlocTest<TextFieldDialogBlocType, Result<dynamic>>(
      'test text_field_dialog_bloc submittedValue state success',
      build: () async {
        _defineWhenValidationReturns();
        return textFieldDialogBlocWithNull();
      },
      act: (bloc) async {
        bloc.events.setText(Stubs.textFieldDialogInitialValue);
        bloc.events.submit();
      },
      state: (bloc) => bloc.states.submittedValue,
      expect: [
        Result<dynamic>.loading(),
        Result<dynamic>.success(Stubs.textFieldDialogInitialValue)
      ]);

  rxBlocTest<TextFieldDialogBlocType, Result<dynamic>>(
      'test text_field_dialog_bloc submittedValue state error',
      build: () async {
        _defineWhenValidationThrows();
        return textFieldDialogBlocWithNull();
      },
      act: (bloc) async {
        bloc.events.setText(Stubs.textFieldDialogExceptionValue);
        bloc.events.submit();
      },
      state: (bloc) => bloc.states.submittedValue,
      expect: [
        Result<dynamic>.loading(),
        Result<dynamic>.error(GenericErrorModel()),
      ]);
}

void _defineWhenValidationReturns() {
  when(serviceValidator.validateOnSubmit(Stubs.textFieldDialogInitialValue))
      .thenAnswer(
          (realInvocation) => Future.value(Stubs.textFieldDialogInitialValue));
}

void _defineWhenValidationThrows() {
  when(serviceValidator.validateOnSubmit(Stubs.textFieldDialogExceptionValue))
      .thenAnswer((realInvocation) => throw GenericErrorModel(
            customMessage: 'Server side message, enter at most 6 symbols',
          ));
}

TextFieldDialogBloc textFieldDialogBlocWithString() => TextFieldDialogBloc(
      serviceValidator,
      Stubs.textFieldDialogInitialValue,
    );

TextFieldDialogBloc textFieldDialogBlocWithNull() => TextFieldDialogBloc(
      serviceValidator,
      null,
    );
