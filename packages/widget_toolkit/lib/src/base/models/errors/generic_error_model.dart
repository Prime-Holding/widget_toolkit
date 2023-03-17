part of 'error_model.dart';

class GenericErrorModel extends ErrorModel {
  GenericErrorModel({this.customMessage});

  final String? customMessage;

  @override
  String toString() {
    return 'GenericErrorModel';
  }
}
