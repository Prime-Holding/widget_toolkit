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

  group('test pin_code_bloc_dart state areBiometricsEnabled', () {
    rxBlocTest<PinCodeBloc, bool>(
        'test pin_code_bloc_dart state areBiometricsEnabled',
        build: () async {
          defineWhen();
          return pinCodeBloc(code: Stubs.pinCode);
        },
        act: (bloc) async {
          bloc.states.isAuthenticatedWithBiometrics.listen((value) {});
        },
        state: (bloc) => bloc.states.areBiometricsEnabled,
        expect: [true]);

    rxBlocTest<PinCodeBloc, bool>(
        'test pin_code_bloc_dart state areBiometricsEnabled false',
        build: () async {
          defineWhen(areBiometricsEnabled: false);
          return pinCodeBloc(code: Stubs.pinCode);
        },
        act: (bloc) async {},
        state: (bloc) => bloc.states.areBiometricsEnabled,
        expect: [false]);
  });

  group('test pin_code_bloc_dart state availableBiometrics', () {
    rxBlocTest<PinCodeBloc, List<BiometricsAuthType>>(
        'test pin_code_bloc_dart state availableBiometrics empty',
        build: () async {
          defineWhen(biometrics: Stubs.noBiometrics);
          return pinCodeBloc();
        },
        act: (bloc) async {
          bloc.events.requestBiometricAuth('');
        },
        state: (bloc) => bloc.states.availableBiometrics,
        expect: [Stubs.noBiometrics]);

    rxBlocTest<PinCodeBloc, List<BiometricsAuthType>>(
        'test pin_code_bloc_dart state availableBiometrics',
        build: () async {
          defineWhen(biometrics: Stubs.someBiometrics);
          return pinCodeBloc(code: Stubs.pinCode2);
        },
        act: (bloc) async {
          bloc.events.requestBiometricAuth('');
        },
        state: (bloc) => bloc.states.availableBiometrics,
        expect: [Stubs.someBiometrics]);
  });

  group('test pin_code_bloc_dart state isAuthenticatedWithBiometrics', () {
    rxBlocTest<PinCodeBloc, bool>(
        'test pin_code_bloc_dart state isAuthenticatedWithBiometrics true',
        build: () async {
          defineWhen();
          return pinCodeBloc(code: Stubs.pinCode);
        },
        act: (bloc) async {
          bloc.events.requestBiometricAuth('');
        },
        state: (bloc) => bloc.states.isAuthenticatedWithBiometrics,
        expect: [true]);

    rxBlocTest<PinCodeBloc, bool>(
        'test pin_code_bloc_dart state isAuthenticatedWithBiometrics false',
        build: () async {
          defineWhen(
              authMessage: Stubs.authMessage, areBiometricsEnabled: false);
          return pinCodeBloc(code: Stubs.pinCode);
        },
        act: (bloc) async {
          bloc.events.requestBiometricAuth(Stubs.authMessage);
        },
        state: (bloc) => bloc.states.isAuthenticatedWithBiometrics,
        expect: [false]);
  });

  group('test pin_code_bloc_dart state isPinCodeVerified', () {
    rxBlocTest<PinCodeBloc, bool>(
        'test pin_code_bloc_dart state isPinCodeVerified true',
        build: () async {
          defineWhen(pinCode: Stubs.pinCode, isPinVerified: true);
          return pinCodeBloc();
        },
        act: (bloc) async {
          bloc.events.autoSubmit(Stubs.pinCode);
        },
        state: (bloc) => bloc.states.isPinCodeVerified,
        expect: [true]);

    rxBlocTest<PinCodeBloc, bool>(
        'test pin_code_bloc_dart state isPinCodeVerified false',
        build: () async {
          defineWhen(pinCode: Stubs.pinCode, isPinVerified: false);
          return pinCodeBloc();
        },
        act: (bloc) async {
          bloc.events.autoSubmit(Stubs.pinCode);
        },
        state: (bloc) => bloc.states.isPinCodeVerified,
        expect: [false]);
  });

  group('test pin_code_bloc_dart state isPinCodeInSecureStorage', () {
    rxBlocTest<PinCodeBloc, bool>(
        'test pin_code_bloc_dart state isPinCodeInSecureStorage true',
        build: () async {
          defineWhen(pinCode: Stubs.pinCode, isPinCodeInSecureStorage: true);
          return pinCodeBloc();
        },
        act: (bloc) async {
          bloc.events.checkPinCodeInStorage();
        },
        state: (bloc) => bloc.states.isPinCodeInSecureStorage,
        expect: [true]);

    rxBlocTest<PinCodeBloc, bool>(
        'test pin_code_bloc_dart state isPinCodeInSecureStorage false',
        build: () async {
          defineWhen(pinCode: Stubs.pinCode, isPinCodeInSecureStorage: false);
          return pinCodeBloc();
        },
        act: (bloc) async {
          bloc.events.checkPinCodeInStorage();
        },
        state: (bloc) => bloc.states.isPinCodeInSecureStorage,
        expect: [false]);
  });

  group('test pin_code_bloc_dart state biometricsDialog', () {
    rxBlocTest<PinCodeBloc, BiometricsMessage?>(
        'test pin_code_bloc_dart state biometricsDialog enabled',
        build: () async {
          defineWhen(
              pinCode: Stubs.pinCode,
              enableBiometrics: true,
              biometricsMessage: BiometricsMessage.enabled);
          return pinCodeBloc();
        },
        act: (bloc) async {
          bloc.events.setBiometrics(true, Stubs.authMessage);
        },
        state: (bloc) => bloc.states.biometricsDialog,
        expect: [BiometricsMessage.enabled]);
  });
}
