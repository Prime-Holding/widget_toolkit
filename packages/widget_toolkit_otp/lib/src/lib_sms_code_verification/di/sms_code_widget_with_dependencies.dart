import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../widget_toolkit_otp.dart';
import '../../lib_countdown_widget/services/countdown_service_impl.dart';
import '../widgets/sms_code_widget.dart';

/// Sms Code dependencies that the SmsCodeWidget requires in order to
/// perform properly. Includes the bloc containing the states and events to
/// which the SmsCodeWidget can react to or manipulate.
// class SmsCodeDependencies {
class SmsCodeWidgetWithDependencies extends StatelessWidget {
  const SmsCodeWidgetWithDependencies({
    required this.service,
    this.countdownService,
    this.initialPhoneNumber,
    required this.sentNewCodeActivationTime,
    required this.builder,
    this.onError,
    this.onResult,
    super.key,
  });

  final SmsCodeService service;
  final CountdownService? countdownService;
  final String? initialPhoneNumber;
  final int sentNewCodeActivationTime;

  final Widget Function(TemporaryCodeState? codeState) builder;
  final void Function(BuildContext, ErrorModel?)? onError;
  final void Function(BuildContext, dynamic)? onResult;

  List<SingleChildWidget> get _blocs => [
        RxBlocProvider<SmsCodeBlocType>(
          create: (context) => SmsCodeBloc(
              service: service,
              countdownService: countdownService ?? CountdownServiceImpl(),
              initialPhoneNumber: initialPhoneNumber,
              sentNewCodeActivationTime: sentNewCodeActivationTime),
        ),
      ];

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [..._blocs],
        child: SmsCodeWidget(
          builder: builder,
          onError: onError,
          onResult: onResult,
        ),
      );
}
