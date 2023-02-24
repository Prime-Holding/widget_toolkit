import 'package:flutter/material.dart';

import '../../base/theme/prime_components_theme.dart';

/// A widget that can be used a placeholder for any other widget. Contains a
/// placeholder text that will be displayed within that widget.
class ShimmerPlaceholderWidget extends StatelessWidget {
  const ShimmerPlaceholderWidget({
    required String placeholderText,
    required this.alignment,
    this.style,
    this.maxLines,
    this.overflow,
    this.borderRadius,
    this.shimmerColor,
    this.textColor,
    super.key,
  }) : _placeholderText = placeholderText;

  /// The placeholder text to be displayed
  final String _placeholderText;

  /// The text style of the placeholder text
  final TextStyle? style;

  /// Max number of lines for the text to span
  final int? maxLines;

  /// The visual overflow of the text
  final TextOverflow? overflow;

  /// The alignment of the content
  final AlignmentGeometry alignment;

  /// The border radius of the widget
  final double? borderRadius;

  /// Shimmer color used for the effect
  final Color? shimmerColor;

  /// Text color that will override the color property of the [style] field
  final Color? textColor;

  double get _borderRadius => borderRadius ?? 16;

  @override
  Widget build(BuildContext context) => Container(
        alignment: alignment,
        decoration: BoxDecoration(
          color: shimmerColor ?? context.primeComponentsTheme.shimmerBaseColor,
          borderRadius: BorderRadius.all(
            Radius.circular(_borderRadius),
          ),
        ),
        child: Text(
          _placeholderText,
          style: style?.copyWith(
              color:
                  textColor ?? context.primeComponentsTheme.shimmerBaseColor),
          maxLines: maxLines,
          overflow: overflow,
        ),
      );
}
