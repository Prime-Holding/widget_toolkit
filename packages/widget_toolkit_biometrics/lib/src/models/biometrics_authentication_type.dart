enum BiometricsAuthType {
  /// Face authentication.
  face,

  /// Fingerprint authentication.
  fingerprint,

  /// Iris authentication.
  iris,

  /// Any biometric (e.g. fingerprint, iris, or face) on the device that the
  /// platform API considers to be strong. For example, on Android this
  /// corresponds to Class 3.
  strong,

  /// Any biometric (e.g. fingerprint, iris, or face) on the device that the
  /// platform API considers to be weak. For example, on Android this
  /// corresponds to Class 2.
  weak,
}
