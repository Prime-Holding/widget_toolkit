part 'empty_list_error_model.dart';
part 'unknown_error_model.dart';
part 'generic_error_model.dart';
part 'open_url/access_denied_error_model.dart';

/// The base error model from which all other errors inherit.
class ErrorModel implements Exception {}

abstract class L10nErrorKeyProvider {
  String get l10nErrorKey;
}
