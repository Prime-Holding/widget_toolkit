import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:flutter_rx_bloc/rx_form.dart';

import '../../../edit_address.dart';
import '../../../search_picker.dart';
import '../../../widget_toolkit.dart';
import '../blocs/edit_address_bloc.dart';
import 'country_picker_bottom_sheet.dart';

typedef OnAddressChange = Function(AddressModel addressModel);

class EditAddressForm<T extends PickerItemModel> extends StatelessWidget {
  const EditAddressForm({
    required this.onAddressChange,
    required this.cityErrorMapper,
    required this.addressErrorMapper,
    required this.validator,
    required this.searchCountryService,
    required this.editAddressLocalizedStrings,
    this.searchCountryCustomBuilders,
    Key? key,
  }) : super(key: key);

  final EditAddressLocalizedStrings? editAddressLocalizedStrings;
  final OnAddressChange onAddressChange;
  final RxFieldException<String> Function(Object error, BuildContext context)
      cityErrorMapper;
  final RxFieldException<String> Function(Object error, BuildContext context)
      addressErrorMapper;
  final TextFieldValidator<String> validator;
  final SearchPickerService<T> searchCountryService;
  final SearchCountryCustomBuilders<T>? searchCountryCustomBuilders;

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
                    configuration: const CountryBottomSheetConfiguration(
                      haveOnlyOneSheet: false,
                    ),
                    searchCountryService: searchCountryService,
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
                errorMapper: cityErrorMapper,
                label: editAddressLocalizedStrings?.cityLabelText ??
                    context.getEditAddressLocalizedStrings.cityLabelText,
                emptyLabel: editAddressLocalizedStrings?.cityEmptyLabel ??
                    context.getEditAddressLocalizedStrings.cityEmptyLabel,
                value: address.data?.city,
                onChanged: (city) => bloc.events.setCity(city),
                validator: validator,
                editFieldType: EditFieldType.editfield,
                configuration: const TextFieldConfiguration(
                  haveOnlyOneSheet: false,
                ),
                dialogHasBottomPadding: true,
              ),
              SizedBox(
                height: context.editAddressTheme.spacingM,
              ),
              TextFieldDialog<String>(
                fillButtonText: editAddressLocalizedStrings
                        ?.addressButtonText ??
                    context.getEditAddressLocalizedStrings.addressButtonText,
                errorMapper: addressErrorMapper,
                label: editAddressLocalizedStrings?.addressLabelText ??
                    context.getEditAddressLocalizedStrings.addressLabelText,
                emptyLabel: editAddressLocalizedStrings?.addressEmptyLabel ??
                    context.getEditAddressLocalizedStrings.addressEmptyLabel,
                value: address.data?.streetAddress,
                onChanged: (street) => bloc.events.setStreet(street),
                validator: validator,
                editFieldType: EditFieldType.editfield,
                configuration: const TextFieldConfiguration(
                  haveOnlyOneSheet: false,
                ),
                dialogHasBottomPadding: true,
              ),
            ],
          ),
        ),
      );

  static Widget withDependencies<T extends PickerItemModel>(
    BuildContext context,
    AddressModel addressModel,
    OnAddressChange onAddressChange, {
    required RxFieldException<String> Function(
            Object error, BuildContext context)
        cityErrorMapper,
    required RxFieldException<String> Function(
            Object error, BuildContext context)
        addressErrorMapper,
    required TextFieldValidator<String> validator,
    required SearchPickerService<T> searchCountryService,
    required final EditAddressService editAddressService,
    final EditAddressLocalizedStrings? editAddressLocalizedStrings,
    final SearchCountryCustomBuilders<T>? searchCountryCustomBuilders,
  }) =>
      EditAddressForm<T>(
        onAddressChange: onAddressChange,
        cityErrorMapper: cityErrorMapper,
        addressErrorMapper: addressErrorMapper,
        validator: validator,
        searchCountryService: searchCountryService,
        editAddressLocalizedStrings: editAddressLocalizedStrings,
        searchCountryCustomBuilders: searchCountryCustomBuilders,
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
