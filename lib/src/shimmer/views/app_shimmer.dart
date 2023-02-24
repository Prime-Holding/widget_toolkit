import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/theme/prime_components_theme.dart';

/// The AppShimmer is a versatile widget that provides control over when you
/// want to display the shimmer effect on top of your [child] widget.
///
/// By specifying a widget by itself, the shimmer effect will be rendered on top
/// of it, which can be great for decorative widgets.
///
/// This widget is however very useful when combined with a builder widget (such
/// as `RxBlocBuilder` or `StreamBuilder`) which can have powerful results.
///
/// For example, we can grab data from a stream, check if that data is still
/// loading or has not yet met our conditions and display a placeholder widget
/// while we are still waiting for our data. Once we have our data, we can stop
/// displaying the shimmer effect and render out widget.
///
/// ```
/// AppShimmer(
///   showShimmer: _showShimmerEffect,
///   child: _showShimmerEffect ? widgetWithShimmer : targetChildWidget,
/// )
/// ```
///
class AppShimmer extends StatelessWidget {
  const AppShimmer({
    required this.child,
    required this.showShimmer,
    this.alignment = Alignment.centerLeft,
    this.radius = 0,
    this.fadeTransition = true,
    this.baseColor,
    this.highlightColor,
    super.key,
  });

  /// The child widget
  final Widget child;

  /// Flag indicating whether or not to display the shimmer effect
  final bool showShimmer;

  /// The alignment of the content within the widget
  final AlignmentGeometry? alignment;

  /// The border radius of the widget
  final double radius;

  /// Base shimmer color
  final Color? baseColor;

  /// Highlight shimmer color
  final Color? highlightColor;

  /// Use the default fade transition.
  /// If set to `false`, the fade and size transition will be used instead.
  final bool fadeTransition;

  /// Key used for the Container widget containing the [child]
  static const shimmerContainerKey = Key('shimmer');

  @override
  Widget build(BuildContext context) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) =>
            fadeTransition || child.key == AppShimmer.shimmerContainerKey
                ? FadeTransition(
                    opacity: animation,
                    child: child,
                  )
                : _appFadeTransition(animation: animation, child: child),
        child: _buildChild(context),
      );

  Widget _buildChild(BuildContext context) {
    if (showShimmer) {
      return Container(
        key: AppShimmer.shimmerContainerKey,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
        alignment: alignment,
        child: Shimmer.fromColors(
          baseColor: baseColor ?? context.primeComponentsTheme.shimmerBaseColor,
          highlightColor: highlightColor ?? context.primeComponentsTheme.shimmerHighlightColor,
          child: child,
        ),
      );
    }

    if (alignment != null) {
      return Align(
        alignment: alignment!,
        child: child,
      );
    }

    return child;
  }

  /// TODO (david.djordjevic): Replace this fade transition with a custom widget from the base folder
  /// Creates a custom fade transition
  SingleChildRenderObjectWidget _appFadeTransition({
    required Animation<double> animation,
    required Widget child,
  }) =>
      FadeTransition(
        opacity: CurvedAnimation(
          parent: animation,
          curve: const Interval(
            0.4,
            1.0,
            curve: Curves.easeInOutCubic,
          ),
        ),
        child: SizeTransition(
          sizeFactor: CurvedAnimation(
            parent: animation,
            curve: const Interval(
              0.0,
              1.0,
              curve: Curves.easeInOutCubic,
            ),
          ),
          child: child,
        ),
      );
}
