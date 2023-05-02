import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';
import 'package:widget_toolkit_biometrics/widget_toolkit_biometrics.dart';
import 'package:widget_toolkit_pin/src/lib_pin_code_with_biometrics/models/biometrics_authentication_type.dart';
import 'package:widget_toolkit_pin/src/lib_pin_code_with_biometrics/ui_components/pin_code_component.dart';
import 'package:widget_toolkit_pin/widget_toolkit_pin.dart';

import '../../helpers/golden_helper.dart';
import '../../helpers/models/scenario.dart';
import '../../mocks/biometrics_local_data_source_mock.dart';
import '../../mocks/pin_code_mock.dart';
import '../../mocks/pin_code_service_mock.dart';

void main() {
  runGoldenTests(
    [
      generateDeviceBuilder(
        widget: pinCodeComponentPageFactory(
          isLoading: true,
        ),
        scenario: Scenario(name: 'pin_code_loading'),
      ),
      generateDeviceBuilder(
        widget: pinCodeComponentPageFactory(),
        scenario: Scenario(name: 'pin_code_success'),
      ),
      generateDeviceBuilder(
        widget: pinCodeComponentPageFactory(
          isPinCodeInSecureStorage: true,
          isPinCodeVerified: true,
          areBiometricsEnabled: true,
          biometricsMessage: BiometricsMessage.enabled,
          availableBiometrics: [BiometricsAuthType.face],
        ),
        scenario: Scenario(name: 'pin_code_biometrics_enabled'),
      ),
      generateDeviceBuilder(
        widget: pinCodeKeyboardPageFactory(pinLength: 6),
        scenario: Scenario(name: 'pin_code_biometrics'),
      )
    ],
    awaitPump: true,
  );
}

Widget pinCodeComponentPageFactory({
  bool isLoading = false,
  BiometricsMessage? biometricsMessage,
  bool? isPinCodeInSecureStorage,
  bool? isAuthenticatedWithBiometrics,
  bool? isPinCodeVerified,
  bool? areBiometricsEnabled,
  List<BiometricsAuthType>? availableBiometrics,
  int pinLength = 6,
}) =>
    Scaffold(
      backgroundColor: Colors.blue,
      body: MultiProvider(
        providers: [
          RxBlocProvider<PinCodeBlocType>.value(
            value: pinCodeMockFactory(
              isLoading: isLoading,
              biometricsMessage: biometricsMessage,
              isPinCodeInSecureStorage: isPinCodeInSecureStorage,
              isAuthenticatedWithBiometrics: isAuthenticatedWithBiometrics,
              isPinCodeVerified: isPinCodeVerified,
              areBiometricsEnabled: areBiometricsEnabled,
              availableBiometrics: availableBiometrics,
              pinLength: pinLength,
            ),
          ),
        ],
        child: Builder(
          builder: (context) => PinCodeComponent(
            translateError: (error) => error.toString(),
            pinLength: pinLength,
            localizedReason: '',
          ),
        ),
      ),
    );

Widget pinCodeKeyboardPageFactory({
  bool isLoading = false,
  BiometricsMessage? biometricsMessage,
  bool? isPinCodeInSecureStorage,
  bool? isAuthenticatedWithBiometrics,
  bool? isPinCodeVerified,
  bool? areBiometricsEnabled,
  List<BiometricsAuthType>? availableBiometrics,
  int pinLength = 6,
}) =>
    Scaffold(
      backgroundColor: Colors.transparent,
      body: MultiProvider(
        providers: [
          Provider<PinCodeService>(
            create: (context) => PinCodeServiceMock(pinCode: '123456'),
          ),
          Provider<BiometricsLocalDataSource>(
            create: (context) => BiometricsLocalDataSourceMock(),
          ),
          RxBlocProvider<PinCodeBlocType>.value(
            value: pinCodeMockFactory(
              isLoading: isLoading,
              biometricsMessage: biometricsMessage,
              isPinCodeInSecureStorage: isPinCodeInSecureStorage,
              isAuthenticatedWithBiometrics: isAuthenticatedWithBiometrics,
              isPinCodeVerified: isPinCodeVerified,
              areBiometricsEnabled: areBiometricsEnabled,
              availableBiometrics: availableBiometrics,
              pinLength: pinLength,
            ),
          ),
        ],
        child: Builder(
          builder: (context) => PinCodeKeyboard(
            translateError: (error) => error.toString(),
            localizedReason: '',
            pinCodeService: context.read<PinCodeService>(),
            biometricsLocalDataSource:
                context.read<BiometricsLocalDataSource>(),
          ),
        ),
      ),
    );
