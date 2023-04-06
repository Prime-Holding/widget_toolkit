abstract class PinCodeService {
  /// Here you can send request to your server to get the proper code. It will
  /// be executed when biometrics are enabled and biometric authentication have
  /// past successfully. Then instead of waiting for the user to enter a code,
  /// that code will be automatically requested from this function.
  Future<String?> getPinCode();
}
