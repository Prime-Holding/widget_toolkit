// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_language_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SelectedLanguageModelCWProxy {
  SelectedLanguageModel language(LanguageModel language);

  SelectedLanguageModel selected(bool selected);

  SelectedLanguageModel isLoading(bool isLoading);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `SelectedLanguageModel(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SelectedLanguageModel(...).copyWith(id: 12, name: "My name")
  /// ```
  SelectedLanguageModel call({
    LanguageModel language,
    bool selected,
    bool isLoading,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSelectedLanguageModel.copyWith(...)` or call `instanceOfSelectedLanguageModel.copyWith.fieldName(value)` for a single field.
class _$SelectedLanguageModelCWProxyImpl
    implements _$SelectedLanguageModelCWProxy {
  const _$SelectedLanguageModelCWProxyImpl(this._value);

  final SelectedLanguageModel _value;

  @override
  SelectedLanguageModel language(LanguageModel language) =>
      call(language: language);

  @override
  SelectedLanguageModel selected(bool selected) => call(selected: selected);

  @override
  SelectedLanguageModel isLoading(bool isLoading) => call(isLoading: isLoading);

  @override

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `SelectedLanguageModel(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SelectedLanguageModel(...).copyWith(id: 12, name: "My name")
  /// ```
  SelectedLanguageModel call({
    Object? language = const $CopyWithPlaceholder(),
    Object? selected = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
  }) {
    return SelectedLanguageModel(
      language: language == const $CopyWithPlaceholder() || language == null
          ? _value.language
          // ignore: cast_nullable_to_non_nullable
          : language as LanguageModel,
      selected: selected == const $CopyWithPlaceholder() || selected == null
          ? _value.selected
          // ignore: cast_nullable_to_non_nullable
          : selected as bool,
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
    );
  }
}

extension $SelectedLanguageModelCopyWith on SelectedLanguageModel {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSelectedLanguageModel.copyWith(...)` or `instanceOfSelectedLanguageModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SelectedLanguageModelCWProxy get copyWith =>
      _$SelectedLanguageModelCWProxyImpl(this);
}
