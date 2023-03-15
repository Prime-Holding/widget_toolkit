import '../../base/models/errors/error_model.dart';

class EditAddressErrorModel<T> extends ErrorModel {
  EditAddressErrorModel({
    required this.error,
    required this.translationKey,
    required this.fieldValue,
  });

  final String error;
  final String translationKey;
  final T fieldValue;

  @override
  String toString() => error;
}