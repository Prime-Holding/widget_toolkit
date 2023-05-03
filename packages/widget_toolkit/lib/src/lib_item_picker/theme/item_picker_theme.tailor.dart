// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'item_picker_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class ItemPickerTheme extends ThemeExtension<ItemPickerTheme> {
  const ItemPickerTheme({
    required this.contentListPadding,
    required this.errorPadding,
    required this.footerPadding,
    required this.titlePadding,
    required this.titleStyle,
  });

  final EdgeInsets contentListPadding;
  final EdgeInsets errorPadding;
  final EdgeInsets footerPadding;

  /// region ItemPickerPage
  final EdgeInsets titlePadding;
  final TextStyle titleStyle;

  static final ItemPickerTheme light = ItemPickerTheme(
    contentListPadding: _$ItemPickerTheme.contentListPadding[0],
    errorPadding: _$ItemPickerTheme.errorPadding[0],
    footerPadding: _$ItemPickerTheme.footerPadding[0],
    titlePadding: _$ItemPickerTheme.titlePadding[0],
    titleStyle: _$ItemPickerTheme.titleStyle[0],
  );

  static final ItemPickerTheme dark = ItemPickerTheme(
    contentListPadding: _$ItemPickerTheme.contentListPadding[1],
    errorPadding: _$ItemPickerTheme.errorPadding[1],
    footerPadding: _$ItemPickerTheme.footerPadding[1],
    titlePadding: _$ItemPickerTheme.titlePadding[1],
    titleStyle: _$ItemPickerTheme.titleStyle[1],
  );

  static final themes = [
    light,
    dark,
  ];

  @override
  ItemPickerTheme copyWith({
    EdgeInsets? contentListPadding,
    EdgeInsets? errorPadding,
    EdgeInsets? footerPadding,
    EdgeInsets? titlePadding,
    TextStyle? titleStyle,
  }) {
    return ItemPickerTheme(
      contentListPadding: contentListPadding ?? this.contentListPadding,
      errorPadding: errorPadding ?? this.errorPadding,
      footerPadding: footerPadding ?? this.footerPadding,
      titlePadding: titlePadding ?? this.titlePadding,
      titleStyle: titleStyle ?? this.titleStyle,
    );
  }

  @override
  ItemPickerTheme lerp(
      covariant ThemeExtension<ItemPickerTheme>? other, double t) {
    if (other is! ItemPickerTheme) return this as ItemPickerTheme;
    return ItemPickerTheme(
      contentListPadding:
          t < 0.5 ? contentListPadding : other.contentListPadding,
      errorPadding: t < 0.5 ? errorPadding : other.errorPadding,
      footerPadding: t < 0.5 ? footerPadding : other.footerPadding,
      titlePadding: t < 0.5 ? titlePadding : other.titlePadding,
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ItemPickerTheme &&
            const DeepCollectionEquality()
                .equals(contentListPadding, other.contentListPadding) &&
            const DeepCollectionEquality()
                .equals(errorPadding, other.errorPadding) &&
            const DeepCollectionEquality()
                .equals(footerPadding, other.footerPadding) &&
            const DeepCollectionEquality()
                .equals(titlePadding, other.titlePadding) &&
            const DeepCollectionEquality()
                .equals(titleStyle, other.titleStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(contentListPadding),
      const DeepCollectionEquality().hash(errorPadding),
      const DeepCollectionEquality().hash(footerPadding),
      const DeepCollectionEquality().hash(titlePadding),
      const DeepCollectionEquality().hash(titleStyle),
    );
  }
}
