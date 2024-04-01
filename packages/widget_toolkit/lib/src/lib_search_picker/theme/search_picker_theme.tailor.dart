// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'search_picker_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$SearchPickerThemeTailorMixin on ThemeExtension<SearchPickerTheme> {
  EdgeInsets get titlePadding;
  TextStyle get titleStyle;
  EdgeInsets get searchFieldOuterEdgeInsets;
  EdgeInsets get errorEdgeInsets;

  @override
  SearchPickerTheme copyWith({
    EdgeInsets? titlePadding,
    TextStyle? titleStyle,
    EdgeInsets? searchFieldOuterEdgeInsets,
    EdgeInsets? errorEdgeInsets,
  }) {
    return SearchPickerTheme(
      titlePadding: titlePadding ?? this.titlePadding,
      titleStyle: titleStyle ?? this.titleStyle,
      searchFieldOuterEdgeInsets:
          searchFieldOuterEdgeInsets ?? this.searchFieldOuterEdgeInsets,
      errorEdgeInsets: errorEdgeInsets ?? this.errorEdgeInsets,
    );
  }

  @override
  SearchPickerTheme lerp(
      covariant ThemeExtension<SearchPickerTheme>? other, double t) {
    if (other is! SearchPickerTheme) return this as SearchPickerTheme;
    return SearchPickerTheme(
      titlePadding: t < 0.5 ? titlePadding : other.titlePadding,
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
      searchFieldOuterEdgeInsets: t < 0.5
          ? searchFieldOuterEdgeInsets
          : other.searchFieldOuterEdgeInsets,
      errorEdgeInsets: t < 0.5 ? errorEdgeInsets : other.errorEdgeInsets,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchPickerTheme &&
            const DeepCollectionEquality()
                .equals(titlePadding, other.titlePadding) &&
            const DeepCollectionEquality()
                .equals(titleStyle, other.titleStyle) &&
            const DeepCollectionEquality().equals(
                searchFieldOuterEdgeInsets, other.searchFieldOuterEdgeInsets) &&
            const DeepCollectionEquality()
                .equals(errorEdgeInsets, other.errorEdgeInsets));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(titlePadding),
      const DeepCollectionEquality().hash(titleStyle),
      const DeepCollectionEquality().hash(searchFieldOuterEdgeInsets),
      const DeepCollectionEquality().hash(errorEdgeInsets),
    );
  }
}
