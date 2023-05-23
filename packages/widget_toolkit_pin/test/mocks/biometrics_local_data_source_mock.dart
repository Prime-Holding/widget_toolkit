import 'package:widget_toolkit_pin/src/lib_pin_code_with_biometrics/data_source/pin_biometrics_local_data_source.dart';

class BiometricsLocalDataSourceMock implements PinBiometricsLocalDataSource {
  BiometricsLocalDataSourceMock({this.areEnabled = true});

  bool areEnabled;

  @override
  Future<bool> areBiometricsEnabled() async => areEnabled;

  @override
  Future<void> setBiometricsEnabled(bool enable) async => areEnabled = enable;
}
