import 'package:json_annotation/json_annotation.dart';

enum AddressTypeModel {
  @JsonValue('Headquarters')
  headquarters,
  @JsonValue('Correspondence')
  correspondence,
  @JsonValue('Home')
  home,
}
