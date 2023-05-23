import 'package:flutter/material.dart';

double calculateKeyboardButtonSize(BuildContext context) {
  final size = MediaQuery.of(context).size.width / 5;
  if (size < 48) return 48;
  if (size > 96) return 96;
  return size;
}
