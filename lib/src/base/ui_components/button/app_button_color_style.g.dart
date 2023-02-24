// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_button_color_style.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PrimeButtonColorStyleCWProxy {
  PrimeButtonColorStyle activeButtonTextColor(dynamic activeButtonTextColor);

  PrimeButtonColorStyle disabledButtonTextColor(
      dynamic disabledButtonTextColor);

  PrimeButtonColorStyle activeGradientColorStart(
      dynamic activeGradientColorStart);

  PrimeButtonColorStyle activeGradientColorEnd(dynamic activeGradientColorEnd);

  PrimeButtonColorStyle shadowColor(dynamic shadowColor);

  PrimeButtonColorStyle pressedColor(dynamic pressedColor);

  PrimeButtonColorStyle borderColor(dynamic borderColor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PrimeButtonColorStyle(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PrimeButtonColorStyle(...).copyWith(id: 12, name: "My name")
  /// ````
  PrimeButtonColorStyle call({
    dynamic? activeButtonTextColor,
    dynamic? disabledButtonTextColor,
    dynamic? activeGradientColorStart,
    dynamic? activeGradientColorEnd,
    dynamic? shadowColor,
    dynamic? pressedColor,
    dynamic? borderColor,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPrimeButtonColorStyle.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPrimeButtonColorStyle.copyWith.fieldName(...)`
class _$PrimeButtonColorStyleCWProxyImpl
    implements _$PrimeButtonColorStyleCWProxy {
  const _$PrimeButtonColorStyleCWProxyImpl(this._value);

  final PrimeButtonColorStyle _value;

  @override
  PrimeButtonColorStyle activeButtonTextColor(dynamic activeButtonTextColor) =>
      this(activeButtonTextColor: activeButtonTextColor);

  @override
  PrimeButtonColorStyle disabledButtonTextColor(
          dynamic disabledButtonTextColor) =>
      this(disabledButtonTextColor: disabledButtonTextColor);

  @override
  PrimeButtonColorStyle activeGradientColorStart(
          dynamic activeGradientColorStart) =>
      this(activeGradientColorStart: activeGradientColorStart);

  @override
  PrimeButtonColorStyle activeGradientColorEnd(
          dynamic activeGradientColorEnd) =>
      this(activeGradientColorEnd: activeGradientColorEnd);

  @override
  PrimeButtonColorStyle shadowColor(dynamic shadowColor) =>
      this(shadowColor: shadowColor);

  @override
  PrimeButtonColorStyle pressedColor(dynamic pressedColor) =>
      this(pressedColor: pressedColor);

  @override
  PrimeButtonColorStyle borderColor(dynamic borderColor) =>
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
              : activeButtonTextColor as dynamic,
      disabledButtonTextColor:
          disabledButtonTextColor == const $CopyWithPlaceholder() ||
                  disabledButtonTextColor == null
              // ignore: unnecessary_non_null_assertion
              ? _value.disabledButtonTextColor!
              // ignore: cast_nullable_to_non_nullable
              : disabledButtonTextColor as dynamic,
      activeGradientColorStart:
          activeGradientColorStart == const $CopyWithPlaceholder() ||
                  activeGradientColorStart == null
              // ignore: unnecessary_non_null_assertion
              ? _value.activeGradientColorStart!
              // ignore: cast_nullable_to_non_nullable
              : activeGradientColorStart as dynamic,
      activeGradientColorEnd:
          activeGradientColorEnd == const $CopyWithPlaceholder() ||
                  activeGradientColorEnd == null
              // ignore: unnecessary_non_null_assertion
              ? _value.activeGradientColorEnd!
              // ignore: cast_nullable_to_non_nullable
              : activeGradientColorEnd as dynamic,
      shadowColor:
          shadowColor == const $CopyWithPlaceholder() || shadowColor == null
              // ignore: unnecessary_non_null_assertion
              ? _value.shadowColor!
              // ignore: cast_nullable_to_non_nullable
              : shadowColor as dynamic,
      pressedColor:
          pressedColor == const $CopyWithPlaceholder() || pressedColor == null
              // ignore: unnecessary_non_null_assertion
              ? _value.pressedColor!
              // ignore: cast_nullable_to_non_nullable
              : pressedColor as dynamic,
      borderColor:
          borderColor == const $CopyWithPlaceholder() || borderColor == null
              // ignore: unnecessary_non_null_assertion
              ? _value.borderColor!
              // ignore: cast_nullable_to_non_nullable
              : borderColor as dynamic,
    );
  }
}

extension $PrimeButtonColorStyleCopyWith on PrimeButtonColorStyle {
  /// Returns a callable class that can be used as follows: `instanceOfPrimeButtonColorStyle.copyWith(...)` or like so:`instanceOfPrimeButtonColorStyle.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PrimeButtonColorStyleCWProxy get copyWith =>
      _$PrimeButtonColorStyleCWProxyImpl(this);
}
