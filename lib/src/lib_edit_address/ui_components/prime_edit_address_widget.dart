import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:flutter_rx_bloc/rx_form.dart';
import 'package:provider/provider.dart';

import '../../../edit_address.dart';
import '../../../search_picker.dart';
import '../../../widget_toolkit.dart';
import '../blocs/edit_address_bloc.dart';
import '../di/edit_address_dependencies.dart';
import 'country_picker_bottom_sheet.dart';

typedef OnAddressChange = Function(AddressModel addressModel);

class PrimeEditAddressWidget<T extends PickerItemModel>
    extends StatelessWidget {
  const PrimeEditAddressWidget({
    required this.onAddressChange,
    required this.cityErrorMapper,
    required this.addressErrorMapper,
    required this.validator,
    required this.searchCountryService,
    required this.editAddressLocalizedStrings,
    this.countryCustomIcon,
    this.editCountryFieldType = PrimeEditFieldType.dropdown,
    this.cityCustomIcon,
    this.editCityFieldType = PrimeEditFieldType.editfield,
    this.addressCustomIcon,
    this.editAddressFieldType = PrimeEditFieldType.editfield,
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
  final dynamic countryCustomIcon;
  final PrimeEditFieldType editCountryFieldType;
  final dynamic cityCustomIcon;
  final PrimeEditFieldType editCityFieldType;
  final dynamic addressCustomIcon;
  final PrimeEditFieldType editAddressFieldType;
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
                builder: (context, snapshot, bloc) => PrimeEditFieldWidget(
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
                  customIcon: countryCustomIcon,
                  type: editCountryFieldType,
                ),
              ),
              SizedBox(
                height: context.editAddressTheme.spacingM,
              ),
              PrimeTextFieldDialog<String>(
                appFillButtonText:
                    editAddressLocalizedStrings?.cityButtonText ??
                        context.getEditAddressLocalizedStrings.cityButtonText,
                errorMapper: cityErrorMapper,
                label: editAddressLocalizedStrings?.cityLabelText ??
                    context.getEditAddressLocalizedStrings.cityLabelText,
                emptyLabel: editAddressLocalizedStrings?.cityEmptyLabel ??
                    context.getEditAddressLocalizedStrings.cityEmptyLabel,
                value: address.data?.city,
                onChanged: (city) => bloc.events.setCity(city),
                validator: validator,
                appEditFieldCustomIcon: cityCustomIcon,
                appEditFieldType: editCityFieldType,
                configuration: const TextFieldConfiguration(
                  haveOnlyOneSheet: false,
                ),
                dialogHasBottomPadding: false,
              ),
              SizedBox(
                height: context.editAddressTheme.spacingM,
              ),
              PrimeTextFieldDialog<String>(
                appFillButtonText: editAddressLocalizedStrings
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
                appEditFieldCustomIcon: addressCustomIcon,
                appEditFieldType: editAddressFieldType,
                configuration: const TextFieldConfiguration(
                  haveOnlyOneSheet: false,
                ),
                dialogHasBottomPadding: false,
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
    final dynamic countryCustomIcon,
    final PrimeEditFieldType editCountryFieldType = PrimeEditFieldType.dropdown,
    final dynamic cityCustomIcon,
    final PrimeEditFieldType editCityFieldType = PrimeEditFieldType.editfield,
    final dynamic addressCustomIcon,
    final PrimeEditFieldType editAddressFieldType =
        PrimeEditFieldType.editfield,
    final SearchCountryCustomBuilders<T>? searchCountryCustomBuilders,
  }) =>
      MultiProvider(
        providers: EditAddressDependencies.from(
                context, addressModel, editAddressService)
            .providers,
        child: PrimeEditAddressWidget<T>(
          onAddressChange: onAddressChange,
          cityErrorMapper: cityErrorMapper,
          addressErrorMapper: addressErrorMapper,
          validator: validator,
          countryCustomIcon: countryCustomIcon,
          editCountryFieldType: editCountryFieldType,
          cityCustomIcon: cityCustomIcon,
          editCityFieldType: editCityFieldType,
          addressCustomIcon: addressCustomIcon,
          editAddressFieldType: editAddressFieldType,
          searchCountryService: searchCountryService,
          editAddressLocalizedStrings: editAddressLocalizedStrings,
          searchCountryCustomBuilders: searchCountryCustomBuilders,
        ),
      );

  PrimeEditFieldState _getProfileFieldState(
    bool? isEdited,
    bool? isLoading,
  ) {
    if (isLoading != null && isLoading) {
      return PrimeEditFieldState.loading;
    }

    if (isEdited != null && isEdited) {
      return PrimeEditFieldState.edited;
    }

    return PrimeEditFieldState.notEditedYet;
  }
}
