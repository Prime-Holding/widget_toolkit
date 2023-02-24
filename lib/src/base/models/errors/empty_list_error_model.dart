part of 'error_model.dart';

class EmptyListErrorModel extends ErrorModel {
  EmptyListErrorModel({this.customMessage});

  final String? customMessage;

  @override
  String toString() {
    return 'EmptyListErrorModel';
  }
}
