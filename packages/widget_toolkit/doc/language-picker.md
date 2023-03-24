# Language Picker

Language Picker package is useful when we need to display a list of languages and select one of them.
There are possible customizations such as passing a custom title, language service and a right icon.

## Widgets

Within the `language_picker` package you can call the `showChangeLanguageBottomSheet` function in order
to show your language list.

### `showChangeLanguageBottomSheet`

The `showChangeLanguageBottomSheet` function is a convenience function for displaying a 
`ChangeLanguageWidget` modal sheet with some pre-configured options. 

The `itemBuilder` parameter accepts a function, which should return a Widget to display the 
`SelectedLanguageModel` data. The loading parameter accepts the value for the current 
`SelectedLanguageModel.isLoading` model.
With the `errorBuilder` parameter you can provide a function, which receives an exception model,
which implements `ErrorModel`. `ErrorModel` is the type of error coming from the LanguagePickerBloc
error state. In order to map other types of exceptions, you should provide an `errorBuilder`,
with handling of the error.
The `headerBuilder` parameter receives the title widget of the language picker.
With the `modalConfiguration` we can change the default configuration of the `showBlurredBottomSheet()`.
To do that should provide a LanguagePickerConfiguration() instance to override the default values.
There are different states for the error message widget. The default state is `MessagePanelState.important`.
With the `messageState` you can provide one of the enum values.
`MessagePanelError` widget, is displayed above the languages list, when there is an error with a 
default icon. To access one of the other preconfigured icons, instead of the danger icon displayed
in the error panel on the left of the error text, for the value of the parameter `messageState`
provide another `MessagePanelState` value, such as: `MessagePanelState.informative`. According to
`messageState`, the appropriate icon, color and background color of the error panel widget  are displayed.
In order to override the error panel icon with a custom icon, you should use the `copyWith` method of
the `WidgetToolkitTheme`, such as:
`WidgetToolkitTheme.light.copyWith(
   dangerIcon: Assets.customIcon,
 );`

To listen for the state of the changed language in the whole app, you should provide the 
`LanguagePickerDependencies.from()` constructor in the base of your app. There, you should update
the `Locale` in your `MaterialApp` with the `currentLanguage` state of the bloc. In the
`LanguagePickerDependencies.from()` constructor, you should provide your implementation of the
methods of the abstract `LanguageService` class.

## How to use

In order to start using this package you need to add the dependency to the `widget_toolkit` in
your `pubspec.yaml` file.

```yaml
widget_toolkit: any
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

Additional step is the requirement to add the `LanguagePickerTheme` and `WidgetToolkitTheme` as  
extensions to your `ThemeData`.

Here is an example:
```dart
//theme 
//...
MaterialApp(
  theme: ThemeData(
    extensions: [
      darkMode ? WidgetToolkitTheme.dark : WidgetToolkitTheme.light,
      darkMode ? LanguagePickerTheme.dark : LanguagePickerTheme.light,
    ]
  )
);
//..
```

Here is an example of how you can listen for a change of the `currentLanguage` state in a StatefulWidget in 
your app and update your `MaterialApp` locale parameter:
```dart
late Locale _locale;

  @override
  void initState() {
    _locale = const Locale('en');
    
    context
        .read<LanguagePickerBlocType>()
        .states
        .currentLanguage
        .listen((language) {
      setState(
        () => _locale = Locale(language.locale),
      );
    });

    super.initState();
  }

@override
Widget build(BuildContext context) => MaterialApp(
  locale: _locale,
);
```

Minimal example for showItemPickerBottomSheet usage:
```dart
showChangeLanguageBottomSheet(
  context: context,
);
```

Complete example for showItemPickerBottomSheet usage:
```dart
showChangeLanguageBottomSheet(
    context: context,
    itemBuilder: (item, isLoading, context) => _buildLanguageItem(item, isLoading, context),
    headerBuilder: (context) => _buildCustomHeaderBuilder(context),
    modalConfiguration: const LanguagePickerModalConfiguration(
      safeAreaBottom: false,
      contentAlignment: MainAxisAlignment.end,
      fullScreen: false,
      haveOnlyOneSheet: true,
      showHeaderPill: false,  
      showCloseButton: false,
      heightFactor: 0.6,
      dialogHasBottomPadding: false,
      isDismissible: true,
    ),
    errorBuilder: (myException) => _buildCustomErrorBuilder(myException),
    messageState: MessagePanelState.informative,
);
```



---