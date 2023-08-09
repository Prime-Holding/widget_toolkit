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
  ///Triggered when user tap on the digit
  void addDigit(String digit);

  ///Triggered when user delete digit
  void deleteDigit();

  ///Triggered when user tap on biometrics button
  void biometricsButtonPressed(String reason);

  /// Requests getting the pin code length
  void getPinLength(int? length);

  /// Checks whether the biometrics are enabled for the application
  @RxBlocEvent(type: RxBlocEventType.behaviour)
  void checkBiometricsEnabled();

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
  ///Indicating how much dots to present
  Stream<int> get digitsCount;

  ///Indicating the biometrics button must be presented
  ConnectableStream<bool> get showBiometricsButton;

  ///Emits when biometrics must be presented to the user
  ConnectableStream<void> get requestBiometricsAuthentication;

  ///Emits when user successfully authenticate (pin/biometrics)
  ConnectableStream<void> get authenticated;

  Stream<String> get pin;

  /// Returns true if the biometrics of the phone are enabled for usage from the app
  Stream<bool> get areBiometricsEnabled;

  /// Returns true is the pin code was verified by the API
  ConnectableStream<bool> get isPinCodeVerified;

  /// Returns list of available biometrics if the biometrics for the app are
  /// enabled, otherwise returns an empty list
  ConnectableStream<List<BiometricsAuthType>> get availableBiometrics;

  /// Returns true if the user is authenticated with biometrics
  // ConnectableStream<bool> get isAuthenticatedWithBiometrics;

  /// Message to be presented when biometrics setting are updated
  Stream<BiometricsMessage?> get biometricsDialog;

  /// Returns true if there is any pin code stored in device local secure storage
  ConnectableStream<bool> get isPinCodeInSecureStorage;

  /// Returns the correct length of the pin code
  // ConnectableStream<int> get pinLength;

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
    isPinCodeInSecureStorage.connect().addTo(_compositeSubscription);
    authenticated.connect().addTo(_compositeSubscription);
    isPinCodeVerified.connect().addTo(_compositeSubscription);
    availableBiometrics.connect().addTo(_compositeSubscription);
    showBiometricsButton.connect().addTo(_compositeSubscription);
    requestBiometricsAuthentication.connect().addTo(_compositeSubscription);
  }

  final PinBiometricsService biometricAuthenticationService;
  final PinCodeService pinCodeService;
  final String enterPinWithBiometrics;

  String pinCode = '';

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
    bool isDeviceSupported =
        await biometricAuthenticationService.isDeviceSupported;
    bool canCheckBiometrics =
        await biometricAuthenticationService.canCheckBiometrics;
    bool biometricsEnabled =
        await biometricAuthenticationService.areBiometricsEnabled();

    String? pinCode = await pinCodeService.getPinCode();
    return isDeviceSupported &&
        canCheckBiometrics &&
        biometricsEnabled &&
        pinCode != null;
  }

  @override
  ConnectableStream<List<BiometricsAuthType>>
      _mapToAvailableBiometricsState() => _$checkBiometricsEnabledEvent
          .switchMap((value) => biometricAuthenticationService
              .availableBiometrics
              .asResultStream())
          .setResultStateHandler(this)
          .whereSuccess()
          .publishReplay();

  //
  // @override
  // ConnectableStream<bool> _mapToIsAuthenticatedWithBiometricsState() =>
  //     _$requestBiometricAuthEvent
  //         .switchMap(
  //             (value) => _biometricAuthentication(value).asResultStream())
  //         .setResultStateHandler(this)
  //         .whereSuccess()
  //         .publishReplay(maxSize: 1);
  //
  // Future<bool> _biometricAuthentication(String localizedReason) async {
  //   bool success = await biometricAuthenticationService.authenticate(
  //       localizedReason.isEmpty ? enterPinWithBiometrics : localizedReason);
  //
  //   return success;
  // }

  @override
  ConnectableStream<bool> _mapToIsPinCodeVerifiedState() => _$autoSubmitEvent
      .switchMap((pinCode) => encryptAndVerify(pinCode).asResultStream())
      .setResultStateHandler(this)
      .whereSuccess()
      .publishReplay(maxSize: 1);

  Future<bool> encryptAndVerify(String pinCode) async {
    String encryptedPin = await pinCodeService.encryptPinCode(pinCode);
    bool verifiedPin = await pinCodeService.verifyPinCode(encryptedPin);
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
  Stream<int> _mapToDigitsCountState() => _$getPinLengthEvent
      .startWith(null)
      .switchMap((value) => pinCodeService.getPinLength().asResultStream())
      .setResultStateHandler(this)
      .whereSuccess();

  @override
  Stream<bool> _mapToIsLoadingState() => loadingState;

  @override
  Stream<ErrorModel> _mapToErrorsState() => errorState.mapToErrorModel();

  @override
  ConnectableStream<void> _mapToAuthenticatedState() {
    String pin = '';
    return Rx.merge([
      _$biometricsButtonPressedEvent.switchMap(
          (reason) => _biometricAuthentication(reason).asResultStream()),
      _$addDigitEvent.switchMap((digit) {
        pin += digit;
        return pinCodeService.getPinLength().then((pinLength) async {
          print(pin);
          if (pinLength == pin.length) {
            await encryptAndVerify(pin);
            events.checkPinCodeInStorage();
          }
        }).asResultStream();
      })
    ]).setResultStateHandler(this).whereSuccess().publish();
  }

  Future<bool> _biometricAuthentication(String localizedReason) async {
    bool success = await biometricAuthenticationService.authenticate(
        localizedReason.isEmpty ? enterPinWithBiometrics : localizedReason);

    return success;
  }

  @override
  ConnectableStream<void> _mapToRequestBiometricsAuthenticationState() =>
      _$checkBiometricsEnabledEvent
          .switchMap((value) => biometricAuthenticationService
              .availableBiometrics
              .asResultStream())
          .setResultStateHandler(this)
          .whereSuccess()
          .publishReplay();

  @override
  ConnectableStream<bool> _mapToShowBiometricsButtonState() =>
      _$checkBiometricsEnabledEvent
          .switchMap((value) => getAreBiometricsEnabled().asResultStream())
          .setResultStateHandler(this)
          .whereSuccess()
          .publish();

  @override
  Stream<String> _mapToPinState() {
    return Rx.merge([
      _$addDigitEvent
          .switchMap((digit) => _digitsCountState.switchMap((length) {
                if (pinCode.length < length) {
                  return Stream.value(pinCode += digit);
                }
                print(pinCode);
                return Stream.value(pinCode);
              })),
      _$deleteDigitEvent.switchMap((value) =>
          Stream.value(pinCode = pinCode.substring(0, pinCode.length - 1))),
    ]).share();
  }
}
