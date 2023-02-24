import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';

import '../../../widget_toolkit.dart';

/// Display a bottom modal sheet, designed to display a list of available languages,
/// from which to choose one to be set as the language Locale() to your MaterialApp()
///
/// With the [errorBuilder] parameter you can provide a function, which receives
/// an exception model, which implements `ErrorModel`.`ErrorModel` is the type
/// of error coming from the LanguagePickerBloc error state. In order to map
/// other types of exceptions, you should provide an [errorBuilder],
/// with handling of the error.
///
/// The [headerBuilder] parameter receives the title widget of the language picker
///
/// With [iconRight] parameter, you can provide the icon, displayed on the
/// right end of every language widget. There is a default checkIcon if the parameter
/// is not specified.
///
///  With [configuration] we can change the configuration of the showAppModalBottomSheet().
///  There are default configurations provided. Changing [fullScreen] to true, makes
///  the modal sheet appear to the top of the screen. With [showHeaderPill] set to
///  true displays a header pill at the top of the modal sheet. Changing [safeAreaBottom]
///  to true, moves the modal sheet up and displays the background color at the
///  bottom of the modal sheet.
///
/// [messageState] receives a [MessagePanelState], according to it, the appropriate
/// icon, color and background color of the error panel widget are displayed.
///
/// [errorPanelIcon] receives a custom Icon for the error panel displayed above
/// the language list. In order to use it, you should specify that the message
/// state is [MessagePanelState.custom].
///
void showAppChangeLanguageBottomSheet({
  required BuildContext context,
  Widget Function(ErrorModel?)? errorBuilder,
  required Widget Function(BuildContext)? headerBuilder,
  dynamic iconRight,
  LanguagePickerConfiguration configuration =
      const LanguagePickerConfiguration(),
  final MessagePanelState messageState = MessagePanelState.important,
  dynamic errorPanelIcon,
}) =>
    showAppModalBottomSheet(
      context: context,
      builder: (context) => _ChangeLanguageWidget(
        iconRight: iconRight,
        errorBuilder: errorBuilder,
        messageState: messageState,
        errorPanelIcon: errorPanelIcon,
      ),
      headerBuilder: headerBuilder,
      onCancelPressed: () => Navigator.of(context).pop(),
      configuration: AppModalBottomSheetConfiguration(
        fullScreen: configuration.fullScreen,
        showCloseButton: false,
        showHeaderPill: configuration.showHeaderPill,
        safeAreaBottom: configuration.safeAreaBottom,
      ),
    );

class LanguagePickerConfiguration {
  const LanguagePickerConfiguration({
    this.fullScreen = false,
    this.safeAreaBottom = false,
    this.showHeaderPill = false,
  });

  final bool fullScreen;
  final bool safeAreaBottom;
  final bool showHeaderPill;
}

class _ChangeLanguageWidget extends StatelessWidget {
  const _ChangeLanguageWidget({
    required this.messageState,
    this.errorPanelIcon,
    this.errorBuilder,
    this.iconRight,
    Key? key,
  }) : super(key: key);

  final dynamic iconRight;
  final Widget Function(ErrorModel?)? errorBuilder;
  final MessagePanelState messageState;
  final dynamic errorPanelIcon;

  @override
  Widget build(BuildContext context) =>
      RxBlocBuilder<LanguagePickerBlocType, List<SelectedLanguageModel>>(
        bloc: context.read<LanguagePickerBlocType>(),
        state: (bloc) => bloc.states.languages,
        builder: (context, snapshot, bloc) => Padding(
          padding: context.languagePickerTheme.changeLanguagePadding,
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppMessagePanelError<LanguagePickerBlocType>(
                  errorState: (bloc) => bloc.states.errors,
                  padding:
                      context.languagePickerTheme.messagePanelErrorEdgeInsets,
                  errorBuilder: errorBuilder,
                  messageState: messageState,
                  errorPanelIcon: errorPanelIcon,
                ),
                ...(snapshot.data ?? [])
                    .map(
                      (language) => _AppChooseLanguage(
                        languageModel: language,
                        padding:
                            context.languagePickerTheme.chooseLanguagePadding,
                        isLoading: language.isLoading,
                        onPressed: (snapshot.data ?? []).isAnyLoading
                            ? null
                            : (languageModel) => context
                                .read<LanguagePickerBlocType>()
                                .events
                                .setCurrent(languageModel.language),
                        iconRight: iconRight,
                      ),
                    )
                    .toList(),
                SizedBox(
                  height: context.languagePickerTheme.changeLanguageSizedBox,
                ),
                AppSmallButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icons.close,
                  type: SmallButtonType.outline,
                  colorStyle: PrimeButtonColorStyle.fromContext(
                    context,
                    activeGradientColorStart: context.languagePickerTheme
                        .disabledFilledButtonBackgroundColor,
                    activeGradientColorEnd:
                        context.languagePickerTheme.activeGradientRedEnd,
                  ),
                )
              ],
            ),
          ),
        ),
      );
}

class _AppChooseLanguage extends StatelessWidget {
  const _AppChooseLanguage({
    required this.languageModel,
    this.onPressed,
    this.isLoading = false,
    this.padding = EdgeInsets.zero,
    this.iconRight,
    Key? key,
  }) : super(key: key);

  final SelectedLanguageModel languageModel;
  final Function(SelectedLanguageModel)? onPressed;

  final EdgeInsets padding;
  final bool isLoading;
  final dynamic iconRight;

  @override
  Widget build(BuildContext context) {
    final buttonState =
        isLoading ? ButtonStateModel.loading : ButtonStateModel.enabled;

    if (languageModel.selected) {
      return Padding(
        padding: padding,
        child: AppChooseLanguage(
          languageModel: languageModel,
          languageKey: languageModel.language.key,
          code: languageModel.language.languageCode.toUpperCase(),
          onPressed:
              onPressed == null ? null : () => onPressed?.call(languageModel),
          iconRight: iconRight ?? context.languagePickerTheme.checkIcon,
          state: buttonState,
        ),
      );
    }

    return Padding(
      padding: padding,
      child: AppChooseLanguageInactive(
        languageKey: languageModel.language.key,
        code: languageModel.language.languageCode.toUpperCase(),
        iconRight: iconRight ?? context.languagePickerTheme.checkIcon,
        onPressed:
            onPressed == null ? null : () => onPressed?.call(languageModel),
        state: buttonState,
        colorStyle: PrimeButtonColorStyle.fromContext(
          context,
          activeButtonTextColor:
              context.languagePickerTheme.activeButtonLanguageTextColor,
        ),
        languageModel: languageModel,
      ),
    );
  }
}