import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../base/theme/design_system/widget_toolkit_design_system.dart';

part 'search_picker_theme.tailor.dart';

@Tailor(themeGetter: ThemeGetter.none)
class _$SearchPickerTheme {
  /// region SearchPickerPage

  static List<EdgeInsets> titlePadding = [
    EdgeInsets.only(
        bottom: WidgetToolkitDesignSystem.light().spacings.xs,
        left: WidgetToolkitDesignSystem.light().spacings.xs),
    EdgeInsets.only(
        bottom: WidgetToolkitDesignSystem.light().spacings.xs,
        left: WidgetToolkitDesignSystem.light().spacings.xs),
  ];

  static List<TextStyle> titleStyle = [
    WidgetToolkitDesignSystem.light().typography.titleStyle,
    WidgetToolkitDesignSystem.dark().typography.titleStyle,
  ];

  static List<EdgeInsets> searchFieldOuterEdgeInsets = [
    WidgetToolkitDesignSystem.light().spacings.mediumEdgeInsets,
    WidgetToolkitDesignSystem.dark().spacings.mediumEdgeInsets,
  ];

  static List<EdgeInsets> errorEdgeInsets = [
    WidgetToolkitDesignSystem.light().spacings.mediumEdgeInsets,
    WidgetToolkitDesignSystem.dark().spacings.mediumEdgeInsets,
  ];

  /// endregion
}

extension SearchPickerThemeContextExtension on BuildContext {
  /// Returns a reference to the [SearchPickerTheme] theme extension of the current [Theme]
  SearchPickerTheme get searchPickerTheme {
    final theme = Theme.of(this).extension<SearchPickerTheme>();
    if (theme == null) {
      throw UnimplementedError(
        'Not Implemented SearchPickerTheme. '
        'Please add it as extension to the MaterialApp -> ThemeData',
      );
    }

    return theme;
  }
}
