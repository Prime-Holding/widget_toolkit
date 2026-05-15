import 'package:flutter/cupertino.dart';
import 'package:widget_toolkit/ui_components.dart';

import '../../../widget_toolkit_qr.dart';

/// Presents showErrorBlurredBottomSheet so hosts can mirror failures coming from
/// [QrScannerBlocStates.errors] with widget_toolkit styling consistent across QR flows.
/// The [context] parameter anchors navigation when routing the modal overlay while [error]
/// supplies the main explanatory message rendered inside the sheet body.
/// [retryButtonText] labels the affirmative recovery control whose tap forwards to [retryCallback]
/// when hosts supply one, and [onCancelCallback] runs when the sheet resolves without committing retry.
/// Optional [headerWidget], [footerWidget], and [image] widgets extend the blurred scaffold chrome beyond plain text,
/// and ModalConfiguration picks up non-required booleans [showHeaderPill], [safeAreaBottom], and [showCloseButton]
/// so parity matches widget_toolkit [showErrorBottomSheet].
void showQrScannerErrorBottomModalSheet({
  required BuildContext context,
  required String error,
  required String retryButtonText,
  Widget? headerWidget,
  Widget? footerWidget,
  Widget? image,
  Function(BuildContext)? retryCallback,
  bool showHeaderPill = true,
  bool safeAreaBottom = false,
  bool showCloseButton = true,
  Function()? onCancelCallback,
}) =>
    showErrorBlurredBottomSheet(
      context: context,
      error: error,
      headerWidget: headerWidget,
      footerWidget: footerWidget,
      image: image,
      retryCallback: retryCallback,
      onCancelCallback: onCancelCallback,
      configuration: ModalConfiguration(
        showCloseButton: showCloseButton,
        safeAreaBottom: safeAreaBottom,
        showHeaderPill: showHeaderPill,
      ),
      retryButtonText: retryButtonText,
    );
