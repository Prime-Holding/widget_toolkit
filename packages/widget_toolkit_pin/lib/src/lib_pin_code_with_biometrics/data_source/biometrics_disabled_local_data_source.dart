import 'package:widget_toolkit_biometrics/widget_toolkit_biometrics.dart';

/// A data source implementation used by default, when the biometrics
/// authentication feature is not required.
class BiometricsDisabledLocalDataSource implements BiometricsLocalDataSource {
  @override
  Future<bool> areBiometricsEnabled() async => false;

  @override
  Future<void> setBiometricsEnabled(bool enable) async => Future.value();
}
