![CI][ci_badge_lnk] [![codecov][codecov_badge_lnk]][codecov_branch_lnk] ![style][code_style_lnk] ![license][license_lnk]

# Widget Toolkit Pin

**Widget Toolkit Pin** provides a page for entering pin code and might be used with or without biometrics.
The package uses the [local_auth](https://pub.dev/packages/local_auth) package, in order to provide an automatic prompt of a platform dialog that asks you to enable or disable biometrics at the application level.

## Setup

Step 1: Add the `widget_toolkit_pin`  and `widget_toolkit_biometrics` packages as dependencies.
```bash  
$ flutter pub add widget_toolkit_pin widget_toolkit_biometrics  
```

Step 2: Pass the `WidgetToolkitPin` extensions to the `ThemeData` of your app:
```dart
MaterialApp(  
  theme: ThemeData.light().copyWith(  
    colorScheme: ColorScheme.fromSwatch(),
      WidgetToolkitPin.light,  
    ],  
  ),  
  darkTheme: ThemeData.dark().copyWith(  
    colorScheme: ColorScheme.fromSwatch(),  
    extensions: [
      WidgetToolkitPin.dark,
    ],
  ),  
); 
```  

Support Android, iOS and Windows

## Features

 - Customizable length of the pin up to 10 digits
 - Masked row with entered numbers and fancy animation
 - Build in keyboard with pressed state of buttons
 - Two customizable icon buttons of two sides of the zero with default back and submit functionality
 - Optional list of actions to be displayed below the keyboard
 - Optional Biometric authentication

## Getting started

You can decide to use PrimePinCodePage or PrimePinCodeWithBiometricsPage. For the second one is 
required to provide in the context above it PrimePinCodeWithBiometricsPageBlocType or to use 
the static method withDependencies, which injects the bloc for you. Bought of them might be used for 
verify, create in two steps or change the pin code.

In your project MaterialApp add PrimePinTheme into your ThemeExtensions list. If you want to change some of the default strings 
or want to make the package translatable, provide implementation of PrimePinLocalizedStrings. If you decide to use the Widget with Biometrics,
you need to provide implementations of two abstract classes into your app level dependencies - BiometricAuthenticationService and PinCodeService.

This package depends on  [local_auth](https://pub.dev/packages/local_auth) so make sure that you will do all required settings for its integration.

## Usage
In order to start using this package you need to add the dependency to the widget_toolkit_pin in your pubspec.yaml file:
```yaml 
	widget_toolkit_pin:
    	git:
  			url: https://gitlab.programista.pro/prime-reusable-components/flutter
      		path: packages/widget_toolkit_pin
```

After that you can import the package with the following line:

	import 'package:widget_toolkit_pin/widget_toolkit_pin.dart';

after which you are ready to start using the widgets in your app.

[ci_badge_lnk]: https://github.com/Prime-Holding/widget_toolkit/workflows/CI/badge.svg
[codecov_badge_lnk]: https://codecov.io/gh/Prime-Holding/widget_toolkit/packages/widget_toolkit/branch/master/graph/badge.svg
[codecov_branch_lnk]: https://codecov.io/gh/Prime-Holding/widget_toolkit/packages/widget_toolkit_biometrics/branch/master
[code_style_lnk]: https://img.shields.io/badge/style-effective_dart-40c4ff.svg
[license_lnk]: https://img.shields.io/badge/license-MIT-purple.svg