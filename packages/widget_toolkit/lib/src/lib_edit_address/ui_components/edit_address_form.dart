import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';

import '../../../edit_address.dart';
import '../../../models.dart';
import '../../../search_picker.dart';
import '../../../text_field_dialog.dart';
import '../blocs/edit_address_bloc.dart';
import '../services/city_service.dart';
import '../services/country_service.dart';
import '../services/street_service.dart';
import 'country_picker_bottom_sheet.dart';

typedef OnAddressChange = Function(AddressModel addressModel);

class EditAddressForm<T extends PickerItemModel> extends StatelessWidget {
  const EditAddressForm({
    required this.onAddressChange,
    required this.editAddressErrorMapper,
    required this.editAddressService,
    required this.editAddressLocalizedStrings,
    this.searchCountryCustomBuilders,
    this.textFieldsModalConfiguration = const TextFieldModalConfiguration(),
    this.countryPickerModalConfiguration =
        const SearchPickerModalConfiguration(),
    Key? key,
  }) : super(key: key);

  final EditAddressLocalizedStrings? editAddressLocalizedStrings;
  final OnAddressChange onAddressChange;
  final EditAddressErrorMapper editAddressErrorMapper;
  final EditAddressService<T> editAddressService;
  final SearchCountryCustomBuilders<T>? searchCountryCustomBuilders;
  final TextFieldModalConfiguration textFieldsModalConfiguration;
  final SearchPickerModalConfiguration countryPickerModalConfiguration;

  @override
  Widget build(BuildContext context) =>
      RxBlocListener<EditAddressBlocType, AddressModel>(
        state: (bloc) => bloc.states.address,
        listener: (context, state) {
          onAddressChange(state);
        },
        child: RxBlocBuilder<EditAddressBlocType, AddressModel>(
          state: (bloc) => bloc.states.address,
          builder: (context, address, bloc) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RxBlocBuilder<EditAddressBlocType, bool>(
                state: (bloc) => bloc.states.isCountryEdited,
                builder: (context, snapshot, bloc) => EditFieldWidget(
                  label: editAddressLocalizedStrings?.countryLabelText ??
                      context.getEditAddressLocalizedStrings.countryLabelText,
                  value: address.data?.country.countryName ?? '',
                  onTap: () => showEditCountryBottomSheet<T>(
                    context,
                    address.data?.country,
                    (country) {
                      bloc.events.setCountry(country);
                      bloc.events.saveCountry();
                    },
                    modalConfiguration: countryPickerModalConfiguration,
                    searchCountryService:
                        CountryService(editAddressService: editAddressService),
                    countrySearchPickerTitle:
                        editAddressLocalizedStrings?.countrySearchPickerTitle ??
                            context.getEditAddressLocalizedStrings
                                .countrySearchPickerTitle,
                    countrySearchPickerHintText: editAddressLocalizedStrings
                            ?.countrySearchPickerHintText ??
                        context.getEditAddressLocalizedStrings
                            .countrySearchPickerHintText,
                    countrySearchPickerRetryText: editAddressLocalizedStrings
                            ?.countrySearchPickerRetryText ??
                        context.getEditAddressLocalizedStrings
                            .countrySearchPickerRetryText,
                    searchCountryCustomBuilders: searchCountryCustomBuilders,
                  ),
                  state: _getProfileFieldState(
                    snapshot.data,
                    false,
                  ),
                  type: EditFieldType.dropdown,
                ),
              ),
              SizedBox(
                height: context.editAddressTheme.spacingM,
              ),
              TextFieldDialog<String>(
                fillButtonText: editAddressLocalizedStrings?.cityButtonText ??
                    context.getEditAddressLocalizedStrings.cityButtonText,
                errorMapper: editAddressErrorMapper.cityErrorMapper,
                label: editAddressLocalizedStrings?.cityLabelText ??
                    context.getEditAddressLocalizedStrings.cityLabelText,
                emptyLabel: editAddressLocalizedStrings?.cityEmptyLabel ??
                    context.getEditAddressLocalizedStrings.cityEmptyLabel,
                value: address.data?.city,
                onChanged: (city) => bloc.events.setCity(city),
                validator: CityService(editAddressService: editAddressService),
                editFieldType: EditFieldType.editfield,
                modalConfiguration: textFieldsModalConfiguration,
              ),
              SizedBox(
                height: context.editAddressTheme.spacingM,
              ),
              TextFieldDialog<String>(
                fillButtonText: editAddressLocalizedStrings
                        ?.addressButtonText ??
                    context.getEditAddressLocalizedStrings.addressButtonText,
                errorMapper: editAddressErrorMapper.streetErrorMapper,
                label: editAddressLocalizedStrings?.addressLabelText ??
                    context.getEditAddressLocalizedStrings.addressLabelText,
                emptyLabel: editAddressLocalizedStrings?.addressEmptyLabel ??
                    context.getEditAddressLocalizedStrings.addressEmptyLabel,
                value: address.data?.streetAddress,
                onChanged: (street) => bloc.events.setStreet(street),
                validator:
                    StreetService(editAddressService: editAddressService),
                editFieldType: EditFieldType.editfield,
                modalConfiguration: textFieldsModalConfiguration,
              ),
            ],
          ),
        ),
      );

  static Widget withDependencies<T extends PickerItemModel>(
    BuildContext context,
    AddressModel addressModel,
    OnAddressChange onAddressChange, {
    required EditAddressErrorMapper editAddressErrorMapper,
    required EditAddressService<T> editAddressService,
    final EditAddressLocalizedStrings? editAddressLocalizedStrings,
    final SearchCountryCustomBuilders<T>? searchCountryCustomBuilders,
    final TextFieldModalConfiguration textFieldsModalConfiguration =
        const TextFieldModalConfiguration(),
    final SearchPickerModalConfiguration countryPickerModalConfiguration =
        const SearchPickerModalConfiguration(),
  }) =>
      EditAddressForm<T>(
        onAddressChange: onAddressChange,
        editAddressErrorMapper: editAddressErrorMapper,
        editAddressService: editAddressService,
        editAddressLocalizedStrings: editAddressLocalizedStrings,
        searchCountryCustomBuilders: searchCountryCustomBuilders,
        textFieldsModalConfiguration: textFieldsModalConfiguration,
        countryPickerModalConfiguration: countryPickerModalConfiguration,
      );

  EditFieldState _getProfileFieldState(
    bool? isEdited,
    bool? isLoading,
  ) {
    if (isLoading != null && isLoading) {
      return EditFieldState.loading;
    }

    if (isEdited != null && isEdited) {
      return EditFieldState.edited;
    }

    return EditFieldState.notEditedYet;
  }
}
