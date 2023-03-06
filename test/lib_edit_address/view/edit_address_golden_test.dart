import '../../helpers/golden_helper.dart';
import '../../helpers/models/scenario.dart';
import '../../mocks/stubs.dart';
import '../factory/edit_address_page_factory.dart';
import '../factory/edit_address_widget.dart';

void main() {
  runGoldenTests([
    generateDeviceBuilder(
        widget: editAddressPageFactory(
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
        widget: editAddressPageFactory(
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
        widget: editAddressWidget(
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
