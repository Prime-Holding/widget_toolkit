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
  void biometricsButtonPressed();
}

/// A contract class containing all states of the PinCodeBloc.
abstract class PinCodeBlocStates {
  /// Emits current PIN length to UI
  Stream<int> get digitsCount;

  /// Emits placeholder PIN length to UI
  Stream<int> get placeholderDigitsCount;

  ///Indicating the biometrics button must be presented
  Stream<bool> get showBiometricsButton;

  ///Emits when user successfully authenticate (pin/biometrics)
  ConnectableStream<dynamic> get authenticated;

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
    required this.localizedReason,
    required this.autoPromptBiometric,
  }) {
    authenticated.connect().addTo(_compositeSubscription);
    Rx.merge([
      _$addDigitEvent
          .asyncMap((digit) async => (
                digit: digit,
                allowedLength: await pinCodeService.getPinLength()
              ))
          .where((data) => _pinCode.value.length <= data.allowedLength)
          .map((data) => _pinCode.value + data.digit),
      _$deleteDigitEvent
          .map((_) => _pinCode.value.substring(0, _pinCode.value.length - 1)),
    ]).listen(_pinCode.add).addTo(_compositeSubscription);
  }

  final PinBiometricsService biometricAuthenticationService;
  final PinCodeService pinCodeService;
  final String localizedReason;
  final bool autoPromptBiometric;

  final BehaviorSubject<String> _pinCode = BehaviorSubject.seeded('');

  @override
  Stream<int> _mapToDigitsCountState() =>
      _pinCode.map<int>((pinCode) => pinCode.length).share();

  @override
  Stream<int> _mapToPlaceholderDigitsCountState() => pinCodeService
      .getPinLength()
      .asResultStream()
      .setResultStateHandler(this)
      .whereSuccess();

  @override
  Stream<bool> _mapToIsLoadingState() => loadingState;

  @override
  Stream<ErrorModel> _mapToErrorsState() => errorState.mapToErrorModel();

  @override
  ConnectableStream<dynamic> _mapToAuthenticatedState() => Rx.merge([
        digitsCount
            .switchMap((_) => pinCodeService.getPinLength().asStream())
            .where(
                (storedPinLength) => storedPinLength == _pinCode.value.length)
            .switchMap((digitsCount) => _checkPin(_pinCode.value)
                .asResultStream()
                .doOnData((result) => _pinCode.add(''))),
        _$biometricsButtonPressedEvent
            .mapTo(true)
            .startWith(autoPromptBiometric)
            .where((shouldPrompt) => shouldPrompt)
            .asyncMap((_) => _getAreBiometricsEnabled())
            .where((biometricsEnabled) => biometricsEnabled)
            .switchMap((_) => _authenticateWithBiometrics().asResultStream())
      ]).setResultStateHandler(this).whereSuccess().publish();

  @override
  Stream<bool> _mapToShowBiometricsButtonState() => const Stream.empty()
      .startWith(null)
      .switchMap((_) => _getAreBiometricsEnabled().asResultStream())
      .setResultStateHandler(this)
      .whereSuccess()
      .shareReplay(maxSize: 1);

  @override
  void dispose() {
    _pinCode.close();
    super.dispose();
  }

  /// region Private methods

  /// Checks the conditions for when the biometrics button should be shown:
  /// 1. The biometrics are supported by the device and are enabled
  /// 2. The pin code is stored on-device
  Future<bool> _getAreBiometricsEnabled() async {
    final isDeviceSupported =
        await biometricAuthenticationService.isDeviceSupported;
    final canCheckBiometrics =
        await biometricAuthenticationService.canCheckBiometrics;
    final biometricsEnabled =
        await biometricAuthenticationService.areBiometricsEnabled();

    final pinCode = await pinCodeService.getPinCode();

    return isDeviceSupported &&
        canCheckBiometrics &&
        biometricsEnabled &&
        pinCode != null;
  }

  // Checks the validity of the pin code
  Future<dynamic> _checkPin(String pinCode) async {
    final encryptedPin = await pinCodeService.encryptPinCode(pinCode);
    await pinCodeService.savePinCodeInSecureStorage(encryptedPin);
    final verificationResult = await pinCodeService.verifyPinCode(encryptedPin);
    return verificationResult;
  }

  /// Authenticates the user with biometrics after which the pin code is
  /// retrieved from the device and checked.
  Future<dynamic> _authenticateWithBiometrics() async {
    if (!await biometricAuthenticationService.isDeviceSupported) {
      throw ErrorEnableBiometrics(BiometricsMessage.notSupported);
    }
    if (await biometricAuthenticationService.authenticate(localizedReason)) {
      final pinCode = await pinCodeService.getPinCode();
      if (pinCode != null) {
        final verificationResult = await pinCodeService.verifyPinCode(pinCode);
        return verificationResult;
      }
    }
    return false;
  }

  /// endregion
}
