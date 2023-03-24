// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'qr_scanner_bloc.dart';

/// Used as a contractor for the bloc, events and states classes
/// {@nodoc}
abstract class QrScannerBlocType<T> extends RxBlocTypeBase {
  QrScannerBlocEvents get events;
  QrScannerBlocStates<T> get states;
}

/// [$QrScannerBloc<T>] extended by the [QrScannerBloc<T>]
/// {@nodoc}
abstract class $QrScannerBloc<T> extends RxBlocBase
    implements
        QrScannerBlocEvents,
        QrScannerBlocStates<T>,
        QrScannerBlocType<T> {
  final _compositeSubscription = CompositeSubscription();

  /// Тhe [Subject] where events sink to by calling [validateQRCode]
  final _$validateQRCodeEvent = PublishSubject<String>();

  /// Тhe [Subject] where events sink to by calling [requestCameraPermission]
  final _$requestCameraPermissionEvent = PublishSubject<void>();

  /// The state of [isLoading] implemented in [_mapToIsLoadingState]
  late final Stream<bool> _isLoadingState = _mapToIsLoadingState();

  /// The state of [scannedValue] implemented in [_mapToScannedValueState]
  late final ConnectableStream<T?> _scannedValueState =
      _mapToScannedValueState();

  /// The state of [errors] implemented in [_mapToErrorsState]
  late final Stream<ErrorModel> _errorsState = _mapToErrorsState();

  /// The state of [hasCameraPermission] implemented in
  /// [_mapToHasCameraPermissionState]
  late final ConnectableStream<bool> _hasCameraPermissionState =
      _mapToHasCameraPermissionState();

  @override
  void validateQRCode(String qrCode) => _$validateQRCodeEvent.add(qrCode);

  @override
  void requestCameraPermission() => _$requestCameraPermissionEvent.add(null);

  @override
  Stream<bool> get isLoading => _isLoadingState;

  @override
  ConnectableStream<T?> get scannedValue => _scannedValueState;

  @override
  Stream<ErrorModel> get errors => _errorsState;

  @override
  ConnectableStream<bool> get hasCameraPermission => _hasCameraPermissionState;

  Stream<bool> _mapToIsLoadingState();

  ConnectableStream<T?> _mapToScannedValueState();

  Stream<ErrorModel> _mapToErrorsState();

  ConnectableStream<bool> _mapToHasCameraPermissionState();

  @override
  QrScannerBlocEvents get events => this;

  @override
  QrScannerBlocStates<T> get states => this;

  @override
  void dispose() {
    _$validateQRCodeEvent.close();
    _$requestCameraPermissionEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}
