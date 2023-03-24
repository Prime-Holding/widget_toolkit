import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';
import 'package:widget_toolkit/language_picker.dart';
import 'package:widget_toolkit_qr/widget_toolkit_qr.dart';

import 'qr_scanner_mock.mocks.dart';

@GenerateMocks([
  QrScannerBlocStates,
  QrScannerBlocEvents,
  QrScannerBlocType,
])
QrScannerBlocType qrScannerMockFactory({
  required ErrorModel errors,
  bool? isLoading,
  String? scannedValue,
  bool? hasCameraPermission,
}) {
  final blocMock = MockQrScannerBlocType();
  final eventsMock = MockQrScannerBlocEvents();
  final statesMock = MockQrScannerBlocStates();

  when(blocMock.events).thenReturn(eventsMock);
  when(blocMock.states).thenReturn(statesMock);

  when(statesMock.isLoading).thenAnswer(
    (_) => isLoading != null ? Stream.value(isLoading) : const Stream.empty(),
  );

  when(statesMock.scannedValue).thenAnswer(
    (_) => scannedValue != null
        ? Stream.value(scannedValue).publish()
        : const Stream<String?>.empty().publish(),
  );

  when(statesMock.errors).thenAnswer(
    (_) => Stream.value(errors),
  );

  when(statesMock.hasCameraPermission).thenAnswer(
    (_) => hasCameraPermission != null
        ? Stream.value(hasCameraPermission).publish()
        : const Stream<bool>.empty().publish(),
  );

  return blocMock;
}
