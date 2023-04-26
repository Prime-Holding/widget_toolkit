import 'package:flutter/material.dart';

extension PinKeyExtension on BuildContext {
  double calculatePinKeySize() {
    final size = MediaQuery.of(this).size.width / 5;
    if (size < 48) return 48;
    if (size > 96) return 96;
    return size;
  }
}
