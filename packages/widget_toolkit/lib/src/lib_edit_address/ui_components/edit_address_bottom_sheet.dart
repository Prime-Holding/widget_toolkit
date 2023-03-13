import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../edit_address.dart';
import '../../../models.dart';
import '../../../search_picker.dart';
import '../../../text_field_dialog.dart';
import '../../../ui_components.dart';
import '../views/edit_address_page.dart';

Future<AddressModel?> showEditAddressBottomSheet<T extends PickerItemModel>(
  BuildContext context, {
  required String buttonText,
  required String headerText,
  required AddressModel addressModel,
  required Function(Object error) translateError,
  required EditAddressService<T> editAddressService,
  final Function(AddressModel? addressModel)? onChanged,
  final EditAddressConfiguration modalConfiguration =
      const EditAddressConfiguration(),
  dynamic countryCustomIcon,
  final EditAddressLocalizedStrings? editAddressLocalizedStrings,
  final Widget Function(ErrorModel?)? editContactAddressErrorBuilder,
  final SearchCountryCustomBuilders<T>? searchCountryCustomBuilders,
  final TextFieldModalConfiguration textFieldsModalConfiguration =
      const TextFieldModalConfiguration(),
  final SearchPickerModalConfiguration countryPickerModalConfiguration =
      const SearchPickerModalConfiguration(),
}) async =>
    await showBlurredBottomSheet<AddressModel?>(
      configuration: modalConfiguration,
      context: context,
      builder: (ctx) => EditAddressPage.withDependencies<T>(context,
          onAddressSaved: (AddressModel address) =>
              Navigator.of(ctx).pop(address),
          buttonText: buttonText,
          headerText: headerText,
          addressModel: addressModel,
          translateError: translateError,
          onChanged: onChanged,
          editAddressLocalizedStrings: editAddressLocalizedStrings,
          editAddressService: editAddressService,
          editContactAddressErrorBuilder: editContactAddressErrorBuilder,
          searchCountryCustomBuilders: searchCountryCustomBuilders,
          textFieldsModalConfiguration: textFieldsModalConfiguration,
          countryPickerModalConfiguration: countryPickerModalConfiguration),
      onCancelPressed: () => Navigator.of(context).pop(),
    );

/// [countrySearchPickerTitle] is the text at the top of the country search
/// picker page
///
/// [countrySearchPickerHintText] is the text in the country search page, text
/// input field
///
/// [countrySearchPickerRetryText] is a text displayed in retry button, which
/// is displayed, when there is an exception on the country search page.
///
/// [countryLabelText] is the label text for the country widget.
///
/// [cityButtonText] is the text in the button inside the edit city page.
///
/// [cityLabelText] is the label text of the city widget
///
/// [cityEmptyLabel] is a value displayed if there is a null value provided for
/// the city name
///
/// [addressButtonText] is a text inside button in the page with the address
/// edit input field
///
/// [addressLabelText] is a label text displayed on the address widget
///
/// [addressEmptyLabel]  A value displayed if there is a null value provided for
/// the address name
///
/// [addressChangedMessage] A message displayed, when an address is changed
/// successfully
class CountryCityAddressStrings {
  const CountryCityAddressStrings({
    required this.countrySearchPickerTitle,
    required this.countrySearchPickerHintText,
    required this.countrySearchPickerRetryText,
    required this.countryLabelText,
    required this.cityButtonText,
    required this.cityLabelText,
    required this.cityEmptyLabel,
    required this.addressButtonText,
    required this.addressLabelText,
    required this.addressEmptyLabel,
    required this.addressChangedMessage,
  });

  final String countrySearchPickerTitle;
  final String countrySearchPickerHintText;
  final String countrySearchPickerRetryText;
  final String countryLabelText;
  final String cityButtonText;
  final String cityLabelText;
  final String cityEmptyLabel;
  final String addressButtonText;
  final String addressLabelText;
  final String addressEmptyLabel;
  final String addressChangedMessage;
}
