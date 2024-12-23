import 'package:flutter/material.dart';
import 'package:widget_toolkit/text_field_dialog.dart';
import 'package:widget_toolkit/theme_data.dart';
import 'package:widget_toolkit_otp/widget_toolkit_otp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light()
          .copyWith(colorScheme: ColorScheme.fromSwatch(), extensions: [
        WidgetToolkitTheme.light(),
        SmsCodeTheme.light(),
        TextFieldDialogTheme.light(),
      ]),
      darkTheme: ThemeData.dark()
          .copyWith(colorScheme: ColorScheme.fromSwatch(), extensions: [
        WidgetToolkitTheme.dark(),
        SmsCodeTheme.dark(),
        TextFieldDialogTheme.dark(),
      ]),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: SmsCodeProvider(
            sentNewCodeActivationTime: 2,
            smsCodeService: FakeSmsCodeService(),
            builder: (state) => Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmsPhoneNumberField(
                    builder: (context, number, onChanged) => TextFieldDialog(
                      label: 'Phone Number',
                      value: number,
                      validator: FakeTextFieldValidator(),
                      translateError: (Object error) => null,
                      onChanged: onChanged,
                    ),
                  ),
                  const Column(
                    children: [
                      Text(
                        '*hint* The correct code might be 0000...',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 8),
                      SmsCodeField(),
                      SizedBox(height: 8),
                      ValidityWidget(),
                    ],
                  ),
                  SizedBox(
                    height: 85,
                    child: Column(
                      children: [
                        ResendCodeButton(
                            strings: CustomLocalizedStrings(context)),
                        const ResendButtonTimer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

class FakeTextFieldValidator extends TextFieldValidator<String> {
  @override
  Future<String> validateOnSubmit(String text) async => text;

  @override
  void validateOnType(String text) => true;
}

/// Custom Strings for the ResendCodeButton
class CustomLocalizedStrings extends LocalizedStrings {
  CustomLocalizedStrings(super.context);

  @override
  String get sendNewCode => 'Resend';

  @override
  String get codeSent => 'Code resent';
}

/// Service used to implement SMS code logic
class FakeSmsCodeService implements SmsCodeService {
  /// Confirm if the entered code is equal to the last send code
  @override
  Future<dynamic> confirmPhoneCode(String code) async {
    return code == '0000' ? true : throw Exception();
  }

  /// Get user's phone number with the country code
  @override
  Future<String> getFullPhoneNumber() async => '+38164 1234567';

  /// Edit the user's phone number and return fullPhoneNumber
  @override
  Future<String> updatePhoneNumber(String newNumber) async => '+38164 1234567';

  /// Send a new code to the user
  @override
  Future<bool> sendConfirmationSms(String usersPhoneNumber) async {
    await Future.delayed(const Duration(seconds: 3));
    return true;
  }

  /// How long codes will be valid in seconds
  @override
  Future<int> getValidityTime(bool reset) async => 30;

  /// How long the resendCode button will be disabled after a code has been sent
  @override
  Future<int> getResendButtonThrottleTime(bool reset) async => 15;

  /// How many characters the code has
  @override
  Future<int> getCodeLength() async => 4;
}
