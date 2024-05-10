import 'package:flutter/material.dart';

import '../../../widget_toolkit.dart';

enum EditFieldType { dropdown, editfield, custom }

enum EditFieldState { notEditedYet, edited, loading, success }

class EditFieldWidget extends StatelessWidget {
  final String label;
  final String value;
  final EditFieldType type;
  final EditFieldState state;
  final VoidCallback onTap;
  final dynamic customIcon;

  const EditFieldWidget({
    super.key,
    required this.label,
    required this.value,
    this.type = EditFieldType.editfield,
    required this.state,
    required this.onTap,
    this.customIcon,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Container(
          decoration: BoxDecoration(
            color: state == EditFieldState.success
                ? context.textFieldDialogTheme.editFieldSuccessBackground
                : context.textFieldDialogTheme.editFieldRegularBackground,
            borderRadius: BorderRadius.circular(
              context.textFieldDialogTheme.editFieldBorderRadius,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: context.textFieldDialogTheme.spacingS,
              horizontal: context.textFieldDialogTheme.spacingM,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerText(
                          state == EditFieldState.loading
                              ? null
                              : label.toUpperCase(),
                          style: context.textFieldDialogTheme.captionBold
                              .copyWith(color: _getLabelColor(context))),
                      SizedBox(height: context.textFieldDialogTheme.spacingXSS),
                      ShimmerText(
                        state == EditFieldState.loading ? null : value,
                        style: _textStyle(context)
                            .copyWith(color: _getValueColor(context)),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: context.textFieldDialogTheme.spacingS,
                      top: context.textFieldDialogTheme.spacingXS,
                      bottom: context.textFieldDialogTheme.spacingXS),
                  child: Material(
                    color: Colors.transparent,
                    child: _buildIcon(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _buildIcon(BuildContext context) {
    if (state == EditFieldState.loading) {
      return const SizedBox();
    }
    switch (type) {
      case EditFieldType.dropdown:
        return context.textFieldDialogTheme.arrowRightSquareIcon
            .copyWith(color: _getValueColor(context));
      case EditFieldType.editfield:
        return context.textFieldDialogTheme.editPenIcon
            .copyWith(color: _getValueColor(context));
      case EditFieldType.custom:
        return customIcon;
    }
  }

  Color? _getLabelColor(BuildContext context) {
    switch (state) {
      case EditFieldState.edited:
        return context.textFieldDialogTheme.editFieldLabelEditedColor;
      case EditFieldState.notEditedYet:
        return context.textFieldDialogTheme.editFieldLabelNotEditedColor;
      case EditFieldState.loading:
        return context.textFieldDialogTheme.editFieldLabelLoadingColor;
      case EditFieldState.success:
        return context.textFieldDialogTheme.editFieldLabelSuccessColor;
    }
  }

  Color? _getValueColor(BuildContext context) {
    switch (state) {
      case EditFieldState.edited:
        return context.textFieldDialogTheme.editFieldValueEditedColor;
      case EditFieldState.notEditedYet:
        return context.textFieldDialogTheme.editFieldValueNotEditedColor;
      case EditFieldState.loading:
        return context.textFieldDialogTheme.editFieldValueLoadingColor;
      case EditFieldState.success:
        return context.textFieldDialogTheme.editFieldValueSuccessColor;
    }
  }

  TextStyle _textStyle(BuildContext context) {
    switch (state) {
      case EditFieldState.edited:
        return context.textFieldDialogTheme.editFieldTextEditedTextStyle;
      case EditFieldState.notEditedYet:
        return context.textFieldDialogTheme.editFieldTextNotEditedTextStyle;
      case EditFieldState.loading:
        return context.textFieldDialogTheme.editFieldTextLoadingTextStyle;
      case EditFieldState.success:
        return context.textFieldDialogTheme.editFieldTextSuccessTextStyle;
    }
  }
}
