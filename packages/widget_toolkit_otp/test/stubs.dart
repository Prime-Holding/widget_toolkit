import 'package:flutter/cupertino.dart';
import 'package:pinput/pinput.dart';
import 'package:widget_toolkit_otp/src/base/models/error/error_model.dart';

class Stubs {
  static Key buttonKey = const ValueKey('resendButtonKey');
  static Duration durationOneSecond = const Duration(seconds: 1);
  static Duration durationThreeSeconds = const Duration(seconds: 3);
  static int oneSecond = 1;

  static Key smsCodeFieldKey = const ValueKey('smsCodeFieldKey');
  static TextEditingController controllerEmpty = TextEditingController();
  static TextEditingController controllerFourDigits = TextEditingController()
    ..setText('1234');
  static TextEditingController controllerSixDigits = TextEditingController()
    ..setText('123456');

  static String initialPhoneNumber = '+359899123456';
  static String phoneNumber = '+359899999999';
  static int sentNewCodeActivationTime = 1;
  static int codeLength = 5;
  static String code = '55555';
  static const int resendButtonThrottleTime = 3;
  static const int validityTime = 30;

  static String defaultException = 'Default exception';
  static Exception throwable = ErrorModel();
}
