part of 'error_model.dart';

class UnknownErrorModel extends ErrorModel {
  UnknownErrorModel({
    this.exception,
  });

  final Exception? exception;

  factory UnknownErrorModel.fromString(String data) =>
      UnknownErrorModel(exception: Exception(data));

  @override
  String toString() => 'Unknown Error. ${exception.toString()}';
}
