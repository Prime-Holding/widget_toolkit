import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';

import '../../base/theme/sms_code_theme.dart';
import '../../base/utils/enums.dart';
import '../../base/utils/localized_strings.dart';
import '../../base/utils/util_methods.dart';
import '../bloc/sms_code_bloc.dart';

/// ValidityWidget presents how long a code is valid. It depends on [SmsCodeBlocType],
/// so place [SmsCodeProvider] above this widget in the tree. Hosts may replace the
/// layout with [builder] while still reading the same countdown stream.
class ValidityWidget extends StatelessWidget {
  const ValidityWidget({
    this.title,
    this.builder,
    this.placeholder,
    this.timeFormat = CountdownTimeFormat.minutes,
    this.textStyle,
    super.key,
  });

  /// Heading rendered above the countdown column in the default layout from `validity_widget.dart`,
  /// defaulting to [LocalizedStrings.codeValidity] when null.
  final String? title;

  /// Builds a custom row or card while receiving the remaining seconds emitted by
  /// [SmsCodeBlocStates.validityTime] in `validity_widget.dart`.
  final Widget Function(int remainingTime)? builder;

  /// Shown until the bloc publishes the first validity sample in `validity_widget.dart`.
  final Widget? placeholder;

  /// Overrides the numeric line in the default column while leaving the title
  /// on [SmsCodeTheme.validityTitleTextStyle].
  final TextStyle? textStyle;

  /// Chooses how the default layout formats seconds before it appends
  /// [LocalizedStrings.minutes] in `validity_widget.dart`.
  final CountdownTimeFormat? timeFormat;

  @override
  Widget build(BuildContext context) => RxBlocBuilder<SmsCodeBlocType, int>(
        bloc: context.read<SmsCodeBlocType>(),
        state: (bloc) => bloc.states.validityTime,
        builder: (context, validityTime, bloc) => (validityTime.hasData)
            ? builder?.call(validityTime.data!) ??
                _buildValidityWidget(
                  context,
                  validityTime.data ?? 0,
                )
            : placeholder ?? const SizedBox(),
      );

  Widget _buildValidityWidget(BuildContext context, int time) => Column(
        children: [
          Text(
            title ?? context.getLocalizedStrings.codeValidity,
            style: context.smsCodeTheme.validityTitleTextStyle,
          ),
          Text(
            '${convertRemainingTime(time, timeFormat ?? CountdownTimeFormat.minutes, true)} ${context.getLocalizedStrings.minutes}',
            style: textStyle,
          ),
        ],
      );
}
