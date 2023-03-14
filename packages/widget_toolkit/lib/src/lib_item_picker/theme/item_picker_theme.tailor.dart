// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'item_picker_theme.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class ItemPickerTheme extends ThemeExtension<ItemPickerTheme> {
  const ItemPickerTheme({
    required this.titlePadding,
    required this.titleStyle,
    required this.errorPadding,
    required this.contentListPadding,
    required this.footerPadding,
  });

  final EdgeInsets titlePadding;
  final TextStyle titleStyle;
  final EdgeInsets errorPadding;
  final EdgeInsets contentListPadding;
  final EdgeInsets footerPadding;

  static final ItemPickerTheme light = ItemPickerTheme(
    titlePadding: _$ItemPickerTheme.titlePadding[0],
    titleStyle: _$ItemPickerTheme.titleStyle[0],
    errorPadding: _$ItemPickerTheme.errorPadding[0],
    contentListPadding: _$ItemPickerTheme.contentListPadding[0],
    footerPadding: _$ItemPickerTheme.footerPadding[0],
  );

  static final ItemPickerTheme dark = ItemPickerTheme(
    titlePadding: _$ItemPickerTheme.titlePadding[1],
    titleStyle: _$ItemPickerTheme.titleStyle[1],
    errorPadding: _$ItemPickerTheme.errorPadding[1],
    contentListPadding: _$ItemPickerTheme.contentListPadding[1],
    footerPadding: _$ItemPickerTheme.footerPadding[1],
  );

  static final themes = [
    light,
    dark,
  ];

  @override
  ItemPickerTheme copyWith({
    EdgeInsets? titlePadding,
    TextStyle? titleStyle,
    EdgeInsets? errorPadding,
    EdgeInsets? contentListPadding,
    EdgeInsets? footerPadding,
  }) {
    return ItemPickerTheme(
      titlePadding: titlePadding ?? this.titlePadding,
      titleStyle: titleStyle ?? this.titleStyle,
      errorPadding: errorPadding ?? this.errorPadding,
      contentListPadding: contentListPadding ?? this.contentListPadding,
      footerPadding: footerPadding ?? this.footerPadding,
    );
  }

  @override
  ItemPickerTheme lerp(ThemeExtension<ItemPickerTheme>? other, double t) {
    if (other is! ItemPickerTheme) return this;
    return ItemPickerTheme(
      titlePadding: t < 0.5 ? titlePadding : other.titlePadding,
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
      errorPadding: t < 0.5 ? errorPadding : other.errorPadding,
      contentListPadding:
          t < 0.5 ? contentListPadding : other.contentListPadding,
      footerPadding: t < 0.5 ? footerPadding : other.footerPadding,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ItemPickerTheme &&
            const DeepCollectionEquality()
                .equals(titlePadding, other.titlePadding) &&
            const DeepCollectionEquality()
                .equals(titleStyle, other.titleStyle) &&
            const DeepCollectionEquality()
                .equals(errorPadding, other.errorPadding) &&
            const DeepCollectionEquality()
                .equals(contentListPadding, other.contentListPadding) &&
            const DeepCollectionEquality()
                .equals(footerPadding, other.footerPadding));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(titlePadding),
        const DeepCollectionEquality().hash(titleStyle),
        const DeepCollectionEquality().hash(errorPadding),
        const DeepCollectionEquality().hash(contentListPadding),
        const DeepCollectionEquality().hash(footerPadding));
  }
}
