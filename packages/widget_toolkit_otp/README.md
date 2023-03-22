# Prime SMS Code

`Prime SMS Code` package contains a number of useful widgets that can help you in building sms/pin 
code screens or workflows for your app. The package contains widgets for entering pin codes, 
pasting them, resend logic and more.

## Widgets

The `Prime SMS Code` package consists of the following widgets:

### PrimeSmsCodeField

This is a wrapper around package [Pinput](https://pub.dev/packages/pinput) and exposes all its 
customization options. In addition it provide default implementations for some of the package properties 
and style it in themeData. Support autofill and paste.
By default it uses the inter feature communication, implemented with the SmsCodeBloc. To use it 
as stand alone widget, set its property useInternalCommunication to false. 

### CountdownWidget

Countdown widget used to keep track of the remaining time.

An onCountdownTick callback can be provided to keep track of any changes happening. This callback 
accepts the remaining countdown time to which the user of the widget can react. This callback is 
triggered after the frame has been rendered in order to prevent any potential setStates happening and 
modifying the widget during its build phase.

You can also access the remaining time, as well as the elapsed time of the countdown via a controller. 
The controller also gives you the possibility to reset the countdown and start it from a custom time (provided in seconds).

By default, every countdown is presented in the format of remaining seconds. However, you can change 
this to include minutes and hours by changing the timeFormat parameter of the widget.

By default, the highest number (minutes in the minutes format, hours in the hours format) will be 
displayed with double digits (even if a single digit number is presented). In case you want to disable
this behaviour, you can set the preferDoubleDigitsForTime parameter to `false`.

### AutomatedResendCodeButton

AutomatedResendCodeButton maintains its own state. Once the button is being pressed, it goes through 
a few statuses (loading, codeSent, disabled, active, error). The button is enabled only in active state. 
There are a lot of options to be customised as providing icons, labels, colorStyles, textStyle e.t. 
To prevent user from spam pressing the button it gets disabled for long after the onPressed callback 
is executed. That way we are not going to sent too much codes and confuse the user. Uses the CountdownWidget under the hoot.

### ResendCodeButton

ResendCodeButton might be maintained from your business logic, but by default it uses SmsCodeBloc. 
It builds TextButton with great amount of customization options and authomated styling.

### SmsPhoneNumberField

SmsPhoneNumberField is kind of builder witch provide phone number and callback to update saved phone
number. It gets handy to build (if needed) featured field, wrapped int SmsCodeWidget.

### ResendButtonTimer

ResendButtonTimer wraps CountdownWidget with the business logic, provided from SmsCodeBloc. It have 
builder, to be totally recreated, using the same logic.

### ValidityWidget

ValidityWidget displays how long will be valid lately sent to the user code. This widget can not be 
used outside the SmsCodeBloc and its content might be fully recreated using its builder.

### SmsCodeWidget

SmsCodeWidget is user friendly way to provide all dependencies for the implemented business logic and,
in the same step, arrange the page content depending on bloc's states and events.

## How to use

In order to start using this package you need to add the dependency to the `prime_sms_code` in your `pubspec.yaml` file.

```yaml
prime_sms_code:
  git:
    url: https://gitlab.programista.pro/prime-reusable-components/flutter
    path: packages/prime_sms_code
```


Afterwards, you can import the package by including the following line:

`import 'package:prime_sms_code/prime_sms_code.dart';`

after which you are ready to start using the widgets in your app.

There are two ways of using this package - to use prebuilt widgets to visualize your own business 
logic or to use the provided SmsCodeBloc and arrange widgets in a page, however you want.
Widgets that you can use without SmsCodeBloc are CountdownWidget, AutomatedResendCodeButton, 
PrimeSmsCodeField(set useInternalCommunication = false) and ResendCodeButton(set useInternalCommunication = false).

To use the implemented business logic, you first need to provide in the context SmsCodeBloc and 
implementation of SmsCodeService. Then, to render your page content, you can use SmsPhoneNumberField 
(combine it with custom widget or with PrimeTextFieldDialog),
ValidityWidget, ResendCodeButton, ResendButtonTimer and PrimeSmsCodeField. Use SmsCodeWidget to have 
all dependencies provided and use its builder to easily create your page content.
