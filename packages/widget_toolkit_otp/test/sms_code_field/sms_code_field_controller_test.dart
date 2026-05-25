import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_toolkit_otp/widget_toolkit_otp.dart';

void main() {
  group('SmsCodeFieldController', () {
    late SmsCodeFieldController fieldController;
    late TextEditingController textController;

    setUp(() {
      fieldController = SmsCodeFieldController();
      textController = TextEditingController(text: '1234');
    });

    tearDown(() {
      textController.dispose();
    });

    test('hasClients is false before bind', () {
      expect(fieldController.hasClients, isFalse);
    });

    test('clear and reset have no effect before bind', () {
      fieldController.clear();
      fieldController.reset();

      expect(textController.text, '1234');
    });

    test('clear removes text when bound', () {
      fieldController.bind(textController: textController);

      fieldController.clear();

      expect(fieldController.hasClients, isTrue);
      expect(textController.text, isEmpty);
    });

    test('reset notifies bloc with inactive when bound', () {
      TemporaryCodeState? capturedState;
      fieldController.bind(
        textController: textController,
        setBlocState: (state) => capturedState = state,
      );

      fieldController.reset();

      expect(textController.text, isEmpty);
      expect(capturedState, TemporaryCodeState.inactive);
    });

    test('reset with notifyBloc false only clears text', () {
      TemporaryCodeState? capturedState;
      fieldController.bind(
        textController: textController,
        setBlocState: (state) => capturedState = state,
      );

      fieldController.reset(notifyBloc: false);

      expect(textController.text, isEmpty);
      expect(capturedState, isNull);
    });

    test('unbind detaches the controller', () {
      fieldController.bind(textController: textController);

      fieldController.unbind();

      expect(fieldController.hasClients, isFalse);
      fieldController.clear();
      expect(textController.text, '1234');
    });
  });
}
