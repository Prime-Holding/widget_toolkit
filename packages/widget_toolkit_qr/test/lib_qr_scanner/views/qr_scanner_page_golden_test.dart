import 'package:mockito/annotations.dart';

import '../../helpers/golden_helper.dart';
import '../../helpers/models/scenario.dart';
import '../../mocks/qr_error_model_mock.dart';
import '../factory/qr_scanner_page_factory.dart';

@GenerateMocks([])
void main() {
  runGoldenTests([
    generateDeviceBuilder(
        widget: qrScannerPageFactory(
          isLoading: false,
          scannedValue: 'SCANNED VALUE',
          errors: null,
          hasCameraPermission: true,
        ), //example:  Stubs.success
        scenario: Scenario(name: 'qr_scanner_page_success')),
    generateDeviceBuilder(
        widget: qrScannerPageFactory(
          isLoading: true,
          scannedValue: null,
          errors: null,
          hasCameraPermission: true,
        ), //loading
        scenario: Scenario(name: 'qr_scanner_page_loading')),
    generateDeviceBuilder(
        widget: qrScannerPageFactory(
          isLoading: false,
          scannedValue: null,
          errors: QrErrorModelMock(customMessage: 'QR ERROR'),
          hasCameraPermission: true,
        ),
        scenario: Scenario(name: 'qr_scanner_page_error'))
  ]);
}
