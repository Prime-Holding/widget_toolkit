import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rx_bloc/rx_form.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../asset_classes.dart';
import '../../../ui_components.dart';
import '../../base/extensions/data_type_extensions.dart';
import '../di/text_field_dialog_dependencies.dart';
import '../services/text_field_validator.dart';
import '../theme/text_field_dialog_theme.dart';
import '../ui_components/edit_field_widget.dart';
import '../ui_components/labeled_box_widget.dart';
import 'text_field_dialog_page.dart';

typedef FilledWidgetBuilder<T> = Widget Function(
  T value,
  EditFieldState fieldState,
  Function showDialogCallback,
);

/// A widget which shows a text dialog.
/// [label] is the value of the text label of the widget, which when pressed loads the
/// text field dialog
///
/// [emptyLabel] is the text value, displayed when there is no initially set text
/// value for the widget
///
/// [validator] received a service, which extends [TextFieldValidator] and
/// implements its validation methods for the frontend and backend checks
///
/// [onChanged] after the field service validation is successful the onChanged
/// function is called with the value from the text input field. It can be used
/// for sending the value as an event to a bloc, for example as:
/// onChanged: (street) => bloc.events.setStreet(street);
///
/// [fillButtonText] is the text value in the button in the dialog
///
/// [errorMapper] function, which implementation should map the form error to
/// RxFieldException error and translate the error to the correct language.
/// You can check also the translateErrors() method in the [TextFieldDialogPage] widget
///
/// Set [editFieldType] to EditFieldType.custom if you want to set custom edit icon
/// and provide the icon to [editFieldCustomIcon]
///
/// [value] is the value bellow the label text value, which has been inputted
/// as text field value
///
/// [header] is a value displayed above the text field in the dialog
///
/// [maxLines] is the value of maximum lines the [InputTextField] widget
/// can have, if the number is increased, the input field becomes bigger.
///
/// [editFieldType] is used in the [EditFieldWidget] and from its type,
/// one of the preconfigured icons are loaded or if the type is set to
/// EditFieldType.custom, you can set a custom icon. In this case, you should
/// provide a custom icon to [editFieldCustomIcon]
///
/// [dialogHasBottomPadding] by default is should be true, which moves the dialog
/// up with the height of the keyboard, when it is visible, so the dialog appears
/// above it
///
/// [isDismissible] shows whether you can dismiss the dialog, if you click outside
/// of it
///
/// [heightFactor] sets a custom heightFactor, setting, how high the modal sheet
/// is displayed
///
/// When we use this widget in a form, we may want to lock fields to be read only
/// for some users and editable for others. In such cases set [enabled] property to false.
class TextFieldDialog<T> extends StatefulWidget {
  const TextFieldDialog({
    required this.validator,
    required this.errorMapper,
    this.onChanged,
    this.label = 'Describe your value',
    this.emptyLabel = 'Enter text here',
    this.fillButtonText = 'Save',
    this.isLoading = false,
    this.isSuccess = false,
    this.filledWidgetBuilder,
    this.value,
    this.header,
    this.keyBoardType = TextInputType.text,
    this.inputFormatters,
    this.isMultiLinedInputField = false,
    this.maxLines,
    this.editFieldCustomIcon,
    this.editFieldType = EditFieldType.editfield,
    this.dialogHasBottomPadding = true,
    this.configuration = const TextFieldConfiguration(),
    this.enabled = true,
    Key? key,
  })  : assert(editFieldCustomIcon == null ||
            editFieldCustomIcon is IconData ||
            editFieldCustomIcon is SvgPicture ||
            editFieldCustomIcon is SvgFile),
        super(key: key);

  final T? value;
  final String label;
  final String emptyLabel;
  final String? header;
  final Function(T value)? onChanged;
  final TextFieldValidator<T> validator;
  final FilledWidgetBuilder<T>? filledWidgetBuilder;
  final bool isLoading;
  final bool isSuccess;
  final TextInputType? keyBoardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool isMultiLinedInputField;
  final int? maxLines;
  final String fillButtonText;
  final RxFieldException<T> Function(Object error, BuildContext context)
      errorMapper;
  final dynamic editFieldCustomIcon;
  final EditFieldType editFieldType;
  final bool dialogHasBottomPadding;
  final TextFieldConfiguration configuration;
  final bool enabled;

  @override
  State<TextFieldDialog<T>> createState() => _TextFieldDialogState<T>();
}

class _TextFieldDialogState<T> extends State<TextFieldDialog<T>> {
  T? _value;
  T? _initialValue;

  @override
  void didUpdateWidget(covariant TextFieldDialog<T> oldWidget) {
    if (_initialValue == null && widget.value != null) {
      setState(() => _initialValue = widget.value);
    }

    if (widget.value != oldWidget.value) {
      setState(() => _value = widget.value);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    _value = widget.value;
    _initialValue = widget.value;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_value == null || _value!.toString().isEmpty) {
      return LabeledBoxWidget(
        label: widget.emptyLabel,
        onTap: () => _showModalText(context),
        leadingIcon: context.textFieldDialogTheme.addIcon.copyWith(
          color: context.textFieldDialogTheme.blue,
        ),
        // optionalString won't be used since the type is not going to be changed to LabeledBoxType.optional
        optionalString: '',
      );
    }

    if (widget.filledWidgetBuilder != null) {
      return widget.filledWidgetBuilder!.call(
        _value as T,
        _getFieldState(),
        () => _showModalText(context),
      );
    }

    return EditFieldWidget(
      label: widget.label,
      onTap: () => _showModalText(context),
      value: _value?.toString() ?? '',
      state: _getFieldState(),
      type: widget.editFieldType,
      customIcon: widget.editFieldCustomIcon,
    );
  }

  Future<void> _showModalText(BuildContext context) async => widget.enabled
      ? showModal(
          context: context,
          configuration: ModalConfiguration(
            fullScreen: widget.configuration.fullScreen,
            heightFactor: widget.configuration.heightFactor,
            isDismissible: widget.configuration.isDismissible,
            safeAreaBottom: false,
            haveOnlyOneSheet: widget.configuration.haveOnlyOneSheet,
          ),
          dialogHasBottomPadding: widget.dialogHasBottomPadding,
          builder: (ctx) => MultiProvider(
            providers: TextFieldDialogDependencies<T>.from(
              context,
              validator: widget.validator,
              initialValue: _value,
            ).providers,
            child: TextFieldDialogPage<T>(
              errorMapper: widget.errorMapper,
              callback: (value) {
                setState(() => _value = value);
                widget.onChanged?.call(value);
              },
              label: widget.label,
              header: widget.header,
              keyBoardType: widget.keyBoardType,
              inputFormatters: widget.inputFormatters,
              isMultiLinedInputField: widget.isMultiLinedInputField,
              maxLines: widget.maxLines,
              fillButtonText: widget.fillButtonText,
            ),
          ),
          onCancelPressed: () => Navigator.of(context).pop(),
        )
      : null;

  EditFieldState _getFieldState() {
    if (widget.isLoading) {
      return EditFieldState.loading;
    } else {
      if (_value?.toString() == _initialValue?.toString()) {
        return EditFieldState.notEditedYet;
      } else {
        if (widget.isSuccess) {
          return EditFieldState.success;
        } else {
          return EditFieldState.edited;
        }
      }
    }
  }
}

class TextFieldConfiguration {
  const TextFieldConfiguration({
    this.isDismissible = true,
    this.heightFactor,
    this.fullScreen = false,
    this.haveOnlyOneSheet = true,
  });

  final double? heightFactor;
  final bool isDismissible;
  final bool fullScreen;
  final bool haveOnlyOneSheet;
}
