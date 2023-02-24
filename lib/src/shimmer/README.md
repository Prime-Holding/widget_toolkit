# Shimmer

Shimmer package is a package used for providing a way to animate widgets with the shimmer effect while the data for that widget is still loading.

As part of great UX there may be times where you want to occupy an area of your screen which will be replaced with another widget at a point once the right conditions are met. Those conditions can be a variety of things, but the most prominent of those is displaying the widgets once the data has been fetched and parsed from a remote api.

## Widgets

As part of the shimmer package, there are two widgets that you can use right in your app: [`AppShimmerText`](#app-shimmer-text) and [`AppShimmer`](#app-shimmer). 

<div id="app-shimmer-text">

### AppShimmerText

The `AppShimmerText` is a widget that can be used to display a container with a shimmer effect while we are waiting for the text to be fetched. It acts as a wrapper around the `Text` widget where as long the provided string is not null the text will be displayed. In case the text is null (we still don't have it), a shimmer container will be displayed in the place where the text should be.

```dart
AppShimmerText(
  _textToBeBuilt,
  type: ShimmerType.random(),
)
```

A great use case when working with `AppShimmerText` is to wrap the widget with a builder widget (for example a `RxBlocBuilder` or a `StreamBuilder`) where the listened state can be used as the parameter in the widget itself. By manipulating the stream, we can provide a value after our calculations or requests are done.

Also, the `AppShimmerText` widget benefits from a `type` field where you can specify the type of the shimmer animation. Currently, there are three different shimmer types, each of them coming with a preset that you can customize:

- `ShimmerType.fixed()` : Defines a shimmer with a fixed length that will always remain the same size.

- `ShimmerType.proportional()` : Defines a shimmer that can take a custom amount of space by defining the leading and trailing flex property. Whenever the widget with this type is rebuilt, it will have the same size.

- `ShimmerType.random()` : Defines a shimmer that can take a custom amount of space by defining a range of values within [min,max) for the leading flex and a value for the trailing flex. You can also define a static `ShimmerTypeRandom.leadingFlex` that will be used instead of a randomly generated one for all the random shimmer type configurations. If no static leading flex is defined, the size of the shimer will have a different size every time it is rebuilt.

<div id="app-shimmer">


### AppShimmer

Unlike the `AppShimmerText` widget, the `AppShimmer` widget is more versatile and provides control over when you want to display the shimmer effect on top of your child widget. By specifying a widget by itself, the shimmer effect will be rendered on top of it, which can be great for decorative widgets.

```dart
AppShimmer(
  showShimmer: _showShimmerEffect,
  child: childWidget,
)
```

A great combination with the `AppShimmer` is a builder widget (`RxBlocBuilder`,`StreamBuilder`,etc) which consumes data from a stream, which can be used to conditionally manipulate and display the target child widget. So for example, we can grab data from a stream, check if that data is still loading or has not yet met our conditions and display a placeholder widget while we are still waiting for our data. Once we have our data, we can stop displaying the shimmer effect and render out widget.

```dart
AppShimmer(
  showShimmer: _showShimmerEffect,
  child: _showShimmerEffect ? widgetWithShimmer : targetChildWidget,
)
```



## How to use

In order to start using this package you need to add the dependency to the `widget_toolkit` in your `pubspec.yaml` file.

```yaml
widget_toolkit: any
```

After that you can import the package with the following line:

`import 'package:widget_toolkit/shimmer.dart';`

after which you are ready to start using the widgets in your app.

---
