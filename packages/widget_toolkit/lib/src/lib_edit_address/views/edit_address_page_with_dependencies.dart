import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../edit_address.dart';
import '../../../models.dart';
import '../../../search_picker.dart';
import '../../../text_field_dialog.dart';
import '../di/edit_address_dependencies.dart';
import 'edit_address_page.dart';

class EditAddressPageWithDependencies<T extends PickerItemModel>
    extends StatelessWidget {
  const EditAddressPageWithDependencies({
    required this.onAddressSaved,
    required this.addressModel,
    required this.buttonText,
    required this.headerText,
    required this.textFieldsModalConfiguration,
    required this.countryPickerModalConfiguration,
    required this.translateError,
    required this.editAddressService,
    this.saveAddress,
    this.onChanged,
    this.editAddressLocalizedStrings,
    this.editContactAddressErrorBuilder,
    this.searchCountryCustomBuilders,
    super.key,
  });

  final OnAddressSaved onAddressSaved;
  final String buttonText;
  final String headerText;
  final AddressModel addressModel;
  final Function(Object error) translateError;
  final EditAddressService<T> editAddressService;
  final Function(AddressModel? addressModel)? onChanged;
  final EditAddressLocalizedStrings? editAddressLocalizedStrings;
  final Function(AddressModel)? saveAddress;
  final Widget Function(ErrorModel?)? editContactAddressErrorBuilder;
  final SearchCountryCustomBuilders<T>? searchCountryCustomBuilders;
  final TextFieldModalConfiguration textFieldsModalConfiguration;
  final SearchPickerModalConfiguration countryPickerModalConfiguration;

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: EditAddressDependencies.from(
          context,
          addressModel,
          editAddressService,
        ).providers,
        child: EditAddressPage<T>(
            onAddressSaved: onAddressSaved,
            buttonText: buttonText,
            headerText: headerText,
            addressModel: addressModel,
            onChanged: onChanged,
            saveAddress: saveAddress,
            translateError: translateError,
            editAddressLocalizedStrings: editAddressLocalizedStrings,
            editAddressService: editAddressService,
            searchCountryCustomBuilders: searchCountryCustomBuilders,
            editContactAddressErrorBuilder: editContactAddressErrorBuilder,
            textFieldsModalConfiguration: textFieldsModalConfiguration,
            countryPickerModalConfiguration: countryPickerModalConfiguration),
      );
}
