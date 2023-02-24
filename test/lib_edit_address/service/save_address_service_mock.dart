import 'package:widget_toolkit/edit_address.dart';

class SaveAddressServiceMock extends EditAddressService {
  SaveAddressServiceMock({required this.showError});

  final bool showError;

  @override
  Future<AddressModel> saveAddress(AddressModel addressModel) async {
    if (showError) {
      throw Exception('Could not save the address');
    } else {
      return addressModel;
    }
  }
}
