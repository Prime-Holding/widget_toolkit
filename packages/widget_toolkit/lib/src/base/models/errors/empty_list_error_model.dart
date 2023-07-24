part of 'error_model.dart';

class EmptyListErrorModel extends ErrorModel implements L10nErrorKeyProvider {
  EmptyListErrorModel(this.l10nErrorKey);

  @override
  final String l10nErrorKey;

  @override
  String toString() => 'EmptyListError. TranslationKey: $l10nErrorKey';
}
