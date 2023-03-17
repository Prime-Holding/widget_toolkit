import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../asset_classes.dart';

extension SvgFileExtension on SvgFile {
  SvgPicture copyWith({
    double? width,
    double? height,
    Color? color,
    BoxFit fit = BoxFit.contain,
  }) =>
      SvgPicture.asset(
        path,
        width: width ?? SvgPicture.asset(path).width,
        height: height ?? SvgPicture.asset(path).height,
        colorFilter:
            color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
        fit: fit,
      );
}
