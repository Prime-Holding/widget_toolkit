import 'package:flutter/material.dart';

// Material Design System documentation.
// https://m2.material.io/design/color/the-color-system.html
// https://m2.material.io/design/color/dark-theme.html

@immutable
class DesignSystemColors {
  DesignSystemColors.light()
      : brightness = Brightness.light,
        primaryColor = const Color(0xff2196f3),
        backgroundColor = Colors.white,
        scaffoldBackgroundColor = Colors.white,
        highlightColor = Colors.black,
        errorTitleColor = Colors.black,
        bottomSheetBarrierColor = const Color(0xccf0f0f2),
        shimmerBaseColor = const Color(0xffd8e1ee),
        shimmerHighlightColor = const Color(0xfff1f3f8);

  DesignSystemColors.dark()
      : brightness = Brightness.dark,
        primaryColor = const Color(0xff004f95),
        backgroundColor = Colors.black,
        scaffoldBackgroundColor = Colors.black,
        highlightColor = Colors.white,
        errorTitleColor = Colors.white,
        bottomSheetBarrierColor = Colors.black.withValues(alpha: 0.5),
        shimmerBaseColor = const Color(0xff9da2a6),
        shimmerHighlightColor = const Color(0xffF0F0F2);

  final Brightness brightness;

  /// region Essential (Material and component) colors

  final Color primaryColor;

  final Color backgroundColor;

  final Color scaffoldBackgroundColor;

  final Color highlightColor;

  /// Color of the title of an error message
  final Color errorTitleColor;

  final errorColor = const Color(0xFFFFCDD2);

  /// endregion

  /// region App-specific colors

  final inactiveButtonColor = Colors.grey;

  final activeButtonColor = const Color(0xFFC8E6C9);

  final inactiveButtonTextColor = Colors.black;

  final activeButtonTextColor = Colors.white;

  final Color bottomSheetBarrierColor;

  final activeButtonLanguageTextColor = const Color(0xff212526);

  final textFieldDialogBlack = const Color(0xff212526);

  final appButtonBlueGradientEnd = _HexColor('BFE1FF');

  final Color shimmerBaseColor;
  final Color shimmerHighlightColor;

  /// endregion

  /// region General purpose colors

  final gradientRedEnd = _HexColor('FFBFC1');

  final gradientRedStart = _HexColor('D40E14');

  final filledButtonBackgroundColorDisabled = _HexColor('F0F0F2');

  final textColorWhite = const Color(0xfffafafc);

  final textFieldDialogWhite = const Color(0xfffafafc);

  final transparent = const Color(0x00000000);

  final snow = const Color(0xfffffafa);

  final black87 = Colors.black87;

  final black = Colors.black;

  final gray = const Color(0xff9da2a6);

  final darkGray = const Color(0xff393E46);

  final lightGray = const Color(0xffF0F0F2);

  final blue = const Color(0xFF2196F3);

  final lightBlue = const Color(0xFF90CAF9);

  final white = const Color(0xFFFFFFFF);

  final mediumWhite = const Color(0xFFF6F6F6);

  final green = const Color(0xFF4CAF50);

  final lightGreen = const Color(0xFFA5D6A7);

  final red = const Color(0xffd40e14);

  final redDark = const Color(0xff990f13);

  final lightRed = const Color(0xffffe5e6);

  final blueLight = const Color(0xffe5f4ff);

  final greenLight = const Color(0xffdcf5ed);

  final orangeLight = const Color(0xffffe9d9);

  final darkBlue = const Color(0xff004f95);

  final textFieldDialogBlue = const Color(0xff004f95);

  final disabledFilledButtonBackgroundColor = const Color(0xff9da2a6);

  final darkGreen = const Color(0xff008559);

  final orange = const Color(0xffec6601);

  final textFieldDialogTransparent = Colors.transparent;

  final mediumBlack = const Color(0xff393f40);

  /// endregion
}

class _HexColor extends Color {
  _HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    var hex = hexColor.toUpperCase().replaceAll('#', '');
    if (hex.length == 6) hex = 'FF$hex';
    return int.parse(hex, radix: 16);
  }
}
