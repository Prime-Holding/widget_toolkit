abstract class PinCodeService {
  /// Reads from device internal storage and returns the stored pin code to the bloc
  Future<bool> isPinCodeInSecureStorage();

  /// Receives the pinCode from user input. Returns whether it was verified by
  /// the server
  Future<bool> verifyPinCode(String pinCode);

  /// Returns the correct length from the backend
  Future<int> getPinLength();

  /// Encrypts the string and stores it in the device secure storage. It has a
  /// add a default implementation to return what is the input. Returns the
  /// encrypted pinCode from the device secure storage.
  Future<String> encryptPinCode(String pinCode) => Future.value(pinCode);
}
