import 'package:widget_toolkit/widget_toolkit.dart';
import 'package:widget_toolkit_biometrics/widget_toolkit_biometrics.dart';

/// If biometrics authentication can't be done for some reason
/// bloc will throw this error and bottom sheet will be presented
/// to the user with the appropriate message
class ErrorEnableBiometrics extends ErrorModel {
  ErrorEnableBiometrics(this.message);
  final BiometricsMessage message;
}
