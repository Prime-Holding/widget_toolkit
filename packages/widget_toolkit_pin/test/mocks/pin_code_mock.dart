import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';
import 'package:widget_toolkit/models.dart';
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
  required MockPinBiometricsService biometricsService,
  required String localizedReason,
  required int digitsCount,
  bool? showBiometricsButton,
  bool? isLoading,
  bool? authenticated,
  ErrorModel? error,
}) {
  final blocMock = MockPinCodeBlocType();
  final eventsMock = MockPinCodeBlocEvents();
  final statesMock = MockPinCodeBlocStates();

  when(blocMock.events).thenReturn(eventsMock);
  when(blocMock.states).thenReturn(statesMock);

  when(statesMock.showBiometricsButton).thenAnswer(
    (_) {
      service.verifyPinCode(Stubs.pinCode3);
      service.isPinCodeInSecureStorage();
      return showBiometricsButton != null
          ? Stream.value(showBiometricsButton).publishReplay(maxSize: 1)
          : Stream.value(false).publishReplay(maxSize: 1)
        ..connect();
    },
  );

  when(statesMock.isLoading).thenAnswer(
      (_) => isLoading != null ? Stream.value(isLoading) : Stream.value(false));

  when(statesMock.authenticated).thenAnswer(
    (_) => Stream<void>.value(null).publish()..connect(),
  );

  when(statesMock.errors).thenAnswer(
    (_) =>
        error != null ? Stream.value(error) : const Stream<ErrorModel>.empty(),
  );

  when(service.getPinLength()).thenAnswer((_) async => Stubs.pinCode3.length);

  when(statesMock.digitsCount).thenAnswer(
    (_) => Stream.value(digitsCount).startWith(0).publishReplay(maxSize: 1)
      ..connect(),
  );

  when(service.verifyPinCode(Stubs.pinCode3)).thenAnswer((_) async => true);

  when(service.isPinCodeInSecureStorage()).thenAnswer((_) async => true);

  when(service.encryptPinCode(Stubs.pinCode3))
      .thenAnswer((_) async => Stubs.pinCode3);

  return blocMock;
}
