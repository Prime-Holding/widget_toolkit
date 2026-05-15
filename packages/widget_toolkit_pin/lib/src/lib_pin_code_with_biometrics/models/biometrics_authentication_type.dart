/// Normalized biometric modality list derived from package local_auth so PIN flows can branch on
/// face, fingerprint, or iris without depending on platform-specific enum spellings.
enum BiometricsAuthType {
  /// Face unlock or equivalent strong face templates surfaced as a single modality bucket.
  face,
  /// Fingerprint sensors or touch-based fingerprint enrollment on supported hardware.
  fingerprint,
  /// Iris scanning hardware when the platform still reports a dedicated iris type.
  iris,
}
