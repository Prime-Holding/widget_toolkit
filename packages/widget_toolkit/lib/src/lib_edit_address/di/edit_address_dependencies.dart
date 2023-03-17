import 'package:flutter/widgets.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../blocs/edit_address_bloc.dart';
import '../models/address_model.dart';
import '../services/city_service.dart';
import '../services/country_service.dart';
import '../services/edit_address_service.dart';
import '../services/street_service.dart';

class EditAddressDependencies<T> {
  EditAddressDependencies._(
      this.context, this._addressModel, this._editAddressService);

  factory EditAddressDependencies.from(
          BuildContext context,
          AddressModel addressModel,
          EditAddressService<T> editAddressService) =>
      EditAddressDependencies._(context, addressModel, editAddressService);

  final BuildContext context;
  final AddressModel _addressModel;
  final EditAddressService<T> _editAddressService;

  late List<SingleChildWidget> providers = [
    ..._services,
    ..._blocs,
  ];

  late final List<SingleChildWidget> _services = [
    Provider<CountryService<T>>(
      create: (context) =>
          CountryService<T>(editAddressService: _editAddressService),
    ),
    Provider<CityService>(
      create: (context) => CityService(editAddressService: _editAddressService),
    ),
    Provider<StreetService>(
      create: (context) =>
          StreetService(editAddressService: _editAddressService),
    ),
  ];

  late final List<RxBlocProvider> _blocs = [
    RxBlocProvider<EditAddressBlocType>(
      create: (context) => EditAddressBloc(
        addressModel: _addressModel,
        service: _editAddressService,
      ),
    ),
  ];
}
