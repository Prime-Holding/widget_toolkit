import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../base/theme/design_system/widget_toolkit_design_system.dart';

part 'search_picker_theme.tailor.dart';

@TailorMixinComponent()
class SearchPickerTheme extends ThemeExtension<SearchPickerTheme>
    with _$SearchPickerThemeTailorMixin {
  SearchPickerTheme({
    required this.titlePadding,
    required this.titleStyle,
    required this.searchFieldOuterEdgeInsets,
    required this.errorEdgeInsets,
  });

  /// region Themes

  SearchPickerTheme.light()
      : titlePadding = EdgeInsets.only(
            bottom: WidgetToolkitDesignSystem.light().spacings.xs,
            left: WidgetToolkitDesignSystem.light().spacings.xs),
        titleStyle = WidgetToolkitDesignSystem.light().typography.titleStyle,
        searchFieldOuterEdgeInsets =
            WidgetToolkitDesignSystem.light().spacings.mediumEdgeInsets,
        errorEdgeInsets =
            WidgetToolkitDesignSystem.light().spacings.mediumEdgeInsets;

  SearchPickerTheme.dark()
      : titlePadding = EdgeInsets.only(
            bottom: WidgetToolkitDesignSystem.dark().spacings.xs,
            left: WidgetToolkitDesignSystem.dark().spacings.xs),
        titleStyle = WidgetToolkitDesignSystem.dark().typography.titleStyle,
        searchFieldOuterEdgeInsets =
            WidgetToolkitDesignSystem.dark().spacings.mediumEdgeInsets,
        errorEdgeInsets =
            WidgetToolkitDesignSystem.dark().spacings.mediumEdgeInsets;

  /// endregion

  @override
  final EdgeInsets titlePadding;
  @override
  final TextStyle titleStyle;
  @override
  final EdgeInsets searchFieldOuterEdgeInsets;
  @override
  final EdgeInsets errorEdgeInsets;
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
