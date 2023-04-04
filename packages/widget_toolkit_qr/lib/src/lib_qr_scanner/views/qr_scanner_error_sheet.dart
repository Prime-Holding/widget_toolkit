import 'package:flutter/cupertino.dart';
import 'package:widget_toolkit/ui_components.dart';

import '../../../widget_toolkit_qr.dart';

/// This function can be used to provide a bottom modal sheet, in which the error
/// text from [QrScannerBloc] error state can be printed. The error state from
/// the bloc can be listened also in another place in your app, with a custom
/// implementation of a builder or listener.
///
/// For more information of the parameters, you can read the documentation for
/// [showErrorBottomSheet]
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
  showCloseButton = true,
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
