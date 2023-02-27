import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../base/theme/design_system/widget_toolkit_design_system.dart';

part 'item_picker_theme.tailor.dart';

@Tailor(themeGetter: ThemeGetter.none)
class _$ItemPickerTheme {
  /// region ItemPickerPage

  static List<EdgeInsets> titlePadding = [
    const EdgeInsets.only(bottom: 16, top: 20, left: 24),
    const EdgeInsets.only(bottom: 16, top: 20, left: 24),
  ];

  static List<TextStyle> titleStyle = [
    WidgetToolkitDesignSystem.light().typography.titleStyle,
    WidgetToolkitDesignSystem.dark().typography.titleStyle,
  ];

  static List<EdgeInsets> errorPadding = [
    WidgetToolkitDesignSystem.light().spacings.largeHorizontalEdgeInsets,
    WidgetToolkitDesignSystem.dark().spacings.largeHorizontalEdgeInsets,
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
