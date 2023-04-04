import 'package:permission_handler/permission_handler.dart';

import '../repositories/system_permissions_repository.dart';

/// Do all the work regarding checking and requesting the camera permissions.
/// It uses [permission_handler] package under the hood.
///
/// [checkForCameraPermissions] - checks if the app has permissions ot use the camera
///
/// [requestCameraPermission] - the method is used for requesting the usage of the camera
class SystemPermissionsService {
  SystemPermissionsService(this._systemPermissionsRepository);

  final SystemPermissionsRepository _systemPermissionsRepository;

  /// Checks if the app has permission to access the camera of the device
  Future<bool> checkForCameraPermissions() async =>
      await _systemPermissionsRepository.checkForCameraPermissions();

  /// Requests permission to the camera of the device
  Future<bool> requestCameraPermission() async {
    PermissionStatus status =
        await _systemPermissionsRepository.requestCameraPermission();
    if (status.isPermanentlyDenied) {
      await _systemPermissionsRepository.openPhoneAppSettings();

      status = await _systemPermissionsRepository.requestCameraPermission();
    }

    if (status.isGranted) return true;
    return false;
  }
}
