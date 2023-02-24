part of 'error_model.dart';

class ErrorUnknown extends ErrorModel {
  ErrorUnknown({
    this.exception,
  });

  final Exception? exception;

  factory ErrorUnknown.fromString(String data) =>
      ErrorUnknown(exception: Exception(data));

  @override
  String toString() => 'Unknown Error. ${exception.toString()}';
}
