## [0.3.2]
* Fixed a bug where the pin code buttons would throw a setState error

## [0.3.1]
* Removed deprecated use of `.withOpacity()`
* Updated example project

## [0.3.0]
Fixes and improvements:
* Fixed a bug where biometrics authentication would not work if encryption was used
* Added biometrics authentication to the example application
* Added `autoPromptBiometric` parameter to `PinCodeKeyboard` to automatically authenticate with biometrics if available

Breaking changes:
* Added `savePinCodeInSecureStorage` to `PinCodeService` for saving the pin code in secure storage
* Removed `isPinCodeInSecureStorage` method from `PinCodeService`. Now this flag is set automatically when the pin code is saved in secure storage and accessed through the `getPinCode` method

## [0.2.2]
* Fixed a bug where a newly input pin could get deleted if the user starts typing again immediately after an error shake animation starts

## [0.2.1]
* Fixed a visual bug where held buttons would remain stuck in the pressed state
* Fixed a visual bug where pin indicators wouldn't be displayed after an error is presented
* Throw an error if biometrics aren't supported during biometrics authentication

## [0.2.0]
- Updated dependencies:
* `rxdart` to `0.28.0`
* `rx_bloc` to `6.0.0`
* `flutter_rx_bloc` to `7.0.0`
* `local_auth` to `2.3.0`

## [0.1.0]
- Improvements to error handling
- Errors of type `ErrorModel` thrown by `PinCodeService` are now caught by the `PinCodeKeyboard.onError` callback
### Breaking changes:
- Update `PinCodeService.verifyPinCode` to return a `Future<dynamic>` instead of a `bool`
- Update `PinCodeKeyboard.onAuthenticated` signature to accept a `dynamic` parameter passed from `PinCodeService.verifyPinCode` on authentication success

## [0.0.2]
- Upgrade major versions of dependencies: `theme_tailor`, `theme_tailor_annotation`
### Breaking changes:
- Added `light()` and `dark()` constructors for each theme that previously has static `light` and `dark` fields
- Removed static fields `light` and `dark` for each of the themes

## [0.0.2-dev.7]
* Fixes and improvements

## [0.0.2-dev.6]
* Support flutter 3.19

## [0.0.2-dev.5]
* Fix loading animation not being displayed when pin is submitted
* Update dependencies 

## [0.0.2-dev.4]
* Fix biometrics button being displayed when `biometricsLocalDataSource` is not provided
* Update dependencies 

## [0.0.2-dev.3]
* Remove `isAuthenticatedWithBiometrics` and `isPinCodeVerified` callbacks.
* Add `onAuthenticated` callback.

## [0.0.2-dev.2]
* Fix pin code auto submit, when biometrics authentication is disabled

## [0.0.2-dev.1]
* Update `widget_toolkit` and `widget_toolkit_biometrics` dependencies
* Update parameter `biometricsLocalDataSource` in `PinCodeKeyboard` to be optional
* Add option to disable biometrics authentication, when not required

## [0.0.1-dev2]
* Requires Dart `3.0`
* Update dependencies

## [0.0.1-dev1]
* Initial release of widget_toolkit_pin,
  * Includes the PinCodeKeyboard widget
