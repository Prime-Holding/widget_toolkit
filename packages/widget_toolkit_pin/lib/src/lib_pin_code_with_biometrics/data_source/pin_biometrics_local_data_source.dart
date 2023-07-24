import 'package:widget_toolkit_biometrics/widget_toolkit_biometrics.dart';

class PinBiometricsLocalDataSource implements BiometricsLocalDataSource {
  @override
  Future<bool> areBiometricsEnabled() async => false;

  @override
  Future<void> setBiometricsEnabled(bool enable) async => Future.value();
}
