import 'package:flutter/material.dart';

import '../../../widget_toolkit.dart';

enum PrimeEditFieldType { dropdown, editfield, custom }

enum PrimeEditFieldState { notEditedYet, edited, loading, success }

class PrimeEditFieldWidget extends StatelessWidget {
  final String label;
  final String value;
  final PrimeEditFieldType type;
  final PrimeEditFieldState state;
  final VoidCallback onTap;
  final dynamic customIcon;

  const PrimeEditFieldWidget({
    Key? key,
    required this.label,
    required this.value,
    this.type = PrimeEditFieldType.editfield,
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
            color: state == PrimeEditFieldState.success
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
                      AppShimmerText(
                          state == PrimeEditFieldState.loading
                              ? null
                              : label.toUpperCase(),
                          style: context.textFieldDialogTheme.captionBold
                              .copyWith(color: _getLabelColor(context))),
                      SizedBox(height: context.textFieldDialogTheme.spacingXSS),
                      AppShimmerText(
                        state == PrimeEditFieldState.loading ? null : value,
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
    if (state == PrimeEditFieldState.loading) {
      return const SizedBox();
    }
    switch (type) {
      case PrimeEditFieldType.dropdown:
        return context.textFieldDialogTheme.arrowRightSquareIcon
            .copyWith(color: _getValueColor(context));
      case PrimeEditFieldType.editfield:
        return context.textFieldDialogTheme.editPenIcon
            .copyWith(color: _getValueColor(context));
      case PrimeEditFieldType.custom:
        return customIcon;
    }
  }

  Color? _getLabelColor(BuildContext context) {
    switch (state) {
      case PrimeEditFieldState.edited:
        return null;
      case PrimeEditFieldState.loading:
      case PrimeEditFieldState.notEditedYet:
        return context.textFieldDialogTheme.gray;
      case PrimeEditFieldState.success:
        return context.textFieldDialogTheme.green;
    }
  }

  Color? _getValueColor(BuildContext context) {
    switch (state) {
      case PrimeEditFieldState.edited:
        return context.textFieldDialogTheme.blue;
      case PrimeEditFieldState.loading:
        return context.textFieldDialogTheme.gray;
      case PrimeEditFieldState.notEditedYet:
      case PrimeEditFieldState.success:
        return context.primeComponentsTheme.highlightColor;
    }
  }

  TextStyle _textStyle(BuildContext context) {
    switch (state) {
      case PrimeEditFieldState.notEditedYet:
        return context.textFieldDialogTheme.descriptionThin;
      case PrimeEditFieldState.edited:
      case PrimeEditFieldState.success:
      case PrimeEditFieldState.loading:
        return context.textFieldDialogTheme.descriptionBold;
    }
  }
}
