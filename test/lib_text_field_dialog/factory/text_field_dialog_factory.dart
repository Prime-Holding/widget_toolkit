import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:flutter_rx_bloc/rx_form.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:widget_toolkit/src/lib_text_field_dialog/blocs/text_field_dialog_bloc.dart';
import 'package:widget_toolkit/src/lib_text_field_dialog/views/text_field_dialog_page.dart';

import '../mock/text_field_dialog_mock.dart';
import '../services/text_field_service_mock.dart';

class FakeAssetBundle extends Fake implements AssetBundle {
  final String svgStr = '''<svg viewBox="0 0 10 10"></svg>''';

  @override
  Future<String> loadString(String key, {bool cache = true}) async => svgStr;
}

/// Change the parameters according the the needs of the test
/// todo add values if needed in the function
Widget textFieldDialogFactory({
  required Result<String> submittedResult,
}) =>
    DefaultAssetBundle(
      bundle: FakeAssetBundle(),
      child: Scaffold(
        body: MultiProvider(
          providers: [
            Provider<TextFieldDialogServiceMock>(
              create: (context) => TextFieldDialogServiceMock(),
            ),
            RxBlocProvider<TextFieldDialogBlocType>.value(
              value:
                  textFieldDialogMockFactory(submittedResult: submittedResult),
            ),
          ],
          child: TextFieldDialogPage<String>(
            callback: (value) {
              return '';
            },
            label: 'Label',
            fillButtonText: 'Save',
            errorMapper: (Object error, BuildContext context) {
              return const RxFieldException(
                  error: 'Error', fieldValue: 'exception');
            },
          ),
        ),
      ),
    );
