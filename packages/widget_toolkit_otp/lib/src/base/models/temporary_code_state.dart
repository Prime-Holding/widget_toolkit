import 'package:flutter/cupertino.dart';

import '../utils/localized_strings.dart';

/// High-level verification states surfaced through [SmsCodeBlocStates.onCodeVerificationResult]
/// and consumed by [SmsCodeField], [SmsCodeWidget], and [ResendCodeButton].
enum TemporaryCodeState {
  /// Indicates the OTP area is idle before any digits were committed to the bloc.
  inactive,

  /// Indicates digits are present while verification has not finished.
  populated,

  /// Indicates the backend confirmed the OTP, unlocking success styling in [SmsCodeField].
  correct,

  /// Indicates the last attempt failed and [SmsCodeField] should show error styling.
  wrong,

  /// Indicates the user exhausted retries and the flow needs a fresh code path.
  wrongTooManyRetries,

  /// Indicates an async verification or send operation is in flight.
  loading,

  /// Tells listeners to clear inputs so the bloc can restart the entry experience.
  reset,

  /// Indicates timed validity expired so inputs should lock until a new code arrives.
  disabled
}

extension TemporaryCodeTranslate on TemporaryCodeState {
  String translateToMessage(BuildContext context) {
    switch (this) {
      case TemporaryCodeState.correct:
        return context.getLocalizedStrings.codeStateCorrect;
      case TemporaryCodeState.wrong:
        return context.getLocalizedStrings.codeStateWrong;
      case TemporaryCodeState.disabled:
        return context.getLocalizedStrings.codeStateDisabled;
      default:
        return context.getLocalizedStrings.codeStateDefault;
    }
  }
}
