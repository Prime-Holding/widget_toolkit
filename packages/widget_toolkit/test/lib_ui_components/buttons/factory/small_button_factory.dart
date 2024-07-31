import 'package:flutter/material.dart';
import 'package:widget_toolkit/ui_components.dart';

Widget smallButtonFactory({
  required ButtonStateModel state,
}) =>
    SmallButton(onPressed: () {}, icon: Icons.add, state: state);
