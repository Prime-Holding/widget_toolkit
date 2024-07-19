abstract class PinCodeService {
  /// Reads from device internal storage and
  /// returns the stored pin code to the bloc
  Future<bool> isPinCodeInSecureStorage();

  /// Receives the encrypted pinCode from user input.
  /// Returns the value verified by the server
  Future<dynamic> verifyPinCode(String pinCode);

  /// Returns the correct length from the backend,
  /// the length should be less than 10 digits
  Future<int> getPinLength();

  /// Encrypts the string and stores it in the device secure storage. It has a
  /// add a default implementation to return what is the input. Returns the
  /// encrypted pinCode from the device secure storage.
  Future<String> encryptPinCode(String pinCode) => Future.value(pinCode);

  /// Returns the pin code or null if it is not saved in the device memory yet.
  Future<String?> getPinCode();
}
