import 'package:flutter/material.dart';

import '../../extensions.dart';
import '../base/models/message_panel_state.dart';
import '../base/theme/widget_toolkit_theme.dart';
import '../lib_shimmer/models/shimmer_type.dart';
import '../lib_shimmer/views/shimmer_text.dart';
import '../lib_shimmer/views/shimmer_wrapper.dart';

class MessagePanelWidget extends StatelessWidget {
  const MessagePanelWidget({
    required this.message,
    required this.messageState,
    this.body,
    this.color,
    this.bgColor,
    this.textDecoration,
    this.isLoading = false,
    this.errorPanelIcon,
    super.key,
  });

  final MessagePanelState messageState;
  final TextDecoration? textDecoration;
  final String message;
  final String? body;
  final Color? color;
  final Color? bgColor;
  final bool isLoading;
  final dynamic errorPanelIcon;

  @override
  Widget build(BuildContext context) => Container(
        padding: context.widgetToolkitTheme.messagePanelEdgeInsets,
        decoration: BoxDecoration(
          color: _backgroundColor(context),
          borderRadius: BorderRadius.all(
            Radius.circular(
              context.widgetToolkitTheme.spacingM,
            ),
          ),
        ),
        child: Row(
          children: [
            isLoading
                ? ShimmerWrapper(
                    showShimmer: true,
                    baseColor: context.widgetToolkitTheme.shimmerBaseColor,
                    highlightColor:
                        context.widgetToolkitTheme.shimmerHighlightColor,
                    child: Container(
                      decoration: BoxDecoration(
                          color: context.widgetToolkitTheme.shimmerBaseColor,
                          borderRadius: BorderRadius.all(Radius.circular(
                              context.widgetToolkitTheme.spacingXL))),
                      width: context.widgetToolkitTheme.spacingXXL,
                      height: context.widgetToolkitTheme.spacingXXL,
                    ))
                : const SizedBox(),
            _IconWidget(
              state: messageState,
              color: color,
              errorPanelIcon: errorPanelIcon,
            ),
            SizedBox(
              width: context.widgetToolkitTheme.spacingM,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ShimmerText(
                    isLoading ? null : message.toUpperCase(),
                    style: context.widgetToolkitTheme.captionBold.copyWith(
                      color: color ?? messageState.getColor(context),
                      letterSpacing: 0.8,
                      decoration: textDecoration,
                      height: 2.2,
                    ),
                    textHeightBehavior: const TextHeightBehavior(
                      leadingDistribution: TextLeadingDistribution.even,
                    ),
                    baseColor: context.widgetToolkitTheme.shimmerBaseColor,
                    highlightColor:
                        context.widgetToolkitTheme.shimmerHighlightColor,
                    type: ShimmerType.fixed(placeholderLength: 20),
                  ),
                  if (isLoading) ...[
                    SizedBox(
                      height: context.widgetToolkitTheme.spacingXS,
                    ),
                    if (body == null)
                      ShimmerText(
                        null,
                        style: context.widgetToolkitTheme.captionBold.copyWith(
                          color: color ?? messageState.getColor(context),
                          letterSpacing: 0.8,
                          height: 2.2,
                        ),
                        baseColor: context.widgetToolkitTheme.shimmerBaseColor,
                        highlightColor:
                            context.widgetToolkitTheme.shimmerHighlightColor,
                        type: ShimmerType.fixed(placeholderLength: 20),
                      )
                  ],
                  if (body != null)
                    ShimmerText(
                      isLoading ? null : body!.toUpperCase(),
                      style: context.widgetToolkitTheme.captionBold.copyWith(
                        color: context.widgetToolkitTheme.shimmerTextColor,
                        height: 2.2,
                      ),
                      baseColor: context.widgetToolkitTheme.shimmerBaseColor,
                      highlightColor:
                          context.widgetToolkitTheme.shimmerHighlightColor,
                    ),
                ],
              ),
            ),
          ],
        ),
      );

  Color _backgroundColor(BuildContext context) {
    if (isLoading) {
      return context.widgetToolkitTheme.messagePanelBackgroundColor;
    }
    return bgColor ?? messageState.getBackgroundColor(context);
  }
}

class _IconWidget extends StatelessWidget {
  const _IconWidget({
    required this.state,
    this.color,
    this.errorPanelIcon,
  });

  final MessagePanelState state;
  final Color? color;
  final dynamic errorPanelIcon;

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case MessagePanelState.important:
        return context.widgetToolkitTheme.dangerIcon
            .copyWith(color: color ?? state.getColor(context));
      case MessagePanelState.informative:
        return context.widgetToolkitTheme.educateIcon
            .copyWith(color: color ?? state.getColor(context));
      case MessagePanelState.positive:
        return context.widgetToolkitTheme.messageIcon
            .copyWith(color: color ?? state.getColor(context));
      case MessagePanelState.positiveCheck:
        return context.widgetToolkitTheme.checkCircleIcon
            .copyWith(color: color ?? state.getColor(context));
      case MessagePanelState.neutral:
        return context.widgetToolkitTheme.greatNewsIcon
            .copyWith(color: color ?? state.getColor(context));
      case MessagePanelState.lessImportant:
        return context.widgetToolkitTheme.infoCircleIcon
            .copyWith(color: color ?? state.getColor(context));
      case MessagePanelState.custom:
        return errorPanelIcon;
    }
  }
}

extension _MessagePanelStateX on MessagePanelState {
  Color getBackgroundColor(BuildContext context) {
    switch (this) {
      case MessagePanelState.important:
        return context.widgetToolkitTheme.messagePanelBackgroundColorImportant;
      case MessagePanelState.informative:
        return context
            .widgetToolkitTheme.messagePanelBackgroundColorInformative;
      case MessagePanelState.positive:
      case MessagePanelState.positiveCheck:
        return context.widgetToolkitTheme.messagePanelBackgroundColorPositive;
      case MessagePanelState.neutral:
        return context.widgetToolkitTheme.messagePanelBackgroundColorNeutral;
      case MessagePanelState.lessImportant:
        return context
            .widgetToolkitTheme.messagePanelBackgroundColorLessImportant;
      case MessagePanelState.custom:
        return context.widgetToolkitTheme.messagePanelBackgroundColorImportant;
    }
  }

  Color getColor(BuildContext context) {
    switch (this) {
      case MessagePanelState.important:
        return context.widgetToolkitTheme.messagePanelColorImportant;
      case MessagePanelState.informative:
        return context.widgetToolkitTheme.messagePanelColorInformative;
      case MessagePanelState.positive:
      case MessagePanelState.positiveCheck:
        return context.widgetToolkitTheme.messagePanelColorPositive;
      case MessagePanelState.neutral:
        return context.widgetToolkitTheme.messagePanelColorNeutral;
      case MessagePanelState.lessImportant:
        return context.widgetToolkitTheme.messagePanelColorLessImportant;
      case MessagePanelState.custom:
        return context.widgetToolkitTheme.messagePanelBackgroundColorNeutral;
    }
  }
}
