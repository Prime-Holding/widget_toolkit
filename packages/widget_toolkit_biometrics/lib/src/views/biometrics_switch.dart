import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:widget_toolkit/widget_toolkit.dart';

import '../blocs/biometrics_bloc.dart';
import '../data_sources/biometrics_auth_data_source.dart';
import '../data_sources/biometrics_auth_data_source_impl.dart';
import '../data_sources/biometrics_local_data_source.dart';
import '../models/biometrics_setting_message_type.dart';
import '../repositories/biometrics_repository.dart';
import '../repositories/biometrics_repository_impl.dart';
import '../resources/constants.dart';
import '../services/biometrics_service.dart';

/// Presents biometric opt-in as a stock [Switch] or a custom control from
/// [builder], with [BiometricsService] and [BiometricsBloc] driving enrollment.
/// When [onStateChanged] is null, confirmations use [showBlurredBottomSheet],
/// [MessagePanelWidget], and [SmallButton] from widget_toolkit, and the sheet
/// layout reads padding from [WidgetToolkitTheme.bottomSheetPaddingAlternative]
/// and [WidgetToolkitTheme.bottomSheetCloseButtonPadding], while outline buttons
/// blend [WidgetToolkitTheme.disabledFilledButtonBackgroundColor] into
/// [WidgetToolkitTheme.primaryGradientEnd] through [ButtonColorStyle.fromContext].
class BiometricsSwitch extends StatelessWidget {
  /// Installs [LocalAuthentication], data-source providers, [BiometricsRepositoryImpl],
  /// [BiometricsService], and [BiometricsBloc] around this subtree so the widget
  /// works without upstream dependency injection.
  const BiometricsSwitch({
    required this.biometricsLocalDataSource,
    this.localizedReason,
    this.mapMessageToString,
    this.onStateChanged,
    this.builder,
    this.onError,
    super.key,
  }) : _addDependencies = true;

  /// Skips creating providers so hosts can register [LocalAuthentication],
  /// [BiometricsAuthDataSource], [BiometricsRepository], [BiometricsService],
  /// and [BiometricsBloc] once near the app root or route, which mirrors the
  /// list built by the default constructor but keeps graph ownership explicit.
  const BiometricsSwitch.withoutDependencies({
    required this.biometricsLocalDataSource,
    this.localizedReason,
    this.mapMessageToString,
    this.onStateChanged,
    this.builder,
    this.onError,
    super.key,
  }) : _addDependencies = false;

  /// Interface the host implements so approvals persist; the default constructor
  /// wires the same instance into [BiometricsRepositoryImpl], and the bloc stream
  /// of areBiometricsEnabled seeds the switch value during build.
  final BiometricsLocalDataSource biometricsLocalDataSource;

  /// Shown in the system biometric prompt while enabling; when null, the
  /// activateBiometrics constant from `constants.dart` feeds
  /// [BiometricsService.enableBiometrics] instead.
  final String? localizedReason;

  /// Runs after a non-null [BiometricsMessage] from the bloc when you would
  /// rather own toasts or navigation than the default bottom sheet; receives
  /// [BiometricsMessage] plus the localized string resolved through
  /// [mapMessageToString] when you supply that mapper, otherwise through
  /// [ReadableMessage.translate].
  final void Function(
    BuildContext context,
    BiometricsMessage message,
    String localizedMessage,
  )? onStateChanged;

  /// Replaces the default [Switch] while reusing the bloc; call the provided
  /// setter with the desired value so the bloc receives the same localized
  /// reason path as the stock control.
  final Widget Function(
    BuildContext context,
    bool isEnabled,
    void Function(bool newValue) setBiometrics,
  )? builder;

  /// Turns each [BiometricsMessage] into host copy for notifications,
  /// including the strings passed to [onStateChanged] and the default sheet.
  final String Function(BiometricsMessage message)? mapMessageToString;

  /// Invoked from the bloc error listener when the bloc publishes an [ErrorModel],
  /// which lets hosts surface permission or platform errors beside biometric
  /// outcomes.
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
          padding: context.widgetToolkitTheme.bottomSheetPaddingAlternative,
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
                          AppSettings.openAppSettings(
                            type: AppSettingsType.security,
                          );
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
          create: (context) => BiometricsAuthDataSourceImpl(
            localAuthentication: context.read<LocalAuthentication>(),
          ),
        ),
        Provider<BiometricsRepository>(
          create: (context) => BiometricsRepositoryImpl(
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
