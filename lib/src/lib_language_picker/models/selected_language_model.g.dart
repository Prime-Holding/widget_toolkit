// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_language_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SelectedLanguageModelCWProxy {
  SelectedLanguageModel language(LanguageModel language);

  SelectedLanguageModel selected(bool selected);

  SelectedLanguageModel isLoading(bool isLoading);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SelectedLanguageModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SelectedLanguageModel(...).copyWith(id: 12, name: "My name")
  /// ````
  SelectedLanguageModel call({
    LanguageModel? language,
    bool? selected,
    bool? isLoading,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSelectedLanguageModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSelectedLanguageModel.copyWith.fieldName(...)`
class _$SelectedLanguageModelCWProxyImpl
    implements _$SelectedLanguageModelCWProxy {
  const _$SelectedLanguageModelCWProxyImpl(this._value);

  final SelectedLanguageModel _value;

  @override
  SelectedLanguageModel language(LanguageModel language) =>
      this(language: language);

  @override
  SelectedLanguageModel selected(bool selected) => this(selected: selected);

  @override
  SelectedLanguageModel isLoading(bool isLoading) => this(isLoading: isLoading);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SelectedLanguageModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SelectedLanguageModel(...).copyWith(id: 12, name: "My name")
  /// ````
  SelectedLanguageModel call({
    Object? language = const $CopyWithPlaceholder(),
    Object? selected = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
  }) {
    return SelectedLanguageModel(
      language: language == const $CopyWithPlaceholder() || language == null
          // ignore: unnecessary_non_null_assertion
          ? _value.language!
          // ignore: cast_nullable_to_non_nullable
          : language as LanguageModel,
      selected: selected == const $CopyWithPlaceholder() || selected == null
          // ignore: unnecessary_non_null_assertion
          ? _value.selected!
          // ignore: cast_nullable_to_non_nullable
          : selected as bool,
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          // ignore: unnecessary_non_null_assertion
          ? _value.isLoading!
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
    );
  }
}

extension $SelectedLanguageModelCopyWith on SelectedLanguageModel {
  /// Returns a callable class that can be used as follows: `instanceOfSelectedLanguageModel.copyWith(...)` or like so:`instanceOfSelectedLanguageModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SelectedLanguageModelCWProxy get copyWith =>
      _$SelectedLanguageModelCWProxyImpl(this);
}
