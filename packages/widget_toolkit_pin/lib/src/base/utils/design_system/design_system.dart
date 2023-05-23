import 'design_system_colors.dart';
import 'design_system_icons.dart';
import 'design_system_spacings.dart';
import 'design_system_typography.dart';

class PrimeDesignSystem {
  const PrimeDesignSystem({
    required this.colors,
    required this.icons,
    required this.typography,
    required this.spacings,
  });

  PrimeDesignSystem.light()
      : colors = DesignSystemColors.light(),
        icons = DesignSystemIcons(),
        typography = DesignSystemTypography.withColor(
          DesignSystemColors.light(),
        ),
        spacings = const DesignSystemSpacings();

  PrimeDesignSystem.dark()
      : colors = DesignSystemColors.dark(),
        icons = DesignSystemIcons(),
        typography = DesignSystemTypography.withColor(
          DesignSystemColors.dark(),
        ),
        spacings = const DesignSystemSpacings();

  final DesignSystemColors colors;
  final DesignSystemIcons icons;
  final DesignSystemTypography typography;
  final DesignSystemSpacings spacings;
}
