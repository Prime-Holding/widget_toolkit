import 'package:widget_toolkit_pin/widget_toolkit_pin.dart';

class MockPinCodeService implements PinCodeService {
  MockPinCodeService(
      {this.code, this.returnNull = false, this.throwError = false});

  final String? code;
  final bool returnNull;
  final bool throwError;

  @override
  Future<String> encryptPinCode(String pinCode) => Future.value(pinCode);

  @override
  Future<int> getPinLength() => Future.value(3);

  @override
  Future<bool> verifyPinCode(String pinCode) => Future.value(true);

  @override
  Future<bool> isPinCodeInSecureStorage() => Future.value(true);
}
