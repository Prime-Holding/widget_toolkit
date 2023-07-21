import 'package:widget_toolkit/models.dart';

class QrErrorModelMock implements ErrorModel {
  QrErrorModelMock({this.customMessage});

  final String? customMessage;

  @override
  String toString() {
    return customMessage ?? 'QrErrorModel Exception';
  }
}
