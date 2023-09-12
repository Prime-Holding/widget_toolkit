import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';
import 'package:widget_toolkit/language_picker.dart';
import 'package:widget_toolkit_biometrics/widget_toolkit_biometrics.dart';
import 'package:widget_toolkit_pin/src/lib_pin_code_with_biometrics/models/error_enable_biometrics.dart';
import 'package:widget_toolkit_pin/src/lib_pin_code_with_biometrics/ui_components/pin_code_component.dart';
import 'package:widget_toolkit_pin/widget_toolkit_pin.dart';

import '../../helpers/golden_helper.dart';
import '../../helpers/models/scenario.dart';
import '../../mocks/biometrics_local_data_source_mock.dart';
import '../../mocks/pin_code_mock.dart';
import '../blocs/pin_code_test.mocks.dart';

void main() {
  final MockPinCodeService service = MockPinCodeService();
  final MockPinBiometricsService biometricsService = MockPinBiometricsService();
  runGoldenTests(
    [
      generateDeviceBuilder(
        widget: pinCodeComponentPageFactory(
          isLoading: true,
          service: service,
          biometricsService: biometricsService,
          localizedReason: 'Activate the biometrics of your device',
          digitsCount: 6,
          showBiometricsButton: true,
        ),
        scenario: Scenario(name: 'pin_code_loading'),
      ),
      generateDeviceBuilder(
        widget: pinCodeComponentPageFactory(
          service: service,
          biometricsService: biometricsService,
          localizedReason: 'Activate the biometrics of your device',
          digitsCount: 6,
          showBiometricsButton: true,
          authenticated: true,
        ),
        scenario: Scenario(name: 'pin_code_success'),
      ),
      generateDeviceBuilder(
        widget: pinCodeComponentPageFactory(
          service: service,
          biometricsService: biometricsService,
          localizedReason: '',
          digitsCount: 4,
        ),
        scenario: Scenario(name: 'pin_code_delete_digit'),
      ),
      generateDeviceBuilder(
        widget: pinCodeComponentPageFactory(
          error: ErrorEnableBiometrics(BiometricsMessage.notSetup),
          service: service,
          biometricsService: biometricsService,
          localizedReason: '',
          digitsCount: 4,
          authenticated: false,
        ),
        scenario: Scenario(name: 'pin_code_error'),
      ),
    ],
    awaitPump: true,
  );
}

Widget pinCodeComponentPageFactory({
  required MockPinCodeService service,
  required MockPinBiometricsService biometricsService,
  required String localizedReason,
  required int digitsCount,
  bool isLoading = false,
  bool? showBiometricsButton,
  bool? authenticated,
  ErrorModel? error,
}) =>
    Scaffold(
      backgroundColor: Colors.blue,
      body: MultiProvider(
        providers: [
          RxBlocProvider<PinCodeBlocType>.value(
            value: pinCodeMockFactory(
              isLoading: isLoading,
              showBiometricsButton: showBiometricsButton,
              authenticated: authenticated,
              digitsCount: digitsCount,
              error: error,
              service: service,
              biometricsService: biometricsService,
              localizedReason: localizedReason,
            ),
          ),
        ],
        child: Builder(
          builder: (context) => PinCodeComponent(
            translateError: (error) => error.toString(),
            localizedReason: localizedReason,
            biometricsLocalDataSource: context.read(),
            error: error,
          ),
        ),
      ),
    );

Widget pinCodeKeyboardPageFactory({
  required MockPinCodeService service,
  required MockPinBiometricsService biometricsService,
  required String localizedReason,
  required int pinLength,
  required int digitsCount,
  bool isLoading = false,
  bool? showBiometricsButton,
  bool? authenticated,
  ErrorModel? error,
}) =>
    Scaffold(
      body: MultiProvider(
        providers: [
          Provider<BiometricsLocalDataSource>(
            create: (context) => BiometricsLocalDataSourceMock(),
          ),
          RxBlocProvider<PinCodeBlocType>.value(
            value: pinCodeMockFactory(
              isLoading: isLoading,
              showBiometricsButton: showBiometricsButton,
              authenticated: authenticated,
              digitsCount: digitsCount,
              error: error,
              service: service,
              biometricsService: biometricsService,
              localizedReason: localizedReason,
            ),
          )
        ],
        child: Builder(
          builder: (context) => PinCodeKeyboard(
            translateError: (error) => error.toString(),
            localizedReason: localizedReason,
            pinCodeService: service,
            biometricsLocalDataSource:
                context.read<BiometricsLocalDataSource>(),
          ),
        ),
      ),
    );
