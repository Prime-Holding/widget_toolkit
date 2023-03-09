import 'package:flutter/material.dart';

typedef ItemPickerItemBuilder<T> = Widget Function(
  BuildContext context,
  T? model,
  bool isSelected,
  bool isLoading,
);
