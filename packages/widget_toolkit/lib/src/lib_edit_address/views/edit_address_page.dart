import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';

import '../../../edit_address.dart';
import '../../../models.dart';
import '../../../search_picker.dart';
import '../../../text_field_dialog.dart';
import '../../../ui_components.dart';
import '../blocs/edit_address_bloc.dart';
import '../ui_components/edit_address_form_with_dependencies.dart';

typedef OnAddressSaved = Function(AddressModel addressModel);

class EditAddressPage<T extends PickerItemModel> extends StatelessWidget {
  const EditAddressPage({
    required this.onAddressSaved,
    required this.addressModel,
    required this.translateError,
    required this.buttonText,
    required this.headerText,
    required this.editAddressService,
    this.onChanged,
    this.editAddressLocalizedStrings,
    this.saveAddress,
    this.editContactAddressErrorBuilder,
    this.searchCountryCustomBuilders,
    this.textFieldsModalConfiguration = const TextFieldModalConfiguration(),
    this.countryPickerModalConfiguration =
        const SearchPickerModalConfiguration(),
    super.key,
  });

  final OnAddressSaved onAddressSaved;
  final AddressModel addressModel;
  final String buttonText;
  final String headerText;
  final Function(AddressModel)? saveAddress;
  final Function(Object error) translateError;
  final Function(AddressModel? addressModel)? onChanged;
  final EditAddressLocalizedStrings? editAddressLocalizedStrings;
  final EditAddressService<T> editAddressService;
  final Widget Function(ErrorModel?)? editContactAddressErrorBuilder;
  final SearchCountryCustomBuilders<T>? searchCountryCustomBuilders;
  final TextFieldModalConfiguration textFieldsModalConfiguration;
  final SearchPickerModalConfiguration countryPickerModalConfiguration;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            padding: context.editAddressTheme.editAddressPageOuterMostPadding,
            color: context.editAddressTheme.editAddressPageBackgroundColor,
            child: RxBlocListener<EditAddressBlocType, AddressModel>(
              state: (bloc) => bloc.states.onAddressSet,
              listener: (context, state) => onChanged?.call(state),
              child: RxBlocListener<EditAddressBlocType, AddressModel>(
                state: (bloc) => bloc.states.onAddressSaved,
                listener: (context, state) => onAddressSaved(state),
                child: RxBlocBuilder<EditAddressBlocType, AddressModel>(
                  state: (bloc) => bloc.states.onAddressSaved,
                  builder: (context, snapshot, bloc) => Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: context.editAddressTheme
                            .editAddressPageOnAddressSavedPadding,
                        child: Text(
                          headerText,
                          textAlign: TextAlign.start,
                          style: context.editAddressTheme.titleBold,
                        ),
                      ),
                      MessagePanelError<EditAddressBlocType>(
                        errorState: (bloc) => bloc.states.errors.map((event) =>
                            event != null ? translateError(event) : event),
                        errorBuilder: editContactAddressErrorBuilder,
                        padding: context
                            .editAddressTheme.editAddressPageErrorPanelPadding,
                      ),
                      if (!snapshot.hasData)
                        EditAddressFormWithDependencies<T>(
                            addressModel: addressModel,
                            onAddressChange: (addressModel) => context
                                .read<EditAddressBlocType>()
                                .events
                                .setAddress(addressModel),
                            translateError: translateError,
                            editAddressLocalizedStrings:
                                editAddressLocalizedStrings,
                            editAddressService: editAddressService,
                            searchCountryCustomBuilders:
                                searchCountryCustomBuilders,
                            textFieldsModalConfiguration:
                                textFieldsModalConfiguration,
                            countryPickerModalConfiguration:
                                countryPickerModalConfiguration),
                      if (!snapshot.hasData)
                        SizedBox(height: context.editAddressTheme.spacingXL),
                      if (!snapshot.hasData)
                        RxBlocBuilder<EditAddressBlocType, bool>(
                          state: (bloc) => bloc.states.isLoading,
                          builder: (context, isLoadingSnapshot, bloc) =>
                              RxBlocBuilder<EditAddressBlocType, AddressModel>(
                            state: (bloc) => bloc.states.onAddressSet,
                            builder: (context, address, bloc) =>
                                GradientFillButton(
                              elevation: 0,
                              text: buttonText,
                              state: isLoadingSnapshot.data ?? false
                                  ? ButtonStateModel.loading
                                  : ButtonStateModel.enabled,
                              areIconsClose: true,
                              onPressed: () async {
                                if (saveAddress == null) {
                                  context
                                      .read<EditAddressBlocType>()
                                      .events
                                      .saveAddress();
                                } else {
                                  if (address.hasData) {
                                    saveAddress?.call(address.data!);
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
