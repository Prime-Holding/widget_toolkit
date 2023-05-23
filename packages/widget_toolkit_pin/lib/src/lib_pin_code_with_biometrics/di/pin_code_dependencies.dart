import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:widget_toolkit_biometrics/widget_toolkit_biometrics.dart';

import '../../../widget_toolkit_pin.dart';
import '../data_source/pin_biometrics_auth_data_source.dart';
import '../data_source/pin_biometrics_local_data_source.dart';
import '../repositories/pin_biometrics_repository.dart';
import '../services/pin_biometrics_service.dart';

class PinCodeDependencies {
  PinCodeDependencies._(
    this.pinCodeService,
    this.biometricsLocalDataSource,
    this.localizedReason,
  );

  factory PinCodeDependencies.from({
    required PinCodeService pinCodeService,
    required BiometricsLocalDataSource biometricsLocalDataSource,
    required String localizedReason,
  }) =>
      PinCodeDependencies._(
        pinCodeService,
        biometricsLocalDataSource,
        localizedReason,
      );

  final String localizedReason;
  final PinCodeService pinCodeService;
  final BiometricsLocalDataSource biometricsLocalDataSource;

  late List<SingleChildWidget> providers = [
    ..._localAuthentication,
    ..._dataSources,
    ..._repositories,
    ..._services,
    ..._blocs
  ];

  late final List<SingleChildWidget> _localAuthentication = [
    Provider<LocalAuthentication>(
      create: (context) => LocalAuthentication(),
    ),
  ];

  late final List<SingleChildWidget> _dataSources = [
    Provider<PinBiometricsLocalDataSource>(
      create: (context) => PinBiometricsLocalDataSource(),
    ),
    Provider<PinBiometricsAuthDataSource>(
      create: (context) => PinBiometricsAuthDataSource(
        localAuthentication: context.read<LocalAuthentication>(),
      ),
    ),
  ];

  late final List<SingleChildWidget> _repositories = [
    Provider<PinBiometricsRepository>(
      create: (context) => PinBiometricsRepository(
        context.read<PinBiometricsAuthDataSource>(),
        biometricsLocalDataSource,
      ),
    ),
  ];

  late final List<SingleChildWidget> _services = [
    Provider<PinBiometricsService>(
      create: (context) => PinBiometricsService(
        context.read<PinBiometricsRepository>(),
      ),
    ),
  ];
  late final List<SingleChildWidget> _blocs = [
    Provider<PinCodeBlocType>(
      create: (context) => PinCodeBloc(
        biometricAuthenticationService: context.read<PinBiometricsService>(),
        pinCodeService: pinCodeService,
        enterPinWithBiometrics: localizedReason,
      ),
    ),
  ];
}
