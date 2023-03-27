# Language Picker

Language Picker package is useful when we need to display a list of languages and select one of them.
There are possible customizations such as passing a custom title, language service and a right icon.

## Widgets

Within the `language_picker` package you can call the `showChangeLanguageBottomSheet` function in order
to show your language list.

### `showChangeLanguageBottomSheet`

The `showChangeLanguageBottomSheet` function is a convenience function for displaying a 
`ChangeLanguageWidget` modal sheet with some pre-configured options. 

The `service` receives an implementation of the `LanguageService` class. The API of the class 
provides methods for the logic of fetching a list of languages, setting and getting the current 
one and getting all of them.
The `onChanged` parameter accepts a function, which receives the value of the selected language,
which can be used to update the value of the `MaterialApp(locale)` parameter of the app,
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

## How to use

In order to start using this package you need to add the dependency to the `widget_toolkit` in
your `pubspec.yaml` file.

```yaml
widget_toolkit: any
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

In order to fetch the models you want to present in the bottom sheet dialog you need to implement
your `LanguageService` and/or extend `LanguageModel` and you can implement the `SelectedLanguageModel`:

```dart
class MyCustomLanguageModel implements LanguageModel {
  MyCustomLanguageModel({
    required this.locale,
    required this.key,
    required this.languageCode,
  });

  @override
  final String locale;

  @override
  final String key;

  @override
  final String languageCode;

  @override
  String asString() => key;

  @override
  String withFirstCapitalLetter() => key.substring(0).toUpperCase();

  @override
  String translate(BuildContext context) => '';

  @override
  List<Object?> get props => [locale, key, languageCode];

  @override
  bool? get stringify => true;
}

class MyCustomSelectedLanguageModel implements SelectedLanguageModel {
  MyCustomSelectedLanguageModel({
    required this.language,
    required this.selected,
    this.isLoading = false,
  });

  @override
  final LanguageModel language;

  @override
  final bool selected;

  @override
  final bool isLoading;

  @override
  List<Object?> get props => [language, selected, isLoading];

  @override
  bool? get stringify => true;
}

class MyCustomLanguageService implements LanguageService {
  MyCustomLanguageService();

  @override
  Future<List<LanguageModel>> getAll() async => [...get all language models];

  @override
  Future<LanguageModel> getCurrent() async => [...get current language model];

  @override
  Future<void> setCurrent(LanguageModel language) async => [...set current language model];

  @override
  Future<List<SelectedLanguageModel>> getLanguageList() async => [...get selected language models];
}
```

Minimal example for showItemPickerBottomSheet usage:
```dart
showChangeLanguageBottomSheet(
  context: context,
  service: context.read<LanguageServiceExample>(),
  onChanged: (language) => print('Selected language: $language'),
);
```

Complete example for showItemPickerBottomSheet usage:
```dart
showChangeLanguageBottomSheet(
  context: context,
  service: context.read<LanguageServiceExample>(),
  onChanged: (language) => print('Selected language: $language'),
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