import 'package:flutter/material.dart';

import 'design_system_colors.dart';

class DesignSystemTypography {
  DesignSystemTypography.withColor(DesignSystemColors customDesignSystemColors)
      : _customDesignSystemColors = customDesignSystemColors;

  final DesignSystemColors _customDesignSystemColors;

// Material design typography:
// https://material.io/design/typography/the-type-system.html#type-scale

// Keep the general purpose styles declared as 'const'. If not possible then
// declare them as late final properties.

  final bold30 = const TextStyle(
      fontWeight: FontWeight.w700, fontStyle: FontStyle.normal, fontSize: 30.0);

  final h1Med26 = const TextStyle(
      fontWeight: FontWeight.w700, fontStyle: FontStyle.normal, fontSize: 26.0);

  final h1Bold24 = const TextStyle(
      fontWeight: FontWeight.w700, fontStyle: FontStyle.normal, fontSize: 24.0);

  final h1Bold20 = const TextStyle(
      fontWeight: FontWeight.w700, fontStyle: FontStyle.normal, fontSize: 20.0);

  final h1Reg20 = const TextStyle(
      fontWeight: FontWeight.w400, fontStyle: FontStyle.normal, fontSize: 20.0);

  final h1bold24 = const TextStyle(
      fontWeight: FontWeight.w700, fontStyle: FontStyle.normal, fontSize: 24.0);

  final h1Bold18 = const TextStyle(
      fontWeight: FontWeight.w700, fontStyle: FontStyle.normal, fontSize: 18.0);

  final h2ExtraBold18 = const TextStyle(
      fontWeight: FontWeight.w800, fontStyle: FontStyle.normal, fontSize: 18.0);

  final h2Med18 = const TextStyle(
      fontWeight: FontWeight.w500, fontStyle: FontStyle.normal, fontSize: 18.0);

  final h2Med18Italic = const TextStyle(
      fontWeight: FontWeight.w500, fontStyle: FontStyle.italic, fontSize: 18.0);

  final h2Med16 = const TextStyle(
      fontWeight: FontWeight.w500, fontStyle: FontStyle.normal, fontSize: 16.0);

  final h2Semibold17 = const TextStyle(
      fontWeight: FontWeight.w600, fontStyle: FontStyle.normal, fontSize: 17.0);

  final h2Semibold16 = const TextStyle(
      fontWeight: FontWeight.w600, fontStyle: FontStyle.normal, fontSize: 16.0);

  final h2Reg16 = const TextStyle(
      fontWeight: FontWeight.w400, fontStyle: FontStyle.normal, fontSize: 16.0);

  final h3Med13 = const TextStyle(
      fontWeight: FontWeight.w500, fontStyle: FontStyle.normal, fontSize: 13.0);

  final h3Med14 = const TextStyle(
      fontWeight: FontWeight.w500, fontStyle: FontStyle.normal, fontSize: 14.0);

  final h3Reg14 = const TextStyle(
      fontWeight: FontWeight.w400, fontStyle: FontStyle.normal, fontSize: 14.0);

  final h3Reg13 = const TextStyle(
      fontWeight: FontWeight.w400, fontStyle: FontStyle.normal, fontSize: 13.0);

  final h1Reg12 = const TextStyle(
      fontWeight: FontWeight.w400, fontStyle: FontStyle.normal, fontSize: 12.0);

  final h3Med11 = const TextStyle(
      fontWeight: FontWeight.w400, fontStyle: FontStyle.normal, fontSize: 11.0);

  /// App specific typography

  late final titleText =
      h1Reg12.copyWith(color: _customDesignSystemColors.primaryColor);

  late final errorTitle = h1Reg12.copyWith(
    color: _customDesignSystemColors.errorTitleColor,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  late final messageText =
      h3Med14.copyWith(color: _customDesignSystemColors.black87);

  final titleStyle = const TextStyle(
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    height: 1.6,
    fontSize: 20.0,
  );

  final descriptionBold = const TextStyle(
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontSize: 14.0,
  );

  final titleBold = const TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      height: 1.6,
      fontSize: 20.0);
  final descriptionThin = const TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontSize: 14.0);
  final smallThin = const TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontSize: 12.0,
      height: 1.8);
  final captionBold = const TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      letterSpacing: 0.8,
      fontSize: 10.0);
}
