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

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `ButtonColorStyle(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ButtonColorStyle(...).copyWith(id: 12, name: "My name")
  /// ```
  ButtonColorStyle call({
    Color activeButtonTextColor,
    Color disabledButtonTextColor,
    Color activeGradientColorStart,
    Color activeGradientColorEnd,
    Color shadowColor,
    Color pressedColor,
    Color borderColor,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfButtonColorStyle.copyWith(...)` or call `instanceOfButtonColorStyle.copyWith.fieldName(value)` for a single field.
class _$ButtonColorStyleCWProxyImpl implements _$ButtonColorStyleCWProxy {
  const _$ButtonColorStyleCWProxyImpl(this._value);

  final ButtonColorStyle _value;

  @override
  ButtonColorStyle activeButtonTextColor(Color activeButtonTextColor) =>
      call(activeButtonTextColor: activeButtonTextColor);

  @override
  ButtonColorStyle disabledButtonTextColor(Color disabledButtonTextColor) =>
      call(disabledButtonTextColor: disabledButtonTextColor);

  @override
  ButtonColorStyle activeGradientColorStart(Color activeGradientColorStart) =>
      call(activeGradientColorStart: activeGradientColorStart);

  @override
  ButtonColorStyle activeGradientColorEnd(Color activeGradientColorEnd) =>
      call(activeGradientColorEnd: activeGradientColorEnd);

  @override
  ButtonColorStyle shadowColor(Color shadowColor) =>
      call(shadowColor: shadowColor);

  @override
  ButtonColorStyle pressedColor(Color pressedColor) =>
      call(pressedColor: pressedColor);

  @override
  ButtonColorStyle borderColor(Color borderColor) =>
      call(borderColor: borderColor);

  @override

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `ButtonColorStyle(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ButtonColorStyle(...).copyWith(id: 12, name: "My name")
  /// ```
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
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfButtonColorStyle.copyWith(...)` or `instanceOfButtonColorStyle.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ButtonColorStyleCWProxy get copyWith => _$ButtonColorStyleCWProxyImpl(this);
}
