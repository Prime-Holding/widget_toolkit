import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:widget_toolkit/models.dart';

import '../../base/models/temporary_code_state.dart';
import '../bloc/sms_code_bloc.dart';

/// Orchestrates [RxBlocListener] and [RxBlocBuilder] wiring for [SmsCodeBlocType]
/// while exposing verification state to the supplied [builder].
class SmsCodeWidget extends StatelessWidget {
  const SmsCodeWidget({
    required this.builder,
    this.onError,
    this.onResult,
    super.key,
  });

  /// Builds the visible OTP subtree whenever [SmsCodeBlocStates.onCodeVerificationResult]
  /// publishes a new [TemporaryCodeState].
  final Widget Function(TemporaryCodeState? codeState) builder;

  /// Handles error emissions from [SmsCodeBlocStates.errors] inside this
  /// widget's [RxBlocListener] column in `sms_code_widget.dart`.
  final void Function(BuildContext, ErrorModel?)? onError;

  /// Handles success payloads from [SmsCodeBlocStates.result] inside the paired
  /// listener in `sms_code_widget.dart`.
  final void Function(BuildContext, dynamic)? onResult;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RxBlocListener<SmsCodeBlocType, ErrorModel?>(
              listener: (context, error) => onError?.call(context, error),
              state: (bloc) => bloc.states.errors),
          RxBlocListener<SmsCodeBlocType, dynamic>(
              listener: (context, result) => onResult?.call(context, result),
              state: (bloc) => bloc.states.result),
          Flexible(
            child: RxBlocBuilder<SmsCodeBlocType, TemporaryCodeState>(
              state: (bloc) => bloc.states.onCodeVerificationResult,
              builder: (context, codeState, bloc) => builder(codeState.data),
            ),
          ),
        ],
      );
}
