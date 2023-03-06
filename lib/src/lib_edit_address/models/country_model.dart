import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../models.dart';

part 'country_model.g.dart';

@JsonSerializable()
@CopyWith()
class CountryModel extends PickerItemModel with EquatableMixin {
  const CountryModel({
    required this.countryCode,
    required this.countryName,
  });

  final String countryCode;

  final String countryName;

  static const _countryName = 'Bulgaria';
  static const _countryCode = 'BG';

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountryModelToJson(this);

  const CountryModel.withDefaults()
      : countryName = _countryName,
        countryCode = _countryCode;

  factory CountryModel.empty() => const CountryModel(
        countryName: '',
        countryCode: '',
      );

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [countryName, countryCode];

  @override
  String get itemDisplayName => countryName;
}
