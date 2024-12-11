import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rx_bloc_test/rx_bloc_test.dart';
import 'package:widget_toolkit/models.dart';
import 'package:widget_toolkit_pin/src/lib_pin_code_with_biometrics/models/biometrics_authentication_type.dart';
import 'package:widget_toolkit_pin/src/lib_pin_code_with_biometrics/services/pin_biometrics_service.dart';
import 'package:widget_toolkit_pin/widget_toolkit_pin.dart';

import '../../mocks/stubs.dart';
import 'pin_code_test.mocks.dart';

@GenerateMocks([
  PinBiometricsService,
  PinCodeService,
])
void main() {
  late PinBiometricsService biometricAuthenticationService;
  late PinCodeService pinCodeService;
  setUp(() {
    biometricAuthenticationService = MockPinBiometricsService();
    pinCodeService = MockPinCodeService();
  });

  void defineWhen({
    String authMessage = '',
    bool areBiometricsEnabled = true,
    bool isDeviceSupported = true,
    bool canCheckBiometrics = true,
    List<BiometricsAuthType>? biometrics,
    String pinCode = '',
    bool isPinVerified = true,
    bool enableBiometrics = true,
    BiometricsMessage biometricsMessage = BiometricsMessage.enabled,
    ErrorModel? biometricsError,
  }) {
    when(biometricAuthenticationService.isDeviceSupported)
        .thenAnswer((_) => Future.value(isDeviceSupported));

    when(biometricAuthenticationService.canCheckBiometrics)
        .thenAnswer((_) => Future.value(canCheckBiometrics));

    if (biometricsError == null) {
      when(biometricAuthenticationService.areBiometricsEnabled())
          .thenAnswer((_) => Future.value(areBiometricsEnabled));
    } else {
      when(biometricAuthenticationService.areBiometricsEnabled())
          .thenThrow(biometricsError);
    }

    when(biometricAuthenticationService.availableBiometrics).thenAnswer(
        (_) => Future.value(biometrics ?? [BiometricsAuthType.fingerprint]));

    when(biometricAuthenticationService.authenticate(authMessage))
        .thenAnswer((_) => Future.value(areBiometricsEnabled));

    when(biometricAuthenticationService.enableBiometrics(
            enableBiometrics, Stubs.authMessage))
        .thenAnswer((_) => Future.value(biometricsMessage));

    when(pinCodeService.verifyPinCode(pinCode))
        .thenAnswer((_) => Future.value(isPinVerified));

    when(pinCodeService.encryptPinCode(pinCode))
        .thenAnswer((_) => Future.value(pinCode));

    when(pinCodeService.getPinLength()).thenAnswer((_) => Future.value(6));

    when(pinCodeService.getPinCode()).thenAnswer((_) => Future.value(pinCode));
  }

  PinCodeBloc pinCodeBloc() => PinCodeBloc(
        biometricAuthenticationService: biometricAuthenticationService,
        localizedReason: '',
        pinCodeService: pinCodeService,
        autoPromptBiometric: false,
      );

  group('test pin_code_bloc_dart state digitsCount', () {
    rxBlocTest<PinCodeBloc, int>(
        'test pin_code_bloc_dart state digitsCount with addDigit event',
        build: () async {
          defineWhen(pinCode: Stubs.pinCode);
          return pinCodeBloc();
        },
        act: (bloc) async {
          bloc.events.addDigit(Stubs.pinCode);
        },
        state: (bloc) => bloc.states.digitsCount,
        expect: [6]);

    rxBlocFakeAsyncTest<PinCodeBloc, int>(
        'test pin_code_bloc_dart state digitsCount with addDigit and deleteDigit event',
        build: () {
          defineWhen();
          return pinCodeBloc();
        },
        act: (bloc, fakeAsync) async {
          bloc.events.addDigit('1');
          fakeAsync.elapse(const Duration(milliseconds: 1));
          bloc.events.deleteDigit();
          bloc.events.addDigit('2');
          bloc.events.addDigit('1');
          fakeAsync.elapse(const Duration(milliseconds: 1));
          bloc.events.deleteDigit();
        },
        state: (bloc) => bloc.states.digitsCount,
        expect: [0, 1, 0, 1, 2, 1]);
  });

  group('test pin_code_bloc_dart state authenticated', () {
    rxBlocTest<PinCodeBloc, void>(
        'test pin_code_bloc_dart state authenticated failing',
        build: () async {
          defineWhen(
            isDeviceSupported: false,
            areBiometricsEnabled: false,
            enableBiometrics: false,
            biometricsMessage: BiometricsMessage.notSetup,
          );

          return pinCodeBloc();
        },
        act: (bloc) async {
          bloc.events.biometricsButtonPressed();
        },
        state: (bloc) => bloc.states.authenticated,
        expect: []);

    rxBlocTest<PinCodeBloc, void>('test pin_code_bloc_dart state authenticated',
        build: () async {
          defineWhen(
            isDeviceSupported: true,
            isPinVerified: true,
            canCheckBiometrics: true,
            pinCode: Stubs.pinCode,
          );
          return pinCodeBloc();
        },
        act: (bloc) async {
          bloc.events.biometricsButtonPressed();
        },
        state: (bloc) => bloc.states.authenticated,
        expect: []);
  });

  group('test pin_code_bloc_dart state showBiometricsButton', () {
    rxBlocTest<PinCodeBloc, bool>(
        'test pin_code_bloc_dart state showBiometricsButton true',
        build: () async {
          defineWhen(
            pinCode: Stubs.pinCode,
            isPinVerified: true,
            enableBiometrics: true,
          );

          return pinCodeBloc();
        },
        act: (bloc) async {
          bloc.events.addDigit(Stubs.pinCode);
        },
        state: (bloc) => bloc.states.showBiometricsButton,
        expect: [true]);

    rxBlocTest<PinCodeBloc, bool>(
        'test pin_code_bloc_dart state showBiometricsButton false',
        build: () async {
          defineWhen(
            pinCode: Stubs.pinCode2,
            isPinVerified: false,
            areBiometricsEnabled: false,
          );

          return pinCodeBloc();
        },
        act: (bloc) async {},
        state: (bloc) => bloc.states.showBiometricsButton,
        expect: [false]);

    rxBlocTest<PinCodeBloc, Exception>(
        'test pin_code_bloc_dart state error with biometrics',
        build: () async {
          defineWhen(
            pinCode: Stubs.pinCode2,
            isPinVerified: false,
            areBiometricsEnabled: false,
            biometricsError: Stubs.error,
          );

          return pinCodeBloc();
        },
        act: (bloc) async {},
        state: (bloc) {
          bloc.states.showBiometricsButton.listen((_) {});
          return bloc.states.errors;
        },
        expect: [Stubs.error]);
  });

  test('dispose test', () {
    defineWhen();

    pinCodeBloc().dispose();
  });
}
