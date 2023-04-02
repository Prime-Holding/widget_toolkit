import 'package:widget_toolkit_qr/widget_toolkit_qr.dart';

class QrValidationServiceMock extends QrValidationService<String> {
  @override
  Future<String> validateQrCode(String qrCode) async => qrCode;
}
