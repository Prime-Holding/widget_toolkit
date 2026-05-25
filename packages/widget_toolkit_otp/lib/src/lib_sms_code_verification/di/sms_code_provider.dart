import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:widget_toolkit/models.dart';

import '../../base/models/temporary_code_state.dart';
import '../../base/utils/localized_strings.dart';
import '../../lib_countdown_widget/services/countdown_service.dart';
import '../../lib_countdown_widget/services/countdown_service_impl.dart';
import '../bloc/sms_code_bloc.dart';
import '../services/sms_code_service.dart';
import '../widgets/sms_code_widget.dart';

/// Sms Code dependencies that the SmsCodeWidget requires in order to
/// perform properly. Includes the bloc containing the states and events to
/// which the SmsCodeWidget can react to or manipulate.
class SmsCodeProvider extends StatelessWidget {
  const SmsCodeProvider({
    required this.smsCodeService,
    required this.sentNewCodeActivationTime,
    required this.builder,
    this.countdownService,
    this.initialPhoneNumber,
    this.localization,
    this.onError,
    this.onResult,
    super.key,
  });

  /// Supplies phone actions, timers, and verification hooks consumed by
  /// [SmsCodeBloc] inside `sms_code_provider.dart`.
  final SmsCodeService smsCodeService;

  /// Overrides the default [CountdownServiceImpl] wired into [SmsCodeBloc] for
  /// validity and throttle timers.
  final CountdownService? countdownService;

  /// Seeds [SmsCodeBlocStates.phoneNumber] so the field stack starts with a
  /// known MSISDN before [SmsCodeService.getFullPhoneNumber] runs.
  final String? initialPhoneNumber;

  /// Supplies copy overrides for OTP widgets below this provider. Pass a
  /// subclass of [LocalizedStrings] to replace the default English labels.
  final LocalizedStrings? localization;

  /// Seconds to wait after sending a code before [SmsCodeBlocStates.isSendNewCodeEnabled]
  /// allows another resend, aligning with [SmsCodeService.getResendButtonThrottleTime].
  final int sentNewCodeActivationTime;

  /// Builds the OTP subtree that reads [TemporaryCodeState] from
  /// [SmsCodeWidget] after the bloc emits verification updates.
  final Widget Function(TemporaryCodeState? codeState) builder;

  /// Receives [SmsCodeBlocStates.errors] through the listener inside
  /// `sms_code_widget.dart`.
  final void Function(BuildContext, ErrorModel?)? onError;

  /// Receives payloads from [SmsCodeBlocStates.result] after
  /// [SmsCodeService.confirmPhoneCode] finishes.
  final void Function(BuildContext, dynamic)? onResult;

  List<SingleChildWidget> get _providers => [
        RxBlocProvider<SmsCodeBlocType>(
          create: (context) => SmsCodeBloc(
              service: smsCodeService,
              countdownService: countdownService ?? CountdownServiceImpl(),
              initialPhoneNumber: initialPhoneNumber,
              sentNewCodeActivationTime: sentNewCodeActivationTime),
        ),
        Provider<LocalizedStrings?>.value(value: localization),
      ];

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [..._providers],
        child: SmsCodeWidget(
          builder: builder,
          onError: onError,
          onResult: onResult,
        ),
      );
}
