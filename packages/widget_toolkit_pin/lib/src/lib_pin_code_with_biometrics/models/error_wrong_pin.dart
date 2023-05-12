import 'package:widget_toolkit/models.dart';

/// This error can be thrown from the service layer, when the user types a wrong
/// pin code. When the [PinCodeComponent] widget receives this error a shake
/// animation will be triggered on the masked pin code keys, then they disappear
/// and the text from the [errorMessage] will be displayed on the screen.
class ErrorWrongPin extends ErrorModel {
  ErrorWrongPin({required this.errorMessage});

  final String errorMessage;

  @override
  String toString() => 'ErrorWrongPin $errorMessage';
}
