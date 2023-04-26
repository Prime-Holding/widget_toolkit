![CI][ci_badge_lnk] [![codecov][codecov_badge_lnk]][codecov_branch_lnk] ![style][code_style_lnk] ![license][license_lnk]

# Widget Toolkit Pin

**Widget Toolkit Pin** provides a page for entering pin code and might be used with biometrics.
The package uses the [local_auth](https://pub.dev/packages/local_auth) package, in order to provide
an automatic prompt of a platform dialog that asks you to enable or disable biometrics at the application level.

## Features

- Customizable length of the pin up to 10 digits
- Masked row with entered numbers and fancy animation
- Build in keyboard with pressed state of buttons
- Two customizable icon buttons on right side of the zero with default delete, auto submit and biometrics functionality
- Optional error handling by the user
- Biometric authentication

## Setup

Step 1: Add the `widget_toolkit_pin`  and `widget_toolkit_biometrics` packages as dependencies.
```bash  
$ flutter pub add widget_toolkit_pin widget_toolkit_biometrics  
```

Step 2: Follow the [integration instructions for the local_auth package](https://pub.dev/packages/local_auth) in order for the plugin to work on your desired platforms.

Step 3: Pass the `WidgetToolkitTheme`,`PinCodeTheme` extensions to the `ThemeData` of your app:
```dart
MaterialApp(  
  theme: ThemeData.light().copyWith(  
    colorScheme: ColorScheme.fromSwatch(),
      PinCodeTheme.light,
      WidgetToolkitTheme.light,  
    ],  
  ),  
  darkTheme: ThemeData.dark().copyWith(  
    colorScheme: ColorScheme.fromSwatch(),  
    extensions: [
      PinCodeTheme.dark,
      WidgetToolkitTheme.dark,
    ],
  ),  
);
```
To access the content of the `widget_toolkit_pin`, you should import the files with the following line:
```dart
import 'package:widget_toolkit_pin/widget_toolkit_pin.dart';
```

**Note:** The `WidgetToolkitTheme` comes from the **Widget Toolkit** package which already presence in the **Widget Toolkit Pin** package.
It can be imported with the following line:
```dart
import 'package:widget_toolkit/widget_toolkit.dart';
```  

Step 3: Create an implementation of `BiometricsLocalDataSource`, for example:
```dart
class ProfileLocalDataSource implements BiometricsLocalDataSource { 
	static const _areBiometricsEnabled = 'areBiometricsEnabled';
	
	Future<SharedPreferences> get _storageInstance => SharedPreferences.getInstance();
	
	@override  
	Future<bool> areBiometricsEnabled() async {  
	  final storage = await _storageInstance;  
	  return storage.getBool(_areBiometricsEnabled) ?? false;  
	}
	
	@override  
	Future<void> setBiometricsEnabled(bool enable) async {  
	  final storage = await _storageInstance;  
	  await storage.setBool(_areBiometricsEnabled, enable);  
	}
}
```

Step 6: Create an implementation of `PinCodeService`, for example:
```dart
class AppPinCodeService implements PinCodeService {
  AppPinCodeService();

  Future<SharedPreferences> get _storageInstance =>
      SharedPreferences.getInstance();

  static const _isPinCodeInStorage = 'pinCode';

  @override
  Future<bool> isPinCodeInSecureStorage() async {
    final storage = await _storageInstance;
    final isPinCodeInSecureStorage = storage.getString(_isPinCodeInStorage);
    if (isPinCodeInSecureStorage == null) {
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Future<String> encryptPinCode(String pinCode) async {
    final storage = await _storageInstance;
    var isPinSaved = await storage.setString(_isPinCodeInStorage, pinCode);
    if (isPinSaved) {
      return Future.value(pinCode);
    }
    return Future.value('not saved');
  }

  @override
  Future<int> getPinLength() => Future.value(3);

  @override
  Future<bool> verifyPinCode(String pinCode) {
    if (pinCode == '111') {
      return Future.value(true);
    }
    return Future.value(false);
  }

  @override
  Future<String?> getPinCode() async {
    final storage = await _storageInstance;
    var pin = storage.getString(_isPinCodeInStorage);
    if (pin == null) {
      return Future.value(null);
    }
    return Future.value(pin);
  }
}
```

Step 7: Use the `BiometricsSwitch` widget somewhere in your widget tree, using your implementation of `BiometricsLocalDataSource`:
Support Android, iOS and Windows

```dart
PinCodeKeyboard(
    pinCodeService: AppPinCodeService(),
    biometricsLocalDataSource: ProfileLocalDataSource(),
    translateError: _translateError,
);
```

## Customization

Optionally you can provide `mapMessageToString`, which will be used to translate the `BiometricsMessage` to human readable text and will be used in the default notification:
```dart
mapMessageToString: (message) {  
  switch (message) {  
    case BiometricsMessage.notSetup:  
      return 'To use biometrics, you need to turn it on in your device settings!';  
  
    case BiometricsMessage.notSupported:  
      return 'You don\'t have biometric feature on your device!';  
  
    case BiometricsMessage.enabled:  
      return 'Your biometrics are enabled!';  
  
    case BiometricsMessage.disabled:  
      return 'Your biometrics are disabled!';  
  }  
},
```

Optionally you can provide `onError` to handle errors out of the package, or to show a notification,
in practice this would only get called if the implementations of `BiometricsLocalDataSource.areBiometricsEnabled()`, 
`BiometricsLocalDataSource.setBiometricsEnabled(enable)`,`PinCodeService.isPinCodeInSecureStorage()`, 
`PinCodeService.encryptPinCode()`, `PinCodeService.getPinLength()`, `PinCodeService.verifyPinCode()`, 
`PinCodeService.getPinCode()`, throw.

```dart
onError: (error, translatedError) {
  showBlurredBottomSheet(
    context: context,
    configuration: const ModalConfiguration(safeAreaBottom: false),
    builder: (context) => const MessagePanelWidget(
      message: 'Could not enable biometric authentication at this time',
      messageState: MessagePanelState.important,
    ),
  );
},
```

Optionally you can provide `addDependencies` and set it to false. In this case you will have to provide
and implementation of the `LocalAuthentication`, `PinBiometricsAuthDataSource`, `PinBiometricsRepository`,
`PinCodeBloc`

```dart
addDependencies: false,
```

Optionally you can provide `isAuthenticatedWithBiometrics` where the function receives a bool value showing,
whether the user was authenticated with biometrics.
```dart
isAuthenticatedWithBiometrics: (isAuthenticated) => true,
```

Optionally you can provide `isPinCodeVerified`, where the function receives a bool value showing,
whether pin code is verified.
```dart
isPinCodeVerified: (isPinCodeVerified) => true,
```

Optionally you can provide `deleteKeyButton`, which button will be used instead of the default delete
button.
```dart
deleteKeyButton: PinCodeCustomKey(
  buildChild: (bool isPressed) => const Icon(Icons.delete),
  onTap: () {},
)
```

Optionally you can provide `bottomRightKeyboardButton`, which button will be used instead of the default delete
button and instead of the other functionalities provided from the default auto submit, biometrics scan buttons,
which are appearing on the bottom right of the keyboard.
```dart
bottomRightKeyboardButton: PinCodeCustomKey(
  buildChild: (bool isPressed) => const Icon(Icons.face),
  onTap: () {},
)
```

Optionally you can provide a `localizedReason`, this should be a localized string, which would get shown
to the user when they  are prompted to confirm that they want to enable biometrics.
```dart
localizedReason: 'Activate the biometrics of your device',
```
## Functional specifications

When the widget is loaded for the first time on the bottom right of the page, there is no button.
At this point the biometrics for the app are still not enabled.
After at least 1 number has been selected the delete button shows up. When the length of the input
reached the pin code length the button icon disappears. The pin code is encrypted stored in the
local device secure storage. Then, there is an auto submit of the selected
pin code to the backend for verification. After the pin has been saved successfully in the secure
storage, the biometrics icon appear on the bottom right. When you press it, it triggers enabling
of the biometrics event. The local authentication from the local_auth package is triggered.
The user is asked, if he/she wants to allow the app to use biometrics authentication. When you click
ok, the biometrics authentication is triggered. When it is successful, on the screen is displayed
a message that the biometrics are enabled. The next time when restart the app, because the pin code
will be stored in the device secure storage, the biometrics authentication will be automatically
triggered and the biometrics icon will be displayed on the bottom right. When you press it every 
time it will trigger the biometric authentication.

[ci_badge_lnk]: https://github.com/Prime-Holding/widget_toolkit/workflows/CI/badge.svg
[codecov_badge_lnk]: https://codecov.io/gh/Prime-Holding/widget_toolkit/packages/widget_toolkit/branch/master/graph/badge.svg
[codecov_branch_lnk]: https://codecov.io/gh/Prime-Holding/widget_toolkit/packages/widget_toolkit_biometrics/branch/master
[code_style_lnk]: https://img.shields.io/badge/style-effective_dart-40c4ff.svg
[license_lnk]: https://img.shields.io/badge/license-MIT-purple.svg