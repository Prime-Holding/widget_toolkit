import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:widget_toolkit/extensions.dart';
import 'package:widget_toolkit/models.dart';
import 'package:widget_toolkit_biometrics/widget_toolkit_biometrics.dart';

import '../models/biometrics_authentication_type.dart';
import '../services/pin_biometrics_service.dart';
import '../services/pin_code_service.dart';

part 'pin_code_bloc.rxb.g.dart';

/// A contract class containing all events of the PinCodeBloc.
abstract class PinCodeBlocEvents {
  /// Requests getting the pin code length
  void getPinLength(int? length);

  /// Checks whether the biometrics are enabled for the application
  @RxBlocEvent(type: RxBlocEventType.behaviour)
  void checkBiometricsEnabled();

  /// Requests getting the available biometrics list
  @RxBlocEvent(type: RxBlocEventType.behaviour)
  void checkAvailableBiometrics();

  /// Checks whether there is a pin code stored in the device secure storage
  @RxBlocEvent(type: RxBlocEventType.behaviour)
  void checkPinCodeInStorage();

  /// Requests biometric authentication
  void requestBiometricAuth(String localizedMessage);

  /// This event is called when the user input pin code length reached the length
  /// set for the keyLength parameter in the PinCodeKeyboard widget
  void autoSubmit(String pin);

  /// When biometrics are not enable, this event is called with enabled true to
  /// enable the biometrics, the localizedReason is the message with a reason
  /// for enabling the biometrics displayed on the screen
  void setBiometrics(bool enabled, String localizedReason);
}

/// A contract class containing all states of the PinCodeBloc.
abstract class PinCodeBlocStates {
  /// Returns true if the biometrics of the phone are enabled for usage from the app
  Stream<bool> get areBiometricsEnabled;

  /// Returns true is the pin code was verified by the API
  ConnectableStream<bool> get isPinCodeVerified;

  /// Returns list of available biometrics if the biometrics for the app are
  /// enabled, otherwise returns an empty list
  ConnectableStream<List<BiometricsAuthType>> get availableBiometrics;

  /// Returns true if the user is authenticated with biometrics
  ConnectableStream<bool> get isAuthenticatedWithBiometrics;

  /// Message to be presented when biometrics setting are updated
  Stream<BiometricsMessage?> get biometricsDialog;

  /// Returns true if there is any pin code stored in device local secure storage
  ConnectableStream<bool> get isPinCodeInSecureStorage;

  /// Returns the correct length of the pin code
  ConnectableStream<int> get pinLength;

  /// The loading state
  Stream<bool> get isLoading;

  /// The error state
  Stream<ErrorModel> get errors;
}

@RxBloc()
class PinCodeBloc extends $PinCodeBloc {
  PinCodeBloc({
    required this.biometricAuthenticationService,
    required this.pinCodeService,
    required this.enterPinWithBiometrics,
  }) {
    checkPinCodeInStorage();
    checkBiometricsEnabled();
    checkAvailableBiometrics();
    isPinCodeInSecureStorage.connect().addTo(_compositeSubscription);
    isAuthenticatedWithBiometrics.connect().addTo(_compositeSubscription);
    isPinCodeVerified.connect().addTo(_compositeSubscription);
    availableBiometrics.connect().addTo(_compositeSubscription);
    pinLength.connect().addTo(_compositeSubscription);
  }

  final PinBiometricsService biometricAuthenticationService;
  final PinCodeService pinCodeService;
  final String enterPinWithBiometrics;

  @override
  ConnectableStream<bool> _mapToIsPinCodeInSecureStorageState() =>
      _$checkPinCodeInStorageEvent
          .switchMap((value) =>
              pinCodeService.isPinCodeInSecureStorage().asResultStream())
          .setResultStateHandler(this)
          .whereSuccess()
          .publishReplay(maxSize: 1);

  @override
  Stream<bool> _mapToAreBiometricsEnabledState() =>
      _$checkBiometricsEnabledEvent
          .switchMap((value) => getAreBiometricsEnabled().asResultStream())
          .setResultStateHandler(this)
          .whereSuccess();

  Future<bool> getAreBiometricsEnabled() async {
    var isDeviceSupported =
        await biometricAuthenticationService.isDeviceSupported;
    var canCheckBiometrics =
        await biometricAuthenticationService.canCheckBiometrics;
    var biometricsEnabled =
        await biometricAuthenticationService.areBiometricsEnabled();

    var pinCode = await pinCodeService.getPinCode();

    return isDeviceSupported &&
        canCheckBiometrics &&
        biometricsEnabled &&
        pinCode != null;
  }

  @override
  ConnectableStream<List<BiometricsAuthType>>
      _mapToAvailableBiometricsState() => _$checkAvailableBiometricsEvent
          .switchMap((value) => biometricAuthenticationService
              .availableBiometrics
              .asResultStream())
          .setResultStateHandler(this)
          .whereSuccess()
          .publishReplay();

  @override
  ConnectableStream<bool> _mapToIsAuthenticatedWithBiometricsState() =>
      _$requestBiometricAuthEvent
          .switchMap(
              (value) => _biometricAuthentication(value).asResultStream())
          .setResultStateHandler(this)
          .whereSuccess()
          .publishReplay(maxSize: 1);

  Future<bool> _biometricAuthentication(String localizedReason) async {
    var success = await biometricAuthenticationService.authenticate(
        localizedReason.isEmpty ? enterPinWithBiometrics : localizedReason);

    return success;
  }

  @override
  ConnectableStream<bool> _mapToIsPinCodeVerifiedState() => _$autoSubmitEvent
      .switchMap((pinCode) => encryptAndVerify(pinCode).asResultStream())
      .setResultStateHandler(this)
      .whereSuccess()
      .publishReplay(maxSize: 1);

  Future<bool> encryptAndVerify(String pinCode) async {
    var encryptedPin = await pinCodeService.encryptPinCode(pinCode);
    var verifiedPin = await pinCodeService.verifyPinCode(encryptedPin);
    return verifiedPin;
  }

  @override
  Stream<BiometricsMessage?> _mapToBiometricsDialogState() =>
      _$setBiometricsEvent
          .switchMap((event) => biometricAuthenticationService
              .enableBiometrics(event.enabled, event.localizedReason)
              .asResultStream())
          .setResultStateHandler(this)
          .whereSuccess()
          .doOnData((event) {
        if (event == BiometricsMessage.enabled) {
          checkBiometricsEnabled();
        }
      });

  @override
  ConnectableStream<int> _mapToPinLengthState() => _$getPinLengthEvent
      .startWith(null)
      .switchMap((value) => pinCodeService.getPinLength().asResultStream())
      .setResultStateHandler(this)
      .whereSuccess()
      .publish();

  @override
  Stream<bool> _mapToIsLoadingState() => loadingState;

  @override
  Stream<ErrorModel> _mapToErrorsState() => errorState.mapToErrorModel();
}
