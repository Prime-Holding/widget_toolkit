# Widget Toolkit

The Widget Toolkit package consists of several smaller lightweight UI modules to increase productivity and development time spent on those features.

## Contents:

- [Shimmer][shimmer_pkg]
- [Item Picker][item_picker_pkg]
- [Open Url][open_url_pkg]
- [Language Picker][language_picker_pkg]
- [Common Utilities][common_utilities_pkg]
- [Edit Address][edit_address]
- [Text Field Dialog][text_field_dialog]
- [Search Picker][search_picker]

## How to use

In order to start using this package you need to add the dependency to the `widget_toolkit` in
your `pubspec.yaml` file.

```yaml
widget_toolkit:
```

After that you can import any of the specific packages into your file and start using the described functionalities. For more information on specific widgets or functionalities the packages provide, please check the packages in the `Contents` section above.

Alternatively, you can import all of the packages by importing the following line:

`import 'package:widget_toolkit/widget_toolkit.dart';`

after which you are ready to start using the widgets in your app.


## Setup

List of available themes:
- PrimeComponentsTheme
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

[shimmer_pkg]: https://github.com/Prime-Holding/widget_toolkit/tree/master/lib/src/shimmer
[item_picker_pkg]: https://github.com/Prime-Holding/widget_toolkit/tree/master/lib/src/lib_item_picker
[open_url_pkg]: https://github.com/Prime-Holding/widget_toolkit/tree/master/lib/src/open_url
[item_picker_pkg]: https://github.com/Prime-Holding/widget_toolkit/tree/master/lib/src/src/lib_item_picker
[language_picker_pkg]: https://github.com/Prime-Holding/widget_toolkit/tree/master/lib/src/lib_language_picker
[common_utilities_pkg]: https://github.com/Prime-Holding/widget_toolkit/tree/master/lib/src/common
[edit_address]: https://github.com/Prime-Holding/widget_toolkit/tree/master/lib/src/lib_edit_address
[text_field_dialog]: https://github.com/Prime-Holding/widget_toolkit/tree/master/lib/src/lib_text_field_dialog
[search_picker]: https://github.com/Prime-Holding/widget_toolkit/tree/master/lib/src/lib_search_picker
