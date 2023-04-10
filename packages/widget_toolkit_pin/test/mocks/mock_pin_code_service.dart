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
}
