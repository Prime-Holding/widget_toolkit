import 'package:widget_toolkit_pin/src/lib_pin_code_with_biometrics/data_source/biometrics_disabled_local_data_source.dart';

class BiometricsLocalDataSourceMock implements BiometricsDisabledLocalDataSource {
  BiometricsLocalDataSourceMock({this.areEnabled = true});

  bool areEnabled;

  @override
  Future<bool> areBiometricsEnabled() async => areEnabled;

  @override
  Future<void> setBiometricsEnabled(bool enable) async => areEnabled = enable;
}
