![CI][ci_badge_lnk] [![codecov][codecov_badge_lnk]][codecov_branch_lnk] ![style][code_style_lnk] ![license][license_lnk]  
  
# Widget Toolkit Biometrics  
  
**Widget Toolkit Biometrics** uses the [local_auth](https://pub.dev/packages/local_auth) package, in order to provide an easy to use **Material Design** switch, that enables you to enable or disable biometrics at the application level.

## Demo  
  
| Enable/Disable | Not Supported | Not Setup | 
|---|---|---| 
| <img width=200 src="https://raw.githubusercontent.com/Prime-Holding/widget_toolkit/develop/packages/widget_toolkit_biometrics/doc/assets/success.webp" alt="Enable/Disable"></img> | <img width=200 src="https://raw.githubusercontent.com/Prime-Holding/widget_toolkit/develop/packages/widget_toolkit_biometrics/doc/assets/not_supported.webp" alt="Not Supported"></img> | <img width=200 src="https://raw.githubusercontent.com/Prime-Holding/widget_toolkit/develop/packages/widget_toolkit_biometrics/doc/assets/not_setup.webp" alt="Not Setup"></img> |
  
## Setup  

Step 1: Add the `widget_toolkit_biometrics`  and `widget_toolkit` packages as dependencies.
```bash  
$ flutter pub add widget_toolkit widget_toolkit_biometrics  
```

Step 2: Follow the [integration instructions for the local_auth package](https://pub.dev/packages/local_auth) in order for the plugin to work on your desired platforms.

Step 3: Pass the `WidgetToolkitTheme` extensions to the `ThemeData` of your app:
```dart
MaterialApp(  
  theme: ThemeData.light().copyWith(  
    colorScheme: ColorScheme.fromSwatch(),  
      WidgetToolkitTheme.light(),  
    ],  
  ),  
  darkTheme: ThemeData.dark().copyWith(  
    colorScheme: ColorScheme.fromSwatch(),  
    extensions: [
	    WidgetToolkitTheme.dark(),
    ],
  ),  
); 
```  

Step 4: Create an implementation of `BiometricsLocalDataSource`, for example:
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

Step 5: Use the `BiometricsSwitch` widget somewhere in your widget tree, using your implementation of `BiometricsLocalDataSource`:
```dart
//...
BiometricsSwitch(
	biometricsLocalDataSource: ProfileLocalDataSource(),
),
//...
```
  
## Customization  
  
Optionally you can provide a `localizedReason`, this should be a localized string, which would get shown to the user when they  are prompted to confirm that they want to enable biometrics. 
```dart
localizedReason: 'Activate the biometrics of your device',
```

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

Optionally provide `builder` if you want to build the element in your own way using the implemented business logic.
```dart
builder: (context, enabled, setBiometrics) {  
  return Switch(  
    value: enabled,  
    onChanged: setBiometrics,  
  );  
},
```

Optionally, use `onStateChanged` to execute custom callback or present custom notification to the user whenever the biometrics are enabled or disabled successfully. If you have defined `mapMessageToString` the result from that would be passed in as `localizedMessage`, otherwise the default mapping of the message to an English string would be passed in. However if you do override this, you will have to handle the case where the user hasn't setup their biometrics, and needs to be led to the settings page to set them up, for example by using the [app_settings](https://pub.dev/packages/app_settings) library.
```dart
onStateChanged: (context, message, localizedMessage) {  
	showBlurredBottomSheet(  
	  context: context,  
	  configuration: const ModalConfiguration(  
	    safeAreaBottom: false,  
	  ),  
	  builder: (context) => MessagePanelWidget(  
	    message: localizedMessage,  
	    messageState: message.state(),  
	  ),  
	);
},
```

Optionally you can provide `onError` to handle errors out of the package, or to show a notification, in practice this would only get called if the implementations of `BiometricsLocalDataSource.areBiometricsEnabled()` or `BiometricsLocalDataSource.setBiometricsEnabled(enable)` throw .

```dart
onError: (error) {  
  showBlurredBottomSheet(  
    context: context,  
    configuration:  
        const ModalConfiguration(safeAreaBottom: false),  
    builder: (context) => const MessagePanelWidget(  
      message: 'We\'re sorry we couldn\'t enable biometric authentication at this time',  
      messageState: MessagePanelState.important,  
    ),  
  );  
},
```
  
[ci_badge_lnk]: https://github.com/Prime-Holding/widget_toolkit/workflows/CI/badge.svg  
[codecov_badge_lnk]: https://codecov.io/gh/Prime-Holding/widget_toolkit/packages/widget_toolkit/branch/master/graph/badge.svg  
[codecov_branch_lnk]: https://codecov.io/gh/Prime-Holding/widget_toolkit/packages/widget_toolkit_biometrics/branch/master
[code_style_lnk]: https://img.shields.io/badge/style-effective_dart-40c4ff.svg  
[license_lnk]: https://img.shields.io/badge/license-MIT-purple.svg
