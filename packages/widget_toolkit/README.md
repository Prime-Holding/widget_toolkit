![CI][ci_badge_lnk] [![codecov][codecov_badge_lnk]][codecov_branch_lnk] ![style][code_style_lnk] ![license][license_lnk]

# Widget Toolkit

The Widget Toolkit package consists of several lightweight and customisable UI components that boost productivity and reduce the development time.

## Contents:

- [UI Components][ui_components_doc]
- [Shimmer][shimmer_doc]
- [URL Launcher][open_url_doc]
- [Item Picker][item_picker_doc]
- [Language Picker][language_picker_doc]
- [Search Picker][search_picker-_doc]
- [Text Field Dialog][text_field_dialog_doc]
- [Edit Address][edit_address_doc]

## Demo

| Item Picker (multi-select)| Item Picker (single select)| Language Picker |
|---------------------------------------|-----------------------------|-----------------------------|
| <img src="https://raw.githubusercontent.com/Prime-Holding/widget_toolkit/master/packages/widget_toolkit/doc/assets/multi-item-picker.gif" alt="Address Widget"> | <img src="https://raw.githubusercontent.com/Prime-Holding/widget_toolkit/master/packages/widget_toolkit/doc/assets/single-item-picker.gif" alt="Language Picker"></img> | <img src="https://raw.githubusercontent.com/Prime-Holding/widget_toolkit/master/packages/widget_toolkit/doc/assets/language-picker.gif" alt="Language Picker"></img> |
| Search Picker| Shimmer | Launch URL |
| <img src="https://raw.githubusercontent.com/Prime-Holding/widget_toolkit/master/packages/widget_toolkit/doc/assets/search-picker.gif" alt="Address Widget"> | <img src="https://raw.githubusercontent.com/Prime-Holding/widget_toolkit/master/packages/widget_toolkit/doc/assets/shimmer.gif" alt="Language Picker"></img> | <img src="https://raw.githubusercontent.com/Prime-Holding/widget_toolkit/master/packages/widget_toolkit/doc/assets/url.gif" alt="Language Picker"></img> |
| Error Bottom Sheet | Text Field Dialog | Address Dialog |
| <img src="https://raw.githubusercontent.com/Prime-Holding/widget_toolkit/master/packages/widget_toolkit/doc/assets/error-bottom-sheet.gif" alt="Address Widget"> | <img src="https://raw.githubusercontent.com/Prime-Holding/widget_toolkit/master/packages/widget_toolkit/doc/assets/text-field-dialog.gif" alt="Language Picker"></img> | <img src="https://raw.githubusercontent.com/Prime-Holding/widget_toolkit/master/packages/widget_toolkit/doc/assets/address.gif" alt="Language Picker"></img> |


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
      ItemPickerTheme.light(),
    ],
  ),
  darkTheme: ThemeData.dark().copyWith(
    extensions: <ThemeExtension<dynamic>>[
      ItemPickerTheme.dark(),
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
      ItemPickerTheme.light().copyWith(
          backgroundColor: Colors.orange,
          iconColor: Colors.red,
          icon: Icons.ac_unit_outlined,
        ),
    ],
...
```


[ci_badge_lnk]: https://github.com/Prime-Holding/widget_toolkit/workflows/CI/badge.svg
[codecov_badge_lnk]: https://codecov.io/gh/Prime-Holding/widget_toolkit/packages/widget_toolkit/branch/master/graph/badge.svg
[codecov_branch_lnk]: https://codecov.io/gh/Prime-Holding/widget_toolkit/packages/widget_toolkit/branch/master
[code_style_lnk]: https://img.shields.io/badge/style-effective_dart-40c4ff.svg
[license_lnk]: https://img.shields.io/badge/license-MIT-purple.svg
[shimmer_pkg]: https://github.com/Prime-Holding/widget_toolkit/packages/widget_toolkit/tree/master/lib/src/lib_shimmer
[item_picker_pkg]: https://github.com/Prime-Holding/widget_toolkit/packages/widget_toolkit/tree/master/lib/src/lib_item_picker
[open_url_pkg]: https://github.com/Prime-Holding/widget_toolkit/tree/packages/widget_toolkit/master/lib/src/lib_open_url
[item_picker_pkg]: https://github.com/Prime-Holding/widget_toolkit/packages/widget_toolkit/tree/master/lib/src/src/lib_item_picker
[language_picker_pkg]: https://github.com/Prime-Holding/widget_toolkit/packages/widget_toolkit/tree/master/lib/src/lib_language_picker
[ui_components_pkg]: https://github.com/Prime-Holding/widget_toolkit/packages/widget_toolkit/tree/master/lib/src/lib_ui_components
[edit_address_pkg]: https://github.com/Prime-Holding/widget_toolkit/packages/widget_toolkit/tree/master/lib/src/lib_edit_address
[text_field_dialog_pkg]: https://github.com/Prime-Holding/widget_toolkit/packages/widget_toolkit/tree/master/lib/src/lib_text_field_dialog
[search_picker_pkg]: https://github.com/Prime-Holding/widget_toolkit/packages/widget_toolkit/tree/master/lib/src/lib_search_picker
[ui_components_doc]: https://github.com/Prime-Holding/widget_toolkit/tree/master/packages/widget_toolkit/doc/ui-components.md
[shimmer_doc]: https://github.com/Prime-Holding/widget_toolkit/tree/master/packages/widget_toolkit/doc/shimmer.md
[open_url_doc]: https://github.com/Prime-Holding/widget_toolkit/tree/master/packages/widget_toolkit/doc/open-url.md
[item_picker_doc]: https://github.com/Prime-Holding/widget_toolkit/tree/master/packages/widget_toolkit/doc/item-picker.md
[language_picker_doc]: https://github.com/Prime-Holding/widget_toolkit/tree/master/packages/widget_toolkit/doc/language-picker.md
[search_picker-_doc]: https://github.com/Prime-Holding/widget_toolkit/tree/master/packages/widget_toolkit/doc/search-picker.md
[text_field_dialog_doc]: https://github.com/Prime-Holding/widget_toolkit/tree/master/packages/widget_toolkit/doc/text-field-dialog.md
[edit_address_doc]: https://github.com/Prime-Holding/widget_toolkit/tree/master/packages/widget_toolkit/doc/edit-address.md
