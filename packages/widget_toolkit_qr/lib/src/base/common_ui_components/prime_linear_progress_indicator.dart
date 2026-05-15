import 'package:flutter/material.dart';

import '../theme/qr_scanner_theme.dart';

/// Thin wrapper around [LinearProgressIndicator] that clips corners and defaults colors plus
/// thickness from [QrScannerTheme] when callers omit explicit styling.
class PrimeLinearProgressIndicator extends StatelessWidget {
  const PrimeLinearProgressIndicator({
    this.backgroundColor,
    this.color,
    this.valueColor,
    this.minHeight,
    this.borderRadius,
    super.key,
  });

  /// Track fill painted behind the animating value when non-null; otherwise
  /// [QrScannerTheme.linearProgressIndicatorBackgroundColor] supplies the track color from `qr_scanner_theme.dart`.
  final Color? backgroundColor;

  /// Foreground color for determinate progress or indeterminate sweeps when non-null; otherwise
  /// [QrScannerTheme.linearProgressIndicatorColor] from `qr_scanner_theme.dart` applies.
  final Color? color;

  /// Optional animated color provider forwarded verbatim to [LinearProgressIndicator.valueColor].
  final Animation<Color?>? valueColor;

  /// Explicit bar thickness when non-null; otherwise [QrScannerTheme.linearProgressIndicatorDefaultMinHeight]
  /// from `qr_scanner_theme.dart` defines the height.
  final double? minHeight;

  /// Corner radius fed into [ClipRRect] before painting [LinearProgressIndicator]; zero keeps square ends.
  final double? borderRadius;

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 0.0)),
        child: LinearProgressIndicator(
          backgroundColor: backgroundColor ??
              context.qrScannerTheme.linearProgressIndicatorBackgroundColor,
          color: color ?? context.qrScannerTheme.linearProgressIndicatorColor,
          valueColor: valueColor,
          minHeight: minHeight ??
              context.qrScannerTheme.linearProgressIndicatorDefaultMinHeight,
        ),
      );
}
