import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:widget_toolkit/extensions.dart';
import 'package:widget_toolkit/models.dart';
import 'package:widget_toolkit_biometrics/widget_toolkit_biometrics.dart';

import '../models/error_enable_biometrics.dart';
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
}

/// A contract class containing all states of the PinCodeBloc.
abstract class PinCodeBlocStates {
  ///Indicating how much dots to present
  Stream<int> get digitsCount;

  ///Indicating the biometrics button must be presented
  ConnectableStream<bool> get showBiometricsButton;

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
  ConnectableStream<void> _mapToAuthenticatedState() =>
      _$biometricsButtonPressedEvent
          .switchMap((localizedReason) => biometricAuthenticationService
                  .enableBiometrics(true, localizedReason)
                  .then((value) async {
                if (value != null && value != BiometricsMessage.enabled) {
                  throw ErrorEnableBiometrics(value);
                }
                await getAreBiometricsEnabled();
              }).asResultStream())
          .setResultStateHandler(this)
          .whereSuccess()
          .publish();

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
  ConnectableStream<bool> _mapToShowBiometricsButtonState() => _digitsCountState
      .switchMap((digitsCount) async* {
        int storedPinLength = await pinCodeService.getPinLength();
        if (digitsCount == storedPinLength) {
          yield await encryptAndVerify(pinCode.value);
        }
      })
      .asResultStream()
      .setResultStateHandler(this)
      .whereSuccess()
      .publish();

  @override
  void dispose() {
    pinCode.close();
    super.dispose();
  }
}
