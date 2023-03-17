import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'address_type_model.dart';
import 'country_model.dart';

part 'address_model.g.dart';

@JsonSerializable()
@CopyWith()
class AddressModel with EquatableMixin {
  const AddressModel({
    required this.addressType,
    required this.city,
    required this.streetAddress,
    required this.country,
  });

  final AddressTypeModel addressType;

  final String city;

  final String streetAddress;

  final CountryModel country;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);

  factory AddressModel.empty(AddressTypeModel addressTypeModel) => AddressModel(
        city: '',
        addressType: addressTypeModel,
        country: CountryModel.empty(),
        streetAddress: '',
      );

  bool isEmpty() => city.isEmpty && streetAddress.isEmpty;

  String get fullAddress => '$city, ${country.countryName} \n$streetAddress';

  String get countryAndCity => '${country.countryName}, $city';

  @override
  List<Object?> get props => [addressType, city, streetAddress, country];
}
