import 'package:flutter/material.dart';

import '../../../extensions.dart';
import '../../../language_picker.dart';
import '../../lib_shimmer/models/shimmer_type.dart';
import '../../lib_shimmer/views/app_shimmer.dart';
import '../../lib_shimmer/views/app_shimmer_text.dart';
import '../theme/prime_components_theme.dart';

class AppMessagePanelWidget extends StatelessWidget {
  const AppMessagePanelWidget({
    required this.message,
    required this.messageState,
    this.body,
    this.color,
    this.bgColor,
    this.textDecoration,
    this.isLoading = false,
    this.errorPanelIcon,
    Key? key,
  }) : super(key: key);

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
        padding: context.primeComponentsTheme.messagePanelEdgeInsets,
        decoration: BoxDecoration(
          color: _backgroundColor(context),
          borderRadius: BorderRadius.all(
            Radius.circular(
              context.languagePickerTheme.spacingM,
            ),
          ),
        ),
        child: Row(
          children: [
            isLoading
                ? AppShimmer(
                    showShimmer: true,
                    baseColor: context.primeComponentsTheme.shimmerBaseColor,
                    highlightColor:
                        context.primeComponentsTheme.shimmerHighlightColor,
                    child: Container(
                      decoration: BoxDecoration(
                          color: context.primeComponentsTheme.shimmerBaseColor,
                          borderRadius: BorderRadius.all(Radius.circular(
                              context.primeComponentsTheme.spacingXL))),
                      width: context.primeComponentsTheme.spacingXXL,
                      height: context.primeComponentsTheme.spacingXXL,
                    ))
                : const SizedBox(),
            _IconWidget(
              state: messageState,
              color: color,
              errorPanelIcon: errorPanelIcon,
            ),
            SizedBox(
              width: context.languagePickerTheme.spacingM,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppShimmerText(
                    isLoading ? null : message.toUpperCase(),
                    style: context.primeComponentsTheme.captionBold.copyWith(
                      color: color ?? messageState.getColor(context),
                      letterSpacing: 0.8,
                      decoration: textDecoration,
                      height: 2.2,
                    ),
                    textHeightBehavior: const TextHeightBehavior(
                      leadingDistribution: TextLeadingDistribution.even,
                    ),
                    baseColor: context.primeComponentsTheme.shimmerBaseColor,
                    highlightColor:
                        context.primeComponentsTheme.shimmerHighlightColor,
                    type: ShimmerType.fixed(placeholderLength: 20),
                  ),
                  if (isLoading) ...[
                    SizedBox(
                      height: context.primeComponentsTheme.spacingXS1,
                    ),
                    if (body == null)
                      AppShimmerText(
                        null,
                        style:
                            context.primeComponentsTheme.captionBold.copyWith(
                          color: color ?? messageState.getColor(context),
                          letterSpacing: 0.8,
                          height: 2.2,
                        ),
                        baseColor:
                            context.primeComponentsTheme.shimmerBaseColor,
                        highlightColor:
                            context.primeComponentsTheme.shimmerHighlightColor,
                        type: ShimmerType.fixed(placeholderLength: 20),
                      )
                  ],
                  if (body != null)
                    AppShimmerText(
                      isLoading ? null : body!.toUpperCase(),
                      style: context.primeComponentsTheme.captionBold.copyWith(
                        color: context.primeComponentsTheme.black,
                        height: 2.2,
                      ),
                      baseColor: context.primeComponentsTheme.shimmerBaseColor,
                      highlightColor:
                          context.primeComponentsTheme.shimmerHighlightColor,
                    ),
                ],
              ),
            ),
          ],
        ),
      );

  Color _backgroundColor(BuildContext context) {
    if (isLoading) {
      return context.primeComponentsTheme.messagePanelBackgroundColor;
    }
    return bgColor ?? messageState.getBackgroundColor(context);
  }
}

class _IconWidget extends StatelessWidget {
  const _IconWidget({
    required this.state,
    this.color,
    this.errorPanelIcon,
    Key? key,
  }) : super(key: key);

  final MessagePanelState state;
  final Color? color;
  final dynamic errorPanelIcon;

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case MessagePanelState.important:
        return context.primeComponentsTheme.dangerIcon
            .copyWith(color: color ?? state.getColor(context));
      case MessagePanelState.informative:
        return context.primeComponentsTheme.educateIcon
            .copyWith(color: color ?? state.getColor(context));
      case MessagePanelState.positive:
        return context.primeComponentsTheme.messageIcon
            .copyWith(color: color ?? state.getColor(context));
      case MessagePanelState.positiveCheck:
        return context.primeComponentsTheme.checkCircleIcon
            .copyWith(color: color ?? state.getColor(context));
      case MessagePanelState.neutral:
        return context.primeComponentsTheme.greatNewsIcon
            .copyWith(color: color ?? state.getColor(context));
      case MessagePanelState.lessImportant:
        return context.primeComponentsTheme.infoCircleIcon
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
        return context.primeComponentsTheme.lightRed;
      case MessagePanelState.informative:
        return context.primeComponentsTheme.blueLight;
      case MessagePanelState.positive:
      case MessagePanelState.positiveCheck:
        return context.primeComponentsTheme.greenLight;
      case MessagePanelState.neutral:
        return context.primeComponentsTheme.red;
      case MessagePanelState.lessImportant:
        return context.primeComponentsTheme.orangeLight;
      case MessagePanelState.custom:
        return context.primeComponentsTheme.lightRed;
    }
  }

  Color getColor(BuildContext context) {
    switch (this) {
      case MessagePanelState.important:
        return context.primeComponentsTheme.red;
      case MessagePanelState.informative:
        return context.primeComponentsTheme.darkBlue;
      case MessagePanelState.positive:
      case MessagePanelState.positiveCheck:
        return context.primeComponentsTheme.darkGreen;
      case MessagePanelState.neutral:
        return context.primeComponentsTheme.white;
      case MessagePanelState.lessImportant:
        return context.primeComponentsTheme.orange;
      case MessagePanelState.custom:
        return context.primeComponentsTheme.red;
    }
  }
}
