import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../widget_toolkit_pin.dart';
import '../data_source/pin_biometrics_auth_data_source.dart';
import '../data_source/pin_biometrics_local_data_source.dart';
import '../repositories/pin_biometrics_repository.dart';
import '../services/pin_biometrics_service.dart';

class PinCodeDependencies {
  PinCodeDependencies._(
    this.pinCodeService,
    this.translatableStrings,
  );

  factory PinCodeDependencies.from({
    required PinCodeService pinCodeService,
    PinLocalizedStrings? translatableStrings,
  }) =>
      PinCodeDependencies._(
        pinCodeService,
        translatableStrings,
      );

  final PinLocalizedStrings? translatableStrings;
  final PinCodeService pinCodeService;

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
        context.read<PinBiometricsLocalDataSource>(),
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
          localizedBiometricsMessage:
              translatableStrings?.enterPinWithBiometrics ??
                  context.getPinLocalizedStrings.enterPinWithBiometrics),
    ),
  ];
}








