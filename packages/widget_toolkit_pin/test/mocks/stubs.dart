import 'package:widget_toolkit/widget_toolkit.dart';
import 'package:widget_toolkit_pin/src/lib_pin_code_with_biometrics/models/biometrics_authentication_type.dart';
export 'package:widget_toolkit_biometrics/src/models/biometrics_setting_message_type.dart';

class Stubs {
  static const someBiometrics = <BiometricsAuthType>[
    BiometricsAuthType.iris,
    BiometricsAuthType.fingerprint
  ];
  static const noBiometrics = <BiometricsAuthType>[];
  static const authMessage =
      'The app whats to integrate with the biometrics of your device';
  static const pinCode2 = '123567';
  static const pinCode3 = '123456';
  static const pinCode = '000000';
  static final error = ErrorAccessDeniedModel();
}
