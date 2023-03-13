import 'package:flutter/material.dart';

import '../../base/theme/widget_toolkit_theme.dart';
import '../../lib_shimmer/views/shimmer_text.dart';

class PickerListItem extends StatelessWidget {
  const PickerListItem({
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
            : context.widgetToolkitTheme.pickerListItemOuterEdgeInsets,
        child: Material(
          color: overrideStyle
              ? context.widgetToolkitTheme.pickerListItemUnselectedColor
              : isSelected
                  ? context.widgetToolkitTheme.pickerListItemSelectedColor
                  : context.widgetToolkitTheme.pickerListItemUnselectedColor,
          borderRadius: _radius(context),
          child: InkWell(
            onTap: onTap == null ? null : () => onTap!.call(),
            borderRadius: _radius(context),
            child: Container(
              padding: overrideStyle
                  ? null
                  : context.widgetToolkitTheme.pickerListItemInnerEdgeInsets,
              child: child ??
                  ShimmerText(
                    isLoading ? null : text,
                    style: context.widgetToolkitTheme.pickerListItemTextStyle,
                  ),
            ),
          ),
        ),
      );

  BorderRadius _radius(BuildContext context) => BorderRadius.circular(
        overrideStyle
            ? 0
            : context.widgetToolkitTheme.pickerListItemBorderRadius,
      );
}
