class SystemPermissionsServiceMock {
  SystemPermissionsServiceMock();

  /// Checks if the app has permission to access the camera of the device
  Future<bool> checkForCameraPermissions() async => true;

  /// Requests permission to the camera of the device
  Future<bool> requestCameraPermission() async => true;
}
