# Text Field Dialog

Text field dialog package is useful when we need to have a text field, which appears in a bottom dialog.
There are possible customizations such as passing a custom header, label, save button text,
text field validation service,input text field maximum lines, custom edit icon and others.

## Widgets

Within the `text_field_dialog` package you can create a `TextFieldDialog` widget in order
to show a text field dialog. 

### `TextFieldDialog`

The `TextFieldDialog` is a widget for displaying a text field modal sheet with some
pre-configured options.

`label` is the value of the text label of the widget, which when pressed loads the
text field dialog.
`emptyLabel` is the text value, displayed when there is no initially set text
value for the widget.
`validator` received a service, which extends `TextFieldValidator` and
implements its validation methods for the frontend and backend checks.
`onChanged` after the field service validation is successful the onChanged
function is called with the value from the text input field. It can be used
for sending the value as an event to a bloc, for example as:
`onChanged: (street) => bloc.events.setStreet(street);`
`fillButtonText` is the text value in the button in the dialog.
`errorMapper` function, which implementation should map the form error to
RxFieldException error and translate the error to the correct language.
You can check also the translateErrors() method in the `TextFieldDialog` widget
Set `editFieldType` to `editFieldType.custom` if you want to set custom edit icon
and provide the icon to `editFieldCustomIcon`.
`value` is the value bellow the label text value, which has been inputted
as text field value.
`header` is a value displayed above the text field in the dialog.
`maxLines` is the value of maximum lines the `InputTextField` widget
can have, if the number is increased, the input field becomes bigger.
`editFieldType` is used in the `EditFieldWidget` and from its type,
one of the preconfigured icons are loaded or if the type is set to
EditFieldType.custom, you can set a custom icon. In this case, you should
provide a custom icon to `editFieldCustomIcon`.
`dialogHasBottomPadding` by default is should be true, which moves the dialog
up with the height of the keyboard, when it is visible, so the dialog appears
above it.
`isDismissible` shows whether you can dismiss the dialog, if you click outside
of it.
`heightFactor` sets a custom heightFactor, setting, how high the modal sheet
is displayed.
`optionalString` a string which should be provided, when the `LabeledBoxWidget`'s
type is set to optional: `LabeledBoxType.optional` and the `value` is null.

## How to use

In order to start using this package you need to add the dependency to the `widget_toolkit` in
your `pubspec.yaml` file.

```yaml
widget_toolkit: any
```

After that you can import the package with the following line:

`import 'package:widget_toolkit/text_field_dialog.dart';`

Additional step is the requirement to add the TextFieldDialogTheme as a 
extension to your ThemeData.

as an example:
```dart
//theme 
//...
extensions: [
    darkMode ? WidgetToolkitTheme.dark : WidgetToolkitTheme.light,
    darkMode ? TextFieldDialogTheme.dark : TextFieldDialogTheme.light,
]
//..
```

Complete example for TextFieldDialog usage:
```dart
TextFieldDialog<String>(
    optionalString: 'Optional',
    errorMapper: (obj, context) =>
    ErrorMapperUtil<String>().errorMapper(obj, context),
    label: 'Label text',
    value: 'Some value',
    emptyLabel: 'Empty label',
    editFieldCustomIcon: Assets.deliveryBlack,
    editFieldType: hasCustomIcon
    ? EditFieldType.custom
        : EditFieldType.editfield,
    onChanged: (street) => bloc.events.setStreet(street),
    validator: context.read<LocalAddressFieldService>(),
    fillButtonText: 'Save',
    dialogHasBottomPadding: false,
    header: 'Header text',
    maxLines: 3,
    isDismissible: true,
    heightFactor: 0.6,
),
```

---