import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';

import '../bloc/sms_code_bloc.dart';

/// Presents the phone number line and routes edits through [SmsCodeBlocType],
/// so place [SmsCodeProvider] above this widget in the tree. The [builder] should
/// construct UI such as a dialog field while forwarding mutations through the
/// supplied update callback.
class SmsPhoneNumberField extends StatelessWidget {
  const SmsPhoneNumberField({
    required this.builder,
    super.key,
  });

  /// Renders the phone presentation and wires the second callback argument to
  /// [SmsCodeBlocEvents.updatePhoneNumber] inside `sms_phone_number_field.dart`.
  final Widget Function(BuildContext context, String? phoneNumber,
      void Function(String newNumber) updatePhoneNumber) builder;

  @override
  Widget build(BuildContext context) => RxBlocBuilder<SmsCodeBlocType, String>(
        state: (bloc) => bloc.states.phoneNumber,
        builder: (context, phoneNumber, bloc) => builder.call(
            context,
            phoneNumber.data,
            (String number) => bloc.events.updatePhoneNumber(number)),
      );
}
