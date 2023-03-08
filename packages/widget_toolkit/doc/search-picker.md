# Search Picker

Search Picker package is useful when we need to display an list of items, search based on a query and select one of them. There is possible customizations such as passing custom item, separator,
error and empty widgets.

## Widgets

Within the `search_picker` package you can call the `showSearchPickerBottomSheet` function in order
to show your items list and to perform query searches.

### `showSearchPickerBottomSheet`

The `showSearchPickerBottomSheet` function is a convenience function for displaying an ItemPicker
modal sheet with some pre-configured options. It requires a `context`, `title`, `hintText`, `retryText`, `selectedItem`, function that return a generic type `onItemTap`, `service`.
Another optional customization can be applied by using the `itemBuilder`, `separatorBuilder`, `errorBuilder` or `emptyBuilder`.

## How to use

In order to start using this package you need to add the dependency to the `widget_toolkit` in
your `pubspec.yaml` file.

```yaml
widget_toolkit: any
```

After that you can import the package with the following line:

`import 'package:widget_toolkit/search_picker.dart';`

additional step is the requirement to add the WidgetToolkitTheme and SearchPickerTheme as a extension to your ThemeData.

as an example:
```dart
//theme 
//...
extensions: [
    darkMode ? WidgetToolkitTheme.dark : WidgetToolkitTheme.light,
    darkMode ? SearchPickerTheme.dark : SearchPickerTheme.light,
]
//..
```

Complete example for showSearchPickerBottomSheet usage:
```dart
showSearchPickerBottomSheet<DataModel>(
    context: context,
    title: title,
    hintText: hintText,
    retryText: retryText
    separatorBuilder: (index) => _buildCustomSeparator(index),
    itemBuilder: (model) =>
    _buildCustomListItem(model),
    errorBuilder: (error) => _buildErrorWidget(error),
    emptyBuilder: () => _buildEmptyWidget(),
    selectedItem: _selectedItem,
    onItemTap: (item) => setState(() {
    _selectedItem = item;
    }),
    service: DataService(),
    showEmptyWidgetWhenNoResultsAreFound: true,
);
```

---