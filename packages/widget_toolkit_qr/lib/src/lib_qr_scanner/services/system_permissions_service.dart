/// Extend this service and provide implementation to its method, which request
/// for camera permission of the device and check if the app has permission to
/// camera.
abstract class SystemPermissionsService {
  /// Checks if the app has permission to access the camera of the device
  Future<bool> checkForCameraPermissions();

  /// Requests permission to the camera of the device
  Future<bool> requestCameraPermission();
}
