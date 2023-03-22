import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/single_child_widget.dart';

import '../../lib_countdown_widget/services/countdown_service.dart';
import '../../lib_countdown_widget/services/countdown_service_impl.dart';
import '../bloc/sms_code_bloc.dart';
import '../services/sms_code_service.dart';

/// Sms Code dependencies that the SmsCodeWidget requires in order to
/// perform properly. Includes the bloc containing the states and events to
/// which the SmsCodeWidget can react to or manipulate.
class SmsCodeDependencies {
  SmsCodeDependencies._(
      {required this.service,
      this.countdownService,
      this.initialPhoneNumber,
      required this.sentNewCodeActivationTime});

  final SmsCodeService service;
  final CountdownService? countdownService;
  final String? initialPhoneNumber;
  final int sentNewCodeActivationTime;

  factory SmsCodeDependencies.from(
    SmsCodeService service,
    CountdownService? countdownService,
    String? initialPhoneNumber,
    int sentNewCodeActivationTime,
  ) =>
      SmsCodeDependencies._(
          service: service,
          countdownService: countdownService,
          initialPhoneNumber: initialPhoneNumber,
          sentNewCodeActivationTime: sentNewCodeActivationTime);

  late final List<SingleChildWidget> _blocs = [
    RxBlocProvider<SmsCodeBlocType>(
      create: (context) => SmsCodeBloc(
          service: service,
          countdownService: countdownService ?? CountdownServiceImpl(),
          initialPhoneNumber: initialPhoneNumber,
          sentNewCodeActivationTime: sentNewCodeActivationTime),
    ),
  ];

  /// The list of providers that can be injected into the widget tree in order
  /// for the SmsCodeWidget to work properly.
  late List<SingleChildWidget> providers = [
    ..._blocs,
  ];
}
