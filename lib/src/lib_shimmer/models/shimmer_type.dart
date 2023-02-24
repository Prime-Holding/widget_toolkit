import 'dart:math';

/// Abstraction defining type of the shimmer animation.
abstract class ShimmerType {
  /// The text to be displayed as a placeholder
  String get placeholderText;

  /// Creates a shimmer configuration with a given fixed length
  static ShimmerTypeFixed fixed({int placeholderLength = 12}) =>
      ShimmerTypeFixed(placeholderLength);

  /// Creates a shimmer configuration with random leading and trailing flex
  /// within the provided range.
  static ShimmerTypeRandom random({
    int minLeadingFlex = 3,
    int maxLeadingFlex = 5,
    int trailingFlex = 2,
  }) =>
      ShimmerTypeRandom(
        minLeadingFlex: minLeadingFlex,
        maxLeadingFlex: maxLeadingFlex,
        trailingFlex: trailingFlex,
      );

  /// Creates a shimmer configuration with user predefined leading and trailing
  /// flex
  static ShimmerTypeProportional proportional({
    int trailingFlex = 5,
    int leadingFlex = 3,
  }) =>
      ShimmerTypeProportional(
        leadingFlex: leadingFlex,
        trailingFlex: trailingFlex,
      );
}

/// Shimmer type configuration that automatically generates the placeholder text
/// with a given length.
class ShimmerTypeFixed extends ShimmerType {
  ShimmerTypeFixed(this.placeholderLength);

  final int placeholderLength;

  @override
  late final String placeholderText = _generatePlaceholderText();

  String _generatePlaceholderText() =>
      List.generate(placeholderLength, (index) => '-').fold(
        '',
        (previousValue, element) => '$previousValue$element',
      );
}

/// Shimmer type configuration with randomly generated leading and trailing flex
/// that falls within a user predefined range.
class ShimmerTypeRandom extends ShimmerType {
  ShimmerTypeRandom({
    required this.minLeadingFlex,
    required this.maxLeadingFlex,
    required this.trailingFlex,
  });

  final int minLeadingFlex;
  final int maxLeadingFlex;
  final int trailingFlex;

  static int? leadingFlex;

  int generateLeadingFlex() =>
      leadingFlex ??
      Random().nextInt(maxLeadingFlex - minLeadingFlex) + minLeadingFlex;

  @override
  String get placeholderText => '-';
}

/// Shimmer type configuration that is used for defining a proportional shimmer
/// with user defined leading and trailing flex.
class ShimmerTypeProportional extends ShimmerType {
  ShimmerTypeProportional({
    required this.trailingFlex,
    required this.leadingFlex,
  });

  final int trailingFlex;
  final int leadingFlex;

  @override
  String get placeholderText => '-';
}
