import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

/// This class should be extended in your project. It is used to create objects
/// for the languages that your app is going to use.
///
/// The [translate] method should be overriden and in its implementation you should
/// write the logic for translating the values of the languages that your app is
/// using switching on the [locale] value in the [LanguageModel]
///
/// You can listen for the change of the [locale] value in your MaterialApp widget
/// in order to change the language in the app
abstract class LanguageModel with EquatableMixin {
  /// example bg-BG
  final String locale;

  /// example bulgarian
  final String key;

  /// example bg
  final String languageCode;

  LanguageModel({
    required this.locale,
    required this.key,
    required this.languageCode,
  });

  String asString() => key;

  String withFirstCapitalLetter() => key.substring(0).toUpperCase();

  String translate(BuildContext context);

  @override
  List<Object?> get props => [locale, key, languageCode];
}
