import 'package:flutter/material.dart';
import 'package:widget_toolkit/src/base/models/message_panel_state.dart';
import 'package:widget_toolkit/ui_components.dart';

Widget messagePanelWidgetFactory({
  required MessagePanelState state,
  required String message,
  String? body = 'some text',
  Color? color,
  Color? bgColor,
  TextDecoration? textDecoration,
  bool isLoading = false,
  dynamic errorPanelIcon,
}) =>
    MessagePanelWidget(
      messageState: state,
      message: 'message',
      body: body,
      color: color,
      bgColor: bgColor,
      textDecoration: textDecoration,
      isLoading: isLoading,
      errorPanelIcon: errorPanelIcon,
    );
