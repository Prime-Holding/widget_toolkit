/// A service validator class, used as a contract for validation methods on a
/// text field dialog. It should be extended, with your custom implementation
/// of its methods.
///
/// [validateOnSubmit] Should be used as a backend check for the provided string
/// value, when the user presses the Save button in the dialog
///
/// [validateOnType] Should be used as a frontend check for the provided string,
/// when the user presses the Save button in the dialog
abstract class TextFieldValidator<T> {
  Future<T> validateOnSubmit(String text);

  void validateOnType(String text);
}
