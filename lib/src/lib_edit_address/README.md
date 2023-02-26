# Edit Address Dialog

Edit Address package is useful when we need to edit an address, which appears in a bottom dialog,
or show a message for permanent address, which is not editable and also appears in a bottom dialog.
There are possible customizations such as passing custom error mappers for city and address text 
input values, a custom header text for the bottom modal sheet, custom text labels for the
widgets and custom text for the buttons. A text field validation service should be provided for the 
city and address input fields and a service with method providing logic for the save address event.
Also custom icons for the country, city and address widgets can be provided.

## Widgets

Within the `edit_address` package you can create a `EditAddressWidget` widget in order
to show an edit address dialog. 

### `EditAddressWidget`

The `EditAddressWidget` is a widget for displaying an edit address modal sheet with some
pre-configured options.

`addressModel` is the current address information, which is provided to be displayed in the widgets 
inside the page.
`cityErrorMapper` a function, which maps the the exceptions thrown from the validation methods 
inside the class implementing the `TextFieldValidator`class. The methods in that class validate 
the input String value for the edit city text input field. The `cityErrorMapper` should map the 
exception to a RxFieldException.
`addressErrorMapper` a function, which maps the the exceptions thrown from the validation methods 
inside the class implementing the `TextFieldValidator`class. The methods in that class validate the 
input String value for the edit address text input field. The `addressErrorMapper` should map the 
exception to a RxFieldException.
`validator` is a service validator class, which provides methods with validation implementation for 
the input values of the city and address input values.
`countryCustomIcon` receives a custom icon for the country widget. To use a custom icon, the 
`editCountryFieldType` should be of type EditFieldType.custom.
`cityCustomIcon` receives a custom icon for the city button. To use a custom icon, the 
`editCityFieldType` should be of type EditFieldType.custom.
`addressCustomIcon` receives a custom icon for the city button. To use a custom icon, the
`editAddressFieldType` should be of type EditFieldType.custom.
`configuration` is a configuration for the edit address bottom sheet.
`editAddressService` received an extension class of `EditAddressService` with implementation of the 
logic for the main edit contact address save button logic.
`editContactAddressErrorBuilder` is a custom error builder for the contact address modal sheet.
`searchCountryCustomBuilders` is a class which accepts showEmptyWidgetWhenNoResultsAreFound,
custom item builder, error builder, empty builder, separator builder for the search country item
picker.

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

Additional step is the requirement to add the EditAddressTheme as a
extension to your ThemeData.

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

Complete example for EditAddressWidget usage:

```dart
EditAddressWidget<CountryModel>(
    editAddressLocalizedStrings: EditAddressLocalizedStrings(context),
    addressModel: AddressModel(
      addressType: AddressTypeModel.correspondence,
      city: 'Plovdiv',
      streetAddress: 'street 1',
      country: CountryModel(countryCode: 'BG', countryName: 'Bulgaria'),
    ),
    type: UserProfileCardTypes.mailingAddress,
    cityErrorMapper: (obj, context) =>
        EditAddressErrorMapperUtil<String>().cityErrorMapper(obj, context),
    addressErrorMapper: (obj, context) =>
        EditAddressErrorMapperUtil<String>().addressErrorMapper(obj, context),
    validator: context.read<EditAddressFieldsService>(),
    configuration: EditAddressConfiguration(
      isDismissible: true,
      heightFactor: null,
      fullScreen: false),
    countryCustomIcon: Assets.deliveryBlack,
    editCountryFieldType: EditFieldType.custom,
    cityCustomIcon: Assets.deliveryBlack,
    editCityFieldType: EditFieldType.custom,
    addressCustomIcon: Assets.deliveryBlack,
    editAddressFieldType: EditFieldType.custom,
    searchCountryService: SearchCountryService(
      SearchCountryRepository(),
      true,
    ),
    editAddressService: SaveAddressService(),
    editContactAddressErrorBuilder:(myException) => _customErrorBuilder(myException!, context),
    searchCountryCustomBuilders: SearchCountryCustomBuilders<CountryModel>(
        showEmptyWidgetWhenNoResultsAreFound: _showEmptyWidgetOnSearchCountryWhenNoResults(context),
        itemBuilder: (ctx, item, isSelected, isLoading) =>
          _buildSearchPickerCustomItem(item, isSelected, isLoading),
        separatorBuilder: (index) => _buildSearchPickerCustomSeparator(),
        errorBuilder: (error) => _buildSearchPickerCustomError(error),
        emptyBuilder: () => _buildSearchPickerCustomEmpty(),
    ),
),
```

---