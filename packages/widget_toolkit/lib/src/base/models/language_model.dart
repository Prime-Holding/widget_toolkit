import 'package:equatable/equatable.dart';

/// This class should be used to create objects for the languages that your app
/// is going to use.
///
/// You can listen for the change of the [locale] value in your MaterialApp widget
/// in order to change the language in the app.
class LanguageModel with EquatableMixin {
  LanguageModel({
    required this.locale,
    required this.key,
    required this.languageCode,
  });

  /// example bg-BG
  final String locale;

  /// example bulgarian
  final String key;

  /// example bg
  final String languageCode;

  String asString() => key;

  String withFirstCapitalLetter() => key.substring(0).toUpperCase();

  @override
  List<Object?> get props => [locale, key, languageCode];
}
