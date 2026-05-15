import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';
import 'package:widget_toolkit/widget_toolkit.dart';

import '../../base/models/temporary_code_state.dart';
import '../../base/theme/sms_code_theme.dart';
import '../../base/utils/localized_strings.dart';
import '../bloc/sms_code_bloc.dart';

/// Resend control wired to [SmsCodeBlocType] when [useInternalCommunication] is
/// true, or a standalone [IconTextButton] when you drive [state] yourself.
class ResendCodeButton extends StatelessWidget {
  const ResendCodeButton({
    this.label,
    this.onPressed,
    this.textStyle,
    this.buttonColorStyle,
    this.strings,
    this.activeStateIcon,
    this.pressedStateIcon,
    this.disabledStateIcon,
    this.loadingStateIcon,
    this.capitalizeLabels = true,
    this.splashEffectEnabled = false,
    this.useInternalCommunication = true,
    this.state = ButtonStateModel.enabled,
    super.key,
  })  : assert(
            activeStateIcon is IconData ||
                activeStateIcon is Widget ||
                activeStateIcon == null,
            'Provide Widget, IconData or null for activeStateIcon.'),
        assert(
            loadingStateIcon is IconData ||
                loadingStateIcon is Widget ||
                loadingStateIcon == null,
            'Provide Widget, IconData or null for loadingStateIcon.'),
        assert(
            pressedStateIcon is IconData ||
                pressedStateIcon is Widget ||
                pressedStateIcon == null,
            'Provide Widget, IconData or null for codeSentStateIcon.'),
        assert(
            disabledStateIcon is IconData ||
                disabledStateIcon is Widget ||
                disabledStateIcon == null,
            'Provide Widget, IconData or null for errorStateIcon.');

  /// Overrides the label for the enabled or loading path when
  /// [useInternalCommunication] is false; when the bloc drives the widget, the
  /// label comes from [LocalizedStrings] unless [strings] supplies an override.
  final String? label;

  /// Runs after the bloc’s [SmsCodeBlocEvents.sendNewCode] call when
  /// [useInternalCommunication] is true, and is the sole tap handler when you
  /// manage [state] yourself.
  final void Function()? onPressed;

  /// When true, the button shows the Material splash on press in `resend_code_button.dart`.
  final bool splashEffectEnabled;

  /// Overrides the label typography on the nested [IconTextButton].
  final TextStyle? textStyle;

  /// Overrides gradient, text, disabled, and pressed colors; otherwise
  /// [ButtonColorStyle.fromContext] consumes [SmsCodeTheme] resend tokens.
  final ButtonColorStyle? buttonColorStyle;

  /// Uppercases labels before rendering when true, which matches the stock UX
  /// for call-to-action copy on resend.
  final bool capitalizeLabels;

  /// Supplies copy overrides ahead of [BuildContext.getLocalizedStrings] for
  /// send, sent, and error labels.
  final LocalizedStrings? strings;

  /// Icon or widget shown while the control is in the enabled state in `resend_code_button.dart`.
  final dynamic activeStateIcon;

  /// Icon or widget shown while the bloc reports a loading result for resend,
  /// or the custom [state] is loading, in `resend_code_button.dart`.
  final dynamic loadingStateIcon;

  /// Icon or widget shown during the pressed or sent acknowledgement state in
  /// `resend_code_button.dart`.
  final dynamic pressedStateIcon;

  /// Icon or widget shown when throttling disables interaction but the layout
  /// still shows the trailing affordance in `resend_code_button.dart`.
  final dynamic disabledStateIcon;

  /// When true, the widget listens to [SmsCodeBlocType] streams in
  /// `resend_code_button.dart` and forwards taps through
  /// [SmsCodeBlocEvents.sendNewCode]; when false, rendering follows [state] and
  /// [onPressed] only.
  final bool useInternalCommunication;

  /// Visual and interaction mode for the button when
  /// [useInternalCommunication] is false.
  final ButtonStateModel state;

  @override
  Widget build(BuildContext context) => useInternalCommunication
      ? _buildWithDependencies(context)
      : _buildResendButton(
          context,
          label:
              label ?? context.getLocalizedStrings.resendButtonActiveStateLabel,
          onPressed: onPressed,
          currentState: state,
          activeStateIcon: activeStateIcon,
          loadingStateIcon: loadingStateIcon,
          pressedStateIcon: pressedStateIcon,
          disabledStateIcon: disabledStateIcon,
        );

  Widget _buildWithDependencies(BuildContext context) =>
      RxBlocBuilder<SmsCodeBlocType, TemporaryCodeState>(
        state: (bloc) => bloc.states.onCodeVerificationResult,
        builder: (context, codeState, bloc) {
          ButtonStateModel? globalState = (codeState.hasData &&
                  codeState.data == TemporaryCodeState.correct)
              ? ButtonStateModel.disabled
              : null;

          return RxResultBuilder<SmsCodeBlocType, bool>(
            state: (bloc) => bloc.states.isSendNewCodeEnabled,

            buildSuccess: (context, isEnabled, bloc) =>
                RxBlocBuilder<SmsCodeBlocType, bool>(
              state: (bloc) => bloc.states.sentNewCode,
              builder: (context, isSent, bloc) => (isSent.hasData &&
                      isSent.data!)
                  ? _buildResendButton(
                      context,
                      onPressed: onPressed,
                      label: strings?.codeSent ??
                          context.getLocalizedStrings.codeSent,
                      pressedStateIcon: pressedStateIcon ??
                          Icons.check_circle_outline_rounded,
                      textColor:
                          context.smsCodeTheme.resendButtonSuccessTextColor,
                      iconColor:
                          context.smsCodeTheme.resendButtonSuccessTextColor,
                      currentState: globalState ?? ButtonStateModel.pressed,
                    )
                  : _buildResendButton(
                      context,
                      onPressed: () {
                        context.read<SmsCodeBlocType>().events.sendNewCode();
                        onPressed?.call();
                      },
                      label: strings?.sendNewCode ??
                          context.getLocalizedStrings.sendNewCode,
                      activeStateIcon: activeStateIcon ?? Icons.send_outlined,
                      disabledStateIcon:
                          (disabledStateIcon ?? Icons.send_outlined),
                      textColor: isEnabled
                          ? context.smsCodeTheme.resendButtonActiveTextColor
                          : context.smsCodeTheme.resendButtonDisabledTextColor,
                      iconColor: (globalState != ButtonStateModel.disabled &&
                              isEnabled)
                          ? context.smsCodeTheme.resendButtonActiveTextColor
                          : context.smsCodeTheme.resendButtonDisabledTextColor,
                      currentState: globalState ??
                          (isEnabled
                              ? ButtonStateModel.enabled
                              : ButtonStateModel.disabled),
                    ),
            ),

            buildLoading: (context, bloc) => _buildResendButton(context,
                onPressed: null,
                label: strings?.sendNewCode ??
                    context.getLocalizedStrings.sendNewCode,
                textColor: context.smsCodeTheme.resendButtonDisabledTextColor,
                currentState: globalState ?? ButtonStateModel.loading,
                loadingStateIcon: (loadingStateIcon ?? Icons.refresh),
                iconColor: context.smsCodeTheme.resendButtonDisabledTextColor),

            buildError: (context, error, bloc) => _buildResendButton(
              context,
              onPressed: () {
                context.read<SmsCodeBlocType>().events.sendNewCode();
                onPressed?.call();
              },
              label: strings?.smsCodeResendError ??
                  context.getLocalizedStrings.smsCodeResendError,
              iconColor: context.smsCodeTheme.resendButtonErrorTextColor,
              activeStateIcon: activeStateIcon ?? Icons.refresh,
              textColor: context.smsCodeTheme.resendButtonErrorTextColor,
              currentState: globalState ?? ButtonStateModel.enabled,
            ),
            // ),
          );
        },
      );

  Widget _buildResendButton(
    BuildContext context, {
    required String label,
    void Function()? onPressed,
    Color? textColor,
    Color? iconColor,
    required ButtonStateModel currentState,
    dynamic activeStateIcon,
    dynamic loadingStateIcon,
    dynamic pressedStateIcon,
    dynamic disabledStateIcon,
  }) =>
      IconTextButton(
        splashEffectEnabled: splashEffectEnabled,
        state: currentState,
        iconColor: iconColor,
        icon: currentState == ButtonStateModel.loading
            ? (loadingStateIcon ??
                SizedLoadingIndicator(
                  color: textColor,
                  padding: EdgeInsets.zero,
                  size: Size(
                    context.smsCodeTheme.resendButtonLoadingIndicatorSize,
                    context.smsCodeTheme.resendButtonLoadingIndicatorSize,
                  ),
                  strokeWidth: 3,
                ))
            : currentState == ButtonStateModel.pressed
                ? pressedStateIcon
                : currentState == ButtonStateModel.enabled
                    ? activeStateIcon
                    : currentState == ButtonStateModel.disabled
                        ? disabledStateIcon
                        : activeStateIcon,
        colorStyle: buttonColorStyle ??
            ButtonColorStyle.fromContext(
              context,
              activeGradientColorStart:
                  context.smsCodeTheme.resendButtonBackgroundColor,
              activeButtonTextColor:
                  context.smsCodeTheme.resendButtonActiveTextColor,
              disabledButtonTextColor:
                  context.smsCodeTheme.resendButtonDisabledTextColor,
              pressedColor: context.smsCodeTheme.resendButtonPressedColor,
            ),
        onPressed: () => onPressed?.call(),
        text: capitalizeLabels ? label.toUpperCase() : label,
        textStyle: textStyle ??
            context.smsCodeTheme.resendButtonDefaultTextStyle
                .copyWith(color: textColor),
      );
}
