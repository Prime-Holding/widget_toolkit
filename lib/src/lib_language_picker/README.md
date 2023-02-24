# Language Picker

Language Picker package is useful when we need to display a list of languages and select one of them.
There are possible customizations such as passing a custom title, language service and a right icon.

## Widgets

Within the `language_picker` package you can call the `showAppChangeLanguageBottomSheet` function in order
to show your language list.

### `showAppChangeLanguageBottomSheet`

The `showAppChangeLanguageBottomSheet` function is a convenience function for displaying a 
`ChangeLanguageWidget` modal sheet with some pre-configured options. 

With the `errorBuilder` parameter you can provide a function, which receives an exception model,
which implements `ErrorModel`. `ErrorModel` is the type of error coming from the LanguagePickerBloc
error state. In order to map other types of exceptions, you should provide an `errorBuilder`,
with handling of the error.
With `iconRight` parameter, you can provide the icon, displayed on the 
right end of every language widget. There is a default icon if the parameter is not specified.
The `headerBuilder` parameter receives the title widget of the language picker.
With the `configuration` we can change the default configuration of the showAppModalBottomSheet().
To do that should provide a LanguagePickerConfiguration() instance to override the default values.
There are different styles for the error message widget. The default state is MessagePanelState.important.
With the `messageState` you can provide one of the enum values. With the MessagePanelState.custom
you can use the custom error text color and the custom error background color. When you use the
MessagePanelState.custom, you can provide a custom icon for the error panel widget with the
`errorPanelIcon` parameter.

To listen for the state of the changed language in the whole app, you should provide the 
`LanguagePickerDependencies.from()` constructor in the base of your app. There, you should update
the `Locale` in your `MaterialApp` with the `currentLanguage` state of the bloc. In the
`LanguagePickerDependencies.from()` constructor, you should provide your implementation of the
methods of the abstract `LanguageService` class.

## How to use

In order to start using this package you need to add the dependency to the `widget_toolkit` in
your `pubspec.yaml` file.

```yaml
widget_toolkit:
  git:
    url: https://gitlab.programista.pro/prime-reusable-components/flutter
    path: packages/widget_toolkit
```

The dependencies of the Language Picker should be provided in the root dependencies of the
application:

```dart
MultiProvider(
  providers: [
    ...LanguagePickerDependencies.from(
      LanguageServiceExample(localDataSource: _localDataSource),
    ).providers, 
  ],
  child: this,
);
```

After that you can import the package with the following line:

`import 'package:widget_toolkit/language_picker.dart';`

Additional step is the requirement to add the LanguagePickerTheme and LanguagePickerTheme as a 
extension to your ThemeData.

as an example:
```dart
//theme 
//...
extensions: [
    darkMode ? PrimeComponentsTheme.dark : PrimeComponentsTheme.light,
    darkMode ? LanguagePickerTheme.dark : LanguagePickerTheme.light,
]
//..
```

Complete example for showAppItemPickerBottomSheet usage:
```dart
showAppChangeLanguageBottomSheet(
  context: context,
  headerBuilder: (context) => Text(
    context.l10n.languagePicker.changeLanguage,
    style: context.languagePickerTheme.titleBold,
  ),
  errorBuilder: (myException) => customErrorBuilder(myException!),
  iconRight: Assets.add,
  configuration: LanguagePickerConfiguration(
    showHeaderPill: true,
    fullScreen: true,
    safeAreaBottom: true,
  ),
  messageState: MessagePanelState.custom,
  errorPanelIcon: Assets.deliveryBlack,
);
```

---