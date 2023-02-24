import 'package:flutter/material.dart';

import '../../../../widget_toolkit.dart';

class AppPickerListItem extends StatelessWidget {
  const AppPickerListItem({
    this.text,
    this.child,
    this.onTap,
    this.isSelected = false,
    this.isLoading = false,
    this.overrideStyle = true,
    Key? key,
  })  : assert((text != null || child != null) || isLoading),
        super(key: key);

  final String? text;
  final Widget? child;
  final bool isSelected;
  final bool isLoading;
  final bool overrideStyle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Container(
        padding: overrideStyle
            ? null
            : context.primeComponentsTheme.pickerListItemOuterEdgeInsets,
        child: Material(
          color: overrideStyle
              ? context.primeComponentsTheme.pickerListItemUnselectedColor
              : isSelected
                  ? context.primeComponentsTheme.pickerListItemSelectedColor
                  : context.primeComponentsTheme.pickerListItemUnselectedColor,
          borderRadius: _radius(context),
          child: InkWell(
            onTap: onTap == null ? null : () => onTap!.call(),
            borderRadius: _radius(context),
            child: Container(
              padding: overrideStyle
                  ? null
                  : context.primeComponentsTheme.pickerListItemInnerEdgeInsets,
              child: child ??
                  AppShimmerText(
                    isLoading ? null : text,
                    style: context.primeComponentsTheme.pickerListItemTextStyle,
                  ),
            ),
          ),
        ),
      );

  BorderRadius _radius(BuildContext context) => BorderRadius.circular(
        overrideStyle
            ? 0
            : context.primeComponentsTheme.pickerListItemBorderRadius,
      );
}
