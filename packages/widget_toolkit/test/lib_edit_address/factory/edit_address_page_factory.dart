import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';
import 'package:widget_toolkit/edit_address.dart';
import 'package:widget_toolkit/language_picker.dart';
import 'package:widget_toolkit/src/lib_edit_address/blocs/edit_address_bloc.dart';
import 'package:widget_toolkit/src/lib_edit_address/views/edit_address_page.dart';

import '../mock/edit_address_mock.dart';
import '../service/edit_address_service_mock.dart';
import '../utils/edit_address_error_mapper_util.dart';

/// Change the parameters according the the needs of the test
Widget editAddressPageFactory({
  bool? showError,
  AddressModel? onAddressSet,
  bool? isLoading,
  ErrorModel? errors,
  String? street,
  String? city,
  bool? isCountryEdited,
  CountryModel? country,
  AddressModel? address,
}) =>
    Scaffold(
      body: MultiProvider(
        providers: [
          RxBlocProvider<EditAddressBlocType>.value(
            value: editAddressMockFactory(
              onAddressSet: onAddressSet,
              isLoading: isLoading,
              errors: errors,
              street: street,
              city: city,
              isCountryEdited: isCountryEdited,
              country: country,
              address: address,
            ),
          ),
        ],
        child: Builder(
          builder: (context) => EditAddressPage<CountryModel>(
            editAddressErrorMapper: EditAddressErrorMapperUtil(),
            addressModel: address ??
                const AddressModel(
                  addressType: AddressTypeModel.correspondence,
                  city: 'Sofia',
                  streetAddress: 'str1',
                  country:
                      CountryModel(countryCode: 'BG', countryName: 'Bulgaria'),
                ),
            buttonText: 'Save',
            headerText: 'Contact Address',
            editAddressService:
                EditAddressServiceMock<CountryModel>(showError: showError ?? false),
            editAddressLocalizedStrings: EditAddressLocalizedStrings(context),
            onAddressSaved: (AddressModel addressModel) {},
          ),
        ),
      ),
    );

/// Change the parameters according the the needs of the test
Widget createEditAddressWidget({
  AddressModel? onAddressSet,
  bool? isLoading,
  ErrorModel? errors,
  String? street,
  String? city,
  bool? isCountryEdited,
  CountryModel? country,
  AddressModel? address,
}) =>
    Scaffold(
      body: MultiProvider(
        providers: [
          RxBlocProvider<EditAddressBlocType>.value(
            value: editAddressMockFactory(
              onAddressSet: onAddressSet,
              isLoading: isLoading,
              errors: errors,
              street: street,
              city: city,
              isCountryEdited: isCountryEdited,
              country: country,
              address: address,
            ),
          ),
        ],
        child: Builder(
          builder: (context) => EditAddressWidget<CountryModel>(
            editAddressErrorMapper: EditAddressErrorMapperUtil(),
            addressModel: address ??
                const AddressModel(
                  addressType: AddressTypeModel.correspondence,
                  city: 'Sofia',
                  streetAddress: 'str1',
                  country:
                      CountryModel(countryCode: 'BG', countryName: 'Bulgaria'),
                ),
            editAddressService: EditAddressServiceMock(showError:  false),
            editAddressLocalizedStrings: EditAddressLocalizedStrings(context),
          ),
        ),
      ),
    );
