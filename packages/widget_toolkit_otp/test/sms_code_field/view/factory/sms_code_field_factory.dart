import 'package:flutter/material.dart';
import 'package:widget_toolkit_otp/widget_toolkit_otp.dart';

/// Change the parameters according the the needs of the test
Widget smsCodeFieldFactory({
  void Function(String)? onChanged,
  void Function(String)? onSubmitted,
  void Function(String)? onCompleted,
  void Function()? onFieldTap,
  TextEditingController? controller,
  FocusNode? focusNode,
  String? Function(BuildContext, String?)? validator,
  Widget? cursor,
  String? errorText,
  Widget Function(String?, String)? errorBuilder,
  Widget? prefilledWidget,
  Widget? obscuringWidget,
  String? senderPhoneNumber,
  int pinLength = 4,
  bool enabled = true,
  bool readOnly = false,
  bool autofocus = false,
  bool showCursor = true,
  bool obscureText = false,
  bool autoValidate = true,
  bool forceErrorState = false,
  bool closeKeyboardOnDone = true,
  Key? key,
}) =>
    Scaffold(
      body: Center(
        child: SizedBox(
          height: 100,
          child: Builder(builder: (context) {
            return SmsCodeField(
              useInternalCommunication: false,
              onChanged: onChanged,
              onSubmitted: onSubmitted,
              onCompleted: onCompleted,
              onFieldTap: onFieldTap,
              controller: controller,
              focusNode: focusNode,
              validator: validator,
              cursor: cursor,
              errorText: errorText,
              errorBuilder: errorBuilder,
              prefilledWidget: prefilledWidget,
              obscuringWidget: obscuringWidget,
              senderPhoneNumber: senderPhoneNumber,
              pinLength: pinLength,
              enabled: enabled,
              readOnly: readOnly,
              autofocus: autofocus,
              showCursor: showCursor,
              obscureText: obscureText,
              autoValidate: autoValidate,
              forceErrorState: forceErrorState,
              closeKeyboardOnDone: closeKeyboardOnDone,
              key: key,
            );
          }),
        ),
      ),
    );
