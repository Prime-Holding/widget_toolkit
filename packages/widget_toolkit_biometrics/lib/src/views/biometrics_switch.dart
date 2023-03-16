import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';
import 'package:widget_toolkit/widget_toolkit.dart';

import '../blocs/biometrics_bloc.dart';
import '../data_sources/biometrics_auth_data_source.dart';
import '../data_sources/biometrics_local_data_source.dart';
import '../models/biometrics_setting_message_types.dart';
import '../repositories/biometrics_repository.dart';
import '../resources/constants.dart';
import '../services/biometrics_service.dart';

/// Builds Material Design switch to enable or disable biometrics for a specific
/// need as per application. Might be overwritten using [builder] function.
/// Displays customizable notification on success switching.
class BiometricsSwitch extends StatelessWidget {
  const BiometricsSwitch({
    required this.biometricsLocalDataSource,
    this.enabledMessage,
    this.onStateChanged,
    this.showDefaultNotification = true,
    this.builder,
    this.mapMessageToString,
    this.onError,
    super.key,
  }) : _addDependencies = true;

  const BiometricsSwitch.withoutDependencies({
    required this.biometricsLocalDataSource,
    this.enabledMessage,
    this.onStateChanged,
    this.showDefaultNotification = true,
    this.builder,
    this.mapMessageToString,
    this.onError,
    super.key,
  }) : _addDependencies = false;

  final bool _addDependencies;

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

  final BiometricsLocalDataSource biometricsLocalDataSource;

  @override
  Widget build(BuildContext context) => _wrapWithDependencies(
        child: Nested(
          children: [
            _buildShowBottomMessageListener(),
            _buildErrorListener(),
          ],
          child: RxBlocBuilder<BiometricsBlocType, bool>(
            state: (bloc) => bloc.states.areBiometricsEnabled,
            builder: (context, enabled, bloc) {
              final areEnabled = enabled.hasData && (enabled.data ?? false);
              return builder?.call(
                    areEnabled,
                    (enable) =>
                        bloc.events.setBiometrics(enable, _getMessage(enable)),
                  ) ??
                  Switch(
                    value: areEnabled,
                    onChanged: (val) {
                      bloc.events.setBiometrics(val, _getMessage(val));
                    },
                  );
            },
          ),
        ),
      );

  String _getMessage(bool isEnabled) =>
      isEnabled ? (enabledMessage ?? activateBiometrics) : deactivateBiometrics;

  RxBlocListener _buildErrorListener() =>
      RxBlocListener<BiometricsBlocType, ErrorModel>(
        state: (bloc) => bloc.states.errors,
        listener: (context, state) => onError?.call(state),
      );

  RxBlocListener _buildShowBottomMessageListener() =>
      RxBlocListener<BiometricsBlocType, BiometricsSettingMessageType?>(
        state: (bloc) => bloc.states.biometricsDialog,
        listener: (context, state) {
          if (state != null) {
            if (showDefaultNotification) {
              showBiometricsMessageBottomSheet(context, state);
            } else {
              onStateChanged?.call(state);
            }
          }
        },
      );

  /*todo(Toncho): to customize this you can pass in a [onStateChanged] callback,
      look at [_showBottomMessage] to understand*/
  Future<void> showBiometricsMessageBottomSheet(
    BuildContext context,
    BiometricsSettingMessageType messageType,
  ) =>
      showBlurredBottomSheet(
        context: context,
        configuration: const ModalConfiguration(safeAreaBottom: false),
        builder: (context) => Padding(
          padding: EdgeInsets.only(
            left: 16,
            top: 16,
            right: 16,
            bottom: 16 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: MessagePanelWidget(
            message: mapMessageToString?.call(messageType) ??
                messageType.translate(),
            messageState: messageType.state(),
          ),
        ),
      );

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
            auth: context.read<LocalAuthentication>(),
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
