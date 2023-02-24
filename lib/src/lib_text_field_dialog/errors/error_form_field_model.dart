import '../../../language_picker.dart';

class ErrorFormFieldModel<T> extends ErrorModel {
  ErrorFormFieldModel({
    required this.translationKey,
    required this.fieldValue,
  });

  /// The translatable key
  final String translationKey;

  final T fieldValue;

  @override
  String toString() =>
      'ErrorRequiredField. Translation Key: $translationKey. Value: $fieldValue.';
}
