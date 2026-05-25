import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pinput/pinput.dart';
import 'package:widget_toolkit_otp/src/lib_sms_code_verification/bloc/sms_code_bloc.dart';
import 'package:widget_toolkit_otp/widget_toolkit_otp.dart';

import '../helpers/sms_code_field_wrapper.dart';
import '../sms_code_bloc/sms_code_bloc_test.mocks.dart';
import '../stubs.dart';

void main() {
  group('SmsCodeField standalone', () {
    testWidgets('shows loading overlay when isLoading is true', (tester) async {
      await tester.pumpWidget(
        wrapSmsCodeField(
          child: const SmsCodeField(
            useInternalCommunication: false,
            isLoading: true,
            pinLength: 4,
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(AbsorbPointer), findsWidgets);
    });

    testWidgets('hides loading overlay when isLoading is false', (tester) async {
      await tester.pumpWidget(
        wrapSmsCodeField(
          child: const SmsCodeField(
            useInternalCommunication: false,
            isLoading: false,
            pinLength: 4,
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('respects showLoadingIndicator', (tester) async {
      await tester.pumpWidget(
        wrapSmsCodeField(
          child: const SmsCodeField(
            useInternalCommunication: false,
            isLoading: true,
            showLoadingIndicator: false,
            pinLength: 4,
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('uses custom loadingWidget', (tester) async {
      const loadingKey = Key('custom-loading');

      await tester.pumpWidget(
        wrapSmsCodeField(
          child: const SmsCodeField(
            useInternalCommunication: false,
            isLoading: true,
            loadingWidget: SizedBox(key: loadingKey),
            pinLength: 4,
          ),
        ),
      );

      expect(find.byKey(loadingKey), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('disables Pinput while loading', (tester) async {
      await tester.pumpWidget(
        wrapSmsCodeField(
          child: const SmsCodeField(
            useInternalCommunication: false,
            isLoading: true,
            pinLength: 4,
          ),
        ),
      );

      final pinput = tester.widget<Pinput>(find.byType(Pinput));
      expect(pinput.enabled, isFalse);
      expect(pinput.showCursor, isFalse);
    });
  });

  group('SmsCodeField SmsCodeFieldController', () {
    testWidgets('attaches controller while mounted', (tester) async {
      final fieldController = SmsCodeFieldController();

      await tester.pumpWidget(
        wrapSmsCodeField(
          child: SmsCodeField(
            useInternalCommunication: false,
            smsCodeFieldController: fieldController,
            pinLength: 4,
          ),
        ),
      );

      expect(fieldController.hasClients, isTrue);
    });

    testWidgets('clear removes entered digits via controller', (tester) async {
      final fieldController = SmsCodeFieldController();
      final textController = TextEditingController(text: '1234');

      await tester.pumpWidget(
        wrapSmsCodeField(
          child: SmsCodeField(
            useInternalCommunication: false,
            controller: textController,
            smsCodeFieldController: fieldController,
            pinLength: 4,
          ),
        ),
      );

      fieldController.clear();
      await tester.pump();

      expect(textController.text, isEmpty);
    });

    testWidgets('unbinds controller on dispose', (tester) async {
      final fieldController = SmsCodeFieldController();

      await tester.pumpWidget(
        wrapSmsCodeField(
          child: SmsCodeField(
            useInternalCommunication: false,
            smsCodeFieldController: fieldController,
            pinLength: 4,
          ),
        ),
      );

      await tester.pumpWidget(const SizedBox.shrink());

      expect(fieldController.hasClients, isFalse);
    });
  });

  group('SmsCodeField with SmsCodeBloc', () {
    late MockSmsCodeService service;
    late MockCountdownService countdownService;

    SmsCodeBloc buildBloc() => SmsCodeBloc(
          service: service,
          countdownService: countdownService,
          initialPhoneNumber: Stubs.initialPhoneNumber,
          sentNewCodeActivationTime: Stubs.sentNewCodeActivationTime,
        );

    void stubService({bool throwOnVerifyingCode = false}) {
      when(service.getCodeLength())
          .thenAnswer((_) => Future.value(4));
      when(service.confirmPhoneCode(any))
          .thenAnswer((_) async {
        if (throwOnVerifyingCode) {
          throw Stubs.throwable;
        }
        return true;
      });
      when(service.getResendButtonThrottleTime(any))
          .thenAnswer((_) => Future.value(Stubs.resendButtonThrottleTime));
      when(service.getValidityTime(any))
          .thenAnswer((_) => Future.value(Stubs.validityTime));
      when(countdownService.countDown(maxTime: anyNamed('maxTime')))
          .thenAnswer((_) => Stream.value(1));
    }

    setUp(() {
      service = MockSmsCodeService();
      countdownService = MockCountdownService();
      stubService();
    });

    Future<void> pumpSmsCodeField(
      WidgetTester tester, {
      required SmsCodeBloc bloc,
      required SmsCodeField field,
    }) async {
      await tester.pumpWidget(wrapSmsCodeField(bloc: bloc, child: field));
      await tester.pump();
    }

    testWidgets('clears PIN when bloc emits reset', (tester) async {
      final bloc = buildBloc();
      final textController = TextEditingController();

      await pumpSmsCodeField(
        tester,
        bloc: bloc,
        field: SmsCodeField(controller: textController, pinLength: 4),
      );

      textController.text = '1234';
      bloc.events.reset();
      await tester.pump();

      expect(textController.text, isEmpty);
    });

    testWidgets('clearOnError clears PIN and sets inactive', (tester) async {
      final bloc = buildBloc();
      final textController = TextEditingController();

      await pumpSmsCodeField(
        tester,
        bloc: bloc,
        field: SmsCodeField(
          controller: textController,
          clearOnError: true,
          pinLength: 4,
        ),
      );

      textController.text = '1234';
      bloc.events.setTemporaryCodeState(TemporaryCodeState.wrong);
      await tester.pump();

      expect(textController.text, isEmpty);
    });

    testWidgets('reset via controller clears PIN and sets inactive',
        (tester) async {
      final bloc = buildBloc();
      final fieldController = SmsCodeFieldController();
      final textController = TextEditingController();

      await pumpSmsCodeField(
        tester,
        bloc: bloc,
        field: SmsCodeField(
          controller: textController,
          smsCodeFieldController: fieldController,
          pinLength: 4,
        ),
      );

      textController.text = '1234';
      fieldController.reset();
      await tester.pump();

      expect(textController.text, isEmpty);
    });

    testWidgets('does not clear PIN on wrong when clearOnError is false',
        (tester) async {
      final bloc = buildBloc();
      final textController = TextEditingController();

      await pumpSmsCodeField(
        tester,
        bloc: bloc,
        field: SmsCodeField(
          controller: textController,
          pinLength: 4,
        ),
      );

      textController.text = '1234';
      bloc.events.setTemporaryCodeState(TemporaryCodeState.wrong);
      await tester.pump();

      expect(textController.text, '1234');
    });
  });
}
