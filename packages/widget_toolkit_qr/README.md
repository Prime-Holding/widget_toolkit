This package is a wrapper of [flutter_qr_bar_scanner](https://pub.dev/packages/flutter_qr_bar_scanner),
for more information about the `flutter_qr_bar_scanner` package, check out its documentation.

Support iOS and Android

## Features

This package helps developers to add a qr scanner functionality into their applications. It can be used
in the authentication process of an application.

## Widgets

 - QrScannerPage 

QrScannerPage is is the widget, which displays a qr scanner and a loading indicator bellow the qr scanner.
The handling of the error state of the `QrScannerBloc`, can be done by wrapping the 
`showQrScannerErrorBottomModalSheet()` function with a listener for the error state of the bloc.

## Functions

 - void showAppCameraPermissionBottomSheet()

`showAppCameraPermissionBottomSheet()` is a function, which shows on the screen a bottom modal sheet 
with text message, which you should provide and it should say to the user, that he/she should enable 
the access of the application to the device's camera.

 - void showQrScannerErrorBottomModalSheet()
 
`showQrScannerErrorBottomModalSheet()` is a function, which can be used to provide a bottom modal 
sheet, in which the error text from `QrScannerBloc` error state can be printed. The error state from
the bloc can be listened also in another place in your app, with a custom implementation of a 
builder or listener.

Note: The `QrScannerBloc` and the implementations of `SystemPermissionsService`, `QrCodeService`
should be provided with `QrScannerPageWithDependencies()` above the `QrScannerPage` in the widget tree.

## Getting started

For Android 

Configure your project by adding to your_project_root/android/app/build.gradle:

    android {
        compileSdkVersion 33
    }

Add in your_project_root/android/gradle.properties

    android.useAndroidX=true
    android.enableJetifier=true

Open the AndroidManifest.xml file in your android/app/src/main directory and add the following device permissions:

```
   ...
    <uses-permission android:name="android.permission.CAMERA"/>
   ...
```
For iOS

Open the Info.plist file in your ios/Runner directory and add the following permissions:

```
    ...
    <key>NSCameraUsageDescription</key>
    <string>Your message to user when the camera is accessed for the first time</string>
    ...

```


Open the Podfile file in your ios directory and add the following permissions:
```
    ...
     post_install do |installer|
      installer.pods_project.targets.each do |target|
        flutter_additional_ios_build_settings(target)
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
            #  Preprocessor definitions can be found in: https://github.com/Baseflow/flutter-permission-handler/blob/master/permission_handler/ios/Classes/PermissionHandlerEnums.h
            config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= [
              '$(inherited)',
              ## dart: PermissionGroup.camera
              'PERMISSION_CAMERA=1',
            ]
        end
      end
    end
    ...
```

## Usage

In order to start using this package you need to add the dependency to the `widget_toolkit_qr` and to the
`widget_toolkit` package in your pubspec.yaml file:

```yaml
widget_toolkit_qr:
git:
  url: https://github.com/Prime-Holding/widget_toolkit/tree/develop/
  path: packages/widget_toolkit_qr
widget_toolkit:
  git:
    url: https://github.com/Prime-Holding/widget_toolkit/tree/develop/
    path: packages/widget_toolkit
```

After that you can import the package with the following lines:

	import 'package:widget_toolkit_qr/widget_toolkit_qr.dart';

Also you should import the widget_toolkit package:

    import 'package:widget_toolkit/widget_toolkit.dart';

after which you are ready to start using the widgets in your app.

## Permission handler

To be able to ask the user to grant permissions to your application you can use this package:
[permission_handler](https://pub.dev/packages/permission_handler), for more information check
out the documentation of the package `permission_handler`.
By using its features you can provide implementation of the methods of the abstract class
`SystemPermissionsService`, which should be implemented in a service class.

In your pubspec.yaml you should add a dependency to `permission_handler` package:

```yaml
dependencies:
  permission_handler: ^10.0.0
```

Then you should import the classes from the package like this:

    import 'package:permission_handler/permission_handler.dart';

After which you should be ready to start using the package in your app.

Example for `QrScannerPage` usage:
```dart
      QrScannerPage(
        cameraPermissionBottomSheetConfiguration: QrScannerConfiguration(
          fullScreen: false,
          showHeaderPill: true,
        ),
        qrCodeCallback: (qrCode) =>
            context.read<QrScannerBlocType>().events.checkQRCode(qrCode),
        cameraPermissionButtonText: 'Grant access to camera',
        cameraAccessTitleText: 'Access camera',
        cameraAccessLabelText: 'Access your camera',
        spaceBetweenScannerAndLoadingWidget: 60,
        onScannedCode: (data) => setState(() {
          _scannedValue = data;
          Navigator.of(context).pop();
        }),
      );
```
