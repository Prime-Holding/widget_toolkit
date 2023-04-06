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
  final infoCircle = SvgPicture.asset(
    AssetNames.infoCircle,
    semanticsLabel: 'infoCircle',
  );
  final pinCheckEnabled = SvgPicture.asset(
    AssetNames.pinCheckEnabled,
    semanticsLabel: 'pinCheckEnabled',
  );
  final pinCheckDisabled = SvgPicture.asset(
    AssetNames.pinCheckDisabled,
    semanticsLabel: 'pinCheckDisabled',
  );
  final pinNextEnabled = SvgPicture.asset(
    AssetNames.pinNextEnabled,
    semanticsLabel: 'pinNextEnabled',
  );
  final pinNextDisabled = SvgPicture.asset(
    AssetNames.pinNextDisabled,
    semanticsLabel: 'pinNextDisabled',
  );
}
