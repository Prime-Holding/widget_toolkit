import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../base/models/temporary_code_state.dart';
import '../base/theme/sms_code_theme.dart';
import '../lib_sms_code_verification/bloc/sms_code_bloc.dart';
import 'sms_code_theme_configuration.dart';

/// SMS code field with a lot of customization also supporting sms code
/// autofill and paste functionality.
class SmsCodeField extends StatelessWidget {
  const SmsCodeField({
    this.onChanged,
    this.onSubmitted,
    this.onCompleted,
    this.onFieldTap,
    this.controller,
    this.focusNode,
    this.validator,
    this.cursor,
    this.errorText,
    this.errorBuilder,
    this.prefilledWidget,
    this.obscuringWidget,
    this.separator = const SizedBox(width: 8),
    this.senderPhoneNumber,
    this.pinLength = 4,
    this.enabled,
    this.readOnly = false,
    this.autofocus = false,
    this.showCursor = true,
    this.obscureText = false,
    this.autoValidate = true,
    this.forceErrorState = false,
    this.closeKeyboardOnDone = true,
    this.keyboardType = TextInputType.number,
    this.pinContentAlignment = Alignment.center,
    this.themeConfig = const SmsThemeConfiguration(),
    this.inputAnimationType = PinAnimationType.scale,
    this.hapticFeedbackType = HapticFeedbackType.disabled,
    this.androidSmsAutofillMethod = AndroidSmsAutofillMethod.none,
    this.useInternalCommunication = true,
    super.key,
  });

  /// The number of pin fields
  final int pinLength;

  /// If the field readonly
  final bool readOnly;

  /// Should the field be autofocused
  final bool autofocus;

  /// Focus node for custom focus control
  final FocusNode? focusNode;

  /// Callback executed once a change has been detected
  final void Function(String)? onChanged;

  /// Callback executed once the input has been submitted via the keyboard
  final void Function(String)? onSubmitted;

  /// Callback executed once the last pin character has been entered
  final void Function(String)? onCompleted;

  /// Callback executed once the field has been tapped
  final void Function()? onFieldTap;

  /// Pin field controller
  final TextEditingController? controller;

  /// Hide text input
  final bool obscureText;

  /// Widget used to hide the input
  final Widget? obscuringWidget;

  /// Widget displayed while the field is not yet filled
  final Widget? prefilledWidget;

  /// Should the sms field auto-validate after all the fields are submitted
  final bool autoValidate;

  /// Input validator callback called once all pin fields have been filled. If
  /// the callback returns `null` the input validation is successful. Any string
  /// returned from this callback will be displayed as a validation error.
  final String? Function(BuildContext, String?)? validator;

  /// Toggles the visibility of the [cursor] widget
  final bool showCursor;

  /// Custom [cursor] widget
  final Widget? cursor;

  /// Alignment of the content inside the pin fields
  final AlignmentGeometry pinContentAlignment;

  /// Text input type
  final TextInputType keyboardType;

  /// Optional parameter for Android SMS User Consent API.
  final String? senderPhoneNumber;

  /// Should the keyboard be closed once all the fields have been submitted
  final bool closeKeyboardOnDone;

  /// By default Android autofill is Disabled, you can enable it by using any of options listed below
  ///
  /// First option is [AndroidSmsAutofillMethod.smsRetrieverApi] it automatically reads sms without user interaction
  /// More about Sms Retriever API https://developers.google.com/identity/sms-retriever/overview?hl=en
  ///
  /// Second option requires user interaction to confirm reading a SMS, See readme for more details
  /// [AndroidSmsAutofillMethod.smsUserConsentApi]
  /// More about SMS User Consent API https://developers.google.com/identity/sms-retriever/user-consent/overview
  final AndroidSmsAutofillMethod androidSmsAutofillMethod;

  /// Haptic feedback triggered every key press
  final HapticFeedbackType hapticFeedbackType;

  /// Animation type of the input
  final PinAnimationType inputAnimationType;

  /// Configuration of toolbar options.
  ///
  /// If not set, select all and paste will default to be enabled. Copy and cut
  /// will be disabled if [obscureText] is true. If [readOnly] is true,
  /// paste and cut will be disabled regardless.
  /// DEPRECATED
  // final ToolbarOptions? toolbarOptions;

  /// Error displayed below the pin field. This field is ignored if
  /// [useInternalCommunication] is set to `true`.
  final String? errorText;

  /// Force trigger the error state of the pin field. The field is ignored if
  /// [useInternalCommunication] is set to `true`.
  final bool forceErrorState;

  /// Error builder accepting the error as the first parameter and the pin as
  /// the second parameter
  final Widget Function(String? errorText, String pin)? errorBuilder;

  /// Configuration containing themes for different states of the pin field
  final SmsThemeConfiguration themeConfig;

  /// Widget which will render between the pin fields
  final Widget? separator;

  /// Is the pin field enabled
  final bool? enabled;

  /// Allow the communication between components of the Prime SMS Package. If
  /// this field is set to `true`, the widget will perform a lookup up the
  /// widget tree. If the SmsCodeBlocType bloc is not part of the widget tree,
  /// the
  final bool useInternalCommunication;

  bool get _isDisabled => enabled != null && enabled == false;

  @override
  Widget build(BuildContext context) => useInternalCommunication
      ? _buildPinFieldWithBuilder(context)
      : _buildPinField(context,
          forceErrorState: forceErrorState,
          errorText: errorText,
          pinLength: pinLength,
          enabled: enabled ?? true,
          onCompleted: onCompleted);

  /// region Builders

  /// Widget built if [useInternalCommunication] is disabled
  Widget _buildPinField(
    BuildContext context, {
    String? errorText,
    bool forceErrorState = false,
    bool enabled = true,
    required int pinLength,
    void Function(String)? onCompleted,
    bool readOnly = false,
  }) =>
      Pinput(
        defaultPinTheme: _buildDefaultTheme(context),
        errorPinTheme: _buildErrorTheme(context),
        disabledPinTheme: _isDisabled
            ? _buildDisabledTheme(context)
            : _buildSuccessTheme(context),
        focusedPinTheme: _buildFocusedTheme(context),
        submittedPinTheme: _buildSubmittedTheme(context),
        followingPinTheme: _buildUnfilledStyleTheme(context),
        androidSmsAutofillMethod: androidSmsAutofillMethod,
        hapticFeedbackType: hapticFeedbackType,
        pinAnimationType: inputAnimationType,
        preFilledWidget: prefilledWidget,
        keyboardType: keyboardType,
        controller: controller,
        length: pinLength,
        readOnly: readOnly,
        autofocus: autofocus,
        focusNode: focusNode,
        showCursor: showCursor,
        enabled: enabled,
        errorText: errorText,
        onTap: onFieldTap,
        onChanged: onChanged,
        onCompleted: onCompleted,
        onSubmitted: onSubmitted,
        obscureText: obscureText,
        obscuringWidget: obscuringWidget,
        senderPhoneNumber: senderPhoneNumber,
        pinContentAlignment: pinContentAlignment,
        errorBuilder: errorBuilder,
        forceErrorState: forceErrorState,
        closeKeyboardWhenCompleted: closeKeyboardOnDone,
        separator: separator,
        cursor: cursor ??
            Container(
              width: 1.1,
              height: 16,
              color: Colors.black.withOpacity(0.75),
            ),
        validator:
            validator != null ? (input) => validator!(context, input) : null,
        pinputAutovalidateMode: autoValidate
            ? PinputAutovalidateMode.onSubmit
            : PinputAutovalidateMode.disabled,

        /// toolbarOptions has been deprecated
        // toolbarOptions: toolbarOptions ??
        //     const ToolbarOptions(
        //       paste: true,
        //     ),
      );

  /// Widget built when [useInternalCommunication] is enabled
  Widget _buildPinFieldWithBuilder(BuildContext context) =>
      RxBlocBuilder<SmsCodeBlocType, TemporaryCodeState>(
        state: (bloc) => bloc.states.onCodeVerificationResult,
        builder: (context, verificationResult, bloc) =>
            RxBlocBuilder<SmsCodeBlocType, int>(
          state: (bloc) => bloc.states.pinLength,
          builder: (context, pinLength, bloc) => _buildPinField(
            context,
            forceErrorState:
                verificationResult.data == TemporaryCodeState.wrong,
            pinLength: pinLength.data ?? 6,
            readOnly: verificationResult.data == TemporaryCodeState.correct ||
                verificationResult.data == TemporaryCodeState.loading ||
                verificationResult.data == TemporaryCodeState.disabled,
            enabled: _isDisabled
                ? false
                : verificationResult.data != TemporaryCodeState.correct,
            onCompleted: (value) =>
                context.read<SmsCodeBlocType>().events.verifyCode(value),
          ),
        ),
      );

  /// endregion

  /// region Themes and Styling

  PinTheme _buildThemeFromConfigStyle(SmsFieldTheme theme) => PinTheme(
        width: theme.width,
        height: theme.height,
        padding: theme.padding,
        margin: theme.margin,
        textStyle: theme.textStyle,
        decoration: theme.decoration,
        constraints: theme.constraints,
      );

  PinTheme _buildGenericTheme(
    BuildContext context, {
    Color? bgColor,
    Color? borderColor,
    double? borderWidth,
    TextStyle? textStyle,
    bool showBorder = false,
  }) =>
      PinTheme(
        width: 56,
        height: 60,
        decoration: BoxDecoration(
          color: bgColor ?? context.smsCodeTheme.defaultBackgroundColor,
          borderRadius: context.smsCodeTheme.defaultBorderRadius,
          border: showBorder
              ? Border.all(
                  color: borderColor ?? context.smsCodeTheme.defaultBorderColor,
                  width: borderWidth ?? context.smsCodeTheme.defaultBorderWidth,
                )
              : null,
        ),
        textStyle: textStyle ?? context.smsCodeTheme.defaultTextStyle,
      );

  PinTheme _buildDefaultTheme(BuildContext context) =>
      themeConfig.defaultStyle != null
          ? _buildThemeFromConfigStyle(themeConfig.defaultStyle!)
          : _buildGenericTheme(context);

  PinTheme _buildDisabledTheme(BuildContext context) =>
      themeConfig.disabledStyle != null
          ? _buildThemeFromConfigStyle(themeConfig.disabledStyle!)
          : _buildGenericTheme(
              context,
              bgColor: context.smsCodeTheme.disabledBackgroundColor,
              textStyle: context.smsCodeTheme.disabledTextStyle,
            );

  PinTheme _buildFocusedTheme(BuildContext context) =>
      themeConfig.focusedStyle != null
          ? _buildThemeFromConfigStyle(themeConfig.focusedStyle!)
          : _buildGenericTheme(
              context,
              showBorder: true,
            );

  PinTheme _buildSubmittedTheme(BuildContext context) =>
      themeConfig.submittedStyle != null
          ? _buildThemeFromConfigStyle(themeConfig.submittedStyle!)
          : _buildGenericTheme(
              context,
              bgColor: context.smsCodeTheme.submittedBackgroundColor,
            );

  PinTheme _buildUnfilledStyleTheme(BuildContext context) =>
      themeConfig.unfilledStyle != null
          ? _buildThemeFromConfigStyle(themeConfig.unfilledStyle!)
          : _buildGenericTheme(
              context,
            );

  PinTheme _buildErrorTheme(BuildContext context) =>
      themeConfig.errorStyle != null
          ? _buildThemeFromConfigStyle(themeConfig.errorStyle!)
          : _buildGenericTheme(
              context,
              showBorder: true,
              bgColor: context.smsCodeTheme.errorBackgroundColor,
              borderColor: context.smsCodeTheme.errorBorderColor,
              borderWidth: context.smsCodeTheme.errorBorderWidth,
              textStyle: context.smsCodeTheme.errorTextStyle,
            );

  PinTheme _buildSuccessTheme(BuildContext context) =>
      themeConfig.successStyle != null
          ? _buildThemeFromConfigStyle(themeConfig.successStyle!)
          : _buildGenericTheme(
              context,
              showBorder: true,
              bgColor: context.smsCodeTheme.successBackgroundColor,
              borderColor: context.smsCodeTheme.successBorderColor,
              borderWidth: context.smsCodeTheme.successBorderWidth,
              textStyle: context.smsCodeTheme.successTextStyle,
            );

  /// endregion
}
