import 'design_system_colors.dart';
import 'design_system_icons.dart';
import 'design_system_spacings.dart';
import 'design_system_typography.dart';

/// Bundles palette, icon, typography, and spacing primitives that theme factories read when assembling [WidgetToolkitTheme] and related feature extensions.
class WidgetToolkitDesignSystem {
  /// Creates a design system from explicit building blocks for tests or fully custom host themes.
  const WidgetToolkitDesignSystem({
    required this.colors,
    required this.icons,
    required this.typography,
    required this.spacings,
  });

  /// Assembles the light palette, shared icon set, typography colored for light surfaces, and immutable spacing ladder.
  WidgetToolkitDesignSystem.light()
      : colors = DesignSystemColors.light(),
        icons = DesignSystemIcons(),
        typography = DesignSystemTypography.withColor(
          DesignSystemColors.light(),
        ),
        spacings = const DesignSystemSpacings();

  /// Assembles the dark palette with the same typography and spacing helpers remapped for darker surfaces.
  WidgetToolkitDesignSystem.dark()
      : colors = DesignSystemColors.dark(),
        icons = DesignSystemIcons(),
        typography = DesignSystemTypography.withColor(
          DesignSystemColors.dark(),
        ),
        spacings = const DesignSystemSpacings();

  /// Material-mapped colors consumed by theme factories when seeding feature-specific [ThemeExtension] instances.
  final DesignSystemColors colors;
  /// Vector and iconography references shared across dialogs, pickers, and inline controls.
  final DesignSystemIcons icons;
  /// Typography ramp tinted through [DesignSystemTypography.withColor].
  final DesignSystemTypography typography;
  /// Numeric spacing and EdgeInsets presets mirrored into picker and dialog themes.
  final DesignSystemSpacings spacings;
}
