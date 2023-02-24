import 'package:flutter/src/widgets/framework.dart';
import 'package:widget_toolkit/widget_toolkit.dart';

class LanguagePickerDataMock extends LanguageModel {
  LanguagePickerDataMock(
      {required super.locale, required super.key, required super.languageCode});

  @override
  String translate(BuildContext context) {
    switch (locale) {
      case 'en':
        return 'English';
      case 'bg':
        return 'Bulgarian';
      default:
        return 'English';
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguagePickerDataMock && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}
