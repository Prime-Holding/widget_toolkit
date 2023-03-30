import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:widget_toolkit_biometrics/src/repositories/biometrics_repository.dart';
import 'package:widget_toolkit_biometrics/src/services/biometrics_service.dart';

import '../mocks/stubs.dart';
import 'biometrics_service_test.mocks.dart';

@GenerateMocks([
  BiometricsRepository,
])
void main() {
  late BiometricsRepository biometricsRepository;

  void defineDefaultsWhen() {
    when(biometricsRepository.isDeviceSupported)
        .thenAnswer((realInvocation) => Future.value(true));

    when(biometricsRepository.canCheckBiometrics)
        .thenAnswer((realInvocation) => Future.value(true));

    when(biometricsRepository.areBiometricsEnabled())
        .thenAnswer((realInvocation) => Future.value(false));

    when(biometricsRepository.setBiometricsEnabled(Stubs.positive))
        .thenAnswer((realInvocation) => Future.value());

    when(biometricsRepository.setBiometricsEnabled(Stubs.negative))
        .thenAnswer((realInvocation) => Future.value());

    when(biometricsRepository.authenticate(Stubs.localizedMessage))
        .thenAnswer((realInvocation) => Future.value(Stubs.positive));
  }

  setUp(() {
    biometricsRepository = MockBiometricsRepository();
  });

  group('Test BiometricsService.enableBiometrics()', () {
    test('Test device not supported', () async {
      defineDefaultsWhen();

      when(biometricsRepository.isDeviceSupported)
          .thenAnswer((realInvocation) => Future.value(false));

      final service = BiometricsService(biometricsRepository);

      expect(service.enableBiometrics(Stubs.positive, Stubs.localizedMessage),
          completion(equals(Stubs.notSupported)));
    });

    test('Test device doesn\'t support biometrics', () async {
      defineDefaultsWhen();

      when(biometricsRepository.canCheckBiometrics)
          .thenAnswer((realInvocation) => Future.value(false));

      final service = BiometricsService(biometricsRepository);

      expect(service.enableBiometrics(Stubs.positive, Stubs.localizedMessage),
          completion(equals(Stubs.notSupported)));
    });

    test('Test user hasn\'t setup biometrics', () async {
      defineDefaultsWhen();

      when(biometricsRepository.authenticate(Stubs.localizedMessage))
          .thenAnswer((realInvocation) => throw PlatformException(code: ''));

      final service = BiometricsService(biometricsRepository);

      expect(service.enableBiometrics(Stubs.positive, Stubs.localizedMessage),
          completion(equals(Stubs.notSetup)));
    });

    test('Test enable biometrics success', () async {
      defineDefaultsWhen();

      final service = BiometricsService(biometricsRepository);

      expect(service.enableBiometrics(Stubs.positive, Stubs.localizedMessage),
          completion(equals(Stubs.enabledSuccess)));
    });

    test('Test disable biometrics success', () async {
      defineDefaultsWhen();

      final service = BiometricsService(biometricsRepository);

      expect(service.enableBiometrics(Stubs.negative, Stubs.localizedMessage),
          completion(equals(Stubs.disabledSuccess)));
    });
  });
}
