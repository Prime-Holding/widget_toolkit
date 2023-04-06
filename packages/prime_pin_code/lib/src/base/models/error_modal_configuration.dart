import 'package:flutter/material.dart';

class ErrorModalConfiguration {
  ErrorModalConfiguration(
      {this.applySafeArea = true,
      this.contentAlignment,
      this.haveOnlyOneSheet = true,
      this.headerBuilder,
      this.heightFactor,
      this.isDismissible = true,
      this.safeAreaBottom = true,
      this.showCloseButton = false,
      this.showHeaderPill = true});

  final WidgetBuilder? headerBuilder;
  final double? heightFactor;
  final MainAxisAlignment? contentAlignment;
  final bool haveOnlyOneSheet;
  final bool isDismissible;
  final bool applySafeArea;
  final bool safeAreaBottom;
  final bool showHeaderPill;
  final bool showCloseButton;
}
