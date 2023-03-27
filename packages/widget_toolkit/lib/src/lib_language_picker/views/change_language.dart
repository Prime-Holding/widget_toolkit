import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';

import '../../../models.dart';
import '../../../theme_data.dart';
import '../../base/models/language_model.dart';
import '../../lib_ui_components/buttons/button_color_style.dart';
import '../../lib_ui_components/buttons/button_state.dart';
import '../../lib_ui_components/buttons/small_button.dart';
import '../../lib_ui_components/message_panel_error.dart';
import '../../lib_ui_components/show_blurred_bottom_sheet.dart';
import '../blocs/language_picker_bloc.dart';
import '../di/language_picker_dependencies.dart';
import '../models/selected_language_model.dart';
import '../services/language_service.dart';
import '../theme/language_picker_theme.dart';
import '../ui_components/select_language_item.dart';

/// Display a bottom modal sheet, designed to display a list of available languages,
/// from which to choose one to be set as the language Locale() to your MaterialApp()
///
/// [service] receives an implementation of the [LanguageService] class.
/// The API of the class provides methods for the logic of fetching a list
/// of languages, setting and getting the current one and getting all of them.
/// For more information, check the documentation in the file [LanguageService] class.
///
/// [onChanged] receives a function, which accepts the selected language model and
/// it is invoked when the selected change is changed.
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
/// With [modalConfiguration] we can change the configuration of the showModal().
/// There are default configurations provided. Changing [fullScreen] to true, makes
/// the modal sheet appear to the top of the screen. With [showHeaderPill] set to
/// true displays a header pill at the top of the modal sheet. Changing [safeAreaBottom]
/// to true, moves the modal sheet up and displays the background color at the
/// bottom of the modal sheet.
///
/// For the [SelectLanguageItem] widget there is a default checkIcon on the
/// right end of the selected language widget. To use a custom icon, use:
/// LanguagePickerTheme.light.copyWith(
///   checkIcon: Assets.customIcon,
/// ),
///
/// [MessagePanelError] widget, is displayed above the languages list, when
/// there is an error with a default icon. To access one of the other
/// preconfigured icons, instead of the danger icon displayed in the error panel
/// on the left of the error text, for the value of the parameter [messageState]
/// provide another [MessagePanelState] value, such as: [MessagePanelState.informative].
/// According to [messageState], the appropriate icon, color and background color
/// of the error panel widget  are displayed.
///
/// In order to override the error panel icon with a custom icon, you should use
/// the copyWith method of the [WidgetToolkitTheme], such as:
/// WidgetToolkitTheme.light.copyWith(
///   dangerIcon: Assets.customIcon,
/// )
void showChangeLanguageBottomSheet({
  required BuildContext context,
  required LanguageService service,
  required Function(LanguageModel language) onChanged,
  Widget Function(BuildContext)? headerBuilder,
  Widget Function(ErrorModel?)? errorBuilder,
  Widget Function(
          SelectedLanguageModel model, bool loading, BuildContext context)?
      itemBuilder,
  LanguagePickerModalConfiguration modalConfiguration =
      const LanguagePickerModalConfiguration(),
  MessagePanelState messageState = MessagePanelState.important,
}) =>
    showBlurredBottomSheet(
      context: context,
      builder: (context) => ChangeLanguageWidget(
        service: service,
        onChanged: onChanged,
        itemBuilder: itemBuilder,
        errorBuilder: errorBuilder,
        messageState: messageState,
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

class ChangeLanguageWidget extends StatelessWidget {
  const ChangeLanguageWidget({
    required this.messageState,
    required this.service,
    required this.onChanged,
    this.itemBuilder,
    this.errorBuilder,
    Key? key,
  }) : super(key: key);

  final Widget Function(
    SelectedLanguageModel model,
    bool loading,
    BuildContext context,
  )? itemBuilder;
  final Widget Function(ErrorModel?)? errorBuilder;
  final MessagePanelState messageState;
  final LanguageService service;
  final Function(LanguageModel language) onChanged;

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: LanguagePickerDependencies.from(
          service,
        ).providers,
        child: Builder(
          builder: (context) =>
              RxBlocListener<LanguagePickerBlocType, LanguageModel>(
            state: (bloc) => bloc.states.currentLanguage,
            listener: (context, state) => onChanged.call(state),
            child: RxBlocBuilder<LanguagePickerBlocType,
                List<SelectedLanguageModel>>(
              bloc: context.read<LanguagePickerBlocType>(),
              state: (bloc) => bloc.states.languages,
              builder: (context, snapshot, bloc) => Padding(
                padding: context.languagePickerTheme.changeLanguagePadding,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      MessagePanelError<LanguagePickerBlocType>(
                        errorState: (bloc) => bloc.states.errors,
                        padding: context
                            .languagePickerTheme.messagePanelErrorEdgeInsets,
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
                            padding: context
                                .languagePickerTheme.chooseLanguagePadding,
                            isLoading: language.isLoading,
                            onPressed: (snapshot.data ?? []).isAnyLoading
                                ? null
                                : (languageModel) => context
                                    .read<LanguagePickerBlocType>()
                                    .events
                                    .setCurrent(languageModel.language),
                          );
                        },
                      ).toList(),
                      SizedBox(
                        height:
                            context.languagePickerTheme.changeLanguageSizedBox,
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
    Key? key,
  }) : super(key: key);

  final SelectedLanguageModel languageModel;
  final Function(SelectedLanguageModel)? onPressed;
  final EdgeInsets padding;
  final bool isLoading;

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
      ),
    );
  }
}
