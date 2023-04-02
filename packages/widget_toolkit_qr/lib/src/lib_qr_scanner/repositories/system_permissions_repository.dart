import 'package:permission_handler/permission_handler.dart';

class SystemPermissionsRepository {
  SystemPermissionsRepository();

  Future<bool> checkForCameraPermissions() async {
    final permissionStatus = await requestCameraPermission();
    return permissionStatus.isGranted;
  }

  Future<PermissionStatus> requestCameraPermission() =>
      Permission.camera.request();

  Future<bool> openPhoneAppSettings() => openAppSettings();
}
