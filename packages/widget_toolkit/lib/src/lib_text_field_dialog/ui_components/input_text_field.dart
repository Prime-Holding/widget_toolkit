import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rx_bloc/rx_form.dart';

import '../../../widget_toolkit.dart';
import '../../base/models/input_text_field_state.dart';

const _kInputTextFieldMaxLines = 1;
const double _kBorderWidth = 2;

class InputTextField extends StatefulWidget {
  const InputTextField({
    required this.label,
    required this.state,
    this.unFocusedState,
    this.addFieldLabel,
    this.hintText,
    this.value,
    this.errorMessage,
    this.maxLines,
    this.isMultiLinedInputField = false,
    this.writeMode = true,
    this.isFocused = false,
    this.noPrefixIcon = false,
    this.inputFormatters,
    this.defaultFieldLabelColor,
    this.defaultValueColor,
    this.controller,
    this.decoration,
    this.suffixIcon,
    this.obBlurCallback,
    this.keyBoardType = TextInputType.text,
    super.key,
  });

  final String label;
  final String? addFieldLabel;
  final String? hintText;
  final String? value;
  final String? errorMessage;
  final bool isMultiLinedInputField;
  final bool writeMode;
  final bool isFocused;
  final bool noPrefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final TextEditingController? controller;
  final TextInputType? keyBoardType;

  final InputDecoration? decoration;
  final InputTextFieldStateModel state;
  final InputTextFieldStateModel? unFocusedState;
  final Color? defaultFieldLabelColor;
  final Color? defaultValueColor;
  final Widget? suffixIcon;
  final VoidCallback? obBlurCallback;

  @override
  InputTextFieldState createState() => InputTextFieldState();
}

class InputTextFieldState extends State<InputTextField> {
  late bool _writeMode;
  final FocusNode _focusNode = FocusNode();
  late InputTextFieldStateModel currentState;

  @override
  void initState() {
    _writeMode = widget.writeMode;
    currentState = widget.state;

    if (currentState == InputTextFieldStateModel.defaultField ||
        currentState == InputTextFieldStateModel.defaultDisabled) {
      _writeMode = false;
    }

    if (widget.isFocused) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _focusNode.requestFocus();
      });
    }

    if (widget.unFocusedState != null) {
      setState(() {
        _writeMode = true;
      });

      _focusNode.addListener(() {
        if (!_focusNode.hasFocus) {
          setState(() {
            currentState = widget.unFocusedState!;
          });
        }
      });
    }

    super.initState();
  }

  @override
  void didUpdateWidget(covariant InputTextField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (currentState != widget.state || widget.unFocusedState != null) {
      setState(() {
        currentState = widget.state;

        if (widget.unFocusedState != null) {
          _writeMode = true;
        }
      });
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => RxIgnoreUnfocuser(
        child: GestureDetector(
          onTap: () {
            if (currentState == InputTextFieldStateModel.defaultDisabled ||
                currentState == InputTextFieldStateModel.disabled) return;

            if (currentState != InputTextFieldStateModel.defaultField) {
              _focusNode.requestFocus();
              return;
            }

            setState(() {
              _writeMode = true;
              _focusNode.requestFocus();
              currentState = InputTextFieldStateModel.type;
            });
          },
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: currentState._getBackgroundColor(context),
                  border: Border.all(
                    color: currentState._getBorderColor(context),
                    width: _kBorderWidth,
                  ),
                  borderRadius: BorderRadius.circular(
                      context.textFieldDialogTheme.spacingXS),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: _verticalHeight(),
                  horizontal: context.textFieldDialogTheme.spacingS,
                ),
                child: _writeMode
                    ? _buildInputFieldView(context)
                    : _buildDefaultView(context),
              ),
              if (currentState == InputTextFieldStateModel.error &&
                  widget.errorMessage != null)
                Padding(
                  padding: context.textFieldDialogTheme.inputTextFieldPadding1,
                  child: Text(
                    widget.errorMessage ?? '',
                    textAlign: TextAlign.start,
                    style: context.textFieldDialogTheme.smallThin.copyWith(
                      color: context.textFieldDialogTheme.red,
                    ),
                  ),
                ),
            ],
          ),
        ),
      );

  Widget _buildInputFieldView(BuildContext context) {
    return Row(
      crossAxisAlignment: _isMultiLineFiled()
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: _isMultiLineFiled() && widget.suffixIcon != null
                      ? context.textFieldDialogTheme.spacingXSS
                      : 0,
                ),
                child: Text(
                  widget.label.toUpperCase(),
                  style: context.textFieldDialogTheme.captionBold.copyWith(
                    color: widget.defaultFieldLabelColor ??
                        currentState.getColor(context),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: context.textFieldDialogTheme.spacingXSS,
              ),
              TextFormField(
                focusNode: _focusNode,
                keyboardType: widget.keyBoardType,
                onEditingComplete: () => widget.obBlurCallback?.call(),
                controller: widget.controller,
                readOnly: currentState == InputTextFieldStateModel.disabled,
                maxLines: _isMultiLineFiled()
                    ? widget.maxLines
                    : _kInputTextFieldMaxLines,
                initialValue:
                    widget.controller == null ? widget.value ?? '' : null,
                style: context.textFieldDialogTheme.descriptionBold.copyWith(
                  color: widget.defaultValueColor ??
                      currentState._getValueColor(context),
                ),
                inputFormatters: widget.inputFormatters,
                decoration: widget.decoration ??
                    InputDecoration.collapsed(
                      hintText: widget.hintText,
                      hintStyle:
                          context.textFieldDialogTheme.descriptionThin.copyWith(
                        color: context.textFieldDialogTheme.gray,
                      ),
                    ),
              ),
            ],
          ),
        ),
        widget.suffixIcon ??
            _SuffixIconWidget(
              state: currentState,
            ),
      ],
    );
  }

  Widget _buildDefaultView(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (currentState == InputTextFieldStateModel.defaultDisabled) return;
        setState(() {
          _writeMode = true;
          _focusNode.requestFocus();
          currentState = InputTextFieldStateModel.type;
        });
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (!widget.noPrefixIcon) _PrefixIconWidget(state: currentState),
          Text(
            widget.addFieldLabel ?? '',
            style: context.textFieldDialogTheme.captionBold.copyWith(
              color: currentState.getColor(context),
              fontSize: 14,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  bool _isMultiLineFiled() {
    return (widget.isMultiLinedInputField || widget.maxLines != null);
  }

  double _verticalHeight() {
    switch (currentState) {
      case InputTextFieldStateModel.type:
      case InputTextFieldStateModel.warning:
      case InputTextFieldStateModel.defaultDisabled:
      case InputTextFieldStateModel.defaultField:
      case InputTextFieldStateModel.disabled:
      case InputTextFieldStateModel.error:
      case InputTextFieldStateModel.filled:
      case InputTextFieldStateModel.loading:
        return context.textFieldDialogTheme.spacingM;
      case InputTextFieldStateModel.success:
        return context.textFieldDialogTheme.spacingS;
      default:
        return context.textFieldDialogTheme.spacingM;
    }
  }
}

extension _InputTextFieldStateModelX on InputTextFieldStateModel {
  Color getColor(BuildContext context) {
    switch (this) {
      case InputTextFieldStateModel.defaultField:
        return context.textFieldDialogTheme.blue;
      case InputTextFieldStateModel.defaultDisabled:
        return context.textFieldDialogTheme.gray;
      case InputTextFieldStateModel.disabled:
        return context.textFieldDialogTheme.mediumBlack;
      case InputTextFieldStateModel.error:
        return context.textFieldDialogTheme.red;
      case InputTextFieldStateModel.filled:
        return context.textFieldDialogTheme.green;
      case InputTextFieldStateModel.loading:
        return context.textFieldDialogTheme.blue;
      case InputTextFieldStateModel.success:
        return context.textFieldDialogTheme.green;
      case InputTextFieldStateModel.type:
        return context.textFieldDialogTheme.blue;
      case InputTextFieldStateModel.warning:
        return context.textFieldDialogTheme.orange;
      case InputTextFieldStateModel.plain:
        return context.textFieldDialogTheme.gray;
    }
  }

  Color _getBackgroundColor(BuildContext context) {
    switch (this) {
      case InputTextFieldStateModel.filled:
        return context.textFieldDialogTheme.inputTextFieldRegularBackground;
      case InputTextFieldStateModel.success:
        return context.textFieldDialogTheme.inputTextFieldSuccessBackground;
      case InputTextFieldStateModel.defaultField:
        return context.textFieldDialogTheme.inputTextFieldRegularBackground;
      case InputTextFieldStateModel.defaultDisabled:
        return context.textFieldDialogTheme.inputTextFieldRegularBackground;
      case InputTextFieldStateModel.plain:
        return context.textFieldDialogTheme.inputTextFieldRegularBackground;
      default:
        return context.textFieldDialogTheme.inputTextFieldRegularBackground;
    }
  }

  Color _getBorderColor(BuildContext context) {
    switch (this) {
      case InputTextFieldStateModel.error:
        return context.textFieldDialogTheme.redLight;
      case InputTextFieldStateModel.type:
        return context.textFieldDialogTheme.blue;
      case InputTextFieldStateModel.disabled:
        return context.textFieldDialogTheme.mediumWhite;
      case InputTextFieldStateModel.loading:
        return context.textFieldDialogTheme.blue;
      case InputTextFieldStateModel.warning:
        return context.textFieldDialogTheme.orangeLight;
      default:
        return Colors.transparent;
    }
  }

  Color _getValueColor(BuildContext context) {
    switch (this) {
      case InputTextFieldStateModel.disabled:
        return context.textFieldDialogTheme.gray;
      default:
        return context.widgetToolkitTheme.highlightColor;
    }
  }
}

class _PrefixIconWidget extends StatelessWidget {
  const _PrefixIconWidget({required this.state});

  final InputTextFieldStateModel state;

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case InputTextFieldStateModel.defaultField:
        return Padding(
          padding: context.textFieldDialogTheme.inputTextFieldPadding2,
          child: context.textFieldDialogTheme.addIcon,
        );
      case InputTextFieldStateModel.defaultDisabled:
        return Padding(
          padding: context.textFieldDialogTheme.inputTextFieldPadding3,
          child: context.textFieldDialogTheme.addDisabledIcon,
        );
      default:
        return const SizedBox();
    }
  }
}

class _SuffixIconWidget extends StatelessWidget {
  const _SuffixIconWidget({required this.state});

  final InputTextFieldStateModel state;

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case InputTextFieldStateModel.loading:
        return Padding(
          padding: context.textFieldDialogTheme.inputTextFieldPaddingLoading,
          child: context.textFieldDialogTheme.loadingIcon,
        );
      case InputTextFieldStateModel.success:
        return Padding(
          padding: context.textFieldDialogTheme.inputTextFieldPaddingSuccess,
          child: context.textFieldDialogTheme.tickCircleSuccessIcon,
        );
      case InputTextFieldStateModel.error:
        return Padding(
          padding: context.textFieldDialogTheme.inputTextFieldPaddingError,
          child: context.textFieldDialogTheme.dangerIcon,
        );
      case InputTextFieldStateModel.warning:
        return Padding(
          padding: context.textFieldDialogTheme.inputTextFieldPaddingWarning,
          child: context.textFieldDialogTheme.infoCircleIcon,
        );
      default:
        return const SizedBox();
    }
  }
}
