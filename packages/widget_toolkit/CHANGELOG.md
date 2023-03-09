## [0.0.1-dev5] - March 08, 2023
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

## [0.0.1-dev4] - February 27, 2023
- Fix screenshots

## [0.0.1-dev2] - February 27, 2023
 - Fix static analysis issues

## [0.0.1-dev1] - February 27, 2023
- Initial release of the following libraries
  -  [Shimmer](https://github.com/Prime-Holding/widget_toolkit/packages/widget_toolkit/tree/master/doc/shimmer.md)
  -  [Item Picker](https://github.com/Prime-Holding/widget_toolkit/packages/widget_toolkit/tree/master/doc/item-picker.md)
  -  [Open Url](https://github.com/Prime-Holding/widget_toolkit/packages/widget_toolkit/tree/master/doc/open-url.md)
  -  [Language Picker](https://github.com/Prime-Holding/widget_toolkit/packages/widget_toolkit/tree/master/doc/language-picker.md)
  -  [UI Components](https://github.com/Prime-Holding/widget_toolkit/packages/widget_toolkit/tree/master/doc/ui-components.md)
  -  [Edit Address](https://github.com/Prime-Holding/widget_toolkit/packages/widget_toolkit/tree/master/doc/edit-address.md)
  -  [Text Field Dialog](https://github.com/Prime-Holding/widget_toolkit/packages/widget_toolkit/tree/master/doc/text-field-dialog.md)
  -  [Search Picker](https://github.com/Prime-Holding/widget_toolkit/packages/widget_toolkit/tree/master/doc/search-picker.md)
