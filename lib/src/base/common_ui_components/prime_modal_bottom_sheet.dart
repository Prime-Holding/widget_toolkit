import 'package:flutter/material.dart';

import '../common_ui_components/app_modal_bottom_sheet.dart';

/// Displays a customizable modal sheet with a background blur effect. Requires
/// a [builder] method which returns the contents of the modal sheet.
///
/// You can also specify a [headerBuilder] builder method that returns a widget
/// which will be build above the contents of the widget returned from the
/// [builder]. Additionally, you can choose to toggle the display a modal sheet
/// pill cutout at the top of the modal sheet by setting the [showHeaderPill]
/// flag (defaults to `true`).
///
/// A [heightFactor] can be specified which defines the amount of the remaining
/// screen estate that the modal sheet will take.
///
/// You can define the alignment of the content by specifying the
/// [contentAlignment] property (defaults to `MainAxisAlignment.start`).
///
/// If you want to enforce only one modal sheet at a time, you can do this by
/// specifying the [haveOnlyOneSheet] parameter (defaults to `true`).
///
/// The [isDismissible] parameter controls whether or not the modal sheet can be
/// dismissed manually by the user (defaults to `true`).
///
/// By setting the [applySafeArea] to `true` the displayed widget will be
/// wrapped in a SafeArea widget. Additionally, if you want to apply a safe area
/// padding to the bottom, you can do that by setting the [safeAreaBottom] to
/// `true`. Both of these options are enabled by default.
Future<T?> showPrimeBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  WidgetBuilder? headerBuilder,
  double? heightFactor,
  MainAxisAlignment? contentAlignment,
  bool haveOnlyOneSheet = true,
  bool isDismissible = true,
  bool applySafeArea = true,
  bool safeAreaBottom = true,
  bool showHeaderPill = true,
  bool showCloseButton = false,
}) =>
    showAppModalBottomSheet(
        context: context,
        builder: builder,
        headerBuilder: headerBuilder,
        configuration: AppModalBottomSheetConfiguration(
          heightFactor: heightFactor,
          haveOnlyOneSheet: haveOnlyOneSheet,
          isDismissible: isDismissible,
          applySafeArea: applySafeArea,
          safeAreaBottom: safeAreaBottom,
          showHeaderPill: showHeaderPill,
          showCloseButton: showCloseButton,
        ));
