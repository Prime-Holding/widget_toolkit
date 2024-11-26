import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';
import 'package:widget_toolkit/models.dart';
import 'package:widget_toolkit_biometrics/widget_toolkit_biometrics.dart';

import '../../../widget_toolkit_pin.dart';
import '../di/pin_code_dependencies.dart';
import 'pin_code_component.dart';

/// This Widget builds custom numeric keyboard on the screen. It presents three
/// columns with numbers from 1 to 9 in three rows. Below them is the zero, there are
/// in the two customizable button options on the right direction. To define them use
/// [deleteKeyButton] and/or [bottomRightKeyboardButton]. The right button by default
/// can be is an auto submit button, delete button and biometrics button.
/// When the widget is loaded for the first time, on the bottom right of the
/// page there is no button. At this moment the biometrics for the app are still
/// not enabled. After at least 1 number has been selected the delete button
/// shows up. When the length of the input has reached the pin code length, the
/// button icon disappears. The pin code is encrypted and stored in the
/// local device secure storage. Then, there is an auto submit for the selected
/// pin code to the backend for verification. When the pin code is submitted,
/// the widget should present to the user that the pin verification is in
/// progress with loading animation. Over the masked pin a Shimmer will be
/// presented and buttons will change their appearance. The pin code from the
/// input is auto submitted once its length reaches the returned value from
/// [PinCodeService.getPinLength()], which should return a value less than 10.
/// After the pin has been saved
/// successfully in the secure storage, the biometrics icon appear on the bottom
/// right. When you press it, it triggers enabling of the biometrics event. The
/// local authentication from the local_auth package is triggered. The user is
/// asked, if he/she wants to allow the app to use biometrics authentication.
/// When he/she clicks ok, the biometrics authentication is triggered. When it
/// is successful, on the screen is displayed a message that the biometrics are
/// enabled. The next time when the app is restarted, because the pin code
/// will be stored in the device secure storage, the biometrics authentication
/// will be automatically triggered and the biometrics icon will be displayed
/// on the bottom right. When you press it every time it will trigger the
/// biometric authentication. Note: If [biometricsLocalDataSource] parameter is
/// not provided to `PinCodeKeyboard` the biometrics authentication feature
/// cannot be used.
///
/// For more information on how the widgets work check the functional specification
/// section in the README.md file.
class PinCodeKeyboard extends StatelessWidget {
  const PinCodeKeyboard({
    required this.pinCodeService,
    required this.translateError,
    this.biometricsLocalDataSource,
    this.biometricsAuthDataSource,
    this.mapBiometricMessageToString,
    this.onAuthenticated,
    this.deleteKeyButton,
    this.bottomRightKeyboardButton,
    this.localizedReason,
    this.addDependencies = true,
    this.onError,
    this.autoBiometricAuth = false,
    super.key,
  });

  /// Handle the translation of the error from the errors stream
  final String Function(Object error) translateError;

  /// [mapBiometricMessageToString] will be used to translate the [BiometricsMessage]
  /// to human readable text and will be used into the default notification
  final String Function(BiometricsMessage message)? mapBiometricMessageToString;

  /// Provides a contract to be implemented for the pin code related methods.
  final PinCodeService pinCodeService;

  /// Provides a contract to be implemented for the biometrics related methods.
  /// If this parameter is not provided the biometrics authentication is disabled
  /// for the package
  final BiometricsLocalDataSource? biometricsLocalDataSource;

  /// Provides a contract for custom biometrics authentication plugin. If this
  /// parameter is not provided, a default one will be used featuring
  /// [LocalAuthentication] from the local_auth package
  final PinBiometricsAuthDataSource? biometricsAuthDataSource;

  /// Callback called when the user authentication succeeds. It accepts a dynamic
  /// value which is forwarded from the `verifyPinCode` method of the [pinCodeService].
  final Function(dynamic)? onAuthenticated;

  /// Provide custom implementation for the most down left button, shown when
  /// there is pin code input on the screen. Do not forget to make it clickable.
  /// Default to LeftArrow.
  final PinCodeCustomKey? deleteKeyButton;

  /// Provide custom implementation for the most down right button. If this
  /// parameter is not used, a default button is used, which provides pin code
  /// auto submit, biometrics enabling and biometrics authentication functionalities,
  /// and its icon changes to empty, face, finger. Do not forget to make it clickable.
  final PinCodeCustomKey? bottomRightKeyboardButton;

  /// Provide a custom message, otherwise the default [_enterPinWithBiometrics]
  /// will be used
  final String? localizedReason;

  /// If set to true the dependencies will be injected before the building of
  /// the widget, otherwise the user should provide an implementation for the
  /// dependencies
  final bool addDependencies;

  /// [onError] is optional function that enable error handling out of the package
  final Function(Object error, String translatedError)? onError;

  /// If set to true the biometric authentication will be triggered automatically
  /// when the widget is loaded, requires [biometricsLocalDataSource] to be provided
  /// otherwise the biometric authentication will be disabled
  /// Default to false
  final bool autoBiometricAuth;

  static const String _enterPinWithBiometrics =
      'Enter your pin code by authenticating with biometrics';

  @override
  Widget build(BuildContext context) => _wrapWithDependencies(
        child: RxBlocListener<PinCodeBlocType, ErrorModel>(
          state: (bloc) => bloc.states.errors,
          listener: (context, error) =>
              onError?.call(error, translateError(error)),
          child: RxBlocBuilder<PinCodeBlocType, ErrorModel>(
              state: (bloc) => bloc.states.errors,
              builder: (context, errorSnapshot, bloc) => PinCodeComponent(
                    translateError: translateError,
                    mapBiometricMessageToString: mapBiometricMessageToString,
                    biometricsLocalDataSource: biometricsLocalDataSource,
                    onAuthenticated: onAuthenticated,
                    deleteKeyButton: deleteKeyButton,
                    bottomRightKeyboardButton: bottomRightKeyboardButton,
                    error: errorSnapshot.data,
                    localizedReason: _enterPinWithBiometrics,
                  )),
        ),
      );

  Widget _wrapWithDependencies({required Widget child}) => addDependencies
      ? MultiProvider(
          providers: [
            ...PinCodeDependencies.from(
              pinCodeService: pinCodeService,
              biometricsLocalDataSource: biometricsLocalDataSource,
              biometricsAuthDataSource: biometricsAuthDataSource,
              localizedReason: localizedReason ?? _enterPinWithBiometrics,
              autoBiometricAuth: autoBiometricAuth,
            ).providers,
          ],
          child: child,
        )
      : child;
}
