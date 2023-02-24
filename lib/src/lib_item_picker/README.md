# Item Picker

Item Picker package is useful when we need to display an list of items and select one or more than
one of them. There is possible customizations such as passing configuration or/and custom item, separator, footer,
error and empty widgets.

## Widgets

Within the `item_picker` package you can call the `showItemPickerBottomSheet` function in order
to show your picker list.

### `showItemPickerBottomSheet`

The `showItemPickerBottomSheet` function is a convenience function for displaying an ItemPicker
modal sheet with some pre-configured options. It requires a `context`, `title`, list
of `selectedItems`, function that return a list of generic type `callback`, `service`. The package
provide even more optional customizations as part of AppItemPickerConfiguration. There you can set some
properties like `isMultiSelect`, `isItemSelectionRequired`, `isStatic`, `itemHeight`, `fullScreen`.
Another optional customization can be applied by using the `itemBuilder`, `separatorBuilder`,`footerBuilder`,
'errorBuilder' or `emptyBuilder`.

## How to use

In order to start using this package you need to add the dependency to the `widget_toolkit` in
your `pubspec.yaml` file.

```yaml
widget_toolkit: any
```

After that you can import the package with the following line:

`import 'package:widget_toolkit/item_picker.dart';`

additional step is the requirement to add the PrimeComponentsTheme and ItemPickerTheme as a extension to your ThemeData.

as an example:
```dart
//theme 
//...
extensions: [
    darkMode ? PrimeComponentsTheme.dark : PrimeComponentsTheme.light,
    darkMode ? ItemPickerTheme.dark : ItemPickerTheme.light,
]
//..
```

Complete example for showItemPickerBottomSheet usage:
```dart
showItemPickerBottomSheet<DataModel>(
    context: context,
    title: title,
    separatorBuilder: (ctx, index) => _buildCustomSeparator(index),
    footerBuilder: (ctx) => _buildCustomFooter(),
    itemBuilder: (ctx, model, isSelected, isLoading) =>
    _buildCustomListItem(model, isSelected, isLoading),
    selectedItems: _selectedDataArray,
    callback: (data) => setState(() {
    _selectedDataArray = data;
    }),
    service: DataService(
        data: [DataModel(), DataModel(), DataModel()],
    ),
    configuration: AppItemPickerConfiguration(
        isItemSelectionRequired: false,
        fullScreen: false,
        isMultiSelect: true,
        isStatic: false,
    ),
);
```

---