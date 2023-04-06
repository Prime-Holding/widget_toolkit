This package provides page for entering pin code and might be used with or without biometrics.

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
In order to start using this package you need to add the dependency to the prime_pin_code in your pubspec.yaml file:
```yaml 
	prime_pin_code:
    	git:
  			url: https://gitlab.programista.pro/prime-reusable-components/flutter
      		path: packages/prime_pin_code
```

After that you can import the package with the following line:

	import 'package:prime_pin_code/prime_pin_code.dart';

after which you are ready to start using the widgets in your app.