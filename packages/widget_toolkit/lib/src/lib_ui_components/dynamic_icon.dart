import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../asset_classes.dart';

class DynamicIcon extends StatelessWidget {
  const DynamicIcon(
    this.icon, {
    this.color,
    this.semanticLabel,
    this.size,
    super.key,
  }) : assert(icon == null ||
            icon is IconData ||
            icon is SvgPicture ||
            icon is String ||
            icon is SvgFile);

  /// Provide an IconData
  final dynamic icon;
  final Color? color;
  final String? semanticLabel;
  final double? size;

  @override
  Widget build(BuildContext context) {
    if (icon is IconData) {
      return Icon(
        icon,
        color: color,
        semanticLabel: semanticLabel,
        size: size,
      );
    }

    if (icon is String) {
      return Image.asset(
        icon,
        color: color,
        width: size,
        height: size,
        semanticLabel: semanticLabel,
      );
    }

    return icon;
  }
}
