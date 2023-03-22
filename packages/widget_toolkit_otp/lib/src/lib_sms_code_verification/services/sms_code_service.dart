/// Service contract used to implement SMS code logic
abstract class SmsCodeService {
  /// Confirm if the entered code is equal to the last send code
  Future<dynamic> confirmPhoneCode(String code);

  /// Get user's phone number with the country code
  Future<String> getFullPhoneNumber();

  /// Edit the user's phone number and return fullPhoneNumber
  Future<String> updatePhoneNumber(String newNumber);

  /// Send a new code to the user
  Future<bool> sendConfirmationSms(String usersPhoneNumber);

  /// How long codes will be valid in seconds
  Future<int> getValidityTime(bool reset);

  /// How long resendCode button will be disabled after a code have been sent
  Future<int> getResendButtonThrottleTime(bool reset);

  /// How many characters will contain the code
  Future<int> getCodeLength();
}
