import '../../base/models/errors/error_model.dart';
import 'edit_address_error_type.dart';

class EditAddressErrorModel<T> extends ErrorModel {
  EditAddressErrorModel({
    required this.translationKey,
    required this.fieldValue,
  });

  final EditAddressErrorType translationKey;
  final T fieldValue;

  @override
  String toString() =>
      'EditAddressErrorModel, translationKey: $translationKey, '
      'fieldValue: $fieldValue';
}