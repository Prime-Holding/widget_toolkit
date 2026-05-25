/// Enum representing different time formats with each one including the smaller
/// time formats.
enum CountdownTimeFormat {
  /// Displays the countdown as seconds
  seconds,

  /// Displays the countdown in the minutes:seconds format
  minutes,

  /// Displays the countdown in the hours:minutes:seconds format
  hours,
}

/// The method that is used to get the sms code on Android
enum AndroidSmsAutofillMethod {
  /// Disabled SMS autofill on Android
  none,

  /// Automatically reads sms without user interaction
  /// Requires SMS to contain The App signature, see readme for more details
  /// More about Sms Retriever API https://developers.google.com/identity/sms-retriever/overview?hl=en
  smsRetrieverApi,

  /// Requires user interaction to confirm reading a SMS, see readme for more details
  /// [AndroidSmsAutofillMethod.smsUserConsentApi]
  /// More about SMS User Consent API https://developers.google.com/identity/sms-retriever/user-consent/overview
  smsUserConsentApi,
}

/// The animation applied to each PIN cell inside [SmsCodeField] when it forwards
/// settings to Pinput in `sms_code_field.dart`.
enum PinAnimationType {
  /// Keeps transitions off while still honoring focus and validation coloring.
  none,

  /// Scales the cell slightly on input, matching the default option on [SmsCodeField].
  scale,

  /// Fades between idle and active appearances per keystroke.
  fade,

  /// Slides characters into view along the primary axis of the PIN row.
  slide,

  /// Rotates the cell briefly to acknowledge input.
  rotation,
}

/// Drives haptic responses for each keystroke inside [SmsCodeField] through the
/// mapped Pinput configuration in `sms_code_field.dart`.
enum HapticFeedbackType {
  /// Skips platform haptics so OTP entry stays silent.
  disabled,

  /// Light impact suitable for subtle confirmation taps.
  lightImpact,

  /// Medium impact for more noticeable feedback on each digit.
  mediumImpact,

  /// Heavy impact for pronounced tactile acknowledgement.
  heavyImpact,

  /// Uses the platform selection click for discrete step feedback.
  selectionClick,

  /// Triggers a short vibrate pattern where the platform supports it.
  vibrate,
}
