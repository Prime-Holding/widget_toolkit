import 'package:flutter/material.dart';

import '../models/shimmer_type.dart';
import '../ui_components/shimmer_placeholder_widget.dart';
import '../ui_components/shimmer_proportional_placeholder_widget.dart';
import '../ui_components/shimmer_random_placeholder_widget.dart';
import 'shimmer_wrapper.dart';

/// Wrapper widget on top of the Text widget that will display a shimmer effect
/// whenever the provided text is null. If the provided text is not null, it
/// will be rendered properly. It can be useful if we want to occupy a part of
/// the screen and replace it with the text that will be retrieved sometime in
/// the future.
///
/// This widget works extremely well with `RxBlocBuilder` or `StreamBuilder`.
///
/// Besides different types of text customizations, there is an option to define
/// the type of the shimmer animation by specifying the [type] parameter. As of
/// now, there are three available shimmer types:
///
/// - `ShimmerType.fixed()` : Defines a shimmer with a fixed length that will
/// always remain the same size.
///
/// - `ShimmerType.proportional()` : Defines a shimmer that can take a custom
/// amount of space by defining the leading and trailing flex property. Whenever
/// the widget with this type is rebuilt, it will have the same size.
///
/// - `ShimmerType.random()` : Defines a shimmer that can take a custom amount
/// of space by defining a range of values for the leading flex and a value for
/// the trailing flex.
///
class ShimmerText extends StatelessWidget {
  const ShimmerText(
    this.text, {
    this.style,
    this.type,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.baseColor,
    this.highlightColor,
    this.borderRadius,
    this.textHeightBehavior,
    this.alignment = Alignment.centerLeft,
    super.key,
  });

  /// The text to be displayed
  final String? text;

  /// The text style used for the displayed text
  final TextStyle? style;

  /// The type of the shimmer. If none is selected a random type will be chosen
  /// from the available `ShimmerType`s.
  final ShimmerType? type;

  /// Max number of lines for the text to span
  final int? maxLines;

  /// The visual overflow of the text
  final TextOverflow? overflow;

  /// The alignment of the content
  final AlignmentGeometry alignment;

  /// The alignment of the text
  final TextAlign? textAlign;

  /// The color of the base
  final Color? baseColor;

  /// The color of the highlight
  final Color? highlightColor;

  /// The border radius of the widget
  final double? borderRadius;

  /// The text height behaviour of the [text] field
  final TextHeightBehavior? textHeightBehavior;

  @override
  Widget build(BuildContext context) => ShimmerWrapper(
        showShimmer: text == null,
        alignment: alignment,
        fadeTransition: false,
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: _buildChild(context),
      );

  Widget _buildChild(BuildContext context) {
    if (text != null) {
      return Text(text!,
          style: style,
          maxLines: maxLines,
          overflow: overflow,
          textAlign: textAlign,
          textHeightBehavior: textHeightBehavior);
    }

    final type = this.type ?? ShimmerType.random();

    if (type is ShimmerTypeFixed) {
      return ShimmerPlaceholderWidget(
        placeholderText: type.placeholderText,
        style: style,
        maxLines: maxLines,
        overflow: overflow,
        alignment: alignment,
        borderRadius: borderRadius,
      );
    }

    if (type is ShimmerTypeRandom) {
      return ShimmerRandomPlaceholderWidget(
        placeholderText: type.placeholderText,
        style: style,
        maxLines: maxLines,
        overflow: overflow,
        shimmerTypeRandom: type,
        alignment: alignment,
      );
    }

    if (type is ShimmerTypeProportional) {
      return ShimmerProportionalPlaceholderWidget(
        leadingFlex: type.leadingFlex,
        trailingFlex: type.trailingFlex,
        placeholderText: type.placeholderText,
        overflow: overflow,
        maxLines: maxLines,
        alignment: alignment,
        style: style,
        borderRadius: borderRadius,
      );
    }

    return Container();
  }
}
