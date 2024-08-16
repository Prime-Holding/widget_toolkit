import 'package:flutter/material.dart';
import 'package:widget_toolkit/ui_components.dart';

Widget smallButtonFactory({
  required ButtonStateModel state,
  required SmallButtonType type,
  ButtonColorStyle? colorStyle,
}) =>
    SmallButton(
      onPressed: () {},
      icon: Icons.add,
      state: state,
      type: type,
      colorStyle: colorStyle,
    );
