import 'package:permission_handler/permission_handler.dart';

///TODO: add documentation!
class SystemPermissionsService {
  SystemPermissionsService();

  /// Checks if the app has permission to access the camera of the device
  Future<bool> checkForCameraPermissions() async {
    final permissionStatus = await Permission.camera.request();

    return permissionStatus.isGranted;
  }

  /// Requests permission to the camera of the device
  Future<bool> requestCameraPermission() async {
    PermissionStatus status = await Permission.camera.request();
    if (status.isPermanentlyDenied) {
      await openAppSettings();
    }

    await Permission.camera.request();
    if (status.isGranted) return true;
    return false;
  }
}
