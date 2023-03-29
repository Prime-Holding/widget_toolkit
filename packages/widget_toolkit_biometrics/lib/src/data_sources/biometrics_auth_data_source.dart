import 'package:local_auth/local_auth.dart';

/// [BiometricsAuthDataSource] is a wrapper of the plugin [local_auth] and
/// expose its properties
class BiometricsAuthDataSource {
  final LocalAuthentication localAuthentication;

  ///You must pass in a [LocalAuthentication] instance to be wrapped
  BiometricsAuthDataSource({required this.localAuthentication});

  /// Returns true if device is capable of checking biometrics.
  Future<bool> get canCheckBiometrics => localAuthentication.canCheckBiometrics;

  /// Returns true if device is capable of checking biometrics or is able to
  /// fail over to device credentials.
  Future<bool> get isDeviceSupported => localAuthentication.isDeviceSupported();

  /// Authenticates the user with biometrics available on the device while also
  /// allowing the user to use device authentication - pin, pattern, passcode.
  ///
  /// Returns true if the user successfully authenticated, false otherwise.
  ///
  /// [localizedReason] is the message to show to user while prompting them
  /// for authentication. This is typically along the lines of: 'Authenticate
  /// to access MyApp.'. This must not be empty.
  ///
  /// Throws a [PlatformException] if there were technical problems with local
  /// authentication (e.g. lack of relevant hardware). This might throw
  /// [PlatformException] with error code [otherOperatingSystem] on the iOS
  /// simulator.
  Future<bool> authenticate(String localizedReason) =>
      localAuthentication.authenticate(
        localizedReason: localizedReason,
        options: const AuthenticationOptions(
          biometricOnly: true,
          useErrorDialogs: false,
        ),
      );
}
