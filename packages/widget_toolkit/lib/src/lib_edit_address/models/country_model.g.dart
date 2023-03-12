// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CountryModelCWProxy {
  CountryModel countryCode(String countryCode);

  CountryModel countryName(String countryName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CountryModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CountryModel(...).copyWith(id: 12, name: "My name")
  /// ````
  CountryModel call({
    String? countryCode,
    String? countryName,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCountryModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCountryModel.copyWith.fieldName(...)`
class _$CountryModelCWProxyImpl implements _$CountryModelCWProxy {
  const _$CountryModelCWProxyImpl(this._value);

  final CountryModel _value;

  @override
  CountryModel countryCode(String countryCode) =>
      this(countryCode: countryCode);

  @override
  CountryModel countryName(String countryName) =>
      this(countryName: countryName);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CountryModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CountryModel(...).copyWith(id: 12, name: "My name")
  /// ````
  CountryModel call({
    Object? countryCode = const $CopyWithPlaceholder(),
    Object? countryName = const $CopyWithPlaceholder(),
  }) {
    return CountryModel(
      countryCode:
          countryCode == const $CopyWithPlaceholder() || countryCode == null
              // ignore: unnecessary_non_null_assertion
              ? _value.countryCode!
              // ignore: cast_nullable_to_non_nullable
              : countryCode as String,
      countryName:
          countryName == const $CopyWithPlaceholder() || countryName == null
              // ignore: unnecessary_non_null_assertion
              ? _value.countryName!
              // ignore: cast_nullable_to_non_nullable
              : countryName as String,
    );
  }
}

extension $CountryModelCopyWith on CountryModel {
  /// Returns a callable class that can be used as follows: `instanceOfCountryModel.copyWith(...)` or like so:`instanceOfCountryModel.copyWith.fieldName(...)`.
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
