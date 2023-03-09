import '../../../edit_address.dart';

/// A class which method's [saveAddress] implementation should provide logic for
/// the saving of the edited address.
abstract class EditAddressService {
  Future<AddressModel> saveAddress(AddressModel addressModel);
}
