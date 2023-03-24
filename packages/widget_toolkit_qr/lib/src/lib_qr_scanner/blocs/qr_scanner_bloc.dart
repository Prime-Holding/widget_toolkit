import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:widget_toolkit/extensions.dart';
import 'package:widget_toolkit/models.dart';

import '../services/qr_validation_service.dart';
import '../services/system_permissions_service.dart';

part 'qr_scanner_bloc.rxb_g.dart';

/// A contract class containing all events of the QrScannerBloC.
abstract class QrScannerBlocEvents {
  /// The event receives the scanned qr code value as string
  void validateQRCode(String qrCode);

  /// Requests access to the camera of the device
  void requestCameraPermission();
}

/// A contract class containing all states of the QrScannerBloc.
abstract class QrScannerBlocStates<T> {
  /// The loading state
  Stream<bool> get isLoading;

  /// Returns the scanned value, if it was scanned successfully
  ConnectableStream<T?> get scannedValue;

  /// Returns the errors
  Stream<ErrorModel> get errors;

  /// Returns true if the app has access to the device's camera or false, if it
  /// does not
  ConnectableStream<bool> get hasCameraPermission;
}

@RxBloc()
class QrScannerBloc<T> extends $QrScannerBloc<T> {
  QrScannerBloc(
    this._qrValidationService,
    this._systemPermissionsService,
  ) {
    scannedValue.connect().addTo(_compositeSubscription);
    hasCameraPermission.connect().addTo(_compositeSubscription);
  }

  final QrValidationService<T> _qrValidationService;

  final SystemPermissionsService _systemPermissionsService;

  @override
  Stream<ErrorModel> _mapToErrorsState() => errorState.mapToErrorModel();

  @override
  Stream<bool> _mapToIsLoadingState() => loadingState.startWith(false);

  @override
  ConnectableStream<T?> _mapToScannedValueState() => _$validateQRCodeEvent
      .throttleTime(const Duration(seconds: 1))
      .exhaustMap(
        (qrCode) =>
            _qrValidationService.validateQrCode(qrCode).asResultStream(),
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
