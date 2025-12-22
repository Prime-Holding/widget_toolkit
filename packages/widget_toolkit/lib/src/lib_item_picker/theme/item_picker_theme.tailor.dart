// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_picker_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$ItemPickerThemeTailorMixin on ThemeExtension<ItemPickerTheme> {
  EdgeInsets get titlePadding;
  TextStyle get titleStyle;
  EdgeInsets get errorPadding;
  EdgeInsets get contentListPadding;
  EdgeInsets get footerPadding;

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
  ItemPickerTheme lerp(
      covariant ThemeExtension<ItemPickerTheme>? other, double t) {
    if (other is! ItemPickerTheme) return this as ItemPickerTheme;
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
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(titlePadding),
      const DeepCollectionEquality().hash(titleStyle),
      const DeepCollectionEquality().hash(errorPadding),
      const DeepCollectionEquality().hash(contentListPadding),
      const DeepCollectionEquality().hash(footerPadding),
    );
  }
}
