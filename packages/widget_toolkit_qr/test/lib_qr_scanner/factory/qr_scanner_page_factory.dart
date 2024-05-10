import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';
import 'package:widget_toolkit_qr/src/lib_qr_scanner/views/qr_scanner_component.dart';
import 'package:widget_toolkit_qr/widget_toolkit_qr.dart';

import '../../mocks/qr_scanner_mock.dart';

/// Change the parameters according the needs of the test
Widget qrScannerPageFactory({
  required bool isLoading,
  required bool hasCameraPermission,
  String? scannedValue,
  Exception? errors,
}) =>
    MultiProvider(
      providers: [
        RxBlocProvider<QrScannerBlocType<String>>.value(
          value: qrScannerMockFactory(
            isLoading: isLoading,
            errors: errors,
            hasCameraPermission: hasCameraPermission,
            scannedValue: scannedValue,
          ),
        ),
      ],
      child: Builder(
        builder: (context) => Scaffold(
          backgroundColor:
              context.qrScannerTheme.qrScannerPageScaffoldBackgroundColor,
          body: SafeArea(
            child: Center(
              child: Container(
                color: context.qrScannerTheme.qrScannerPageBackgroundColor,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                  child: SizedBox(
                    height: 600,
                    width: 600,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Padding(
                              padding: context
                                  .qrScannerTheme.qrScannerComponentPadding,
                              child: const QrScannerComponent<String>(),
                            ),
                          ),
                          _buildErrorModalSheetListener(context),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

Widget _buildErrorModalSheetListener(BuildContext context) =>
    RxBlocListener<QrScannerBlocType<String>, Exception?>(
      state: (bloc) => bloc.states.errors,
      listener: (ctx, error) => showQrScannerErrorBottomModalSheet(
        context: context,
        headerWidget: const Text('QR Error bottom sheet'),
        error: error.toString(),
        retryButtonText: 'Retry',
      ),
    );
