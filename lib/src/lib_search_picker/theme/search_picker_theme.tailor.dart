// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'search_picker_theme.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class SearchPickerTheme extends ThemeExtension<SearchPickerTheme> {
  const SearchPickerTheme({
    required this.titlePadding,
    required this.titleStyle,
    required this.searchFieldOuterEdgeInsets,
    required this.errorEdgeInsets,
  });

  final EdgeInsets titlePadding;
  final TextStyle titleStyle;
  final EdgeInsets searchFieldOuterEdgeInsets;
  final EdgeInsets errorEdgeInsets;

  static final SearchPickerTheme light = SearchPickerTheme(
    titlePadding: _$SearchPickerTheme.titlePadding[0],
    titleStyle: _$SearchPickerTheme.titleStyle[0],
    searchFieldOuterEdgeInsets:
        _$SearchPickerTheme.searchFieldOuterEdgeInsets[0],
    errorEdgeInsets: _$SearchPickerTheme.errorEdgeInsets[0],
  );

  static final SearchPickerTheme dark = SearchPickerTheme(
    titlePadding: _$SearchPickerTheme.titlePadding[1],
    titleStyle: _$SearchPickerTheme.titleStyle[1],
    searchFieldOuterEdgeInsets:
        _$SearchPickerTheme.searchFieldOuterEdgeInsets[1],
    errorEdgeInsets: _$SearchPickerTheme.errorEdgeInsets[1],
  );

  static final themes = [
    light,
    dark,
  ];

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
  SearchPickerTheme lerp(ThemeExtension<SearchPickerTheme>? other, double t) {
    if (other is! SearchPickerTheme) return this;
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
        runtimeType,
        const DeepCollectionEquality().hash(titlePadding),
        const DeepCollectionEquality().hash(titleStyle),
        const DeepCollectionEquality().hash(searchFieldOuterEdgeInsets),
        const DeepCollectionEquality().hash(errorEdgeInsets));
  }
}
