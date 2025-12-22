// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AddressModelCWProxy {
  AddressModel addressType(AddressTypeModel addressType);

  AddressModel city(String city);

  AddressModel streetAddress(String streetAddress);

  AddressModel country(CountryModel country);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AddressModel(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AddressModel(...).copyWith(id: 12, name: "My name")
  /// ```
  AddressModel call({
    AddressTypeModel addressType,
    String city,
    String streetAddress,
    CountryModel country,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAddressModel.copyWith(...)` or call `instanceOfAddressModel.copyWith.fieldName(value)` for a single field.
class _$AddressModelCWProxyImpl implements _$AddressModelCWProxy {
  const _$AddressModelCWProxyImpl(this._value);

  final AddressModel _value;

  @override
  AddressModel addressType(AddressTypeModel addressType) =>
      call(addressType: addressType);

  @override
  AddressModel city(String city) => call(city: city);

  @override
  AddressModel streetAddress(String streetAddress) =>
      call(streetAddress: streetAddress);

  @override
  AddressModel country(CountryModel country) => call(country: country);

  @override

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AddressModel(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AddressModel(...).copyWith(id: 12, name: "My name")
  /// ```
  AddressModel call({
    Object? addressType = const $CopyWithPlaceholder(),
    Object? city = const $CopyWithPlaceholder(),
    Object? streetAddress = const $CopyWithPlaceholder(),
    Object? country = const $CopyWithPlaceholder(),
  }) {
    return AddressModel(
      addressType:
          addressType == const $CopyWithPlaceholder() || addressType == null
              ? _value.addressType
              // ignore: cast_nullable_to_non_nullable
              : addressType as AddressTypeModel,
      city: city == const $CopyWithPlaceholder() || city == null
          ? _value.city
          // ignore: cast_nullable_to_non_nullable
          : city as String,
      streetAddress:
          streetAddress == const $CopyWithPlaceholder() || streetAddress == null
              ? _value.streetAddress
              // ignore: cast_nullable_to_non_nullable
              : streetAddress as String,
      country: country == const $CopyWithPlaceholder() || country == null
          ? _value.country
          // ignore: cast_nullable_to_non_nullable
          : country as CountryModel,
    );
  }
}

extension $AddressModelCopyWith on AddressModel {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAddressModel.copyWith(...)` or `instanceOfAddressModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AddressModelCWProxy get copyWith => _$AddressModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      addressType: $enumDecode(_$AddressTypeModelEnumMap, json['addressType']),
      city: json['city'] as String,
      streetAddress: json['streetAddress'] as String,
      country: CountryModel.fromJson(json['country'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'addressType': _$AddressTypeModelEnumMap[instance.addressType]!,
      'city': instance.city,
      'streetAddress': instance.streetAddress,
      'country': instance.country,
    };

const _$AddressTypeModelEnumMap = {
  AddressTypeModel.headquarters: 'Headquarters',
  AddressTypeModel.correspondence: 'Correspondence',
  AddressTypeModel.home: 'Home',
};
