import 'package:widget_toolkit/widget_toolkit.dart';

class QrErrorModelMock implements ErrorModel {
  QrErrorModelMock({this.customMessage});

  final String? customMessage;

  @override
  String toString() {
    return customMessage ?? 'QrErrorModel Exception';
  }
}
