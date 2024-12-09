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
    _$deleteDigitEvent
        .map((_) => _pinCode.add(_pinCode.value.substring(
            0, _pinCode.value.isNotEmpty ? _pinCode.value.length - 1 : 0)))
        .asResultStream()
        .publishReplay()
        .connect()
        .addTo(_compositeSubscription);

    _$addDigitEvent
        .switchMap((digit) => _addDigit(digit).asResultStream())
        .publishReplay()
        .connect()
        .addTo(_compositeSubscription);
  }

  final PinBiometricsService biometricAuthenticationService;
  final PinCodeService pinCodeService;
  final String localizedReason;
  final bool autoPromptBiometric;

  final BehaviorSubject<String> _pinCode = BehaviorSubject.seeded('');

  @override
  Stream<int> _mapToDigitsCountState() => Rx.merge([
        _pinCode
            .flatMap<int>((pinCode) => Stream.value(pinCode.length))
            .asResultStream(),
      ]).whereSuccess().share();

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
        digitsCount.flatMap((digitsCount) =>
            _checkPin(_pinCode.value, digitsCount).asResultStream()),
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

  /// Adds a digit to the pin code, returning the new length of the pin code
  Future<int> _addDigit(String digit) async {
    final pinLength = await pinCodeService.getPinLength();
    if (_pinCode.value.length < pinLength) {
      _pinCode.add(_pinCode.value + digit);
    }
    return _pinCode.value.length;
  }

  // Checks the validity of the pin code
  Future<dynamic> _checkPin(String pinCode, int digits) async {
    final storedPinLength = await pinCodeService.getPinLength();
    if (storedPinLength != 0 && digits == storedPinLength) {
      try {
        final encryptedPin = await pinCodeService.encryptPinCode(pinCode);
        await pinCodeService.savePinCodeInSecureStorage(encryptedPin);
        final verificationResult =
            await pinCodeService.verifyPinCode(encryptedPin);
        _pinCode.value = '';
        return verificationResult;
      } catch (_) {
        _pinCode.value = '';
        rethrow;
      }
    }
    return false;
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
