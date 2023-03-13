# Edit Address Dialog

Edit Address package is useful when we need to edit an address, which appears in a bottom dialog,
or show a message for a permanent address, which is not editable and also appears in a bottom dialog.
There are a lot of possible customizations such as passing a translation error function for the errors
thrown from the validation of the city and address text input values. There is a localization file in 
English, with default values for each string used in the library, which can be overriden. The library 
provides a theme with default spacings, text styles, colors, EdgeInsets and icons, which can be
overriden. There is a default service class, which provides default implementation for some of its
methods. For example, for validation of the city and street input values and for filtering countries
by name there is a default implementation. For the other methods, for example for fetching the list 
of countries and for saving the address, a custom implementation should be provided. Each of the 
bottom sheets can have custom configuration. From more information check the complete example in the
documentation.

## Widgets

Within the `edit_address` package you can create a `EditAddressWidget` widget in order
to show an edit address dialog. 

### `EditAddressWidget`

The `EditAddressWidget` is a widget for displaying an edit address modal sheet with some
pre-configured options.

`translateError` provide a function which maps the city and street validation errors from the 
`service` service to the appropriate RxFieldException<String>, which is an ui error with text.
`service` received an implementation of the `EditAddressService` class. The API of the class provides 
methods for the logic for the main save address button, fetching of the list of countries, filtering
the countries list, validating the city and street values while typing and when pressing the save
button for each of them. Some methods have default implementation. For more information, check the 
documentation in the file `EditAddressService` class.
`onChanged` receives a function, which accepts the edited address model.
`initialAddress` is the current address information, which is provided to be displayed in the
widgets inside the page.
`searchCountryBuilders` is a class which accepts showEmptyWidgetWhenNoResultsAreFound, custom item builder,
error builder, empty builder, separator builder for the search country item picker.
`editContactAddressErrorBuilder` is a custom error builder for the contact address modal sheet
`localizedStrings` receives a class, which should implement `EditAddressLocalizedStrings`, it should
provided translation for the strings in the package.
`configuration` is a configuration for the edit address bottom sheet.
`type` depending on the selected type, a different type of modal bottom sheet is displayed. Currently
choosing `UserProfileCardTypes.permanentAddress`displays a permanent address bottom sheet.
`textFieldsModalConfiguration` is the configuration for the city and street bottom sheets.
`countryPickerModalConfiguration` is the configuration for the country picker.

### How to override the icons in the library 

Here is an example how to override the icons in the library for the light theme. You should use the
`copyWith()` method and create a new `SvgFile`, which receives the path to the svg file, that you 
want to use, to override the specific icon.

```dart
//theme
//...
ThemeData(
extensions: [
  // Here you provide the new icon for the icon in EditAddressWidget
  EditAddressTheme.light.copyWith(editPenIcon: const SvgFile('assets/new-edit-pen.svg')),
  TextFieldDialogTheme.light
  // Here you provide the new icon for the city and street text fields
    .copyWith(editPenIcon: const SvgFile('assets/new-edit-pen.svg'),
  // Here you provide the new icon for the country search picker
  arrowRightSquareIcon: const SvgFile('assets/new-forward.svg')),
]);
//..
```

To load your local svg files in the project, you should add the path to them in your pubspec.yaml

```yaml
flutter:
  assets:
    - assets/
```


### `EditAddressLocalizedStrings`

The `EditAddressLocalizedStrings` is a class, which provides values to all labels used in the 
package. If you do not extend it and do not provide your values for the getters, the default values in
English will be used. The value are provided for the country, city and address widgets. Here are the
default string getters, which the class provides.

`saveButtonText` is the text displayed inside the button at the bottom of the edit address page.
`headerTitle` is the text displayed at the top of the edit address page and at the top of the
permanent address page.
`permanentAddressContentMessage` is the text message displayed inside the permanent address page.
`countrySearchPickerTitle` is the text at the top of the country search picker page.
`countrySearchPickerHintText` is the text in the country search page, text input field.
`countrySearchPickerRetryText` is a text displayed in retry button, which is displayed, when 
there is an exception on the country search page.
`countryLabelText` the label text for the country widget.
`cityButtonText` is text in the button inside the edit city page.
`cityLabelText` is the label text of the city widget.
`cityEmptyLabel` is a value displayed if there is a null value provided for the city name.
`addressButtonText` is a text inside button in the page with the address edit input field.
`addressLabelText` is a label text displayed on the address widget.
`addressEmptyLabel` is value displayed if there is a null value provided for the address name.
`addressChangedMessage` is a message displayed, when an address is changed successfully.

## How to use

In order to start using this package you need to add the dependency to the `widget_toolkit` in
your `pubspec.yaml` file.

```yaml
widget_toolkit: any
```

After that you can import the package with the following line:

`import 'package:widget_toolkit/edit_address.dart';`

Additional step is the requirement to add the `EditAddressTheme` as an extension to your `ThemeData`.

as an example:

```dart
//theme
//...
extensions: [
    darkMode ? WidgetToolkitTheme.dark : WidgetToolkitTheme.light,
    darkMode ? EditAddressTheme.dark : EditAddressTheme.light,
]
//..
```

Minimal configuration example of `EditAddressWidget`:

```dart
EditAddressWidget<CountryModel>(
  translateError: (obj) => EditAddressErrorMapperUtil<String>()
      .translateError(obj, context),
  editAddressService: CustomEditAddressService<CountryModel>(),
);
```

Complete configuration example of `EditAddressWidget`:

```dart
EditAddressWidget<CountryModel>(
  translateError: (obj) => EditAddressErrorMapperUtil<String>()
      .translateError(obj, context),
  editAddressService: CustomEditAddressService<CountryModel>(
    searchRepository: SearchCountryRepository(),
  ),
  onChanged: (addressModel) =>
      print('Address model: $addressModel'),
  addressModel: const AddressModel(
    addressType: AddressTypeModel.correspondence,
    city: 'Plovd',
    streetAddress: 'str1',
    country: CountryModel.withDefaults(),
  ),
  editAddressLocalizedStrings: EditAddressLocalization(context),
  type: UserProfileCardTypes.mailingAddress,
  editAddressConfiguration: const EditAddressConfiguration(
      safeAreaBottom: true,
      contentAlignment: MainAxisAlignment.start,
      additionalBottomPadding: 10,
      fullScreen: false,
      haveOnlyOneSheet: false,
      showHeaderPill: true,
      showCloseButton: true,
      heightFactor: 0.6,
      dialogHasBottomPadding: true,
      isDismissible: true),
  editContactAddressErrorBuilder: (errorMode) => _buildCustomErrorBuilder(errorMode),
  searchCountryCustomBuilders: SearchCountryCustomBuilders<CountryModel>(
    showEmptyWidgetWhenNoResultsAreFound: true,
    itemBuilder: (context, model, isSelected, isLoading) => 
      _buildCustomItemBuilder(context, model, isSelected, isLoading),
    errorBuilder: (exception) => _buildCustomCountryErrorBuilder(exception),
    emptyBuilder: () => _buildCustomEmptyBuilder(),
    separatorBuilder: (index) => _buildCustomSeparatorBuilder(index),
  ),
  textFieldsModalConfiguration: const TextFieldModalConfiguration(
    safeAreaBottom: false,
    contentAlignment: MainAxisAlignment.start,
    additionalBottomPadding: 10,
    fullScreen: false,
    haveOnlyOneSheet: true,
    showHeaderPill: true,
    showCloseButton: true,
    heightFactor: 0.6,
    dialogHasBottomPadding: true,
    isDismissible: true,
  ),
  countryPickerModalConfiguration:
      const SearchPickerModalConfiguration(
    safeAreaBottom: false,
    contentAlignment: MainAxisAlignment.start,
    additionalBottomPadding: 10,
    fullScreen: false,
    haveOnlyOneSheet: true,
    showHeaderPill: true,
    showCloseButton: true,
    heightFactor: 0.6,
    dialogHasBottomPadding: true,
    isDismissible: true,
  ),
);
```

---