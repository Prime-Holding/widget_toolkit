import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:flutter_rx_bloc/rx_form.dart';
import 'package:provider/provider.dart';

import '../../../edit_address.dart';
import '../../../search_picker.dart';
import '../../../widget_toolkit.dart';
import '../../lib_edit_address/ui_components/edit_address_form.dart';
import '../blocs/edit_address_bloc.dart';
import '../di/edit_address_dependencies.dart';

typedef OnAddressSaved = Function(AddressModel addressModel);

class EditAddressPage<T extends PickerItemModel> extends StatelessWidget {
  const EditAddressPage({
    required this.onAddressSaved,
    required this.addressModel,
    required this.cityErrorMapper,
    required this.addressErrorMapper,
    required this.validator,
    required this.buttonText,
    required this.headerText,
    required this.searchCountryService,
    required this.editAddressService,
    this.editAddressLocalizedStrings,
    this.saveAddress,
    this.countryCustomIcon,
    this.editCountryFieldType = EditFieldType.dropdown,
    this.cityCustomIcon,
    this.editCityFieldType = EditFieldType.editfield,
    this.addressCustomIcon,
    this.editAddressFieldType = EditFieldType.editfield,
    this.editContactAddressErrorBuilder,
    this.searchCountryCustomBuilders,
    Key? key,
  }) : super(key: key);

  final OnAddressSaved onAddressSaved;
  final AddressModel addressModel;
  final String buttonText;
  final String headerText;
  final Function(AddressModel)? saveAddress;
  final RxFieldException<String> Function(Object error, BuildContext context)
  cityErrorMapper;
  final RxFieldException<String> Function(Object error, BuildContext context)
  addressErrorMapper;
  final TextFieldValidator<String> validator;
  final dynamic countryCustomIcon;
  final EditFieldType editCountryFieldType;
  final dynamic cityCustomIcon;
  final EditFieldType editCityFieldType;
  final dynamic addressCustomIcon;
  final EditFieldType editAddressFieldType;
  final SearchPickerService<T> searchCountryService;
  final EditAddressLocalizedStrings? editAddressLocalizedStrings;
  final EditAddressService editAddressService;
  final Widget Function(ErrorModel?)? editContactAddressErrorBuilder;
  final SearchCountryCustomBuilders<T>? searchCountryCustomBuilders;

  static Widget withDependencies<T extends PickerItemModel>(
      BuildContext context, {
        required OnAddressSaved onAddressSaved,
        required String buttonText,
        required String headerText,
        required AddressModel addressModel,
        required RxFieldException<String> Function(
            Object error, BuildContext context)
        cityErrorMapper,
        required RxFieldException<String> Function(
            Object error, BuildContext context)
        addressErrorMapper,
        required TextFieldValidator<String> validator,
        required SearchPickerService<T> searchCountryService,
        required EditAddressService editAddressService,
        final EditAddressLocalizedStrings? editAddressLocalizedStrings,
        final Function(AddressModel)? saveAddress,
        final dynamic countryCustomIcon,
        final EditFieldType editCountryFieldType = EditFieldType.dropdown,
        final dynamic cityCustomIcon,
        final EditFieldType editCityFieldType = EditFieldType.editfield,
        final dynamic addressCustomIcon,
        final EditFieldType editAddressFieldType = EditFieldType.editfield,
        final Widget Function(ErrorModel?)? editContactAddressErrorBuilder,
        final SearchCountryCustomBuilders<T>? searchCountryCustomBuilders,
      }) =>
      MultiProvider(
        providers: EditAddressDependencies
            .from(
          context,
          addressModel,
          editAddressService,
        )
            .providers,
        child: EditAddressPage<T>(
          onAddressSaved: onAddressSaved,
          buttonText: buttonText,
          headerText: headerText,
          addressModel: addressModel,
          saveAddress: saveAddress,
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
          editAddressService: editAddressService,
          searchCountryCustomBuilders: searchCountryCustomBuilders,
        ),
      );

  // void _onAddressSaved(AddressModel model) => model;
  //     // setState(() {
  //   // savedModel = model;
  // // });

  @override
  Widget build(BuildContext context) =>
      SingleChildScrollView(
        child: Padding(
          padding:
          EdgeInsets.only(bottom: MediaQuery
              .of(context)
              .viewInsets
              .bottom),
          child: Container(
            padding: context.editAddressTheme.editAddressPageOuterMostPadding,
            color: context.editAddressTheme.editAddressPageBackgroundColor,
            child: RxBlocListener<EditAddressBlocType, AddressModel>(
              state: (bloc) => bloc.states.onAddressSaved,
              listener: (context, state) {
                print('onAddressSavedListener: $state');
                  // SchedulerBinding.instance.scheduleFrameCallback((timeStamp) {
                    onAddressSaved(state);
                  // });
              },
              child: RxBlocBuilder<EditAddressBlocType, AddressModel>(
                state: (bloc) => bloc.states.onAddressSaved,
                builder: (context, snapshot, bloc) =>

                   Column(
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
                      if (snapshot.hasData)
                        MessagePanelWidget(
                          message: editAddressLocalizedStrings
                              ?.addressChangedMessage ??
                              context.getEditAddressLocalizedStrings
                                  .addressChangedMessage,
                          messageState: MessagePanelState.positiveCheck,
                        ),
                      MessagePanelError<EditAddressBlocType>(
                        errorState: (bloc) => bloc.states.errors,
                        errorBuilder: editContactAddressErrorBuilder,
                        padding: context
                            .editAddressTheme.editAddressPageErrorPanelPadding,
                      ),
                      if (!snapshot.hasData)
                        EditAddressForm.withDependencies<T>(
                          context,
                          addressModel,
                              (addressModel) {
                            return context
                                .read<EditAddressBlocType>()
                                .events
                                .setAddress(addressModel);
                          },
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
                          editAddressLocalizedStrings:
                          editAddressLocalizedStrings,
                          editAddressService: editAddressService,
                          searchCountryCustomBuilders:
                          searchCountryCustomBuilders,
                        ),
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
                  )
                ,
              ),
            ),
          ),
        ),
      );
}
