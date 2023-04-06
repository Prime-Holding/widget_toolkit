import 'package:flutter/cupertino.dart';

/// Use this class to translate all labels used in the package. If skip it,
/// default values in English will be used.
/// See the default values in the comments above each method
class PinLocalizedStrings {
  PinLocalizedStrings(this.context);
  PinLocalizedStrings._(this.context);

  factory PinLocalizedStrings.of(context) => _instance != null
      ? _instance!
      : _instance = PinLocalizedStrings._(context);

  static PinLocalizedStrings? _instance;

  final BuildContext context;

  /// Default value '1 attempt left'
  String get errorPinOneAttemptLeft => '1 attempt left';

  /// Default value 'No attempts left'
  String get errorPinNoAttemptsLeft => 'No attempts left';

  /// Default value '$count attempts left'
  String errorPinXAttemptsLeft(String count) => '$count attempts left';

  /// Default value 'Something went wrong. Please try again.'
  String get genericErrorMessage => 'Something went wrong. Please try again.';

  /// Default value 'Enter your pin code by authenticating with biometrics'
  String get enterPinWithBiometrics =>
      'Enter your pin code by authenticating with biometrics';

  /// Default value 'Enter your pin code by authenticating with biometrics'
  String get errorModalActionLabel => 'Change PIN code';
}

extension LocalizedStringsContextExtension on BuildContext {
  PinLocalizedStrings get getPinLocalizedStrings =>
      PinLocalizedStrings.of(this);
}
