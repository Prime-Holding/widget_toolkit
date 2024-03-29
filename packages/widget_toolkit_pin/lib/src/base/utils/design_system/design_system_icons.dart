import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/asset_names.dart';

@immutable
class DesignSystemIcons {
  DesignSystemIcons();

  final pinDeleteAction = SvgPicture.asset(
    AssetNames.pinDeleteAction,
    semanticsLabel: 'pinDeleteAction',
  );

  final pinDeleteDefault = SvgPicture.asset(
    AssetNames.pinDeleteDefault,
    semanticsLabel: 'pinDeleteDefault',
  );

  final faceScanDefault = SvgPicture.asset(
    AssetNames.faceScanDefault,
    semanticsLabel: 'faceScanDefault',
  );

  final faceScanInverted = SvgPicture.asset(
    AssetNames.faceScanInverted,
    semanticsLabel: 'faceScanInverted',
  );

  final faceScanPressed = SvgPicture.asset(
    AssetNames.faceScanPressed,
    semanticsLabel: 'faceScanPressed',
  );

  final fingerScanDefault = SvgPicture.asset(
    AssetNames.fingerScanDefault,
    semanticsLabel: 'fingerScanDefault',
  );

  final fingerScanInverted = SvgPicture.asset(
    AssetNames.fingerScanInverted,
    semanticsLabel: 'fingerScanInverted',
  );

  final fingerScanPressed = SvgPicture.asset(
    AssetNames.fingerScanPressed,
    semanticsLabel: 'fingerScanPressed',
  );
}
