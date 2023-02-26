import 'package:flutter/material.dart';

import '../../lib_shimmer/views/shimmer_text.dart';
import '../theme/widget_toolkit_theme.dart';

class SearchPickerListItem extends StatelessWidget {
  const SearchPickerListItem({
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
                  ShimmerText(
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