import 'package:flutter/material.dart';
import 'package:widget_toolkit/widget_toolkit.dart';

class ErrorModalConfiguration extends ModalConfiguration {
  const ErrorModalConfiguration({
    bool applySafeArea = true,
    MainAxisAlignment? contentAlignment,
    bool haveOnlyOneSheet = true,
    double? heightFactor,
    bool isDismissible = true,
    bool safeAreaBottom = true,
    bool showCloseButton = false,
    bool showHeaderPill = true,
    bool fullScreen = false,
    bool dialogHasBottomPadding = true,
  }) : super(
            safeAreaBottom: safeAreaBottom,
            contentAlignment: contentAlignment,
            fullScreen: fullScreen,
            haveOnlyOneSheet: haveOnlyOneSheet,
            showHeaderPill: showHeaderPill,
            showCloseButton: showCloseButton,
            heightFactor: heightFactor,
            dialogHasBottomPadding: dialogHasBottomPadding,
            isDismissible: isDismissible);
}
