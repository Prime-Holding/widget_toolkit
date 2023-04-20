import 'package:widget_toolkit_pin/widget_toolkit_pin.dart';

class MockPinCodeService implements PinCodeService {
  MockPinCodeService(
      {this.code, this.returnNull = false, this.throwError = false});

  final String? code;
  final bool returnNull;
  final bool throwError;

  @override
  Future<String?> getPinCode() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return throwError
        ? throw Exception('Throw Exception from the PinService')
        : returnNull
            ? null
            : code;
  }

  @override
  Future<String> encryptPinCode(String pinCode) => Future.value(pinCode);
  // Future<String> encryptPinCode(String pinCode) => Future.value(pinCode);

  @override
  Future<int> getPinLength() => Future.value(3);

  @override
  Future<bool> verifyPinCode(String pinCode) => Future.value(true);

  @override
  Future<bool> isPinCodeInSecureStorage() => Future.value(true);
}
