import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';

import '../../../models.dart';
import '../../lib_ui_components/buttons/button_color_style.dart';
import '../../lib_ui_components/buttons/button_state.dart';
import '../../lib_ui_components/buttons/small_button.dart';
import '../../lib_ui_components/message_panel_error.dart';
import '../../lib_ui_components/show_blurred_bottom_sheet.dart';
import '../blocs/language_picker_bloc.dart';
import '../models/selected_language_model.dart';
import '../theme/language_picker_theme.dart';
import '../ui_components/select_language_item.dart';

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
///  With [modalConfiguration] we can change the configuration of the showModal().
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
void showChangeLanguageBottomSheet({
  required BuildContext context,
  Widget Function(ErrorModel?)? errorBuilder,
  required Widget Function(BuildContext)? headerBuilder,
  dynamic iconRight,
  LanguagePickerModalConfiguration modalConfiguration =
      const LanguagePickerModalConfiguration(),
  final MessagePanelState messageState = MessagePanelState.important,
  dynamic errorPanelIcon,
}) =>
    showBlurredBottomSheet(
      context: context,
      builder: (context) => _ChangeLanguageWidget(
        iconRight: iconRight,
        errorBuilder: errorBuilder,
        messageState: messageState,
        errorPanelIcon: errorPanelIcon,
      ),
      headerBuilder: headerBuilder,
      onCancelPressed: () => Navigator.of(context).pop(),
      configuration: modalConfiguration,
    );

class LanguagePickerModalConfiguration extends ModalConfiguration {
  const LanguagePickerModalConfiguration(
      {bool safeAreaBottom = true,
      MainAxisAlignment? contentAlignment,
      bool? fullScreen = false,
      bool haveOnlyOneSheet = true,
      bool showHeaderPill = false,
      bool showCloseButton = false,
      double? heightFactor,
      bool dialogHasBottomPadding = true,
      bool isDismissible = true})
      : super(
            safeAreaBottom: safeAreaBottom,
            contentAlignment: contentAlignment,
            fullScreen: fullScreen,
            haveOnlyOneSheet: haveOnlyOneSheet,
            showHeaderPill: showHeaderPill,
            showCloseButton: showCloseButton,
            heightFactor: heightFactor,
            dialogHasBottomPadding: dialogHasBottomPadding,
            isDismissible: isDismissible);
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
                MessagePanelError<LanguagePickerBlocType>(
                  errorState: (bloc) => bloc.states.errors,
                  padding:
                      context.languagePickerTheme.messagePanelErrorEdgeInsets,
                  errorBuilder: errorBuilder,
                  messageState: messageState,
                  errorPanelIcon: errorPanelIcon,
                ),
                ...(snapshot.data ?? [])
                    .map(
                      (language) => _ChooseLanguage(
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
                SmallButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icons.close,
                  type: SmallButtonType.outline,
                  colorStyle: ButtonColorStyle.fromContext(
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

class _ChooseLanguage extends StatelessWidget {
  const _ChooseLanguage({
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
        child: SelectLanguageItem.selected(
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
      child: SelectLanguageItem.unSelected(
        languageKey: languageModel.language.key,
        code: languageModel.language.languageCode.toUpperCase(),
        iconRight: iconRight ?? context.languagePickerTheme.checkIcon,
        onPressed:
            onPressed == null ? null : () => onPressed?.call(languageModel),
        state: buttonState,
        colorStyle: ButtonColorStyle.fromContext(
          context,
          activeButtonTextColor:
              context.languagePickerTheme.activeButtonLanguageTextColor,
        ),
        languageModel: languageModel,
      ),
    );
  }
}
