import 'package:widget_toolkit_pin/widget_toolkit_pin.dart';

class PinCodeServiceMock implements PinCodeService {
  PinCodeServiceMock({required this.pinCode});

  String? pinCode;

  @override
  Future<bool> isPinCodeInSecureStorage() async {
    if (pinCode == null) {
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Future<String> encryptPinCode(String pinCode) async {
    pinCode = pinCode;
    return Future.value(pinCode);
  }

  @override
  Future<int> getPinLength() async => Future.value(3);

  @override
  Future<bool> verifyPinCode(String pinCode) {
    if (pinCode == '123456') {
      return Future.value(true);
    }
    return Future.value(false);
  }

  @override
  Future<String?> getPinCode() async {
    if (pinCode == null) {
      return Future.value(null);
    }
    return Future.value(pinCode);
  }
}
