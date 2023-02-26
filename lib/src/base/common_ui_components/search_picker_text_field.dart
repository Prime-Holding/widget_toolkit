import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/rx_form.dart';

import '../theme/widget_toolkit_theme.dart';

class SearchPickerTextField extends StatefulWidget {
  const SearchPickerTextField({
    this.hintText,
    this.onChanged,
    this.isFocused = false,
    this.controller,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String? hintText;
  final bool isFocused;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  // if there's a tap callback, the other functionality is ignored
  final VoidCallback? onTap;

  @override
  State<SearchPickerTextField> createState() => _SearchPickerTextFieldState();
}

class _SearchPickerTextFieldState extends State<SearchPickerTextField> {
  late Color iconColor;
  late Color backgroundColor;

  @override
  void initState() {
    widget.controller?.addListener(_onTextChangeListener);
    super.initState();
  }

  void _onTextChangeListener() {
    final controller = widget.controller;

    if (controller != null) {
      setState(() {
        iconColor = controller.text.isEmpty
            ? context.primeComponentsTheme.searchTextFieldIconColor
            : context.primeComponentsTheme.searchTextFieldIconColorActive;

        backgroundColor = controller.text.isEmpty
            ? context.primeComponentsTheme.searchTextFieldBackgroundColor
            : context.primeComponentsTheme.searchTextFieldBackgroundColorActive;
      });
    }
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_onTextChangeListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    iconColor = context.primeComponentsTheme.searchTextFieldIconColor;
    backgroundColor =
        context.primeComponentsTheme.searchTextFieldBackgroundColorActive;

    return RxIgnoreUnfocuser(
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(
            context.primeComponentsTheme.searchTextFieldBorderRadius,
          ),
          border: context.primeComponentsTheme.searchTextFieldBorderType,
        ),
        child: Material(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(
            context.primeComponentsTheme.searchTextFieldBorderRadius,
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(
              context.primeComponentsTheme.searchTextFieldBorderRadius,
            ),
            onTap: widget.onTap,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: context
                      .primeComponentsTheme.searchTextFieldIconEdgeInsets,
                  child: Icon(
                    Icons.search,
                    color: iconColor,
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 12,
                    ),
                    child: widget.onTap == null
                        ? TextFormField(
                            controller: widget.controller,
                            autofocus: widget.isFocused,
                            decoration: InputDecoration.collapsed(
                              hintText: widget.hintText,
                              hintStyle: context.primeComponentsTheme
                                  .searchTextFieldHintStyle,
                            ),
                            style: context
                                .primeComponentsTheme.searchTextFieldTextStyle,
                            onChanged: widget.onChanged,
                          )
                        : Text(
                            widget.hintText ?? '',
                            style: context
                                .primeComponentsTheme.searchTextFieldHintStyle,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
