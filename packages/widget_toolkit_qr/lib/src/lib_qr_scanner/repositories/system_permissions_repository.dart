import 'package:app_settings/app_settings.dart';
import 'package:permission_handler/permission_handler.dart';

class SystemPermissionsRepository {
  SystemPermissionsRepository();

  Future<bool> checkForCameraPermissions() async {
    final permissionStatus = await requestCameraPermission();
    return permissionStatus.isGranted;
  }

  Future<PermissionStatus> requestCameraPermission() =>
      Permission.camera.request();

  Future<void> openPhoneAppSettings() => AppSettings.openAppSettings();
}
