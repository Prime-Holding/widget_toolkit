import 'package:permission_handler/permission_handler.dart';
import 'package:widget_toolkit/language_picker.dart';

import 'qr_error_model_mock.dart';

class Stubs {
  static String qrValue = 'qr';
  static bool cameraPermissionTrue = true;
  static ErrorModel error = QrErrorModelMock(customMessage: 'error');

  static PermissionStatus permissionStatusGranted = PermissionStatus.granted;
  static PermissionStatus permissionStatusPermanentlyDenied =
      PermissionStatus.permanentlyDenied;
}
