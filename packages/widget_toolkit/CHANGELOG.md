## [0.0.1-dev6] - TBE
- Removed params `showEditAddressBottomSheet(cityErrorMapper: , addressErrorMapper)`
- Added params `showEditAddressBottomSheet(Function(Object error) translateError)`
- Removed params `EditAddressWidget(cityErrorMapper:, addressErrorMapper)`
- Added params `EditAddressWidget(Function(Object error) translateError)`
- Removed params `TextFieldDialog(errorMapper: )`
- Added params `TextFieldDialog(Function(Object error) translateError)`
- Removed params `ModalConfiguration(additionalBottomPadding:)`
- Removed params `EditAddressConfiguration(additionalBottomPadding:)`
- Removed params `ItemPickerModalConfiguration(additionalBottomPadding:)`
- Removed params `LanguagePickerModalConfiguration(additionalBottomPadding:)`
- Removed params `SearchPickerModalConfiguration(additionalBottomPadding:)`
- Removed params `TextFieldModalConfiguration(additionalBottomPadding:)`

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
