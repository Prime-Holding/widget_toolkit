import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rx_bloc_test/rx_bloc_test.dart';
import 'package:widget_toolkit/models.dart';
import 'package:widget_toolkit_biometrics/src/base/models/biometrics_setting_message_types.dart';
import 'package:widget_toolkit_biometrics/src/base/services/biometrics_service.dart';
import 'package:widget_toolkit_biometrics/src/lib_biometrics/bloc/biometrics_bloc.dart';

import '../mocks/stubs.dart';
import 'biometrics_bloc_test.mocks.dart';

@GenerateMocks([
  BiometricsService,
])
void main() {
  late BiometricsService biometricAuthenticationService;

  void defineWhen({bool areBiometricsEnabled = false}) {
    when(biometricAuthenticationService.enableBiometrics(
            Stubs.positive, Stubs.emptyString))
        .thenAnswer((_) async {
      await Future.delayed(const Duration(milliseconds: 600));
      return Future.value(Stubs.enabledSuccess);
    });
    when(biometricAuthenticationService.enableBiometrics(
            Stubs.positive, Stubs.localizedMessage))
        .thenAnswer((_) async {
      await Future.delayed(const Duration(milliseconds: 600));
      return Future.value(Stubs.enabledSuccess);
    });
    when(biometricAuthenticationService.enableBiometrics(
            Stubs.negative, Stubs.localizedMessage))
        .thenAnswer((_) async {
      await Future.delayed(const Duration(milliseconds: 600));
      return Future.value(Stubs.disabledSuccess);
    });
    if (areBiometricsEnabled) {
      when(biometricAuthenticationService.areBiometricsEnabled())
          .thenAnswer((_) async => Future.value(Stubs.positive));
    } else {
      when(biometricAuthenticationService.areBiometricsEnabled())
          .thenAnswer((_) async => throw ErrorModel());
    }
  }

  BiometricsBloc biometricsBloc() => BiometricsBloc(
        biometricAuthenticationService,
      );
  setUp(() {
    biometricAuthenticationService = MockBiometricsService();
  });

  group('test biometrics_bloc_dart state isLoading', () {
    rxBlocTest<BiometricsBlocType, bool>(
        'test biometrics_bloc_dart state isLoading',
        build: () async {
          defineWhen();
          return biometricsBloc();
        },
        act: (bloc) async {
          bloc.states.biometricsDialog.listen((event) {});
          bloc.events.setBiometrics(Stubs.positive, Stubs.emptyString);
        },
        state: (bloc) => bloc.states.isLoading,
        expect: [false, true, false]);
  });

  group('test biometrics_bloc_dart state biometricsDialog', () {
    rxBlocTest<BiometricsBlocType, BiometricsSettingMessageType?>(
        'test biometrics_bloc_dart state biometricsDialog',
        build: () async {
          defineWhen();
          return biometricsBloc();
        },
        act: (bloc) async {
          bloc.events.setBiometrics(Stubs.positive, Stubs.localizedMessage);
        },
        state: (bloc) => bloc.states.biometricsDialog,
        expect: [Stubs.enabledSuccess]);

    rxBlocTest<BiometricsBlocType, BiometricsSettingMessageType?>(
        'test biometrics_bloc_dart state biometricsDialog',
        build: () async {
          defineWhen();
          return biometricsBloc();
        },
        act: (bloc) async {
          bloc.events.setBiometrics(Stubs.negative, Stubs.localizedMessage);
        },
        state: (bloc) => bloc.states.biometricsDialog,
        expect: [Stubs.disabledSuccess]);
  });

  group('test biometrics_bloc_dart state areBiometricsEnabled', () {
    rxBlocTest<BiometricsBlocType, bool>(
        'test biometrics_bloc_dart state areBiometricsEnabled',
        build: () async {
          defineWhen();
          return biometricsBloc();
        },
        act: (bloc) async {
          bloc.events.setBiometrics(Stubs.positive, Stubs.localizedMessage);
        },
        state: (bloc) => bloc.states.areBiometricsEnabled,
        expect: [true]);

    rxBlocTest<BiometricsBlocType, bool>(
        'test biometrics_bloc_dart state areBiometricsEnabled',
        build: () async {
          defineWhen();
          return biometricsBloc();
        },
        act: (bloc) async {
          bloc.events.setBiometrics(Stubs.negative, Stubs.localizedMessage);
        },
        state: (bloc) => bloc.states.areBiometricsEnabled,
        expect: [false]);

    rxBlocTest<BiometricsBlocType, bool>(
        'test biometrics_bloc_dart state areBiometricsEnabled',
        build: () async {
          defineWhen(areBiometricsEnabled: Stubs.positive);
          return biometricsBloc();
        },
        act: (bloc) async {
          await Future.delayed(const Duration(milliseconds: 300));
          bloc.events.setBiometrics(Stubs.negative, Stubs.localizedMessage);
        },
        state: (bloc) => bloc.states.areBiometricsEnabled,
        expect: [true, false]);
  });
}
