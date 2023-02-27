import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/widget_toolkit_theme.dart';
import 'buttons/button_color_style.dart';
import 'buttons/small_button.dart';

/// Flag controlling the state of whether a modal sheet is shown in case we want
/// to limit the number of modal sheets shown. It will be updated automatically
/// once a modal sheet opens or closes.
bool _isBottomSheetShown = false;

/// Displays a customizable modal sheet with a background blur effect. Requires
/// a [builder] method which returns the contents of the modal sheet.
///
/// You can also specify a [headerBuilder] builder method that returns a widget
/// which will be build above the contents of the widget returned from the
/// [builder]. Additionally, you can choose to toggle the display a modal sheet
/// pill cutout at the top of the modal sheet by setting the [showHeaderPill]
/// flag (defaults to `true`).
///
/// The [onCancelPressed] callback will be called when the modal sheet is
/// dismissed by the close button enabled from the modal sheet [configuration].
///
/// With the modal sheet [configuration], you can define or toggle different
/// aspects of the modal sheet.
Future<T?> showModal<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  ModalConfiguration configuration = const ModalConfiguration(),
  WidgetBuilder? headerBuilder,
  VoidCallback? onCancelPressed,
  bool dialogHasBottomPadding = false,
}) {
  // Dismiss any other modal sheets if only one is enforced
  if (configuration.haveOnlyOneSheet) {
    if (_isBottomSheetShown) {
      Navigator.pop(context);
    }

    _isBottomSheetShown = true;
  }
  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    barrierColor: context.widgetToolkitTheme.bottomSheetBarrierColor,
    context: context,
    isScrollControlled: true,
    isDismissible: configuration.isDismissible,
    enableDrag: configuration.isDismissible,
    elevation: 0,
    builder: (context) => TweenAnimationBuilder<double>(
      builder: (context, sigma, child) {
        // According to this issue: https://stackoverflow.com/a/68891725
        // an error is logged if the sigma value is zero. We should avoid it by
        // setting it to some low value approaching zero (but not zero!).
        final sigmaVal = math.max(0.001, sigma);
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: sigmaVal, sigmaY: sigmaVal),
          child: child,
        );
      },
      duration: const Duration(milliseconds: 200),
      tween: Tween(begin: 0.0, end: 5.0),
      child: _ModalContent(
        heightFactor: (configuration.fullScreen ?? false)
            ? _calculateFullScreenRatio()
            : configuration.heightFactor,
        builder: builder,
        onClosePressed: onCancelPressed,
        headerBuilder: headerBuilder,
        showCloseButton: configuration.showCloseButton,
        contentAlignment: configuration.contentAlignment,
        animationAlignment: configuration.animationAlignment,
        showHeaderPill: configuration.showHeaderPill,
        applySafeArea: configuration.applySafeArea,
        safeAreaBottom: configuration.safeAreaBottom,
        dialogHasBottomPadding: dialogHasBottomPadding,
      ),
    ),
  ).then((value) {
    _isBottomSheetShown = false;
    return value;
  });
}

/// Widget used to represent the inner state of the app bottom modal sheet whose
/// contents are being rendered on screen.
class _ModalContent extends StatelessWidget {
  const _ModalContent({
    Key? key,
    required this.builder,
    required this.showCloseButton,
    this.headerBuilder,
    this.heightFactor,
    this.contentAlignment,
    this.animationAlignment,
    this.onClosePressed,
    this.showHeaderPill = true,
    this.applySafeArea = true,
    this.safeAreaBottom = true,
    this.dialogHasBottomPadding = true,
  }) : super(key: key);

  /// The builder method returning the contents of the modal sheet
  final WidgetBuilder builder;

  /// Builder method building a widget that will be displayed above the content
  /// built with the [builder] method
  final WidgetBuilder? headerBuilder;

  /// Value for how much of the remaining screen size will the content take
  final double? heightFactor;

  /// Flag indicating whether to apply a safe area around the content
  final bool applySafeArea;

  /// Flag indicating whether or not to apply safe area at the bottom
  final bool safeAreaBottom;

  /// Flag indicating whether or not to display the pill cutout at the top of
  /// the header of the modal sheet
  final bool showHeaderPill;

  /// The content alignment along the vertical axis
  final MainAxisAlignment? contentAlignment;

  /// The content alignment along the vertical axis
  final Alignment? animationAlignment;

  /// Flag indicating the visibility of the already implemented close button
  final bool showCloseButton;

  /// Callback for close
  final VoidCallback? onClosePressed;

  /// Flag indicating if bottom overlay should be added as padding at the bottom
  /// of the page
  final bool dialogHasBottomPadding;

  @override
  Widget build(BuildContext context) => heightFactor == null
      ? Container(
          margin: EdgeInsets.only(
            top: MediaQueryData.fromWindow(window).padding.top,
          ),
          child: _buildContent(context))
      : FractionallySizedBox(
          heightFactor: heightFactor,
          child: _buildContent(context),
        );

  Widget _buildContent(BuildContext context) {
    final builderContent = Container(
      color: context.widgetToolkitTheme.bottomSheetBackgroundColor,
      child: builder(context),
    );

    final mainContent = Column(
      mainAxisAlignment: contentAlignment ?? MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        /// Wrap the header in a `translate` widget, which will shift all its
        /// header contents down by 1px to prevent a glitching gap line which is
        /// appearing between the header and the contents of the modal sheet.
        Transform.translate(
          offset: const Offset(0, 1),
          child: _buildHeader(context),
        ),
        heightFactor != null
            ? Expanded(child: builderContent)
            : Flexible(child: builderContent),
        if (showCloseButton) _buildCloseButton(context),
        if (dialogHasBottomPadding)
          SizedBox(
            height: MediaQuery.of(context).viewInsets.bottom,
          )
      ],
    );

    if (applySafeArea) {
      return SafeArea(
        bottom: safeAreaBottom,
        child: mainContent,
      );
    }

    return mainContent;
  }

  double get _cornerRadius => 24;

  double get _headerHeight => headerBuilder != null ? 72 : 15;

  Widget _buildHeader(BuildContext context) => Container(
        height: _headerHeight,
        decoration: _buildDecoration(context),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (showHeaderPill)
              Positioned.fill(
                top: 6,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 32,
                    height: 4,
                    decoration: BoxDecoration(
                      color: context.widgetToolkitTheme.bottomSheetLineColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(3),
                      ),
                    ),
                  ),
                ),
              ),
            if (headerBuilder != null)
              Positioned(
                child: Padding(
                  padding: context.widgetToolkitTheme.bottomSheetHeaderPadding,
                  child: headerBuilder?.call(context),
                ),
              ),
          ],
        ),
      );

  BoxDecoration _buildDecoration(BuildContext context) => BoxDecoration(
        color: context.widgetToolkitTheme.bottomSheetBackgroundColor,
        border: Border.all(
          color: Colors.transparent,
          width: 0,
        ),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(_cornerRadius),
          topLeft: Radius.circular(_cornerRadius),
        ),
      );

  Widget _buildCloseButton(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: context.widgetToolkitTheme.bottomSheetBackgroundColor,
        child: SmallButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icons.close,
          type: SmallButtonType.outline,
          colorStyle: ButtonColorStyle.fromContext(
            context,
            activeGradientColorStart:
                context.widgetToolkitTheme.disabledFilledButtonBackgroundColor,
            activeGradientColorEnd:
                context.widgetToolkitTheme.primaryGradientEnd,
          ),
        ),
      );
}

/// App Modal sheet configuration used for controlling different parts and
/// options of a modal sheet, such as height factor, header pill or the close
/// button.
class ModalConfiguration {
  const ModalConfiguration({
    this.fullScreen,
    this.heightFactor,
    this.showCloseButton = true,
    this.applySafeArea = true,
    this.safeAreaBottom = true,
    this.showHeaderPill = true,
    this.isDismissible = true,
    this.haveOnlyOneSheet = true,
    this.contentAlignment,
    this.animationAlignment,
  });

  /// If true, this flag ignores the [heightFactor] and calculate the ratio for the full screen
  final bool? fullScreen;

  /// The height factor of the modal sheet defined within the range of (0,1]
  final double? heightFactor;

  /// Flag indicating whether or not to show the close button
  final bool showCloseButton;

  /// Should we apply a safe area around the widget
  final bool applySafeArea;

  /// Should we include the bottom safe area when applying a safe area
  final bool safeAreaBottom;

  /// Flag indicating whether to show the header pill-cutout on the modal sheet
  final bool showHeaderPill;

  /// Flag indicating whether the modal sheet is dismissible or not
  final bool isDismissible;

  /// Flag allowing only to have one modal sheet open at a time
  final bool haveOnlyOneSheet;

  /// Alignment of the content within the modal sheet
  final MainAxisAlignment? contentAlignment;

  /// Alignment of the animation
  final Alignment? animationAlignment;
}

double _calculateFullScreenRatio() {
  final statusBarHeight = MediaQueryData.fromWindow(window).padding.top;
  final totalHeight = MediaQueryData.fromWindow(window).size.height;
  return 1 - statusBarHeight / totalHeight;
}
