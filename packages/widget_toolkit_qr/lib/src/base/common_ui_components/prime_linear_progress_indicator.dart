import 'package:flutter/material.dart';

import '../theme/qr_scanner_theme.dart';

class PrimeLinearProgressIndicator extends StatelessWidget {
  const PrimeLinearProgressIndicator({
    this.backgroundColor,
    this.color,
    this.valueColor,
    this.minHeight,
    this.borderRadius,
    super.key,
  });

  final Color? backgroundColor;
  final Color? color;
  final Animation<Color?>? valueColor;
  final double? minHeight;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 0.0)),
        child: LinearProgressIndicator(
          backgroundColor: backgroundColor ??
              context.qrScannerTheme.linearProgressIndicatorBlueLightColor,
          color: color ?? context.qrScannerTheme.linearProgressIndicatorBlue,
          valueColor: valueColor,
          minHeight:
              minHeight ?? context.qrScannerTheme.linearProgressIndicatorXS,
        ),
      );
}
