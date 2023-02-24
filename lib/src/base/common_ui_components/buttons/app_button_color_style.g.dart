// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_button_color_style.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PrimeButtonColorStyleCWProxy {
  PrimeButtonColorStyle activeButtonTextColor(Color activeButtonTextColor);

  PrimeButtonColorStyle disabledButtonTextColor(Color disabledButtonTextColor);

  PrimeButtonColorStyle activeGradientColorStart(
      Color activeGradientColorStart);

  PrimeButtonColorStyle activeGradientColorEnd(Color activeGradientColorEnd);

  PrimeButtonColorStyle shadowColor(Color shadowColor);

  PrimeButtonColorStyle pressedColor(Color pressedColor);

  PrimeButtonColorStyle borderColor(Color borderColor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PrimeButtonColorStyle(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PrimeButtonColorStyle(...).copyWith(id: 12, name: "My name")
  /// ````
  PrimeButtonColorStyle call({
    Color? activeButtonTextColor,
    Color? disabledButtonTextColor,
    Color? activeGradientColorStart,
    Color? activeGradientColorEnd,
    Color? shadowColor,
    Color? pressedColor,
    Color? borderColor,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPrimeButtonColorStyle.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPrimeButtonColorStyle.copyWith.fieldName(...)`
class _$PrimeButtonColorStyleCWProxyImpl
    implements _$PrimeButtonColorStyleCWProxy {
  const _$PrimeButtonColorStyleCWProxyImpl(this._value);

  final PrimeButtonColorStyle _value;

  @override
  PrimeButtonColorStyle activeButtonTextColor(Color activeButtonTextColor) =>
      this(activeButtonTextColor: activeButtonTextColor);

  @override
  PrimeButtonColorStyle disabledButtonTextColor(
          Color disabledButtonTextColor) =>
      this(disabledButtonTextColor: disabledButtonTextColor);

  @override
  PrimeButtonColorStyle activeGradientColorStart(
          Color activeGradientColorStart) =>
      this(activeGradientColorStart: activeGradientColorStart);

  @override
  PrimeButtonColorStyle activeGradientColorEnd(Color activeGradientColorEnd) =>
      this(activeGradientColorEnd: activeGradientColorEnd);

  @override
  PrimeButtonColorStyle shadowColor(Color shadowColor) =>
      this(shadowColor: shadowColor);

  @override
  PrimeButtonColorStyle pressedColor(Color pressedColor) =>
      this(pressedColor: pressedColor);

  @override
  PrimeButtonColorStyle borderColor(Color borderColor) =>
      this(borderColor: borderColor);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PrimeButtonColorStyle(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PrimeButtonColorStyle(...).copyWith(id: 12, name: "My name")
  /// ````
  PrimeButtonColorStyle call({
    Object? activeButtonTextColor = const $CopyWithPlaceholder(),
    Object? disabledButtonTextColor = const $CopyWithPlaceholder(),
    Object? activeGradientColorStart = const $CopyWithPlaceholder(),
    Object? activeGradientColorEnd = const $CopyWithPlaceholder(),
    Object? shadowColor = const $CopyWithPlaceholder(),
    Object? pressedColor = const $CopyWithPlaceholder(),
    Object? borderColor = const $CopyWithPlaceholder(),
  }) {
    return PrimeButtonColorStyle(
      activeButtonTextColor:
          activeButtonTextColor == const $CopyWithPlaceholder() ||
                  activeButtonTextColor == null
              // ignore: unnecessary_non_null_assertion
              ? _value.activeButtonTextColor!
              // ignore: cast_nullable_to_non_nullable
              : activeButtonTextColor as Color,
      disabledButtonTextColor:
          disabledButtonTextColor == const $CopyWithPlaceholder() ||
                  disabledButtonTextColor == null
              // ignore: unnecessary_non_null_assertion
              ? _value.disabledButtonTextColor!
              // ignore: cast_nullable_to_non_nullable
              : disabledButtonTextColor as Color,
      activeGradientColorStart:
          activeGradientColorStart == const $CopyWithPlaceholder() ||
                  activeGradientColorStart == null
              // ignore: unnecessary_non_null_assertion
              ? _value.activeGradientColorStart!
              // ignore: cast_nullable_to_non_nullable
              : activeGradientColorStart as Color,
      activeGradientColorEnd:
          activeGradientColorEnd == const $CopyWithPlaceholder() ||
                  activeGradientColorEnd == null
              // ignore: unnecessary_non_null_assertion
              ? _value.activeGradientColorEnd!
              // ignore: cast_nullable_to_non_nullable
              : activeGradientColorEnd as Color,
      shadowColor:
          shadowColor == const $CopyWithPlaceholder() || shadowColor == null
              // ignore: unnecessary_non_null_assertion
              ? _value.shadowColor!
              // ignore: cast_nullable_to_non_nullable
              : shadowColor as Color,
      pressedColor:
          pressedColor == const $CopyWithPlaceholder() || pressedColor == null
              // ignore: unnecessary_non_null_assertion
              ? _value.pressedColor!
              // ignore: cast_nullable_to_non_nullable
              : pressedColor as Color,
      borderColor:
          borderColor == const $CopyWithPlaceholder() || borderColor == null
              // ignore: unnecessary_non_null_assertion
              ? _value.borderColor!
              // ignore: cast_nullable_to_non_nullable
              : borderColor as Color,
    );
  }
}

extension $PrimeButtonColorStyleCopyWith on PrimeButtonColorStyle {
  /// Returns a callable class that can be used as follows: `instanceOfPrimeButtonColorStyle.copyWith(...)` or like so:`instanceOfPrimeButtonColorStyle.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PrimeButtonColorStyleCWProxy get copyWith =>
      _$PrimeButtonColorStyleCWProxyImpl(this);
}
