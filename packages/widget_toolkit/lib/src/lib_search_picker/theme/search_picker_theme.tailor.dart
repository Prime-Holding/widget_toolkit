// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'search_picker_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class SearchPickerTheme extends ThemeExtension<SearchPickerTheme> {
  const SearchPickerTheme({
    required this.errorEdgeInsets,
    required this.searchFieldOuterEdgeInsets,
    required this.titlePadding,
    required this.titleStyle,
  });

  final EdgeInsets errorEdgeInsets;
  final EdgeInsets searchFieldOuterEdgeInsets;

  /// region SearchPickerPage
  final EdgeInsets titlePadding;
  final TextStyle titleStyle;

  static final SearchPickerTheme light = SearchPickerTheme(
    errorEdgeInsets: _$SearchPickerTheme.errorEdgeInsets[0],
    searchFieldOuterEdgeInsets:
        _$SearchPickerTheme.searchFieldOuterEdgeInsets[0],
    titlePadding: _$SearchPickerTheme.titlePadding[0],
    titleStyle: _$SearchPickerTheme.titleStyle[0],
  );

  static final SearchPickerTheme dark = SearchPickerTheme(
    errorEdgeInsets: _$SearchPickerTheme.errorEdgeInsets[1],
    searchFieldOuterEdgeInsets:
        _$SearchPickerTheme.searchFieldOuterEdgeInsets[1],
    titlePadding: _$SearchPickerTheme.titlePadding[1],
    titleStyle: _$SearchPickerTheme.titleStyle[1],
  );

  static final themes = [
    light,
    dark,
  ];

  @override
  SearchPickerTheme copyWith({
    EdgeInsets? errorEdgeInsets,
    EdgeInsets? searchFieldOuterEdgeInsets,
    EdgeInsets? titlePadding,
    TextStyle? titleStyle,
  }) {
    return SearchPickerTheme(
      errorEdgeInsets: errorEdgeInsets ?? this.errorEdgeInsets,
      searchFieldOuterEdgeInsets:
          searchFieldOuterEdgeInsets ?? this.searchFieldOuterEdgeInsets,
      titlePadding: titlePadding ?? this.titlePadding,
      titleStyle: titleStyle ?? this.titleStyle,
    );
  }

  @override
  SearchPickerTheme lerp(
      covariant ThemeExtension<SearchPickerTheme>? other, double t) {
    if (other is! SearchPickerTheme) return this as SearchPickerTheme;
    return SearchPickerTheme(
      errorEdgeInsets: t < 0.5 ? errorEdgeInsets : other.errorEdgeInsets,
      searchFieldOuterEdgeInsets: t < 0.5
          ? searchFieldOuterEdgeInsets
          : other.searchFieldOuterEdgeInsets,
      titlePadding: t < 0.5 ? titlePadding : other.titlePadding,
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchPickerTheme &&
            const DeepCollectionEquality()
                .equals(errorEdgeInsets, other.errorEdgeInsets) &&
            const DeepCollectionEquality().equals(
                searchFieldOuterEdgeInsets, other.searchFieldOuterEdgeInsets) &&
            const DeepCollectionEquality()
                .equals(titlePadding, other.titlePadding) &&
            const DeepCollectionEquality()
                .equals(titleStyle, other.titleStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(errorEdgeInsets),
      const DeepCollectionEquality().hash(searchFieldOuterEdgeInsets),
      const DeepCollectionEquality().hash(titlePadding),
      const DeepCollectionEquality().hash(titleStyle),
    );
  }
}
