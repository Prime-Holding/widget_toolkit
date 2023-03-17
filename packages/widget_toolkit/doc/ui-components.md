# Common utilities

Common utilities package contains some useful utility functions and widgets which can help reduce development time for implementing common components. This include buttons, modal sheets and other tools which are a non-essential part of the app but would still consume a specific amount writing it from scratch.

## Functions

There are several functions which help reduce time necessary to create widgets or modal sheets. They can be used in different places and provide an interface which allows for customization.

The `showBlurredBottomSheet` is a function which facilitates the use of modal sheets and provides different options for its customization. Out of the box, it provides an animated blurred background while opening the modal sheet so the background is slightly obstructed. Also, all you have to do is provide a `builder` method which returns a widget, and the modal sheet will adapt to its size. You can also toggle different things like the ability to dismiss the modal by pressing outside of the region, show or hide the modal sheet pill at the top of it, align the content in the desired direction, ...

The `showErrorBlurredBottomSheet` is a similar function to the `showBlurredBottomSheet`, but its use can be rooted in displaying error messages. By default it displays the provided error message in an error box with an optional toggleable retry button when a `retryCallback` callback is provided. You can also provide a `headerWidget` or a `footerWidget` which will be displayed above and below the error message respectively, with the exception that the later will be displayed below the retry button if that exists. Similar properties such as the modal sheet pill cutout or a close button can be toggled off/on with a parameter.


## Widgets

There are several helper or utility widget that developers would usually spend time on making them or extending one or more widgets. Those vary from helper widgets to fully functional reusable ui components.

`ErrorCardWidget` is a widget you can use in case you want to display an error with an optional retry button logic. It accepts either a `text` or an `exception` parameter (one of the two is required) and displays the message from it. In case of the `exception` parameter being provided, you can customize the message being displayed by providing a `exceptionTextBuilder` callback which takes a `BuildContext` and the exception and returns a string which is displayed. Additionally, you can specify an app-wide callback by providing it to the `ErrorCardWidget.errorMessageBuilder` static method. This can be useful for translating errors throughout the app by defining it in a single place. This widget is used by the `showErrorModal` function.

`GradientFillButton` is a widget representing a button with either a solid color or a color gradient. Besides the regular `onPressed` callback, it provides the option to add a left and right icon by providing icons to the `iconLeft` and `iconRight` parameters respectively. An additional interesting field is the `colorStyle` parameter which expects a `ButtonColorStyle` configuration class which contains the colors to be used by the widget as well the colors for the linear gradient.


## How to use

In order to start using this package you need to add the dependency to the `widget_toolkit` in your `pubspec.yaml` file.

```yaml
widget_toolkit: any
```

After that you can import the package with the following line:

`import 'package:widget_toolkit/common_ui_components.dart';`

after which you are ready to start using the widgets in your app.

---

