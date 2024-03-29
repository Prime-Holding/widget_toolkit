import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../../base/theme/design_system/widget_toolkit_design_system.dart';

part 'item_picker_theme.tailor.dart';

@TailorMixinComponent()
class ItemPickerTheme extends ThemeExtension<ItemPickerTheme>
    with _$ItemPickerThemeTailorMixin {
  const ItemPickerTheme({
    required this.titlePadding,
    required this.titleStyle,
    required this.errorPadding,
    required this.contentListPadding,
    required this.footerPadding,
  });

  @override
  final EdgeInsets titlePadding;
  @override
  final TextStyle titleStyle;
  @override
  final EdgeInsets errorPadding;
  @override
  final EdgeInsets contentListPadding;
  @override
  final EdgeInsets footerPadding;

  ItemPickerTheme.light()
      : titlePadding = EdgeInsets.only(
            bottom: WidgetToolkitDesignSystem.light().spacings.m,
            left: WidgetToolkitDesignSystem.light().spacings.xs),
        titleStyle = WidgetToolkitDesignSystem.light().typography.titleStyle,
        errorPadding = EdgeInsets.zero,
        contentListPadding = EdgeInsets.zero,
        footerPadding =
            EdgeInsets.only(top: WidgetToolkitDesignSystem.light().spacings.m);

  ItemPickerTheme.dark()
      : titlePadding = EdgeInsets.only(
            bottom: WidgetToolkitDesignSystem.light().spacings.m,
            left: WidgetToolkitDesignSystem.light().spacings.xs),
        titleStyle = WidgetToolkitDesignSystem.dark().typography.titleStyle,
        errorPadding = EdgeInsets.zero,
        contentListPadding = EdgeInsets.zero,
        footerPadding =
            EdgeInsets.only(top: WidgetToolkitDesignSystem.dark().spacings.m);
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
