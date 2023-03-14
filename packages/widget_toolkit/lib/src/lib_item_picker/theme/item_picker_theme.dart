import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../base/theme/design_system/widget_toolkit_design_system.dart';

part 'item_picker_theme.tailor.dart';

@Tailor(themeGetter: ThemeGetter.none)
class _$ItemPickerTheme {
  /// region ItemPickerPage

  static List<EdgeInsets> titlePadding = [
    EdgeInsets.only(
        bottom: WidgetToolkitDesignSystem.light().spacings.m,
        left: WidgetToolkitDesignSystem.light().spacings.xs),
    EdgeInsets.only(
        bottom: WidgetToolkitDesignSystem.light().spacings.m,
        left: WidgetToolkitDesignSystem.light().spacings.xs),
  ];

  static List<TextStyle> titleStyle = [
    WidgetToolkitDesignSystem.light().typography.titleStyle,
    WidgetToolkitDesignSystem.dark().typography.titleStyle,
  ];

  static List<EdgeInsets> errorPadding = [
    EdgeInsets.zero,
    EdgeInsets.zero,
  ];

  static List<EdgeInsets> contentListPadding = [
    EdgeInsets.zero,
    EdgeInsets.zero,
  ];

  static List<EdgeInsets> footerPadding = [
    EdgeInsets.only(top: WidgetToolkitDesignSystem.light().spacings.m),
    EdgeInsets.only(top: WidgetToolkitDesignSystem.light().spacings.m),
  ];

  /// endregion
}

extension ItemPickerThemeContextExtension on BuildContext {
  /// Returns a reference to the [ItemPickerTheme] theme extension of the current [Theme]
  ItemPickerTheme get itemPickerTheme {
    final theme = Theme.of(this).extension<ItemPickerTheme>();
    if (theme == null) {
      throw UnimplementedError(
        'Not Implemented ItemPickerTheme. '
        'Please add it as extension to the MaterialApp -> ThemeData',
      );
    }

    return theme;
  }
}
