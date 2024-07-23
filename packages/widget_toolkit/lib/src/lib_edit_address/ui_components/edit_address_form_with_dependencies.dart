import 'package:flutter/material.dart';

import '../../../widget_toolkit.dart';
import 'edit_address_form.dart';

class EditAddressFormWithDependencies<T extends PickerItemModel>
    extends StatelessWidget {
  const EditAddressFormWithDependencies({
    super.key,
    required this.addressModel,
    required this.onAddressChange,
    required this.translateError,
    required this.editAddressService,
    this.editAddressLocalizedStrings,
    this.searchCountryCustomBuilders,
    this.textFieldsModalConfiguration = const TextFieldModalConfiguration(),
    this.countryPickerModalConfiguration =
        const SearchPickerModalConfiguration(),
  });

  final AddressModel addressModel;
  final OnAddressChange onAddressChange;
  final Function(Object error) translateError;
  final EditAddressService<T> editAddressService;
  final EditAddressLocalizedStrings? editAddressLocalizedStrings;
  final SearchCountryCustomBuilders<T>? searchCountryCustomBuilders;
  final TextFieldModalConfiguration textFieldsModalConfiguration;
  final SearchPickerModalConfiguration countryPickerModalConfiguration;

  @override
  Widget build(BuildContext context) => EditAddressForm<T>(
        onAddressChange: onAddressChange,
        translateError: translateError,
        editAddressService: editAddressService,
        editAddressLocalizedStrings: editAddressLocalizedStrings,
        searchCountryCustomBuilders: searchCountryCustomBuilders,
        textFieldsModalConfiguration: textFieldsModalConfiguration,
        countryPickerModalConfiguration: countryPickerModalConfiguration,
      );
}
