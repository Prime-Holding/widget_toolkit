import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rx_bloc_test/rx_bloc_test.dart';
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
    bool isPinCodeInSecureStorage = true,
    bool enableBiometrics = true,
    BiometricsMessage biometricsMessage = BiometricsMessage.enabled,
  }) {
    when(biometricAuthenticationService.isDeviceSupported)
        .thenAnswer((_) => Future.value(isDeviceSupported));

    when(biometricAuthenticationService.canCheckBiometrics)
        .thenAnswer((_) => Future.value(canCheckBiometrics));

    when(biometricAuthenticationService.areBiometricsEnabled())
        .thenAnswer((_) => Future.value(areBiometricsEnabled));

    when(biometricAuthenticationService.availableBiometrics).thenAnswer(
        (_) => Future.value(biometrics ?? [BiometricsAuthType.fingerprint]));

    when(biometricAuthenticationService.authenticate(authMessage))
        .thenAnswer((_) => Future.value(areBiometricsEnabled));

    when(biometricAuthenticationService.enableBiometrics(
            enableBiometrics, Stubs.authMessage))
        .thenAnswer((_) => Future.value(biometricsMessage));

    when(pinCodeService.verifyPinCode(pinCode))
        .thenAnswer((_) => Future.value(isPinVerified));

    when(pinCodeService.isPinCodeInSecureStorage())
        .thenAnswer((_) => Future.value(isPinCodeInSecureStorage));

    when(pinCodeService.encryptPinCode(pinCode))
        .thenAnswer((_) => Future.value(pinCode));

    when(pinCodeService.getPinLength()).thenAnswer((_) => Future.value(6));

    when(pinCodeService.getPinCode()).thenAnswer((_) => Future.value(pinCode));
  }

  PinCodeBloc pinCodeBloc({String? code, bool? returnNull, bool? throwError}) =>
      PinCodeBloc(
        biometricAuthenticationService: biometricAuthenticationService,
        enterPinWithBiometrics: '',
        pinCodeService: pinCodeService,
      );

  group('test pin_code_bloc_dart state digitsCount', () {
    rxBlocTest<PinCodeBloc, int>(
        'test pin_code_bloc_dart state digitsCount with addDigit event',
        build: () async {
          defineWhen(pinCode: Stubs.pinCode);
          when(pinCodeService.getPinLength())
              .thenAnswer((_) => Future.value(6));
          return pinCodeBloc(code: Stubs.pinCode);
        },
        act: (bloc) async {
          bloc.events.addDigit(Stubs.pinCode);
        },
        state: (bloc) => bloc.states.digitsCount,
        expect: [6]);

    rxBlocTest<PinCodeBloc, int>(
        'test pin_code_bloc_dart state digitsCount with addDigit and deleteDigit event',
        build: () async {
          when(pinCodeService.getPinLength())
              .thenAnswer((_) => Future.value(6));
          when(pinCodeService.encryptPinCode(Stubs.pinCodeDeleteDigit))
              .thenAnswer((_) => Future.value(Stubs
                  .pinCodeDeleteDigit)); // encrypt pinCode with one digit deleted
          when(pinCodeService.verifyPinCode(Stubs
                  .pinCodeDeleteDigit)) // verify pinCode with one digit deleted
              .thenAnswer((_) => Future.value(true));
          return pinCodeBloc(code: Stubs.pinCode);
        },
        act: (bloc) async {
          bloc.events.addDigit(Stubs.pinCode);
          bloc.events.deleteDigit();
        },
        state: (bloc) => bloc.states.digitsCount,
        expect: [6, 5]);
  });

  group('test pin_code_bloc_dart state authenticated', () {
    rxBlocTest<PinCodeBloc, void>('test pin_code_bloc_dart state authenticated',
        build: () async {
          when(pinCodeService.getPinLength())
              .thenAnswer((_) => Future.value(6));
          return pinCodeBloc();
        },
        act: (bloc) async {
          bloc.events.biometricsButtonPressed(Stubs.authMessage);
        },
        state: (bloc) => bloc.states.authenticated,
        expect: []);
  });

  group('test pin_code_bloc_dart state showBiometricsButton', () {
    rxBlocTest<PinCodeBloc, bool>(
        'test pin_code_bloc_dart state showBiometricsButton true',
        build: () async {
          when(pinCodeService.verifyPinCode(Stubs.pinCode))
              .thenAnswer((_) => Future.value(true));

          when(pinCodeService.encryptPinCode(Stubs.pinCode))
              .thenAnswer((_) => Future.value(Stubs.pinCode));

          when(pinCodeService.isPinCodeInSecureStorage())
              .thenAnswer((_) => Future.value(true));

          when(pinCodeService.getPinLength())
              .thenAnswer((_) => Future.value(6));

          return pinCodeBloc(code: Stubs.pinCode);
        },
        act: (bloc) async {
          bloc.events.addDigit(Stubs.pinCode);
        },
        state: (bloc) => bloc.states.showBiometricsButton,
        expect: [true]);

    rxBlocTest<PinCodeBloc, bool>(
        'test pin_code_bloc_dart state showBiometricsButton false',
        build: () async {
          when(pinCodeService.verifyPinCode(Stubs.pinCode2))
              .thenAnswer((_) => Future.value(false));

          when(pinCodeService.encryptPinCode(Stubs.pinCode2))
              .thenAnswer((_) => Future.value(Stubs.pinCode2));

          when(pinCodeService.isPinCodeInSecureStorage())
              .thenAnswer((_) => Future.value(true));

          when(pinCodeService.getPinLength())
              .thenAnswer((_) => Future.value(6));

          return pinCodeBloc();
        },
        act: (bloc) async {
          bloc.events.addDigit(Stubs.pinCode2);

          /// giving wrong pin so we will get false
        },
        state: (bloc) => bloc.states.showBiometricsButton,
        expect: [false]);
  });
}
