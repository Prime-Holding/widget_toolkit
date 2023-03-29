/// Local data source that store a flag if biometrics are enabled in the project
/// and can update its value
abstract class BiometricsLocalDataSource {
  /// Get the value of the flag if biometrics are enabled
  Future<bool> areBiometricsEnabled();

  /// Enable or disable the use of biometrics in the application
  Future<void> setBiometricsEnabled(bool biometrics);
}
