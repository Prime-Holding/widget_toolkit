import 'package:widget_toolkit/models.dart';

class ErrorWrongPin extends ErrorModel {
  ErrorWrongPin({required this.errorMessage});

  final String errorMessage;

  @override
  String toString() => 'ErrorWrongPin $errorMessage';
}
