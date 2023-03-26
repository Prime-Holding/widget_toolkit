import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:rx_bloc_test/rx_bloc_test.dart';
import 'package:widget_toolkit_otp/widget_toolkit_otp.dart';

import '../stubs.dart';
import 'sms_code_bloc_test.mocks.dart';

@GenerateMocks([
  SmsCodeService,
  CountdownService,
])
void main() {
  late SmsCodeService service;
  late CountdownService countdownService;
  late String? initialPhoneNumber;
  late int sentNewCodeActivationTime;

  void defineWhen(
      {bool throwOnFetchingPhoneNumber = false,
      bool throwOnVerifyingCode = false,
      int throttleTime = Stubs.resendButtonThrottleTime}) {
    if (throwOnFetchingPhoneNumber) {
      when(service.getFullPhoneNumber())
          .thenAnswer((_) async => throw Stubs.throwable);
    } else {
      when(service.getFullPhoneNumber())
          .thenAnswer((_) => Future.value(Stubs.initialPhoneNumber));
    }
    when(service.getCodeLength())
        .thenAnswer((_) => Future.value(Stubs.codeLength));
    if (throwOnVerifyingCode) {
      when(service.confirmPhoneCode(Stubs.code))
          .thenAnswer((_) => throw Stubs.throwable);
    } else {
      when(service.confirmPhoneCode(Stubs.code))
          .thenAnswer((_) => Future.value(true));
    }
    when(service.sendConfirmationSms(Stubs.initialPhoneNumber))
        .thenAnswer((_) => Future.value(true));
    when(service.getResendButtonThrottleTime(false))
        .thenAnswer((_) => Future.value(throttleTime));
    when(service.getValidityTime(false))
        .thenAnswer((_) => Future.value(Stubs.validityTime));
    when(countdownService.countDown(maxTime: Stubs.validityTime))
        .thenAnswer((_) => Stream.value(Stubs.validityTime));
    when(countdownService.countDown(maxTime: throttleTime))
        .thenAnswer((_) => Stream.value(throttleTime));
    when(service.updatePhoneNumber(Stubs.phoneNumber))
        .thenAnswer((_) => Future.value(Stubs.phoneNumber));
    when(service.sendConfirmationSms(Stubs.phoneNumber))
        .thenAnswer((_) => Future.value(true));
  }

  SmsCodeBloc smsCodeBloc({bool hasInitialPhoneNumber = true}) => SmsCodeBloc(
        service: service,
        countdownService: countdownService,
        initialPhoneNumber: hasInitialPhoneNumber ? initialPhoneNumber : null,
        sentNewCodeActivationTime: sentNewCodeActivationTime,
      );
  setUp(() {
    service = MockSmsCodeService();
    countdownService = MockCountdownService();
    initialPhoneNumber = Stubs.initialPhoneNumber;
    sentNewCodeActivationTime = Stubs.sentNewCodeActivationTime;
  });

  group('test sms_code_bloc_dart state isLoading', () {
    rxBlocTest<SmsCodeBlocType, bool>(
        'test sms_code_bloc_dart state isLoading with initial phone number',
        build: () async {
          defineWhen();
          return smsCodeBloc();
        },
        act: (bloc) async {},
        state: (bloc) => bloc.states.isLoading,
        expect: [false]);

    rxBlocTest<SmsCodeBlocType, bool>('test sms_code_bloc_dart state isLoading',
        build: () async {
          defineWhen();
          return smsCodeBloc(hasInitialPhoneNumber: false);
        },
        act: (bloc) async {},
        state: (bloc) => bloc.states.isLoading,
        expect: [false, true, false]);
  });

  // group('test sms_code_bloc_dart state errors', () {
  //   rxBlocTest<SmsCodeBlocType, ErrorModel?>(
  //       'test sms_code_bloc_dart state errors',
  //       build: () async {
  //         defineWhen(throwOnFetchingPhoneNumber: true);
  //         return smsCodeBloc(hasInitialPhoneNumber: false);
  //       },
  //       act: (bloc) async {},
  //       state: (bloc) => bloc.states.errors,
  //       expect: [ErrorModel()]);
  //   //  Actual: <Instance of '_AsBroadcastStream<ErrorModel>'>
  // });

  group('test sms_code_bloc_dart state phoneNumber', () {
    rxBlocTest<SmsCodeBlocType, String>(
        'test sms_code_bloc_dart state phoneNumber',
        build: () async {
          defineWhen();
          return smsCodeBloc();
        },
        act: (bloc) async {},
        state: (bloc) => bloc.states.phoneNumber,
        expect: [Stubs.initialPhoneNumber]);
    rxBlocTest<SmsCodeBlocType, String>(
        'test sms_code_bloc_dart state phoneNumber - update',
        build: () async {
          defineWhen();
          return smsCodeBloc();
        },
        act: (bloc) async {
          bloc.states.onCodeVerificationResult.listen((event) {});
          bloc.states.isSendNewCodeEnabled.listen((event) {});
          await Future.delayed(const Duration(seconds: 1));
          bloc.events.updatePhoneNumber(Stubs.phoneNumber);
        },
        state: (bloc) => bloc.states.phoneNumber,
        expect: [Stubs.initialPhoneNumber, Stubs.phoneNumber]);
  });

  group('test sms_code_bloc_dart state validityTime', () {
    rxBlocTest<SmsCodeBlocType, int>(
        'test sms_code_bloc_dart state validityTime',
        build: () async {
          defineWhen();
          return smsCodeBloc();
        },
        act: (bloc) async {
          bloc.states.onCodeVerificationResult.listen((event) {});
        },
        state: (bloc) => bloc.states.validityTime,
        expect: [Stubs.validityTime]);
  });

  group('test sms_code_bloc_dart state resendButtonThrottleTime', () {
    rxBlocTest<SmsCodeBlocType, int>(
        'test sms_code_bloc_dart state resendButtonThrottleTime',
        build: () async {
          defineWhen();
          return smsCodeBloc();
        },
        act: (bloc) async {},
        state: (bloc) => bloc.states.resendButtonThrottleTime,
        expect: [3]);
  });

  group('test sms_code_bloc_dart state isSendNewCodeEnabled', () {
    rxBlocTest<SmsCodeBlocType, Result<bool>>(
        'test sms_code_bloc_dart state isSendNewCodeEnabled on first load',
        build: () async {
          defineWhen();
          return smsCodeBloc();
        },
        act: (bloc) async {},
        state: (bloc) => bloc.states.isSendNewCodeEnabled,
        expect: [
          Result.loading(),
          Result.loading(),
          Result.success(false),
        ]);
    rxBlocTest<SmsCodeBlocType, Result<bool>>(
        'test sms_code_bloc_dart state isSendNewCodeEnabled after throttle time',
        build: () async {
          defineWhen(throttleTime: 0);
          return smsCodeBloc();
        },
        act: (bloc) async {},
        state: (bloc) => bloc.states.isSendNewCodeEnabled,
        expect: [
          Result.loading(),
          Result.loading(),
          Result.success(true),
        ]);
  });

  group('test sms_code_bloc_dart state sentNewCode', () {
    rxBlocTest<SmsCodeBlocType, bool>(
        'test sms_code_bloc_dart state sentNewCode',
        build: () async {
          defineWhen();
          return smsCodeBloc();
        },
        act: (bloc) async {
          bloc.events.codeSent(true);
        },
        state: (bloc) => bloc.states.sentNewCode,
        expect: [true]);
    rxBlocTest<SmsCodeBlocType, bool>(
        'test sms_code_bloc_dart state sentNewCode after sendNewCode',
        build: () async {
          defineWhen();
          return smsCodeBloc();
        },
        act: (bloc) async {
          bloc.states.isSendNewCodeEnabled.listen((event) {});
          bloc.events.sendNewCode();
        },
        state: (bloc) => bloc.states.sentNewCode,
        expect: [false, true]);
  });

  group('test sms_code_bloc_dart state onCodeVerificationResult', () {
    rxBlocTest<SmsCodeBlocType, TemporaryCodeState>(
        'test sms_code_bloc_dart state onCodeVerificationResult',
        build: () async {
          defineWhen();
          return smsCodeBloc();
        },
        act: (bloc) async {
          bloc.events.verifyCode(Stubs.code);
        },
        state: (bloc) => bloc.states.onCodeVerificationResult,
        expect: [
          TemporaryCodeState.reset,
          TemporaryCodeState.loading,
          TemporaryCodeState.correct
        ]);
    rxBlocTest<SmsCodeBlocType, TemporaryCodeState>(
        'test sms_code_bloc_dart state onCodeVerificationResult throws',
        build: () async {
          defineWhen(throwOnVerifyingCode: true);
          return smsCodeBloc();
        },
        act: (bloc) async {
          bloc.events.verifyCode(Stubs.code);
        },
        state: (bloc) => bloc.states.onCodeVerificationResult,
        expect: [
          TemporaryCodeState.reset,
          TemporaryCodeState.loading,
        ]);
    rxBlocTest<SmsCodeBlocType, TemporaryCodeState>(
        'test sms_code_bloc_dart state onCodeVerificationResult throws',
        build: () async {
          defineWhen();
          return smsCodeBloc();
        },
        act: (bloc) async {
          bloc.events.setTemporaryCodeState(TemporaryCodeState.wrong);
        },
        state: (bloc) => bloc.states.onCodeVerificationResult,
        expect: [
          TemporaryCodeState.reset,
          TemporaryCodeState.wrong,
        ]);
  });

  group('test sms_code_bloc_dart state result', () {
    rxBlocTest<SmsCodeBlocType, dynamic>('test sms_code_bloc_dart state result',
        build: () async {
          defineWhen();
          return smsCodeBloc();
        },
        act: (bloc) async {
          bloc.states.onCodeVerificationResult.listen((event) {});
          bloc.events.verifyCode(Stubs.code);
        },
        state: (bloc) => bloc.states.result,
        expect: [true]);
  });

  group('test sms_code_bloc_dart state pinLength', () {
    rxBlocTest<SmsCodeBlocType, int>('test sms_code_bloc_dart state pinLength',
        build: () async {
          defineWhen();
          return smsCodeBloc();
        },
        act: (bloc) async {},
        state: (bloc) => bloc.states.pinLength,
        expect: [Stubs.codeLength]);
  });
}
