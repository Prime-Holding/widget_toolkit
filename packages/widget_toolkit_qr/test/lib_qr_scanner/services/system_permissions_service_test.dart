import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:widget_toolkit_qr/src/lib_qr_scanner/repositories/system_permissions_repository.dart';
import 'package:widget_toolkit_qr/src/lib_qr_scanner/services/system_permissions_service.dart';

import '../../mocks/stubs.dart';
import 'system_permissions_service_test.mocks.dart';

@GenerateMocks([SystemPermissionsRepository])
void main() {
  late MockSystemPermissionsRepository permissionsRepoMock;

  late SystemPermissionsService systemPermissionsService;

  setUp(() {
    permissionsRepoMock = MockSystemPermissionsRepository();

    when(permissionsRepoMock.openPhoneAppSettings())
        .thenAnswer((_) async => true);

    systemPermissionsService = SystemPermissionsService(permissionsRepoMock);
  });

  group('checkForCameraPermissions tests', () {
    test('permissions granted', () async {
      when(permissionsRepoMock.requestCameraPermission())
          .thenAnswer((_) async => Stubs.permissionStatusGranted);

      when(permissionsRepoMock.checkForCameraPermissions())
          .thenAnswer((_) async => true);

      expect(await systemPermissionsService.checkForCameraPermissions(), true);
    });
  });

  group('checkForCameraPermissions tests', () {
    test('permissions permanently denied', () async {
      when(permissionsRepoMock.requestCameraPermission())
          .thenAnswer((_) async => Stubs.permissionStatusPermanentlyDenied);

      when(permissionsRepoMock.checkForCameraPermissions())
          .thenAnswer((_) async => false);

      expect(await systemPermissionsService.requestCameraPermission(), false);
    });
  });
}
