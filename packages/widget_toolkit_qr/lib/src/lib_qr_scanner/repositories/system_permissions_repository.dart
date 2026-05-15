import 'package:app_settings/app_settings.dart';
import 'package:permission_handler/permission_handler.dart';

/// Bridges permission_handler and app_settings so [QrScannerBloc] can query camera status,
/// trigger OS prompts, and deep-link users into system settings when manual intervention is needed.
class SystemPermissionsRepository {
  SystemPermissionsRepository();

  /// Requests camera access once and reports whether the handler considers it granted after the prompt completes.
  Future<bool> checkForCameraPermissions() async {
    final permissionStatus = await requestCameraPermission();
    return permissionStatus.isGranted;
  }

  /// Wraps Permission.camera.request so bloc listeners can merge prompt outcomes into permission streams.
  Future<PermissionStatus> requestCameraPermission() =>
      Permission.camera.request();

  /// Opens the platform settings application so users can toggle camera access outside the in-app sheet flow.
  Future<void> openPhoneAppSettings() => AppSettings.openAppSettings();
}
