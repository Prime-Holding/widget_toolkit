import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:widget_toolkit/widget_toolkit.dart';
import 'package:widget_toolkit_otp/src/lib_sms_code_verification/bloc/sms_code_bloc.dart';
import 'package:widget_toolkit_otp/widget_toolkit_otp.dart';

/// Wraps [child] with theme extensions required by [SmsCodeField].
Widget wrapSmsCodeField({
  required Widget child,
  SmsCodeBloc? bloc,
}) {
  final app = MaterialApp(
    theme: ThemeData().copyWith(
      extensions: [
        SmsCodeTheme.light(),
        WidgetToolkitTheme.light(),
      ],
    ),
    home: Scaffold(
      body: Center(child: child),
    ),
  );

  if (bloc == null) {
    return app;
  }

  return RxBlocProvider<SmsCodeBlocType>(
    create: (_) => bloc,
    child: app,
  );
}
