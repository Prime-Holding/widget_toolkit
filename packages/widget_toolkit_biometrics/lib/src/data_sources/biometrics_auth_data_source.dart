/// [BiometricsAuthDataSource] is a wrapper of the plugin [local_auth] and
/// expose its properties
abstract class BiometricsAuthDataSource {
  /// Returns true if the device is capable of checking biometrics.
  Future<bool> get canCheckBiometrics;

  /// Returns true if the device is capable of checking biometrics or is able to
  /// fail over to device credentials.
  Future<bool> get isDeviceSupported;

  /// Authenticates the user with biometrics available on the device while also
  /// allowing the user to use device authentication - pin, pattern, passcode.
  ///
  /// Returns true if the user successfully authenticated, false otherwise.
  ///
  /// [localizedReason] is the message to show to the user while prompting them
  /// for authentication. This is typically along the lines of: 'Authenticate
  /// to access MyApp.'. This must not be empty.
  ///
  /// Throws a [PlatformException] if there were technical problems with local
  /// authentication (e.g. lack of relevant hardware). This might throw
  /// [PlatformException] with error code [otherOperatingSystem] on the iOS
  /// simulator.
  Future<bool> authenticate(String localizedReason);
}
