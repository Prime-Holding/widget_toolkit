import '../../helpers/golden_helper.dart';
import '../../helpers/models/scenario.dart';
import '../../mocks/stubs.dart';
import '../factory/edit_address_page_factory.dart';

void main() {
  runGoldenTests([
    generateDeviceBuilder(
        widget: editAddressEmptyPageFactory(
          showError: false,
          isLoading: false,
          onAddressSet: null,
          address: null,
          errors: null,
          street: null,
          city: null,
          isCountryEdited: false,
          country: null,
        ), //loading
        scenario: Scenario(name: 'edit_address_empty')),
    generateDeviceBuilder(
        widget: editAddressSuccessPageFactory(
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
        widget: editAddressEmptyPageFactory(
          showError: false,
          isLoading: true,
          onAddressSet: Stubs.addressModel,
          address: Stubs.addressModel,
          errors: null,
          street: Stubs.street,
          city: Stubs.city,
          isCountryEdited: false,
          country: Stubs.countryModelBG,
        ), //loading
        scenario: Scenario(name: 'edit_address_loading')),
    generateDeviceBuilder(
        widget: createEditAddressWidget(
          isLoading: false,
          onAddressSet: Stubs.addressModel,
          address: Stubs.addressModel,
          errors: null,
          street: Stubs.street,
          city: Stubs.city,
          isCountryEdited: false,
          country: Stubs.countryModelBG,
        ),
        scenario: Scenario(name: 'edit_address_widget'))
  ]);
}
