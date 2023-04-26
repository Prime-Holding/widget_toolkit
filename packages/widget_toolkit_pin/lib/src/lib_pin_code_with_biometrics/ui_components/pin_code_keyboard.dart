import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';
import 'package:widget_toolkit_biometrics/widget_toolkit_biometrics.dart';

import '../../../widget_toolkit_pin.dart';
import '../di/pin_code_dependencies.dart';
import 'pin_code_component.dart';

/// This Widget builds custom numeric keyboard on the screen. It presents three
/// columns with numbers from 1 to 9 in three rows. Below them is the zero in the
/// middle and two customizable buttons in bought directions. To define them use
/// [deleteKeyButton] and/or [bottomRightKeyboardButton]. By default the
/// left button will be back arrow and whenever pressed, will delete the last
/// entered number. The right button will be submit button - enabled only if all
/// numbers are provided. If some biometrics are available and no one digit has been entered,
/// respective biometric icon will be displayed and clicking on the button will
/// return the native ID authentication workflow.
/// When the user submits the pin code, the widget should present to the user that
/// the pin verification is in progress. Over the masked pin a Shimmer will be
/// presented and buttons will change their appearance.
/// The pin code from the input is auto submitted once its length reaches
/// [PinCodeService.getPinLength()], which should return a value less than 10.
/// When the biometrics button on the bottom right is pressed an enable biometrics
/// question pops up after the permission is given the pressing of the button
/// triggers a biometrics scan.
class PinCodeKeyboard extends StatelessWidget {
  const PinCodeKeyboard({
    required this.pinCodeService,
    required this.biometricsLocalDataSource,
    required this.translateError,
    this.mapMessageToString,
    this.isAuthenticatedWithBiometrics,
    this.isPinCodeVerified,
    this.deleteKeyButton,
    this.bottomRightKeyboardButton,
    this.localizedReason,
    this.addDependencies = true,
    this.onError,
    Key? key,
  }) : super(key: key);

  final String Function(Object error) translateError;

  /// [mapMessageToString] will be used to translate the [BiometricsMessage]
  /// to human readable text and will be used into the default notification
  final String Function(BiometricsMessage message)? mapMessageToString;

  /// Provides a contract to be implemented for the pin code related methods.
  final PinCodeService pinCodeService;

  /// Provides a contract to be implemented for the biometrics related methods.
  final BiometricsLocalDataSource biometricsLocalDataSource;

  /// Called when a user is authenticated with biometrics successfully
  final void Function(bool)? isAuthenticatedWithBiometrics;

  /// Returns the verification state of the input from the pin code auto submit value.
  final void Function(bool)? isPinCodeVerified;

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

  static const String _enterPinWithBiometrics =
      'Enter your pin code by authenticating with biometrics';

  @override
  Widget build(BuildContext context) => _wrapWithDependencies(
        child: RxBlocBuilder<PinCodeBlocType, int>(
          state: (bloc) => bloc.states.pinLength,
          builder: (context, snapshot, bloc) {
            if (snapshot.hasData) {
              return PinCodeComponent(
                pinLength: snapshot.data!,
                translateError: translateError,
                mapMessageToString: mapMessageToString,
                isAuthenticatedWithBiometrics: isAuthenticatedWithBiometrics,
                isPinCodeVerified: isPinCodeVerified,
                deleteKeyButton: deleteKeyButton,
                bottomRightKeyboardButton: bottomRightKeyboardButton,
                onError: onError,
                localizedReason: _enterPinWithBiometrics,
              );
            }
            return Container();
          },
        ),
      );

  Widget _wrapWithDependencies({required Widget child}) => addDependencies
      ? MultiProvider(
          providers: [
            ...PinCodeDependencies.from(
              pinCodeService: pinCodeService,
              biometricsLocalDataSource: biometricsLocalDataSource,
              localizedReason:
                  localizedReason ?? _enterPinWithBiometrics,
            ).providers,
          ],
          child: child,
        )
      : child;
}
