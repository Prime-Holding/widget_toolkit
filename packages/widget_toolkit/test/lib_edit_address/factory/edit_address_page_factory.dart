import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';
import 'package:widget_toolkit/edit_address.dart';
import 'package:widget_toolkit/language_picker.dart';
import 'package:widget_toolkit/src/lib_edit_address/blocs/edit_address_bloc.dart';
import 'package:widget_toolkit/src/lib_edit_address/services/city_service.dart';
import 'package:widget_toolkit/src/lib_edit_address/services/street_service.dart';
import 'package:widget_toolkit/src/lib_edit_address/views/edit_address_page.dart';

import '../mock/edit_address_mock.dart';
import '../service/city_service_mock.dart';
import '../service/edit_address_service_mock.dart';
import '../service/street_service_mock.dart';
import '../utils/edit_address_error_mapper_util.dart';

/// Change the parameters according the needs of the test
Widget editAddressEmptyPageFactory({
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
          Provider(
            create: (context) => EditAddressServiceMock<CountryModel>(
                showError: showError ?? false),
          ),
          Provider<CityService>(
            create: (context) => CityServiceMock(
                editAddressService:
                    context.read<EditAddressServiceMock<CountryModel>>()),
          ),
          Provider<StreetService>(
            create: (context) => StreetServiceMock(
                editAddressService:
                    context.read<EditAddressServiceMock<CountryModel>>()),
          ),
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
            addressModel: address ??
                const AddressModel(
                  addressType: AddressTypeModel.correspondence,
                  city: 'Sofia',
                  streetAddress: 'str1',
                  country:
                      CountryModel(countryCode: 'BG', countryName: 'Bulgaria'),
                ),
            translateError: (obj) => EditAddressErrorMapperUtil<String>()
                .translateError(obj, context),
            buttonText: 'Save',
            headerText: 'Contact Address',
            editAddressService:
                context.read<EditAddressServiceMock<CountryModel>>(),
            editAddressLocalizedStrings: EditAddressLocalizedStrings(context),
            onAddressSaved: (AddressModel addressModel) {},
          ),
        ),
      ),
    );

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
            initialAddress: address ??
                const AddressModel(
                  addressType: AddressTypeModel.correspondence,
                  city: 'Sofia',
                  streetAddress: 'str1',
                  country:
                      CountryModel(countryCode: 'BG', countryName: 'Bulgaria'),
                ),
            translateError: (obj) => EditAddressErrorMapperUtil<String>()
                .translateError(obj, context),
            service: EditAddressServiceMock(showError: false),
            localizedStrings: EditAddressLocalizedStrings(context),
          ),
        ),
      ),
    );

Widget editAddressSuccessPageFactory({
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
          builder: (context) => EditAddressPage.withDependencies<CountryModel>(
            context,
            addressModel: address ??
                const AddressModel(
                  addressType: AddressTypeModel.correspondence,
                  city: 'Sofia',
                  streetAddress: 'str1',
                  country:
                      CountryModel(countryCode: 'BG', countryName: 'Bulgaria'),
                ),
            translateError: (obj) => EditAddressErrorMapperUtil<String>()
                .translateError(obj, context),
            buttonText: 'Save',
            headerText: 'Contact Address',
            editAddressService: EditAddressServiceMock<CountryModel>(
                showError: showError ?? false),
            editAddressLocalizedStrings: EditAddressLocalizedStrings(context),
            onAddressSaved: (AddressModel addressModel) {},
          ),
        ),
      ),
    );
