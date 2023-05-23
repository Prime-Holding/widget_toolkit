import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:widget_toolkit/widget_toolkit.dart';

import '../blocs/biometrics_bloc.dart';
import '../data_sources/biometrics_auth_data_source.dart';
import '../data_sources/biometrics_local_data_source.dart';
import '../models/biometrics_setting_message_type.dart';
import '../repositories/biometrics_repository.dart';
import '../resources/constants.dart';
import '../services/biometrics_service.dart';

/// Builds Material Design switch to enable or disable biometrics for a specific
/// need as per application. Might be overwritten using [builder] function.
/// Displays customizable notification on success switching.
class BiometricsSwitch extends StatelessWidget {
  const BiometricsSwitch({
    required this.biometricsLocalDataSource,
    this.localizedReason,
    this.mapMessageToString,
    this.onStateChanged,
    this.builder,
    this.onError,
    super.key,
  }) : _addDependencies = true;

  const BiometricsSwitch.withoutDependencies({
    required this.biometricsLocalDataSource,
    this.localizedReason,
    this.mapMessageToString,
    this.onStateChanged,
    this.builder,
    this.onError,
    super.key,
  }) : _addDependencies = false;

  /// [biometricsLocalDataSource] is an interface that the user of this widget
  /// is required to implement in order to be able to save the state of approval
  /// to use the biometrics.
  final BiometricsLocalDataSource biometricsLocalDataSource;

  /// [localizedReason] is the message to show to user while prompting them
  /// for authentication while enabling biometrics. This is typically along the lines of: 'Please scan
  /// your finger to access MyApp.'. Defaults to 'Activate the biometrics of your device'
  final String? localizedReason;

  /// Use [onStateChanged] to execute custom callback or present custom notification
  /// to the user whenever the biometrics are enabled or disabled successfully.
  ///
  /// If you have defined [mapMessageToString] the result from that would be
  /// passed in as [localizedMessage], otherwise the default mapping of the
  /// message to an english string would be passed in.
  final void Function(
    BuildContext context,
    BiometricsMessage message,
    String localizedMessage,
  )? onStateChanged;

  /// By default this element will display Material Design switch. provide [builder]
  /// if you want to build the element on your own way using the implemented business logic.
  final Widget Function(
    BuildContext context,
    bool isEnabled,
    void Function(bool newValue) setBiometrics,
  )? builder;

  /// [mapMessageToString] will be used to translate the [BiometricsMessage]
  /// to human readable text and will be used into the default notification
  final String Function(BiometricsMessage message)? mapMessageToString;

  /// [onError] is optional function that enable error handling out of the package
  final void Function(ErrorModel)? onError;

  final bool _addDependencies;

  @override
  Widget build(BuildContext context) => _wrapWithDependencies(
        child: RxBlocListener<BiometricsBlocType, BiometricsMessage?>(
          state: (bloc) => bloc.states.biometricsDialog,
          listener: _onStateChanged,
          child: RxBlocListener<BiometricsBlocType, ErrorModel>(
            state: (bloc) => bloc.states.errors,
            listener: (context, state) => onError?.call(state),
            child: RxBlocBuilder<BiometricsBlocType, bool>(
              state: (bloc) => bloc.states.areBiometricsEnabled,
              builder: (context, enabled, bloc) {
                final areEnabled = enabled.hasData && (enabled.data ?? false);

                if (builder != null) {
                  return builder!.call(
                    context,
                    areEnabled,
                    (enable) {
                      bloc.events.setBiometrics(
                        enable,
                        localizedReason ?? activateBiometrics,
                      );
                    },
                  );
                } else {
                  return Switch(
                    value: areEnabled,
                    onChanged: (enable) {
                      bloc.events.setBiometrics(
                        enable,
                        localizedReason ?? activateBiometrics,
                      );
                    },
                  );
                }
              },
            ),
          ),
        ),
      );

  void _onStateChanged(BuildContext context, BiometricsMessage? message) {
    if (message == null) {
      // the user canceled authentication
      return;
    }

    if (onStateChanged == null) {
      _showBiometricsMessageBottomSheet(
        context,
        message,
        _localizeMessage(message),
      );
    } else {
      onStateChanged!.call(context, message, _localizeMessage(message));
    }
  }

  Future<void> _showBiometricsMessageBottomSheet(
    BuildContext context,
    BiometricsMessage message,
    String localizedMessage,
  ) =>
      showBlurredBottomSheet(
        context: context,
        configuration: const ModalConfiguration(
          safeAreaBottom: false,
          showCloseButton: false,
        ),
        builder: (context) => Padding(
          padding: context.widgetToolkitTheme.mediumEdgeInsets,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MessagePanelWidget(
                message: localizedMessage,
                messageState: message.state(),
              ),
              Padding(
                padding:
                    context.widgetToolkitTheme.bottomSheetCloseButtonPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SmallButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icons.close,
                      type: SmallButtonType.outline,
                      colorStyle: ButtonColorStyle.fromContext(
                        context,
                        activeGradientColorStart: context.widgetToolkitTheme
                            .disabledFilledButtonBackgroundColor,
                        activeGradientColorEnd:
                            context.widgetToolkitTheme.primaryGradientEnd,
                      ),
                    ),
                    if (message == BiometricsMessage.notSetup)
                      SmallButton(
                        onPressed: () {
                          AppSettings.openSecuritySettings();
                          Navigator.of(context).pop();
                        },
                        icon: Icons.settings,
                        type: SmallButtonType.outline,
                        colorStyle: ButtonColorStyle.fromContext(
                          context,
                          activeGradientColorStart: context.widgetToolkitTheme
                              .disabledFilledButtonBackgroundColor,
                          activeGradientColorEnd:
                              context.widgetToolkitTheme.primaryGradientEnd,
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      );

  String _localizeMessage(BiometricsMessage message) {
    return mapMessageToString?.call(message) ?? message.translate();
  }

  Widget _wrapWithDependencies({required Widget child}) {
    if (_addDependencies) {
      return MultiProvider(
        providers: _buildDependencies(),
        child: child,
      );
    } else {
      return child;
    }
  }

  List<SingleChildWidget> _buildDependencies() => [
        Provider<LocalAuthentication>(
          create: (context) => LocalAuthentication(),
        ),
        Provider<BiometricsLocalDataSource>(
          create: (context) => biometricsLocalDataSource,
        ),
        Provider<BiometricsAuthDataSource>(
          create: (context) => BiometricsAuthDataSource(
            localAuthentication: context.read<LocalAuthentication>(),
          ),
        ),
        Provider<BiometricsRepository>(
          create: (context) => BiometricsRepository(
            context.read<BiometricsAuthDataSource>(),
            context.read<BiometricsLocalDataSource>(),
          ),
        ),
        Provider<BiometricsService>(
          create: (context) => BiometricsService(
            context.read<BiometricsRepository>(),
          ),
        ),
        RxBlocProvider<BiometricsBlocType>(
          create: (context) => BiometricsBloc(
            context.read<BiometricsService>(),
          ),
        ),
      ];
}
