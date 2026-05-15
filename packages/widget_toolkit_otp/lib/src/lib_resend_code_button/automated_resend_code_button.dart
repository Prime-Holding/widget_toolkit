import 'package:flutter/material.dart';
import 'package:widget_toolkit/widget_toolkit.dart';

import '../base/extensions/exception_extensions.dart';
import '../base/theme/sms_code_theme.dart';
import '../base/utils/localized_strings.dart';
import '../lib_countdown_widget/di/countdown_widget.dart';

/// AutomatedResendCodeButton maintains its own statuses. Once the button is being
/// pressed, it goes through a few stats (loading, codeSent, disabled, active,
/// error). The button is enabled only in active state. When pressed, it goes in
/// loading state while the [onPressed] is being executed. Loading indicator and
/// [strings.resendButtonLoadingStateLabel] are presented. Then the button
/// automatically goes to codeSent state for [sentStateDuration] presenting
/// [codeSentStateIcon] or its default value and [strings.resendButtonCodeSentStateLabel].
/// Next is disabled state for [disabledDuration] seconds. In disabled state the
/// button displays countDown instead of icon and [strings.resendButtonDisabledStateLabel].
/// After [disabledDuration] time past, the button gets back in active state
/// with [activeStateIcon] and [strings.resendButtonActiveStateLabel]. Right
/// after that, the button will be switched back to the enabled state. If an error occur while [onPressed] is executed, the button get in error
/// state instead of codeSent state. [errorStateIcon] and [strings.resendButtonErrorStateLabel]
/// are displayed for [errorStateDuration] seconds. [onError] callback will be
/// executed if provided.
class AutomatedResendCodeButton extends StatefulWidget {
  const AutomatedResendCodeButton({
    required this.onPressed,
    this.onError,
    this.sentStateDuration = 2,
    this.errorStateDuration = 2,
    this.disabledDuration = 30,
    this.textStyle,
    this.buttonColorStyle,
    this.strings,
    this.activeStateIcon,
    this.codeSentStateIcon,
    this.errorStateIcon,
    this.loadingStateIcon,
    this.capitalizeLabels = true,
    this.overwriteLoadingIcon = false,
    this.splashEffectEnabled = false,
    super.key,
  });

  /// A callback to be executed once the active button is pressed. Right before
  /// that, the button state will be changed to loading while this Future is
  /// being processed. After that codeSent and disabled states of the button
  /// will be set one after another respective for [sentStateDuration] and
  /// [disabledDuration].
  final Future<void> Function() onPressed;

  /// Callback executed if an error occurs during the [onPressed] event
  final void Function(String)? onError;

  /// How long in seconds sentCodeState of the button will be presented
  /// (defaults to 2 seconds).
  final int sentStateDuration;

  /// How long in seconds errorState of the button will be presented
  /// (defaults to 2 seconds).
  final int errorStateDuration;

  /// Use this to provide a custom textStyle for button labels
  final TextStyle? textStyle;

  /// If button labels will be capitalized, defaults to true
  final bool capitalizeLabels;

  /// The style of the button
  final ButtonColorStyle? buttonColorStyle;

  /// When true, the shared resend builder in `automated_resend_code_button.dart` swaps the default
  /// [SizedLoadingIndicator] for [loadingStateIcon] during the loading phase; when false, the
  /// tailored loading indicator keeps guiding users while the Future from [onPressed] runs.
  final bool overwriteLoadingIcon;

  /// Localized copy overrides for every visual state rendered by
  /// `automated_resend_code_button.dart`, falling back to [BuildContext.getLocalizedStrings]
  /// when a getter is not replaced.
  final LocalizedStrings? strings;

  /// Seconds the control spends in the disabled branch after [onPressed] resolves,
  /// during which the disabled-state layout embeds [CountdownWidget] instead of a static icon.
  final int disabledDuration;

  /// Icon or widget for the idle, tappable state in `automated_resend_code_button.dart`.
  final dynamic activeStateIcon;

  /// Icon or widget presented during loading whenever [overwriteLoadingIcon] enables custom media
  /// in `automated_resend_code_button.dart`.
  final dynamic loadingStateIcon;

  /// Icon or widget presented after a successful send in `automated_resend_code_button.dart`.
  final dynamic codeSentStateIcon;

  /// Icon or widget shown while the error copy is visible in `automated_resend_code_button.dart`.
  final dynamic errorStateIcon;

  /// When true, tap feedback uses the Material splash configured on [IconTextButton] in
  /// `automated_resend_code_button.dart`.
  final bool splashEffectEnabled;

  @override
  State<AutomatedResendCodeButton> createState() =>
      _AutomatedResendCodeButtonState();
}

class _AutomatedResendCodeButtonState extends State<AutomatedResendCodeButton> {
  late _ResendButtonState _buttonState;

  TextStyle _getDefaultTextStyle(BuildContext context) =>
      context.smsCodeTheme.resendButtonDefaultTextStyle
          .copyWith(color: getTextColor(context));

  @override
  void initState() {
    _buttonState = _ResendButtonState.active;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (_buttonState) {
      case (_ResendButtonState.active):
        return _activeWidget(context);
      case (_ResendButtonState.loading):
        return _loadingWidget(context);
      case (_ResendButtonState.codeSent):
        return _sentCodeWidget(context);
      case (_ResendButtonState.disabled):
        return _disabledWidget(context);
      case (_ResendButtonState.error):
        return _errorWidget(context);
    }
  }

  Widget _loadingWidget(BuildContext context) => _buildResendButton(context,
      text: widget.strings?.resendButtonLoadingStateLabel ??
          context.getLocalizedStrings.resendButtonLoadingStateLabel,
      isEnabled: false,
      isLoading: true,
      icon: widget.loadingStateIcon);

  Widget _errorWidget(BuildContext context) => _buildResendButton(context,
      text: widget.strings?.resendButtonErrorStateLabel ??
          context.getLocalizedStrings.resendButtonErrorStateLabel,
      isEnabled: false,
      icon: widget.errorStateIcon ?? Icons.error_outline);

  Widget _sentCodeWidget(BuildContext context) => _buildResendButton(
        context,
        isEnabled: false,
        text: widget.strings?.resendButtonCodeSentStateLabel ??
            context.getLocalizedStrings.resendButtonCodeSentStateLabel,
        icon: widget.codeSentStateIcon ?? Icons.check_circle_outline,
      );

  Widget _disabledWidget(BuildContext context) => _buildResendButton(
        context,
        isEnabled: false,
        text: widget.strings?.resendButtonDisabledStateLabel ??
            context.getLocalizedStrings.resendButtonDisabledStateLabel,
        icon: CountdownWidget(
            countdownTime: widget.disabledDuration,
            onCountdownTick: _onCountDownTick,
            textStyle: _getDefaultTextStyle(context)),
      );

  Widget _activeWidget(BuildContext context) => _buildResendButton(
        context,
        isEnabled: true,
        icon: widget.activeStateIcon ?? Icons.send_rounded,
        text: widget.strings?.resendButtonActiveStateLabel ??
            context.getLocalizedStrings.resendButtonActiveStateLabel,
        onPressed: () async {
          bool getError = false;
          _setLoadingState();
          try {
            await widget.onPressed.call();
          } catch (e) {
            getError = true;
            _setErrorState();
            widget.onError?.call(e.asErrorString);
          }
          if (!getError) {
            _setSentCodeState();
            await _sentStateDuration();
          } else {
            await _errorStateDuration();
          }
          _setDisabledState();
        },
      );

  Widget _buildResendButton(
    BuildContext context, {
    required bool isEnabled,
    required String text,
    required dynamic icon,
    void Function()? onPressed,
    bool isLoading = false,
  }) =>
      IconTextButton(
        splashEffectEnabled: widget.splashEffectEnabled,
        state: isEnabled ? ButtonStateModel.enabled : ButtonStateModel.disabled,
        icon: (isLoading && !widget.overwriteLoadingIcon)
            ? SizedLoadingIndicator(
                color: getTextColor(context),
                padding: EdgeInsets.zero,
                size: Size(
                  context.smsCodeTheme.resendButtonLoadingIndicatorSize,
                  context.smsCodeTheme.resendButtonLoadingIndicatorSize,
                ),
                strokeWidth: 3,
              )
            : icon,
        colorStyle: widget.buttonColorStyle ??
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
        onPressed: isEnabled ? () => onPressed?.call() : null,
        text: widget.capitalizeLabels ? text.toUpperCase() : text,
        textStyle: widget.textStyle ?? _getDefaultTextStyle(context),
      );

  Color getTextColor(BuildContext context) {
    if (_buttonState == _ResendButtonState.active) {
      return widget.buttonColorStyle?.activeButtonTextColor ??
          context.smsCodeTheme.resendButtonActiveTextColor;
    } else {
      return widget.buttonColorStyle?.activeButtonTextColor ??
          context.smsCodeTheme.resendButtonDisabledTextColor;
    }
  }

  Future<void> _sentStateDuration() =>
      Future.delayed(Duration(seconds: widget.sentStateDuration));

  Future<void> _errorStateDuration() =>
      Future.delayed(Duration(seconds: widget.errorStateDuration));

  void _onCountDownTick(int remainingTime) =>
      remainingTime == 0 ? _setActiveState() : null;

  void _setActiveState() => setState(() {
        _buttonState = _ResendButtonState.active;
      });
  void _setLoadingState() => setState(() {
        _buttonState = _ResendButtonState.loading;
      });
  void _setDisabledState() => setState(() {
        _buttonState = _ResendButtonState.disabled;
      });
  void _setSentCodeState() => setState(() {
        _buttonState = _ResendButtonState.codeSent;
      });
  void _setErrorState() => setState(() {
        _buttonState = _ResendButtonState.error;
      });
}

/// Enum describing different resend button states
enum _ResendButtonState { active, loading, codeSent, disabled, error }
