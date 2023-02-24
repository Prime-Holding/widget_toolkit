import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

import '../../base/models/common/language_model.dart';

part 'selected_language_model.g.dart';

@CopyWith()
class SelectedLanguageModel with EquatableMixin {
  SelectedLanguageModel({
    required this.language,
    required this.selected,
    this.isLoading = false,
  });

  final LanguageModel language;
  final bool selected;
  final bool isLoading;

  @override
  List<Object?> get props => [language, selected, isLoading];
}

extension SelectedLanguageModelList on List<SelectedLanguageModel> {
  bool get isAnyLoading => any((language) => language.isLoading);
}
