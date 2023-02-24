import 'package:flutter/material.dart';

import '../models/shimmer_type.dart';
import 'shimmer_proportional_placeholder_widget.dart';

/// A widget that can be used a placeholder for any other widget. Contains a
/// placeholder text that will be displayed within that widget. With the
/// [shimmerTypeRandom] argument, a configuration can be provided which will
/// define the flex factors for the placeholder widget within a given range.
class ShimmerRandomPlaceholderWidget extends StatefulWidget {
  const ShimmerRandomPlaceholderWidget({
    required String placeholderText,
    required this.shimmerTypeRandom,
    required this.alignment,
    this.style,
    this.maxLines,
    this.overflow,
    this.borderRadius,
    this.textColor,
    super.key,
  }) : _placeholderText = placeholderText;

  /// The placeholder text to be displayed
  final String _placeholderText;

  /// Text style to be applied to the placeholder text
  final TextStyle? style;

  /// Max number of lines for the text to span
  final int? maxLines;

  /// The visual overflow of the text
  final TextOverflow? overflow;

  /// Random shimmer type configuration to be applied to the widget
  final ShimmerTypeRandom shimmerTypeRandom;

  /// The alignment of the content
  final AlignmentGeometry alignment;

  /// The border radius of the widget
  final double? borderRadius;

  /// Text color that will override the color property of the [style] field
  final Color? textColor;

  @override
  State<ShimmerRandomPlaceholderWidget> createState() =>
      _ShimmerRandomPlaceholderWidgetState();
}

class _ShimmerRandomPlaceholderWidgetState
    extends State<ShimmerRandomPlaceholderWidget> {
  late final leadingFlex = widget.shimmerTypeRandom.generateLeadingFlex();

  @override
  Widget build(BuildContext context) => ShimmerProportionalPlaceholderWidget(
        leadingFlex: leadingFlex,
        trailingFlex: widget.shimmerTypeRandom.trailingFlex,
        placeholderText: widget._placeholderText,
        overflow: widget.overflow,
        maxLines: widget.maxLines,
        style: widget.style,
        alignment: widget.alignment,
        borderRadius: widget.borderRadius,
        textColor: widget.textColor,
      );
}
