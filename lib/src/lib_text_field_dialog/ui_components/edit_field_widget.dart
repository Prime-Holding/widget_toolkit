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
    Key? key,
    required this.label,
    required this.value,
    this.type = EditFieldType.editfield,
    required this.state,
    required this.onTap,
    this.customIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Container(
          decoration: BoxDecoration(
            color: state == EditFieldState.success
                ? context.textFieldDialogTheme.primeEditFieldSuccessBackground
                : context.textFieldDialogTheme.primeEditFieldRegularBackground,
            borderRadius: BorderRadius.circular(
              context.textFieldDialogTheme.primeEditFieldBorderRadius,
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
        return null;
      case EditFieldState.loading:
      case EditFieldState.notEditedYet:
        return context.textFieldDialogTheme.gray;
      case EditFieldState.success:
        return context.textFieldDialogTheme.green;
    }
  }

  Color? _getValueColor(BuildContext context) {
    switch (state) {
      case EditFieldState.edited:
        return context.textFieldDialogTheme.blue;
      case EditFieldState.loading:
        return context.textFieldDialogTheme.gray;
      case EditFieldState.notEditedYet:
      case EditFieldState.success:
        return context.primeComponentsTheme.highlightColor;
    }
  }

  TextStyle _textStyle(BuildContext context) {
    switch (state) {
      case EditFieldState.notEditedYet:
        return context.textFieldDialogTheme.descriptionThin;
      case EditFieldState.edited:
      case EditFieldState.success:
      case EditFieldState.loading:
        return context.textFieldDialogTheme.descriptionBold;
    }
  }
}
