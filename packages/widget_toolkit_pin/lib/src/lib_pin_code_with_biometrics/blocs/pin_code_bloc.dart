import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:widget_toolkit/extensions.dart';
import 'package:widget_toolkit/models.dart';
import 'package:widget_toolkit_biometrics/widget_toolkit_biometrics.dart';

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

  /// Requests biometric authentication
  // void requestBiometricAuth(String localizedMessage);

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
    authenticated.connect().addTo(_compositeSubscription);
    showBiometricsButton.connect().addTo(_compositeSubscription);
    requestBiometricsAuthentication.connect().addTo(_compositeSubscription);
  }

  final PinBiometricsService biometricAuthenticationService;
  final PinCodeService pinCodeService;
  final String enterPinWithBiometrics;

  BehaviorSubject<String> pinCode = BehaviorSubject.seeded('');

  Future<bool> encryptAndVerify(String pinCode) async {
    String encryptedPin = await pinCodeService.encryptPinCode(pinCode);
    bool verifiedPin = await pinCodeService.verifyPinCode(encryptedPin);
    return verifiedPin;
  }

  @override
  Stream<int> _mapToDigitsCountState() => Rx.merge([
        Rx.combineLatest2(
            _$addDigitEvent, pinCodeService.getPinLength().asStream(),
            (digits, pinLength) {
          if (pinCode.value.length < pinLength) {
            pinCode.add(pinCode.value += digits);
            return pinCode.value.length;
          }
          return pinCode.value.length;
        }),
        _$deleteDigitEvent.switchMap(
          (value) {
            pinCode.add(pinCode.value.substring(
                0, pinCode.value.isNotEmpty ? pinCode.value.length - 1 : 0));
            return Stream.value(pinCode.value.length);
          },
        ),
      ]).startWith(0).share();

  @override
  Stream<bool> _mapToIsLoadingState() => loadingState;

  @override
  Stream<ErrorModel> _mapToErrorsState() => errorState.mapToErrorModel();

  @override
  ConnectableStream<void> _mapToAuthenticatedState() {
    return Rx.merge([
      Rx.combineLatest2(
          _digitsCountState, pinCodeService.getPinLength().asStream(),
          // _$biometricsButtonPressedEvent,
          (pinLength, storedPinLength) async {
        if (pinLength == storedPinLength) {
          bool isCorrect = await encryptAndVerify(pinCode.value);
          if (isCorrect) {
            // print('Za pritisnuto $pressed');
            await pinCodeService.isPinCodeInSecureStorage();
          }
        }
      }),
      _$biometricsButtonPressedEvent.flatMap((value) {
        _biometricAuthentication(value);
        return biometricAuthenticationService
            .enableBiometrics(true, 'Your biometrics are enabled!')
            .asResultStream()
            .whereSuccess()
            .doOnData((event) async {
          print('Event je $event');
          if (event == BiometricsMessage.enabled) {
            print('USOOO');
            return await biometricAuthenticationService
                .setBiometricsEnabled(true);
          }
          print('uso ispod');
          return await biometricAuthenticationService
              .setBiometricsEnabled(false);
        });
      })
    ])
        .asResultStream()
        .setResultStateHandler(this)
        .whereSuccess()
        .publishReplay(maxSize: 1);
  }

  Future<bool> _biometricAuthentication(String localizedReason) async {
    bool success = await biometricAuthenticationService.authenticate(
        localizedReason.isEmpty ? enterPinWithBiometrics : localizedReason);

    return success;
  }

  @override
  ConnectableStream<void> _mapToRequestBiometricsAuthenticationState() =>
      Rx.merge([
        biometricAuthenticationService.availableBiometrics.asResultStream()
      ]).setResultStateHandler(this).whereSuccess().publish();

  @override
  ConnectableStream<bool> _mapToShowBiometricsButtonState() => Rx.merge([
        Rx.combineLatest2(
            _digitsCountState, pinCodeService.getPinLength().asStream(),
            (digitsCount, pinLength) {
          if (digitsCount == pinLength) {
            return true;
          }
          return false;
        }).switchMap((value) async* {
          if (value) {
            yield await encryptAndVerify(pinCode.value);
          }
        }).asResultStream(),
      ]).setResultStateHandler(this).whereSuccess().publish();
}
