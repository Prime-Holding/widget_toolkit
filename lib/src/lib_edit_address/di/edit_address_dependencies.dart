import 'package:flutter/widgets.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/single_child_widget.dart';

import '../blocs/edit_address_bloc.dart';
import '../models/address_model.dart';
import '../services/edit_address_service.dart';

class EditAddressDependencies {
  EditAddressDependencies._(
      this.context, this._addressModel, this._editAddressService);

  factory EditAddressDependencies.from(BuildContext context,
          AddressModel addressModel, EditAddressService editAddressService) =>
      EditAddressDependencies._(context, addressModel, editAddressService);

  final BuildContext context;
  final AddressModel _addressModel;
  final EditAddressService _editAddressService;

  late List<SingleChildWidget> providers = [
    ..._blocs,
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
