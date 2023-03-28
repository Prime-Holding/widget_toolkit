import 'package:widget_toolkit/widget_toolkit.dart';

class LanguagePickerDataMock extends LanguageModel {
  LanguagePickerDataMock(
      {required super.locale, required super.key, required super.languageCode});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguagePickerDataMock && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}
