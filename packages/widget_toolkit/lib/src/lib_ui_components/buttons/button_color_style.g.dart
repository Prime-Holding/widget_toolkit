// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'button_color_style.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ButtonColorStyleCWProxy {
  ButtonColorStyle activeButtonTextColor(Color activeButtonTextColor);

  ButtonColorStyle disabledButtonTextColor(Color disabledButtonTextColor);

  ButtonColorStyle activeGradientColorStart(Color activeGradientColorStart);

  ButtonColorStyle activeGradientColorEnd(Color activeGradientColorEnd);

  ButtonColorStyle shadowColor(Color shadowColor);

  ButtonColorStyle pressedColor(Color pressedColor);

  ButtonColorStyle borderColor(Color borderColor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ButtonColorStyle(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ButtonColorStyle(...).copyWith(id: 12, name: "My name")
  /// ````
  ButtonColorStyle call({
    Color? activeButtonTextColor,
    Color? disabledButtonTextColor,
    Color? activeGradientColorStart,
    Color? activeGradientColorEnd,
    Color? shadowColor,
    Color? pressedColor,
    Color? borderColor,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfButtonColorStyle.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfButtonColorStyle.copyWith.fieldName(...)`
class _$ButtonColorStyleCWProxyImpl implements _$ButtonColorStyleCWProxy {
  const _$ButtonColorStyleCWProxyImpl(this._value);

  final ButtonColorStyle _value;

  @override
  ButtonColorStyle activeButtonTextColor(Color activeButtonTextColor) =>
      this(activeButtonTextColor: activeButtonTextColor);

  @override
  ButtonColorStyle disabledButtonTextColor(Color disabledButtonTextColor) =>
      this(disabledButtonTextColor: disabledButtonTextColor);

  @override
  ButtonColorStyle activeGradientColorStart(Color activeGradientColorStart) =>
      this(activeGradientColorStart: activeGradientColorStart);

  @override
  ButtonColorStyle activeGradientColorEnd(Color activeGradientColorEnd) =>
      this(activeGradientColorEnd: activeGradientColorEnd);

  @override
  ButtonColorStyle shadowColor(Color shadowColor) =>
      this(shadowColor: shadowColor);

  @override
  ButtonColorStyle pressedColor(Color pressedColor) =>
      this(pressedColor: pressedColor);

  @override
  ButtonColorStyle borderColor(Color borderColor) =>
      this(borderColor: borderColor);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ButtonColorStyle(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ButtonColorStyle(...).copyWith(id: 12, name: "My name")
  /// ````
  ButtonColorStyle call({
    Object? activeButtonTextColor = const $CopyWithPlaceholder(),
    Object? disabledButtonTextColor = const $CopyWithPlaceholder(),
    Object? activeGradientColorStart = const $CopyWithPlaceholder(),
    Object? activeGradientColorEnd = const $CopyWithPlaceholder(),
    Object? shadowColor = const $CopyWithPlaceholder(),
    Object? pressedColor = const $CopyWithPlaceholder(),
    Object? borderColor = const $CopyWithPlaceholder(),
  }) {
    return ButtonColorStyle(
      activeButtonTextColor:
          activeButtonTextColor == const $CopyWithPlaceholder() ||
                  activeButtonTextColor == null
              ? _value.activeButtonTextColor
              // ignore: cast_nullable_to_non_nullable
              : activeButtonTextColor as Color,
      disabledButtonTextColor:
          disabledButtonTextColor == const $CopyWithPlaceholder() ||
                  disabledButtonTextColor == null
              ? _value.disabledButtonTextColor
              // ignore: cast_nullable_to_non_nullable
              : disabledButtonTextColor as Color,
      activeGradientColorStart:
          activeGradientColorStart == const $CopyWithPlaceholder() ||
                  activeGradientColorStart == null
              ? _value.activeGradientColorStart
              // ignore: cast_nullable_to_non_nullable
              : activeGradientColorStart as Color,
      activeGradientColorEnd:
          activeGradientColorEnd == const $CopyWithPlaceholder() ||
                  activeGradientColorEnd == null
              ? _value.activeGradientColorEnd
              // ignore: cast_nullable_to_non_nullable
              : activeGradientColorEnd as Color,
      shadowColor:
          shadowColor == const $CopyWithPlaceholder() || shadowColor == null
              ? _value.shadowColor
              // ignore: cast_nullable_to_non_nullable
              : shadowColor as Color,
      pressedColor:
          pressedColor == const $CopyWithPlaceholder() || pressedColor == null
              ? _value.pressedColor
              // ignore: cast_nullable_to_non_nullable
              : pressedColor as Color,
      borderColor:
          borderColor == const $CopyWithPlaceholder() || borderColor == null
              ? _value.borderColor
              // ignore: cast_nullable_to_non_nullable
              : borderColor as Color,
    );
  }
}

extension $ButtonColorStyleCopyWith on ButtonColorStyle {
  /// Returns a callable class that can be used as follows: `instanceOfButtonColorStyle.copyWith(...)` or like so:`instanceOfButtonColorStyle.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ButtonColorStyleCWProxy get copyWith => _$ButtonColorStyleCWProxyImpl(this);
}
