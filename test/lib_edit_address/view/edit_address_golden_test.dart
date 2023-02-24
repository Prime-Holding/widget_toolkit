import '../../helpers/golden_helper.dart';
import '../../helpers/models/scenario.dart';
import '../../mocks/stubs.dart';
import '../blocs/edit_address_test.mocks.dart';
import '../factory/edit_address_factory.dart';

void main() {
  runGoldenTests([
    generateDeviceBuilder(
        widget: editAddressFactory(
          showError: false,
          isLoading: false,
          onAddressSet: Stubs.addressModel,
          address: Stubs.addressModel,
          errors: null,
          street: Stubs.street,
          city: Stubs.city,
          isCountryEdited: false,
          country: Stubs.countryModelBG,
        ),
        scenario: Scenario(name: 'edit_address_success')),
    generateDeviceBuilder(
        widget: editAddressFactory(
          showError: false,
          isLoading: true,
          onAddressSet: Stubs.addressModel,
          address: Stubs.addressModel,
          errors: null,
          street: Stubs.street,
          city: Stubs.city,
          isCountryEdited: false,
          country: Stubs.countryModelBG,
          service: MockSaveAddressServiceMock(),
        ), //loading
        scenario: Scenario(name: 'edit_address_loading')),
  ]);
}
