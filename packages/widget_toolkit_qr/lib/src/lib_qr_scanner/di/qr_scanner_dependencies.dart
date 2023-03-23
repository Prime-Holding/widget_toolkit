import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/single_child_widget.dart';

import '../blocs/qr_scanner_bloc.dart';
import '../services/qr_code_service.dart';
import '../services/system_permissions_service.dart';

class QrScannerDependencies {
  QrScannerDependencies._(
    this._qrCodeService,
    this._systemPermissionsService,
  );

  factory QrScannerDependencies.from(
    QrCodeService qrCodeService,
    SystemPermissionsService systemPermissionsService,
  ) =>
      QrScannerDependencies._(qrCodeService, systemPermissionsService);

  final QrCodeService _qrCodeService;
  final SystemPermissionsService _systemPermissionsService;

  late List<SingleChildWidget> providers = [
    ..._blocs,
  ];

  late final List<RxBlocProvider> _blocs = [
    RxBlocProvider<QrScannerBlocType>(
      create: (context) => QrScannerBloc(
        _qrCodeService,
        _systemPermissionsService,
      ),
    ),
  ];
}
