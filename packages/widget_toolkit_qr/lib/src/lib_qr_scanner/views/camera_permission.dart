import 'package:flutter/material.dart';
import 'package:widget_toolkit/widget_toolkit.dart';

import '../../base/theme/qr_scanner_theme.dart';
import 'qr_scanner_component.dart';

/// [showAppCameraPermissionBottomSheet] A function, which shows on the screen
/// a bottom modal sheet with text message, which  you should provide and it
/// should say to the user, that he/she should enable the access of the
/// application to the device's camera.
///
/// [cameraPermissionBottomSheetConfiguration] configuration for the bottom
/// modal sheet.
///
/// [onPermissionTab] A callback, which receives the event, which requests
/// access to the camera.
///
/// [cameraPermissionButtonText] the text value of the button, which when pressed
/// navigates to the device's enable camera permission setting.
///
/// [cameraAccessTitleText] the text value, which is used in the
/// [_CameraPermissionWidget], the default value is 'Camera access'.
///
/// [cameraAccessLabelText] A label text for the bottom error modal sheet.
void showAppCameraPermissionBottomSheet(
  BuildContext context, {
  required QrScannerConfiguration cameraPermissionBottomSheetConfiguration,
  VoidCallback? onPermissionTab,
  String? cameraPermissionButtonText,
  String? cameraAccessTitleText,
  String? cameraAccessLabelText,
}) =>
    showBlurredBottomSheet(
      configuration: ModalConfiguration(
        fullScreen: cameraPermissionBottomSheetConfiguration.fullScreen,
        showCloseButton:
            cameraPermissionBottomSheetConfiguration.showCloseButton,
        showHeaderPill: cameraPermissionBottomSheetConfiguration.showHeaderPill,
        safeAreaBottom: cameraPermissionBottomSheetConfiguration.safeAreaBottom,
        isDismissible: cameraPermissionBottomSheetConfiguration.isDismissible,
      ),
      context: context,
      builder: (ctx) => _CameraPermissionWidget(
        onPermissionTab: onPermissionTab,
        cameraPermissionButtonText: cameraPermissionButtonText,
        cameraAccessTitleText: cameraAccessTitleText,
        cameraAccessLabelText: cameraAccessLabelText,
      ),
    );

class _CameraPermissionWidget extends StatelessWidget {
  const _CameraPermissionWidget({
    this.onPermissionTab,
    this.cameraPermissionButtonText,
    this.cameraAccessTitleText,
    this.cameraAccessLabelText,
  });

  final VoidCallback? onPermissionTab;
  final String? cameraPermissionButtonText;
  final String? cameraAccessTitleText;
  final String? cameraAccessLabelText;

  static const String defaultButtonText = 'Grant access';
  static const String defaultCameraAccessTitleText = 'Camera access';
  static const String defaultCameraAccessLabelText =
      'You must provide access to the camera to continue.';

  @override
  Widget build(BuildContext context) => Padding(
        padding: context.qrScannerTheme.cameraPermission1,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: context.qrScannerTheme.cameraPermission2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      context.widgetToolkitTheme.spacingXS1,
                    ),
                    border: Border.all(
                      color: context.qrScannerTheme
                          .qrScannerCameraPermissionBlueLightColor,
                    ),
                  ),
                  child: Padding(
                    padding: context.qrScannerTheme.cameraPermission3,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: context.qrScannerTheme.cameraPermission4,
                          child: context.qrScannerTheme.cameraIcon,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    context.qrScannerTheme.cameraPermission5,
                                child: Text(
                                  cameraAccessTitleText ??
                                      defaultCameraAccessTitleText,
                                  style: context.qrScannerTheme.captionBold
                                      .copyWith(
                                    color: context.qrScannerTheme.qrScannerBlue,
                                  ),
                                ),
                              ),
                              Text(
                                cameraAccessLabelText ??
                                    defaultCameraAccessLabelText,
                                style: context.qrScannerTheme.descriptionThin,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GradientFillButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  if (onPermissionTab != null) {
                    onPermissionTab!();
                  }
                },
                text: cameraPermissionButtonText ?? defaultButtonText,
              ),
            ],
          ),
        ),
      );
}
