import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../base/theme/design_system/design_system.dart';

part 'search_picker_theme.tailor.dart';

@Tailor(themeGetter: ThemeGetter.none)
class _$SearchPickerTheme {
  /// region SearchPickerPage

  static List<EdgeInsets> titlePadding = [
    EdgeInsets.only(
      bottom: DesignSystem.light().spacings.xs,
      top: DesignSystem.light().spacings.l,
      left: DesignSystem.light().spacings.xl,
    ),
    EdgeInsets.only(
      bottom: DesignSystem.light().spacings.xs,
      top: DesignSystem.light().spacings.l,
      left: DesignSystem.light().spacings.xl,
    ),
  ];

  static List<TextStyle> titleStyle = [
    DesignSystem.light().typography.titleStyle,
    DesignSystem.dark().typography.titleStyle,
  ];

  static List<EdgeInsets> searchFieldOuterEdgeInsets = [
    DesignSystem.light().spacings.mediumEdgeInsets,
    DesignSystem.dark().spacings.mediumEdgeInsets,
  ];

  static List<EdgeInsets> errorEdgeInsets = [
    DesignSystem.light().spacings.mediumEdgeInsets,
    DesignSystem.dark().spacings.mediumEdgeInsets,
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
