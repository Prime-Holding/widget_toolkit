import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rx_bloc_test/rx_bloc_test.dart';
import 'package:widget_toolkit/widget_toolkit.dart';
import 'package:widget_toolkit_qr/widget_toolkit_qr.dart';

import '../../mocks/stubs.dart';
import 'qr_scanner_bloc_test.mocks.dart';

@GenerateMocks([
  QrCodeService,
  SystemPermissionsService,
])
void main() {
  late QrCodeService qrCodeService;
  late SystemPermissionsService systemPermissionsService;

  void defineWhenQrServiceReturnsSuccessfully() {
    when(qrCodeService.checkQrCode(Stubs.qrValue))
        .thenAnswer((_) => Future.value(Stubs.qrValue));
  }

  void defineWhenQrServiceThrows() {
    when(qrCodeService.checkQrCode(Stubs.qrValue))
        .thenAnswer((_) => Future.error(Stubs.error));
  }

  void defineWhenServiceResponeCheckCameraPermission() {
    when(systemPermissionsService.checkForCameraPermissions())
        .thenAnswer((_) => Future.value(Stubs.cameraPermissionTrue));
  }

  QrScannerBloc qrScannerBloc() => QrScannerBloc(
        qrCodeService,
        systemPermissionsService,
      );

  setUp(() {
    qrCodeService = MockQrCodeService();
    systemPermissionsService = MockSystemPermissionsService();
  });

  group('test qr_scanner_bloc_dart state scannedValue', () {
    rxBlocTest<QrScannerBlocType, Object?>(
        'test qr_scanner_bloc_dart state scannedValue',
        build: () async {
          defineWhenQrServiceReturnsSuccessfully();
          defineWhenServiceResponeCheckCameraPermission();

          return qrScannerBloc();
        },
        act: (bloc) async {
          return bloc.events.checkQRCode(Stubs.qrValue);
        },
        state: (bloc) => bloc.states.scannedValue,
        expect: [Stubs.qrValue]);
  });

  group('test qr_scanner_bloc_dart state isLoading', () {
    rxBlocTest<QrScannerBlocType, bool>(
        'test qr_scanner_bloc_dart state isLoading',
        build: () async {
          defineWhenQrServiceReturnsSuccessfully();
          defineWhenServiceResponeCheckCameraPermission();

          return qrScannerBloc();
        },
        act: (bloc) async {},
        state: (bloc) => bloc.states.isLoading,
        expect: [
          false,
          false,
          true,
          false,
        ]);
  });

  group('test qr_scanner_bloc_dart state errors', () {
    rxBlocTest<QrScannerBlocType, ErrorModel?>(
        'test qr_scanner_bloc_dart state errors',
        build: () async {
          defineWhenQrServiceThrows();
          defineWhenServiceResponeCheckCameraPermission();

          return qrScannerBloc();
        },
        act: (bloc) async {
          bloc.events.checkQRCode(Stubs.qrValue);
        },
        state: (bloc) => bloc.states.errors,
        expect: [Stubs.error]);
  });

  group('test qr_scanner_bloc_dart state hasCameraPermission', () {
    rxBlocTest<QrScannerBlocType, bool>(
        'test qr_scanner_bloc_dart state hasCameraPermission',
        build: () async {
          defineWhenQrServiceReturnsSuccessfully();
          defineWhenServiceResponeCheckCameraPermission();

          return qrScannerBloc();
        },
        act: (bloc) async {},
        state: (bloc) => bloc.states.hasCameraPermission,
        expect: [Stubs.cameraPermissionTrue]);
  });
}
