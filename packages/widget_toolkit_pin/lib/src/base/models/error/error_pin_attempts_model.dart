part of 'error_model.dart';

class ErrorPinAttemptsModel extends ErrorModel {
  ErrorPinAttemptsModel({
    required this.remainingAttempts,
  });

  final int remainingAttempts;

  @override
  String toString() {
    return 'ErrorPinAttemptsModel{remainingAttempts: $remainingAttempts}';
  }
}
