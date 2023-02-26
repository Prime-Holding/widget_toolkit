import 'package:flutter/material.dart';

import '../../../common_ui_components.dart';
import '../../../edit_address.dart';
import '../../base/extensions/data_type_extensions.dart';

void showAppPermanentAddressBottomSheet(
  BuildContext context, {
  required String headerText,
  required EditAddressConfiguration configuration,
  required String permanentAddressContentMessage,
}) =>
    showModal(
      context: context,
      configuration: ModalConfiguration(
        fullScreen: configuration.fullScreen,
        heightFactor: configuration.heightFactor,
        isDismissible: configuration.isDismissible,
        safeAreaBottom: false,
      ),
      onCancelPressed: () => Navigator.of(context).pop(),
      builder: (ctx) => _PermanentAddressBottomSheetWidget(
        headerText: headerText,
        permanentAddressContentMessage: permanentAddressContentMessage,
      ),
    );

class _PermanentAddressBottomSheetWidget extends StatelessWidget {
  const _PermanentAddressBottomSheetWidget({
    required this.headerText,
    required this.permanentAddressContentMessage,
    Key? key,
  }) : super(key: key);

  final String headerText;
  final String permanentAddressContentMessage;

  @override
  Widget build(BuildContext context) => Padding(
        padding: context.editAddressTheme.permanentAddressPadding1,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                headerText,
                style: context.editAddressTheme.titleBold,
              ),
              Padding(
                padding: context.editAddressTheme.permanentAddressPadding2,
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        context.editAddressTheme.permanentAddressBlueLightColor,
                    borderRadius: BorderRadius.circular(
                      context.editAddressTheme.spacingM,
                    ),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: context.editAddressTheme.permanentAddressPadding3,
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              context.editAddressTheme.permanentAddressPadding4,
                          child:
                              context.editAddressTheme.infoCircleIcon.copyWith(
                            color: context.editAddressTheme.blue,
                            width: context.editAddressTheme.spacingXXXL,
                            height: context.editAddressTheme.spacingXXXL,
                          ),
                        ),
                        Text(
                          permanentAddressContentMessage,
                          style: context.editAddressTheme.captionBold.copyWith(
                            color: context.editAddressTheme.blue,
                            height: 2.2,
                            letterSpacing: 1.1,
                          ),
                          textHeightBehavior: const TextHeightBehavior(
                            leadingDistribution: TextLeadingDistribution.even,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
