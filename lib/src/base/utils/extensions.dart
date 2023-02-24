import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  /// Returns whether or not the light theme is enabled
  bool get isLightTheme => Theme.of(this).brightness == Brightness.light;

  /// Returns whether or not the dark theme is enabled
  bool get isDarkTheme => Theme.of(this).brightness == Brightness.dark;
}
