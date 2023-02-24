# Open Url

Open Url package contains the necessary widgets which can help you react to user input and open any url or call any phone number. It also helps you handle error cases which may occur while trying to open a url, by providing a callback with the exception as an input.

## Widgets

`OpenUrlWidget` is a simple wrapper widget which reacts to user input and tries to open the provided url or phone number.

You can define a callback which is triggered right before trying to open the url with the `onTap` method. If an error occurs, an `onError` callback will be triggered with the exception as an input parameter.

The widget is dependent on the `OpenUriBloc` which is an essential part of the system. The mentioned bloc should be registered with a provider in the widget tree above the widget which is trying to access it.

The `OpenUrlWidget` widget comes with a static method called `OpenUrlWidget.withDependencies` which allows you to easily and on-the-go define a widget with the necessary dependencies. It will instantiate and properly nest a child widget within a MultiProvider for you. The hitbox of the `child` widget will be used to trigger any interactions within the bloc.

```
OpenUrlWidget.withDependencies(
  url: 'https://www.google.com/',
  child: Text('Google'),
  onTap: (){
  	print('Google link has been pressed!');
  },
  onError: (context, exception) => ScaffoldMessenger.of(context).showSnackBar(
  	SnackBar(content: Text(exception.toString())),
  ),
)
```

You can use the `OpenUrlWidget` for opening different things, such as opening the phone or messaging apps for making calls or sending sms. You can define which type of url you are opening by specifying the `uriType` parameter. By default, it handles `https` links, but there is an option for `sms`,`telephone`,`file` or `mail`.

```
OpenUrlWidget.withDependencies(
  url: '+123456789012',
  child: Text('Home'),
  uriType: UriType.telephone,
)
```

## How to use

In order to start using this package you need to add the dependency to the `widget_toolkit` in your `pubspec.yaml` file.

```yaml
widget_toolkit: any
```

Before you actually import the package in your app you'll need to configure the mobile platforms first. For each of the platforms you'll need to specify the schemes your app is going to be using. For a list of all available schemes, please check [this page][url_launcher_supported_schemes].

#### iOS

In order to make it work on iOS you need to add a new entry to your `ios/Runner/Info.plist` file under the name `LSApplicationQueriesSchemes ` with the schemes you'd like to use in your app.

Example:
```plist
<key>LSApplicationQueriesSchemes</key>
<array>
  <string>https</string>
  <string>sms</string>
  <string>tel</string>
  <string>mailto</string>
  <string>file</string>
</array>
```

See [-[UIApplication canOpenURL:]][ios_can_open_url_lnk] for more details.

#### Android

To make it work on Android 11 (API 30) or higher, inside the `android/app/src/main/AndroidManifest.xml` file add a `<queries>` element at the root of the manifest as a child. Within the `<quieries>` element, you can specify the schemes your app will be using.

Example:
```xml
<queries>
  <intent>
    <action android:name="android.intent.action.VIEW" />
    <data android:scheme="https" />
  </intent>
  <intent>
    <action android:name="android.intent.action.VIEW" />
    <data android:scheme="sms" />
  </intent>
  <intent>
    <action android:name="android.intent.action.VIEW" />
    <data android:scheme="tel" />
  </intent>
  <intent>
    <action android:name="android.intent.action.VIEW" />
    <data android:scheme="mailto" />
  </intent>
  <intent>
   <action android:name="android.intent.action.VIEW" />
   <data android:scheme="file" />
  </intent>
</queries>
```

Check out the [Android documentation][android_url_queries_lnk] for more examples of other queries.

##### Import the package

After that you can import the package with the following line:

`import 'package:widget_toolkit/open_url.dart';`

after which you are ready to start using the widgets in your app.

---

[url_launcher_supported_schemes]: https://pub.dev/packages/url_launcher#supported-url-schemes
[ios_can_open_url_lnk]: https://developer.apple.com/documentation/uikit/uiapplication/1622952-canopenurl
[android_url_queries_lnk]: https://developer.android.com/training/package-visibility/use-cases