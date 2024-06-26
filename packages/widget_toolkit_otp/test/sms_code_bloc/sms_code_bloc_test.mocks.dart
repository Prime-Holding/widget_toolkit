// Mocks generated by Mockito 5.4.4 from annotations
// in widget_toolkit_otp/test/sms_code_bloc/sms_code_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i4;
import 'package:widget_toolkit_otp/src/lib_countdown_widget/services/countdown_service.dart'
    as _i5;
import 'package:widget_toolkit_otp/src/lib_sms_code_verification/services/sms_code_service.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [SmsCodeService].
///
/// See the documentation for Mockito's code generation for more information.
class MockSmsCodeService extends _i1.Mock implements _i2.SmsCodeService {
  MockSmsCodeService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<dynamic> confirmPhoneCode(String? code) => (super.noSuchMethod(
        Invocation.method(
          #confirmPhoneCode,
          [code],
        ),
        returnValue: _i3.Future<dynamic>.value(),
      ) as _i3.Future<dynamic>);

  @override
  _i3.Future<String> getFullPhoneNumber() => (super.noSuchMethod(
        Invocation.method(
          #getFullPhoneNumber,
          [],
        ),
        returnValue: _i3.Future<String>.value(_i4.dummyValue<String>(
          this,
          Invocation.method(
            #getFullPhoneNumber,
            [],
          ),
        )),
      ) as _i3.Future<String>);

  @override
  _i3.Future<String> updatePhoneNumber(String? newNumber) =>
      (super.noSuchMethod(
        Invocation.method(
          #updatePhoneNumber,
          [newNumber],
        ),
        returnValue: _i3.Future<String>.value(_i4.dummyValue<String>(
          this,
          Invocation.method(
            #updatePhoneNumber,
            [newNumber],
          ),
        )),
      ) as _i3.Future<String>);

  @override
  _i3.Future<bool> sendConfirmationSms(String? usersPhoneNumber) =>
      (super.noSuchMethod(
        Invocation.method(
          #sendConfirmationSms,
          [usersPhoneNumber],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<int> getValidityTime(bool? reset) => (super.noSuchMethod(
        Invocation.method(
          #getValidityTime,
          [reset],
        ),
        returnValue: _i3.Future<int>.value(0),
      ) as _i3.Future<int>);

  @override
  _i3.Future<int> getResendButtonThrottleTime(bool? reset) =>
      (super.noSuchMethod(
        Invocation.method(
          #getResendButtonThrottleTime,
          [reset],
        ),
        returnValue: _i3.Future<int>.value(0),
      ) as _i3.Future<int>);

  @override
  _i3.Future<int> getCodeLength() => (super.noSuchMethod(
        Invocation.method(
          #getCodeLength,
          [],
        ),
        returnValue: _i3.Future<int>.value(0),
      ) as _i3.Future<int>);
}

/// A class which mocks [CountdownService].
///
/// See the documentation for Mockito's code generation for more information.
class MockCountdownService extends _i1.Mock implements _i5.CountdownService {
  MockCountdownService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Stream<int> countDown({int? maxTime = 60}) => (super.noSuchMethod(
        Invocation.method(
          #countDown,
          [],
          {#maxTime: maxTime},
        ),
        returnValue: _i3.Stream<int>.empty(),
      ) as _i3.Stream<int>);
}
