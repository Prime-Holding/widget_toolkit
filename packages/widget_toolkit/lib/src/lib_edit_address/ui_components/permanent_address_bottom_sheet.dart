import 'package:flutter/material.dart';

import '../../../edit_address.dart';
import '../../base/extensions/data_type_extensions.dart';
import '../../lib_ui_components/show_blurred_bottom_sheet.dart';

void showPermanentAddressBottomSheet(
  BuildContext context, {
  required String headerText,
  EditAddressConfiguration configuration = const EditAddressConfiguration(),
  required String permanentAddressContentMessage,
}) =>
    showBlurredBottomSheet(
      context: context,
      configuration: configuration,
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
  });

  final String headerText;
  final String permanentAddressContentMessage;

  @override
  Widget build(BuildContext context) => Padding(
        padding: context.editAddressTheme.permanentAddressBottomSheetPadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                headerText,
                style: context.editAddressTheme.titleBold,
              ),
              Padding(
                padding: context.editAddressTheme
                    .permanentAddressBottomSheetDecorationPadding,
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
                    padding: context.editAddressTheme
                        .permanentAddressBottomSheetContentPadding,
                    child: Column(
                      children: [
                        Padding(
                          padding: context
                              .editAddressTheme.permanentAddressIconPadding,
                          child:
                              context.editAddressTheme.infoCircleIcon.copyWith(
                            color: context.editAddressTheme.iconColorPrimary,
                            width: context.editAddressTheme.spacingXXXL,
                            height: context.editAddressTheme.spacingXXXL,
                          ),
                        ),
                        Text(
                          permanentAddressContentMessage,
                          style: context.editAddressTheme.captionBold.copyWith(
                            color: context.editAddressTheme.iconColorPrimary,
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
