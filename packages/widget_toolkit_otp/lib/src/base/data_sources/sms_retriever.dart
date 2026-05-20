import 'package:pinput/pinput.dart';
import 'package:smart_auth/smart_auth.dart';

/// Local implementation of a sms retriever to facilitate the retrieval of sms
/// codes for the SmsCodeField autofill feature.
class SmsRetrieverImpl implements SmsRetriever {
  const SmsRetrieverImpl(
    this.smartAuth, {
    this.senderPhoneNumber,
    this.useUserConsentAPI = false,
    this.checkForMultipleSms = false,
  });

  /// The [SmartAuth] instance to use for SMS retrieval
  final SmartAuth smartAuth;

  /// The phone number of the sender (if any)
  final String? senderPhoneNumber;

  /// Flag indicating wheter to use the user consent API.
  ///
  /// For more information, see https://developers.google.com/identity/sms-retriever/user-consent/overview
  final bool useUserConsentAPI;

  /// Should the service listen to multiple sms messages
  final bool checkForMultipleSms;

  @override
  Future<void> dispose() async {}

  @override
  Future<String?> getSmsCode() async {
    final res = await (useUserConsentAPI
        ? smartAuth.getSmsWithUserConsentApi(
            senderPhoneNumber: senderPhoneNumber,
          )
        : smartAuth.getSmsWithRetrieverApi());
    return res.data?.code;
  }

  @override
  bool get listenForMultipleSms => checkForMultipleSms;
}
