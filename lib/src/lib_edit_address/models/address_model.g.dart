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

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddressModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddressModel(...).copyWith(id: 12, name: "My name")
  /// ````
  AddressModel call({
    AddressTypeModel? addressType,
    String? city,
    String? streetAddress,
    CountryModel? country,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAddressModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAddressModel.copyWith.fieldName(...)`
class _$AddressModelCWProxyImpl implements _$AddressModelCWProxy {
  const _$AddressModelCWProxyImpl(this._value);

  final AddressModel _value;

  @override
  AddressModel addressType(AddressTypeModel addressType) =>
      this(addressType: addressType);

  @override
  AddressModel city(String city) => this(city: city);

  @override
  AddressModel streetAddress(String streetAddress) =>
      this(streetAddress: streetAddress);

  @override
  AddressModel country(CountryModel country) => this(country: country);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddressModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddressModel(...).copyWith(id: 12, name: "My name")
  /// ````
  AddressModel call({
    Object? addressType = const $CopyWithPlaceholder(),
    Object? city = const $CopyWithPlaceholder(),
    Object? streetAddress = const $CopyWithPlaceholder(),
    Object? country = const $CopyWithPlaceholder(),
  }) {
    return AddressModel(
      addressType:
          addressType == const $CopyWithPlaceholder() || addressType == null
              // ignore: unnecessary_non_null_assertion
              ? _value.addressType!
              // ignore: cast_nullable_to_non_nullable
              : addressType as AddressTypeModel,
      city: city == const $CopyWithPlaceholder() || city == null
          // ignore: unnecessary_non_null_assertion
          ? _value.city!
          // ignore: cast_nullable_to_non_nullable
          : city as String,
      streetAddress:
          streetAddress == const $CopyWithPlaceholder() || streetAddress == null
              // ignore: unnecessary_non_null_assertion
              ? _value.streetAddress!
              // ignore: cast_nullable_to_non_nullable
              : streetAddress as String,
      country: country == const $CopyWithPlaceholder() || country == null
          // ignore: unnecessary_non_null_assertion
          ? _value.country!
          // ignore: cast_nullable_to_non_nullable
          : country as CountryModel,
    );
  }
}

extension $AddressModelCopyWith on AddressModel {
  /// Returns a callable class that can be used as follows: `instanceOfAddressModel.copyWith(...)` or like so:`instanceOfAddressModel.copyWith.fieldName(...)`.
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
