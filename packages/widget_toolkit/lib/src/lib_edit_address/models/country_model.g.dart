// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CountryModelCWProxy {
  CountryModel countryCode(String countryCode);

  CountryModel countryName(String countryName);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `CountryModel(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CountryModel(...).copyWith(id: 12, name: "My name")
  /// ```
  CountryModel call({
    String countryCode,
    String countryName,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCountryModel.copyWith(...)` or call `instanceOfCountryModel.copyWith.fieldName(value)` for a single field.
class _$CountryModelCWProxyImpl implements _$CountryModelCWProxy {
  const _$CountryModelCWProxyImpl(this._value);

  final CountryModel _value;

  @override
  CountryModel countryCode(String countryCode) =>
      call(countryCode: countryCode);

  @override
  CountryModel countryName(String countryName) =>
      call(countryName: countryName);

  @override

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `CountryModel(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CountryModel(...).copyWith(id: 12, name: "My name")
  /// ```
  CountryModel call({
    Object? countryCode = const $CopyWithPlaceholder(),
    Object? countryName = const $CopyWithPlaceholder(),
  }) {
    return CountryModel(
      countryCode:
          countryCode == const $CopyWithPlaceholder() || countryCode == null
              ? _value.countryCode
              // ignore: cast_nullable_to_non_nullable
              : countryCode as String,
      countryName:
          countryName == const $CopyWithPlaceholder() || countryName == null
              ? _value.countryName
              // ignore: cast_nullable_to_non_nullable
              : countryName as String,
    );
  }
}

extension $CountryModelCopyWith on CountryModel {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCountryModel.copyWith(...)` or `instanceOfCountryModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CountryModelCWProxy get copyWith => _$CountryModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryModel _$CountryModelFromJson(Map<String, dynamic> json) => CountryModel(
      countryCode: json['countryCode'] as String,
      countryName: json['countryName'] as String,
    );

Map<String, dynamic> _$CountryModelToJson(CountryModel instance) =>
    <String, dynamic>{
      'countryCode': instance.countryCode,
      'countryName': instance.countryName,
    };
