import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../asset_classes.dart';
import '../theme/text_field_dialog_theme.dart';

enum LabeledBoxType {
  optional,
  filled,
}

class LabeledBoxWidget extends StatelessWidget {
  const LabeledBoxWidget({
    required this.label,
    required this.onTap,
    required this.optionalString,
    this.labelColor,
    this.leadingIcon,
    this.type = LabeledBoxType.filled,
    Key? key,
  })  : assert(leadingIcon == null ||
            leadingIcon is IconData ||
            leadingIcon is SvgPicture ||
            leadingIcon is SvgFile),
        super(key: key);

  final String label;
  final Function() onTap;
  final Color? labelColor;
  final dynamic leadingIcon;
  final LabeledBoxType type;
  final String optionalString;

  LabeledBoxWidget withDependencies(BuildContext context,
          {required String label,
          required Function() onTap,
          required String optionalString}) =>
      LabeledBoxWidget(
        label: label,
        onTap: onTap,
        optionalString: optionalString,
      );

  @override
  Widget build(BuildContext context) => Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            context.textFieldDialogTheme.spacingXS,
          ),
          side: BorderSide(
            color: type.getBorderColor(context),
            width: context.textFieldDialogTheme.spacingXXXS,
          ),
        ),
        color: type.getBackgroundColor(context),
        child: InkWell(
          borderRadius: BorderRadius.circular(
            context.textFieldDialogTheme.spacingXS,
          ),
          onTap: onTap,
          child: Ink(
            padding: context.textFieldDialogTheme.labeledBoxWidgetPadding1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      context.textFieldDialogTheme.labeledBoxWidgetPadding2,
                  child: leadingIcon != null && leadingIcon is IconData
                      ? Icon(
                          leadingIcon,
                          color: type.getColor(context),
                        )
                      : leadingIcon != null && leadingIcon is SvgPicture
                          ? (leadingIcon as SvgPicture)
                          : null,
                ),
                Expanded(
                  child: Text(
                    label,
                    style:
                        context.textFieldDialogTheme.descriptionBold.copyWith(
                      color: labelColor ?? type.getColor(context),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                if (type == LabeledBoxType.optional)
                  Padding(
                    padding:
                        context.textFieldDialogTheme.labeledBoxWidgetPadding3,
                    child: Text(
                      optionalString,
                      style: context.textFieldDialogTheme.captionBold.copyWith(
                        color: type.getSecondaryColor(context),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
}

extension LabeledBoxTypeX on LabeledBoxType {
  Color getColor(BuildContext context) {
    switch (this) {
      case LabeledBoxType.optional:
        return context.textFieldDialogTheme.black;
      case LabeledBoxType.filled:
        return context.textFieldDialogTheme.blue;
    }
  }

  Color getSecondaryColor(BuildContext context) {
    switch (this) {
      case LabeledBoxType.optional:
        return context.textFieldDialogTheme.gray;
      case LabeledBoxType.filled:
        return context.textFieldDialogTheme.black;
    }
  }

  Color getBackgroundColor(BuildContext context) {
    switch (this) {
      case LabeledBoxType.optional:
        return context.textFieldDialogTheme.labelBoxOptionalBackground;
      case LabeledBoxType.filled:
        return context.textFieldDialogTheme.labelBoxFilledBackground;
    }
  }

  Color getBorderColor(BuildContext context) {
    switch (this) {
      case LabeledBoxType.optional:
        return context.textFieldDialogTheme.mediumWhite;
      case LabeledBoxType.filled:
        return context.textFieldDialogTheme.transparent;
    }
  }
}
