## [0.1.1]
- Added `SmallButtonType.icon` type to `SmallButton` widget

## [0.1.0]
- Fixed loading state of 'SmallButton' widget
### Breaking changes:
- Removed static `.withDependencies` constructor from widgets
- Added new widgets `*WithDependencies`

## [0.0.2]
- Upgrade major versions of dependencies: `theme_tailor`, `theme_tailor_annotation`
### Breaking changes:
- Added `light()` and `dark()` constructors for each theme that previously has static `light` and `dark` fields
- Removed static fields `light` and `dark` for each of the themes

## [0.0.2-dev.3]
- Fixes and improvements

## [0.0.2-dev.2]
- Support flutter 3.19

## [0.0.2-dev.1]
- Renamed `ErrorUnknown` to `UnknownErrorModel`
- Added `L10nErrorKeyProvider` abstract class, used to provide localization keys for error messages
- `GenericErrorModel` and `EmptyListErrorModel` now implement `L10nErrorKeyProvider`

## [0.0.1-dev9]
- Requires Dart `3.0`
- Upgrade dependencies

## [0.0.1-dev8]
- Upgrade major versions of dependencies: `theme_tailor`, `theme_tailor_annotation`

## [0.0.1-dev7]
- Documentation improvements
### Breaking Changes:
- Removed params: `showChangeLanguageBottomSheet(iconRight, errorPanelIcon)`
- Added parameter `showChangeLanguageBottomSheet(Widget Function(SelectedLanguageModel model, bool loading, BuildContext context)? itemBuilder, required LanguageService service, required Function(LanguageModel language) onChanged, String Function(LanguageModel) translate)`
  -  [Language Picker API Improvements ticket](https://github.com/Prime-Holding/widget_toolkit/issues/10)

## [0.0.1-dev6]
- Documentation improvements
- `EditAddressWidget` example is added to the example project
- Fixed golden tests for `EditAddressPage`
- `EditAddressService` provides default implementation for the newly added methods: `filteredCountriesByName`, `validateCityOnSubmit`,`validateStreetOnSubmit`,`validateCityOnType`,`validateStreetOnType`,
- Added methods to `EditAddressService` without default implementation are: `getCountries`, `getCountryPlaceholderList`
### Breaking Changes:
- Removed params `showEditAddressBottomSheet(cityErrorMapper , addressErrorMapper, validator, searchCountryService, countryCustomIcon, editCountryFieldType, cityCustomIcon, editCityFieldType, addressCustomIcon, editAddressFieldType)`
- Added params `showEditAddressBottomSheet(Function(Object error) translateError, Function(AddressModel? addressModel)? onChanged)`
- Removed params `EditAddressWidget(cityErrorMapper, addressErrorMapper, validator, searchCountryService, countryCustomIcon, editCountryFieldType, cityCustomIcon, editCityFieldType, addressCustomIcon, editAddressFieldType)`
- Added params `EditAddressWidget(Function(Object error) translateError, Function(AddressModel? addressModel)? onChanged, onSaved)`
- Renamed params in `EditAddressWidget`: `editAddressService` becomes `service`, `addressModel` becomes `initialAddress`.
- `service` parameter in `EditAddressWidget` becomes required, because the default service is deleted.
- Removed params `TextFieldDialog(errorMapper)`
- Added params `TextFieldDialog(Function(Object error) translateError)`
- Removed params `ModalConfiguration(additionalBottomPadding)`
- Removed params `EditAddressConfiguration(additionalBottomPadding)`
- Removed params `ItemPickerModalConfiguration(additionalBottomPadding)`
- Removed params `LanguagePickerModalConfiguration(additionalBottomPadding)`
- Removed params `SearchPickerModalConfiguration(additionalBottomPadding)`
- Removed params `TextFieldModalConfiguration(additionalBottomPadding)`
  -  [Edit Address API Improvements ticket](https://github.com/Prime-Holding/widget_toolkit/issues/9)

## [0.0.1-dev5]
- Documentation improvements
- Add example project
- CountryModel name getter returns non nullable String
- SearchPickerService provides default implementation of method 'filteredListByName'
- IconTextButton now has transparent background
- modalBottomSheets are more configurable
- showBlurredBottomSheet (old name showModal) - UX improvements
### Breaking Changes:
- showModal is renamed to showBlurredBottomSheet
- showErrorModal is renamed to showErrorBlurredBottomSheet
- showEditAddressBottomSheet - configuration was renamed to modalConfiguration
- EditAddressWidget - configuration was renamed to editAddressConfiguration
- ItemPickerConfiguration - fullScreen was moved inside modalConfiguration
- showChangeLanguageBottomSheet - configuration was renamed to modalConfiguration
- OpenUrlWidget - errorModalSafeBottom was wrapped inside errorModalConfiguration
- showSearchPickerBottomSheet - fullScreen was moved into modalConfiguration (old name configuration)
- TextFieldDialog - configuration was renamed to modalConfiguration, dialogHasBottomPadding was moved inside modalConfiguration
- showErrorBlurredBottomSheet - safeAreaBottom was moved inside configuration

## [0.0.1-dev4]
- Fix screenshots

## [0.0.1-dev2]
 - Fix static analysis issues

## [0.0.1-dev1]
- Initial release of the following libraries
  -  [Shimmer](https://github.com/Prime-Holding/widget_toolkit/tree/master/packages/widget_toolkit/doc/shimmer.md)
  -  [Item Picker](https://github.com/Prime-Holding/widget_toolkit/tree/master/packages/widget_toolkit/doc/item-picker.md)
  -  [Open Url](https://github.com/Prime-Holding/widget_toolkit/tree/master/packages/widget_toolkit/doc/open-url.md)
  -  [Language Picker](https://github.com/Prime-Holding/widget_toolkit/tree/master/packages/widget_toolkit/doc/language-picker.md)
  -  [UI Components](https://github.com/Prime-Holding/widget_toolkit/tree/master/packages/widget_toolkit/doc/ui-components.md)
  -  [Edit Address](https://github.com/Prime-Holding/widget_toolkit/tree/master/packages/widget_toolkit/doc/edit-address.md)
  -  [Text Field Dialog](https://github.com/Prime-Holding/widget_toolkit/tree/master/packages/widget_toolkit/doc/text-field-dialog.md)
  -  [Search Picker](https://github.com/Prime-Holding/widget_toolkit/tree/master/packages/widget_toolkit/doc/search-picker.md)
