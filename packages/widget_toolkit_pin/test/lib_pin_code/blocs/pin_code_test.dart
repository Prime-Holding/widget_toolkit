import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rx_bloc_test/rx_bloc_test.dart';
import 'package:widget_toolkit_pin/src/lib_pin_code_with_biometrics/models/biometrics_authentication_type.dart';
import 'package:widget_toolkit_pin/src/lib_pin_code_with_biometrics/services/pin_biometrics_service.dart';
import 'package:widget_toolkit_pin/widget_toolkit_pin.dart';

import '../../mocks/mock_pin_code_service.dart';
import '../../mocks/stubs.dart';
import 'pin_code_test.mocks.dart';

@GenerateMocks([
  PinBiometricsService,
])
void main() {
  late PinBiometricsService biometricAuthenticationService;

  setUp(() {
    biometricAuthenticationService = MockPinBiometricsService();
  });

  void defineWhen(
      {String authMessage = '',
      bool areBiometricsEnabled = true,
      bool isDeviceSupported = true,
      bool canCheckBiometrics = true,
      List<BiometricsAuthType>? biometrics}) {
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
  }

  PinCodeBloc pinCodeBloc({String? code, bool? returnNull, bool? throwError}) =>
      PinCodeBloc(
        biometricAuthenticationService: biometricAuthenticationService,
        localizedBiometricsMessage: '',
        pinCodeService: MockPinCodeService(
            code: code,
            returnNull: returnNull ?? false,
            throwError: throwError ?? false), // localizedBiometricsMessage,
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
          // bloc.events.requestBiometricAuth('');
        },
        state: (bloc) => bloc.states.availableBiometrics,
        expect: [Stubs.someBiometrics]);
  });

  group('test pin_code_bloc_dart state pinFromBiometricAuthentication', () {
    // rxBlocTest<PinCodeBloc, String?>(
    //     'test pin_code_bloc_dart state pinFromBiometricAuthentication',
    //     build: () async {
    //       defineWhen();
    //       return pinCodeBloc(code: Stubs.pinCode);
    //     },
    //     act: (bloc) async {
    //       bloc.events.requestBiometricAuth('');
    //     },
    //     state: (bloc) => bloc.states.pinFromBiometricAuthentication,
    //     expect: [Stubs.pinCode]);

    // rxBlocTest<PinCodeBloc, String?>(
    //     'test pin_code_bloc_dart state pinFromBiometricAuthentication',
    //     build: () async {
    //       defineWhen();
    //       return pinCodeBloc(code: Stubs.pinCode2);
    //     },
    //     act: (bloc) async {
    //       bloc.events.requestBiometricAuth('');
    //     },
    //     state: (bloc) => bloc.states.pinFromBiometricAuthentication,
    //     expect: [Stubs.pinCode2]);
    //
    // rxBlocTest<PinCodeBloc, String?>(
    //     'test pin_code_bloc_dart state pinFromBiometricAuthentication',
    //     build: () async {
    //       defineWhen(authMessage: Stubs.authMessage);
    //       return pinCodeBloc(code: Stubs.pinCode);
    //     },
    //     act: (bloc) async {
    //       bloc.events.requestBiometricAuth(Stubs.authMessage);
    //     },
    //     state: (bloc) => bloc.states.pinFromBiometricAuthentication,
    //     expect: [Stubs.pinCode]);
  });
}
