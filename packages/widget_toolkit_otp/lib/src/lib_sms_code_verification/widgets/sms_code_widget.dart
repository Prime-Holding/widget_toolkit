import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';

import '../../base/models/error/error_model.dart';
import '../../base/models/temporary_code_state.dart';
import '../../lib_countdown_widget/services/countdown_service.dart';
import '../bloc/sms_code_bloc.dart';
import '../di/sms_code_dependencies.dart';
import '../services/sms_code_service.dart';

/// SmsCodeWidget is a wrapper widget which provides all the necessary
/// dependencies for the SmsCodeBloc which will be accessible for the underlying
/// [builder] widget.
class SmsCodeWidget extends StatelessWidget {
  const SmsCodeWidget({
    required this.builder,
    required this.service,
    this.countdownService,
    this.initialPhoneNumber,
    required this.sentNewCodeActivationTime,
    this.onError,
    this.onResult,
    super.key,
  });

  /// The child widget [builder]
  final Widget Function(TemporaryCodeState? codeState) builder;
  final SmsCodeService service;
  final CountdownService? countdownService;
  final String? initialPhoneNumber;
  final int sentNewCodeActivationTime;
  final void Function(BuildContext, ErrorModel?)? onError;
  final void Function(BuildContext, dynamic)? onResult;

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: SmsCodeDependencies.from(service, countdownService,
                initialPhoneNumber, sentNewCodeActivationTime)
            .providers,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildErrorListener(context),
            _buildResultListener(context),
            Flexible(
              child: RxBlocBuilder<SmsCodeBlocType, TemporaryCodeState>(
                state: (bloc) => bloc.states.onCodeVerificationResult,
                builder: (context, codeState, bloc) => builder(codeState.data),
              ),
            ),
          ],
        ),
      );

  Widget _buildErrorListener(BuildContext context) =>
      RxBlocListener<SmsCodeBlocType, ErrorModel?>(
          listener: (context, error) => onError?.call(context, error),
          state: (bloc) => bloc.states.errors);

  Widget _buildResultListener(BuildContext context) =>
      RxBlocListener<SmsCodeBlocType, dynamic>(
          listener: (context, result) => onResult?.call(context, result),
          state: (bloc) => bloc.states.result);
}
