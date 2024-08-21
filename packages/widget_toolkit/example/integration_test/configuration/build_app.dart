import 'package:example/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

export 'package:flutter/foundation.dart';
export 'package:flutter_test/flutter_test.dart';
export 'package:patrol/patrol.dart';

class BuildApp {
  late PatrolIntegrationTester $;

  BuildApp(this.$);

  Future<void> buildApp() async {
    final FlutterExceptionHandler? originalOnError = FlutterError.onError;

    main();

    await $.pumpAndSettle();
    FlutterError.onError = originalOnError;
  }
}
