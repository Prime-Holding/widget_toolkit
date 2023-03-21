import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';

import '../../../models.dart';
import '../../../theme_data.dart';
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
/// [itemBuilder] the parameter accepts a function, which should return a Widget
/// to display the [SelectedLanguageModel] data. The loading parameter accepts
/// the value for the current [SelectedLanguageModel.isLoading] model.
///
/// With the [errorBuilder] parameter you can provide a function, which receives
/// an exception model, which implements `ErrorModel`.`ErrorModel` is the type
/// of error coming from the LanguagePickerBloc error state. In order to map
/// other types of exceptions, you should provide an [errorBuilder],
/// with handling of the error.
///
/// The [headerBuilder] parameter receives the title widget of the language picker
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
/// For the [SelectLanguageItem] widget there is a default checkIcon on the
/// right end of the selected language widget. To use a custom icon, use:
/// LanguagePickerTheme.light.copyWith(
///   checkIcon: Assets.customIcon,
/// ),
///
/// [MessagePanelError] widget, is displayed above the languages list, when
/// there is an error. To access one of the other preconfigured icons, instead
/// of the danger icon displayed in the error panel on the left of the error,
/// for the value of the parameter [messageState] provide another [MessagePanelState]
/// value, such as: [MessagePanelState.informative]
///
/// In order to override the error panel icon with a custom icon, you should use
/// the copyWith method of the [WidgetToolkitTheme], such as:
/// WidgetToolkitTheme.light.copyWith(
///   dangerIcon: Assets.customIcon,
/// )
///
/// [hasLeftIcon] Displays an icon on the left of the language name. By default it
/// is null and the icon is not displayed. If you want to use the default icon on the
/// left of the language name, set it to true. In order to use a custom icon,
/// set it to true and override the default icon with :
/// LanguagePickerTheme.light.copyWith(
///   leftInfoCircleIcon: Assets.customIcon,
/// ),
void showChangeLanguageBottomSheet({
  required BuildContext context,
  Widget Function(BuildContext)? headerBuilder,
  Widget Function(ErrorModel?)? errorBuilder,
  Widget Function(
          SelectedLanguageModel model, bool loading, BuildContext context)?
      itemBuilder,
  LanguagePickerModalConfiguration modalConfiguration =
      const LanguagePickerModalConfiguration(),
  MessagePanelState messageState = MessagePanelState.important,
  final bool? hasLeftIcon,
}) =>
    showBlurredBottomSheet(
      context: context,
      builder: (context) => _ChangeLanguageWidget(
        itemBuilder: itemBuilder,
        errorBuilder: errorBuilder,
        messageState: messageState,
        hasLeftIcon: hasLeftIcon,
      ),
      headerBuilder: headerBuilder,
      onCancelPressed: () => Navigator.of(context).pop(),
      configuration: modalConfiguration,
    );

class LanguagePickerModalConfiguration extends ModalConfiguration {
  const LanguagePickerModalConfiguration(
      {bool safeAreaBottom = false,
      MainAxisAlignment? contentAlignment,
      bool? fullScreen = false,
      bool haveOnlyOneSheet = true,
      bool showHeaderPill = false,
      bool showCloseButton = false,
      double? heightFactor,
      bool dialogHasBottomPadding = false,
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
    this.itemBuilder,
    this.errorBuilder,
    this.hasLeftIcon,
    Key? key,
  }) : super(key: key);

  final Widget Function(
    SelectedLanguageModel model,
    bool loading,
    BuildContext context,
  )? itemBuilder;
  final Widget Function(ErrorModel?)? errorBuilder;
  final MessagePanelState messageState;
  final bool? hasLeftIcon;

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
                ),
                ...(snapshot.data ?? []).map(
                  (language) {
                    if (itemBuilder != null) {
                      return itemBuilder!(
                          language, language.isLoading, context);
                    }
                    return _ChooseLanguage(
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
                      hasLeftIcon: hasLeftIcon,
                    );
                  },
                ).toList(),
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
                        context.languagePickerTheme.activeGradientEnd,
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
    this.hasLeftIcon,
    Key? key,
  }) : super(key: key);

  final SelectedLanguageModel languageModel;
  final Function(SelectedLanguageModel)? onPressed;
  final EdgeInsets padding;
  final bool isLoading;
  final bool? hasLeftIcon;

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
          state: buttonState,
          hasLeftIcon: hasLeftIcon,
        ),
      );
    }

    return Padding(
      padding: padding,
      child: SelectLanguageItem.unSelected(
        languageKey: languageModel.language.key,
        code: languageModel.language.languageCode.toUpperCase(),
        onPressed:
            onPressed == null ? null : () => onPressed?.call(languageModel),
        state: buttonState,
        colorStyle: ButtonColorStyle.fromContext(
          context,
          activeButtonTextColor:
              context.languagePickerTheme.activeButtonLanguageTextColor,
        ),
        languageModel: languageModel,
        hasLeftIcon: hasLeftIcon,
      ),
    );
  }
}
