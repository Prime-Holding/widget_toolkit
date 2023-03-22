/// Extend this class and provide implementation of the method, where the qr code
/// value is received as parameter
abstract class QrCodeService {
  /// Receives the scanned qr code as a string and returns an Object.
  /// This method can be overridden and being used to make a request to a
  /// backend for some server side validation of the scanned value
  Future<Object> checkQrCode(String qrCode);
}
