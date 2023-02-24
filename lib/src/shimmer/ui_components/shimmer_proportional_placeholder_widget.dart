import 'package:flutter/widgets.dart';

import 'shimmer_placeholder_widget.dart';

/// A widget that can be used a placeholder for any other widget. Contains a
/// placeholder text that will be displayed within that widget. Unlike the
/// `ShimmerPlaceholderWidget`, there is a possibility to adjust the leading
/// and trailing flex factors which will allow the widget to take appropriate
/// size and place, especially when placed in a row or column.
class ShimmerProportionalPlaceholderWidget extends StatelessWidget {
  const ShimmerProportionalPlaceholderWidget({
    required this.placeholderText,
    required this.alignment,
    this.style,
    this.maxLines,
    this.overflow,
    this.borderRadius,
    this.textColor,
    this.leadingFlex = 1,
    this.trailingFlex = 1,
    Key? key,
  }) : super(key: key);

  /// The placeholder text to be displayed
  final String placeholderText;

  /// The leading flex factor (defaults to 1)
  final int leadingFlex;

  /// The trailing flex factor (defaults to 1)
  final int trailingFlex;

  /// Text style to be applied to the placeholder text
  final TextStyle? style;

  /// Max number of lines for the text to span
  final int? maxLines;

  /// The visual overflow of the text
  final TextOverflow? overflow;

  /// The alignment of the content
  final AlignmentGeometry alignment;

  /// The border radius of the widget
  final double? borderRadius;

  /// Text color that will override the color property of the [style] field
  final Color? textColor;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (alignment == Alignment.center ||
              alignment == Alignment.centerRight)
            Flexible(
              fit: FlexFit.loose,
              flex: trailingFlex,
              child: Container(),
            ),
          Flexible(
            fit: FlexFit.loose,
            flex: leadingFlex,
            child: ShimmerPlaceholderWidget(
              placeholderText: placeholderText,
              style: style,
              textColor: textColor,
              maxLines: maxLines,
              overflow: overflow,
              alignment: alignment,
              borderRadius: borderRadius,
            ),
          ),
          if (alignment == Alignment.center ||
              alignment == Alignment.centerLeft)
            Flexible(
              fit: FlexFit.loose,
              flex: trailingFlex,
              child: Container(),
            ),
        ],
      );
}
