import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';
import 'package:widget_toolkit/widget_toolkit.dart';

import '../../base/models/biometrics_setting_message_types.dart';
import '../../base/resources/constants.dart';
import '../../base/services/biometrics_service.dart';
import '../bloc/biometrics_bloc.dart';

/// Builds Material Design switch to enable or disable biometrics for a specific
/// need as per application. Might be overwritten using [builder] function.
/// Displays customizable notification on success switching.
///
/// It depends on [AppLevelBiometricsDependencies] so make sure that you provide
/// them into the context on top level, as well as an implementation of [BiometricsLocalDataSource].
class BiometricsSwitch extends StatelessWidget {
  const BiometricsSwitch({
    this.enabledMessage,
    this.onStateChanged,
    this.showDefaultNotification = true,
    this.builder,
    this.mapMessageToString,
    this.onError,
    super.key,
  });

  /// [enabledMessage] is the message to show to user while prompting them
  /// for authentication while enabling biometrics. This is typically along the lines of: 'Please scan
  /// your finger to access MyApp.'. Defaults to 'Activate the biometrics of your device'
  final String? enabledMessage;

  /// [showDefaultNotification] enables a modal sheet with a default message
  /// to be displayed when the user enable or disable  successfully the biometrics.
  /// If want to customize or disable that notification set [showDefaultNotification]
  /// to false and use [onStateChanged]
  final bool showDefaultNotification;

  /// Use [onStateChanged] to execute custom callback or present custom notification
  /// to the user whenever the biometrics are enabled or disabled successfully.
  /// To use it you need to set [showDefaultNotification] to false
  final void Function(BiometricsSettingMessageType?)? onStateChanged;

  /// By default this element will display Material Design switch. provide [builder]
  /// if you want to build the element on your own way using the implemented business logic.
  final Widget Function(
      bool isEnabled, void Function(bool newValue) setBiometrics)? builder;

  /// [mapMessageToString] will be used to translate the BiometricsSettingMessageType
  /// to human readable text and will be used into the default notification if
  /// [showDefaultNotification] is true
  final String Function(BiometricsSettingMessageType messageType)?
      mapMessageToString;

  /// [onError] is optional function that enable error handling out of the package
  final void Function(ErrorModel)? onError;

  @override
  Widget build(BuildContext context) => RxBlocProvider<BiometricsBlocType>(
        /*Todo(Toncho): this creates an implicit dependency
           on [BiometricsService], */
        create: (ctx) => BiometricsBloc(context.read<BiometricsService>()),
        child: Column(
          children: [
            RxBlocBuilder<BiometricsBlocType, bool>(
              state: (bloc) => bloc.states.areBiometricsEnabled,
              builder: (context, enabled, bloc) {
                final areEnabled = enabled.hasData && (enabled.data ?? false);
                return builder?.call(
                      areEnabled,
                      (enable) => bloc.events
                          .setBiometrics(enable, _getMessage(enable)),
                    ) ??
                    Switch(
                      value: areEnabled,
                      onChanged: (val) {
                        bloc.events.setBiometrics(val, _getMessage(val));
                      },
                    );
              },
            ),
            _showBottomMessage(context),
            _buildErrorListener(context),
          ],
        ),
      );

  String _getMessage(bool isEnabled) =>
      isEnabled ? (enabledMessage ?? activateBiometrics) : deactivateBiometrics;

  Widget _buildErrorListener(BuildContext context) =>
      RxBlocListener<BiometricsBlocType, ErrorModel>(
        state: (bloc) => bloc.states.errors,
        listener: (context, state) => onError?.call(state),
      );

  Widget _showBottomMessage(BuildContext context) =>
      RxBlocListener<BiometricsBlocType, BiometricsSettingMessageType?>(
        state: (bloc) => bloc.states.biometricsDialog,
        listener: (context, state) => state != null
            ? showDefaultNotification
                ? showBiometricsMessageBottomSheet(context, state)
                : onStateChanged?.call(state)
            : null,
      );

  Future<void> showBiometricsMessageBottomSheet(
    BuildContext context,
    BiometricsSettingMessageType messageType,
  ) =>
      showBlurredBottomSheet(
        context: context,
        configuration: const ModalConfiguration(safeAreaBottom: false),
        builder: (context) => Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MessagePanelWidget(
                  message: mapMessageToString?.call(messageType) ??
                      messageType.translate(),
                  messageState: messageType.state(),
                ),
                const SizedBox(
                  height: 24,
                ),
                SmallButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icons.close,
                  type: SmallButtonType.outline,
                ),
              ],
            ),
          ),
        ),
      );
}
