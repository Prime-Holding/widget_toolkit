![CI][ci_badge_lnk] [![codecov][codecov_badge_lnk]][codecov_branch_lnk] ![style][code_style_lnk] ![license][license_lnk]

# Widget Toolkit

The Widget Toolkit package consists of several lightweight and customisable UI components that boost productivity and reduce the development time.

## Contents:

- [Shimmer][shimmer_pkg]
- [Item Picker][item_picker_pkg]
- [Open Url][open_url_pkg]
- [Language Picker][language_picker_pkg]
- [Ui_Components][ui_components_pkg]
- [Edit Address][edit_address]
- [Text Field Dialog][text_field_dialog]
- [Search Picker][search_picker]

## Demo

| Item Picker (mutli-select)| Item Picker (single select)| Language Picker |
|---------------------------------------|-----------------------------|-----------------------------|
| <img src="https://raw.githubusercontent.com/Prime-Holding/widget_toolkit/master/doc/assets/multi-item-picker.gif" alt="Address Widget"> | <img src="https://raw.githubusercontent.com/Prime-Holding/widget_toolkit/master/doc/assets/single-item-picker.gif" alt="Language Picker"></img> | <img src="https://raw.githubusercontent.com/Prime-Holding/widget_toolkit/master/doc/assets/language-picker.gif" alt="Language Picker"></img> |
| Search Picker| Shimmer | Launch URL |
| <img src="https://raw.githubusercontent.com/Prime-Holding/widget_toolkit/master/doc/assets/search-picker.gif" alt="Address Widget"> | <img src="https://raw.githubusercontent.com/Prime-Holding/widget_toolkit/master/doc/assets/shimmer.gif" alt="Language Picker"></img> | <img src="https://raw.githubusercontent.com/Prime-Holding/widget_toolkit/master/doc/assets/url.gif" alt="Language Picker"></img> |
| Error Bottom Sheet | Text Field Dialog | Address Dialog |
| <img src="https://raw.githubusercontent.com/Prime-Holding/widget_toolkit/master/doc/assets/error-bottom-sheet.gif" alt="Address Widget"> | <img src="https://raw.githubusercontent.com/Prime-Holding/widget_toolkit/master/doc/assets/text-field-dialog.gif" alt="Language Picker"></img> | <img src="https://raw.githubusercontent.com/Prime-Holding/widget_toolkit/master/doc/assets/address.gif" alt="Language Picker"></img> |


## How to use

In order to start using this package you need to add the dependency to the `widget_toolkit` in
your `pubspec.yaml` file.

```yaml
widget_toolkit: any
```

After that you can import any of the specific packages into your file and start using the described functionalities. For more information on specific widgets or functionalities the packages provide, please check the packages in the `Contents` section above.

Alternatively, you can import all of the packages by importing the following line:

`import 'package:widget_toolkit/widget_toolkit.dart';`

after which you are ready to start using the widgets in your app.


## Setup

List of available themes:
- WidgetToolkitTheme
- ItemPickerTheme
- LanguagePickerTheme
- SearchPickerTheme
- TextFieldDialogTheme
- EditAddressTheme
- QrScannerTheme

Step 1: Add the package as a dependency at pubspec.yaml, inside your work project

```
//Example
dependencies:
  flutter:
    sdk: flutter
  widget_toolkit:

```

Step 2: Pass the Theme extensions you needed to the ThemeData of your app

```
MaterialApp(
  theme: ThemeData.light().copyWith(
    extensions: <ThemeExtension<dynamic>>[
      ItemPickerTheme.light,
    ],
  ),
  darkTheme: ThemeData.dark().copyWith(
    extensions: <ThemeExtension<dynamic>>[
      ItemPickerTheme.dark,
    ],
  ),
  // other parameters...
);
```

## Customization

Change the theme properties in order to change the visual outcome

```
...
extensions: [
      ItemPickerTheme.light.copyWith(
          backgroundColor: Colors.orange,
          iconColor: Colors.red,
          icon: Icons.ac_unit_outlined,
        ),
    ],
...
```

---


[ci_badge_lnk]: https://github.com/Prime-Holding/widget_toolkit/workflows/CI/badge.svg
[codecov_badge_lnk]: https://codecov.io/gh/Prime-Holding/widget_toolkit/branch/master/graph/badge.svg
[codecov_branch_lnk]: https://codecov.io/gh/Prime-Holding/widget_toolkit/branch/master
[code_style_lnk]: https://img.shields.io/badge/style-effective_dart-40c4ff.svg
[license_lnk]: https://img.shields.io/badge/license-MIT-purple.svg
[shimmer_pkg]: https://github.com/Prime-Holding/widget_toolkit/tree/master/lib/src/lib_shimmer
[item_picker_pkg]: https://github.com/Prime-Holding/widget_toolkit/tree/master/lib/src/lib_item_picker
[open_url_pkg]: https://github.com/Prime-Holding/widget_toolkit/tree/master/lib/src/lib_open_url
[item_picker_pkg]: https://github.com/Prime-Holding/widget_toolkit/tree/master/lib/src/src/lib_item_picker
[language_picker_pkg]: https://github.com/Prime-Holding/widget_toolkit/tree/master/lib/src/lib_language_picker
[ui_components_pkg]: https://github.com/Prime-Holding/widget_toolkit/tree/master/lib/src/lib_ui_components
[edit_address]: https://github.com/Prime-Holding/widget_toolkit/tree/master/lib/src/lib_edit_address
[text_field_dialog]: https://github.com/Prime-Holding/widget_toolkit/tree/master/lib/src/lib_text_field_dialog
[search_picker]: https://github.com/Prime-Holding/widget_toolkit/tree/master/lib/src/lib_search_picker
