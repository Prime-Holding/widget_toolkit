import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';
import 'package:widget_toolkit/models.dart';
import 'package:widget_toolkit_pin/src/lib_pin_code_with_biometrics/models/biometrics_authentication_type.dart';
import 'package:widget_toolkit_pin/widget_toolkit_pin.dart';

import '../lib_pin_code/blocs/pin_code_test.mocks.dart';
import 'pin_code_mock.mocks.dart';
import 'stubs.dart';

@GenerateMocks([
  PinCodeBlocStates,
  PinCodeBlocEvents,
  PinCodeBlocType,
])
PinCodeBlocType pinCodeMockFactory({
  required MockPinCodeService service,
  bool? isLoading,
  BiometricsMessage? biometricsMessage,
  bool? isPinCodeInSecureStorage = true,
  bool? isAuthenticatedWithBiometrics,
  bool? isPinCodeVerified,
  bool? areBiometricsEnabled,
  List<BiometricsAuthType>? availableBiometrics,
  ErrorModel? error,
  int? pinLength = 6,
}) {
  final blocMock = MockPinCodeBlocType();
  final eventsMock = MockPinCodeBlocEvents();
  final statesMock = MockPinCodeBlocStates();

  when(blocMock.events).thenReturn(eventsMock);
  when(blocMock.states).thenReturn(statesMock);

  when(statesMock.showBiometricsButton).thenAnswer(
    (_) => isPinCodeVerified ?? false
        ? Stream.value(true).publish()
        : Stream.value(false).publish(),
  );

  when(statesMock.isLoading).thenAnswer(
    (_) => isLoading != null ? Stream.value(isLoading) : const Stream.empty(),
  );

  when(statesMock.authenticated).thenAnswer(
    (_) => isAuthenticatedWithBiometrics != null
        ? Stream.value(isAuthenticatedWithBiometrics).publish()
        : const Stream<bool>.empty().publish(),
  );

  when(statesMock.errors).thenAnswer(
    (_) =>
        error != null ? Stream.value(error) : const Stream<ErrorModel>.empty(),
  );

  when(statesMock.digitsCount).thenAnswer(
    (_) {
      if (pinLength != null) {
        return Stream<int>.value(pinLength).publish();
      }
      return const Stream<int>.empty().publish();
    },
  );

  when(service.verifyPinCode(Stubs.pinCode3)).thenAnswer((_) async => true);

  when(service.isPinCodeInSecureStorage()).thenAnswer((_) async =>
      (isPinCodeInSecureStorage != null && isPinCodeInSecureStorage)
          ? true
          : false);

  when(service.encryptPinCode(Stubs.pinCode3))
      .thenAnswer((_) async => Stubs.pinCode3);

  when(service.getPinLength()).thenAnswer((_) async => pinLength!);

  when(service.getPinCode()).thenAnswer((_) async => Stubs.pinCode3);

  return blocMock;
}
