import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:widget_toolkit/extensions.dart';
import 'package:widget_toolkit/models.dart';

import '../services/qr_code_service.dart';
import '../services/system_permissions_service.dart';

part 'qr_scanner_bloc.rxb.g.dart';

/// A contract class containing all events of the QrScannerBloC.
abstract class QrScannerBlocEvents {
  /// The event receives the scanned qr code value as string
  void checkQRCode(String qrCode);

  /// Requests access to the camera of the device
  void requestCameraPermission();
}

/// A contract class containing all states of the QrScannerBloc.
abstract class QrScannerBlocStates {
  /// The loading state
  Stream<bool> get isLoading;

  /// Returns the scanned value, if it was scanned successfully
  ConnectableStream<Object?> get scannedValue;

  /// Returns the errors
  Stream<ErrorModel?> get errors;

  /// Returns true if the app has access to the device's camera or false, if it
  /// does not
  ConnectableStream<bool> get hasCameraPermission;
}

@RxBloc()
class QrScannerBloc extends $QrScannerBloc {
  QrScannerBloc(
    this._qrCodeService,
    this._systemPermissionsService,
  ) {
    scannedValue.connect().addTo(_compositeSubscription);
    hasCameraPermission.connect().addTo(_compositeSubscription);
  }

  final QrCodeService _qrCodeService;

  final SystemPermissionsService _systemPermissionsService;

  @override
  Stream<ErrorModel?> _mapToErrorsState() => errorState.mapToErrorModel();

  @override
  Stream<bool> _mapToIsLoadingState() => loadingState.startWith(false);

  @override
  ConnectableStream<Object?> _mapToScannedValueState() => _$checkQRCodeEvent
      .throttleTime(const Duration(seconds: 1))
      .exhaustMap(
        (qrCode) => _qrCodeService.checkQrCode(qrCode).asResultStream(),
      )
      .setResultStateHandler(this)
      .whereSuccess()
      .publish();

  @override
  ConnectableStream<bool> _mapToHasCameraPermissionState() => Rx.merge([
        _systemPermissionsService.checkForCameraPermissions().asResultStream(),
        _$requestCameraPermissionEvent.switchMap((value) =>
            _systemPermissionsService
                .requestCameraPermission()
                .asResultStream()),
      ]).setResultStateHandler(this).whereSuccess().publish();
}
