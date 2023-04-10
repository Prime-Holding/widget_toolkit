import 'package:flutter/material.dart';
import 'package:widget_toolkit/ui_components.dart';

import '../../base/extensions/error_model_translations.dart';
import '../../base/models/error/error_model.dart';
import '../../base/models/error_modal_configuration.dart';
import '../../base/resources/pin_localized_strings.dart';
import '../../base/utils/theme/prime_pin_theme.dart';

void showPinCodeErrorModal(BuildContext context,
    {required ErrorPinAttemptsModel error,
    bool hasRetryButton = false,
    VoidCallback? onChangePinTap,
    VoidCallback? onCloseTap,
    PinLocalizedStrings? translatableStrings,
    WidgetBuilder? headerBuilder,
    ErrorModalConfiguration modalConfiguration =
        const ErrorModalConfiguration()}) {
  showBlurredBottomSheet(
    context: context,
    configuration: modalConfiguration,
    headerBuilder: headerBuilder,
    builder: (context) => Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: context.primePinTheme.errorModalTitlePadding,
          child: Text(
            error.translate(context, translatableStrings: translatableStrings),
            style: context.primePinTheme.errorModalTitleTextStyle,
          ),
        ),
        Padding(
          padding: context.primePinTheme.errorModalErrorWidgetPadding,
          child: ErrorCardWidget(
            exception: error,
            retryButtonVisible: hasRetryButton,
            onRetryPressed: hasRetryButton ? onChangePinTap : null,
          ),
        ),
        Padding(
          padding: error.remainingAttempts == 0
              ? context.primePinTheme.errorModalCloseButtonPadding1
              : context.primePinTheme.errorModalCloseButtonPadding2,
          child: error.remainingAttempts == 0
              ? OutlineFillButton(
                  text: translatableStrings?.errorModalActionLabel ??
                      context.getPinLocalizedStrings.errorModalActionLabel,
                  colorStyle: ButtonColorStyle.fromContext(
                    context,
                    activeButtonTextColor:
                        context.primePinTheme.errorModalActionButtonTextColor,
                  ),
                  onPressed: () {
                    if (onCloseTap != null) onCloseTap;
                    Navigator.of(context).pop();
                  })
              : SmallButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icons.close,
                  type: SmallButtonType.outline,
                  colorStyle: ButtonColorStyle.fromContext(
                    context,
                    activeButtonTextColor:
                        context.primePinTheme.errorModalCloseButtonIconColor,
                    activeGradientColorStart: context
                        .primePinTheme.errorModalCloseButtonGradientStartColor,
                  ),
                ),
        ),
      ],
    ),
  );
}
