import 'package:flutter/material.dart';

import '../../base/utils/theme/pin_code_theme.dart';
import '../../base/utils/utils.dart';

class PinCodeKey extends StatefulWidget {
  const PinCodeKey({
    required this.onPressed,
    this.number,
    this.isFingerScan = false,
    this.isFaceScan = false,
    this.isLoading = false,
    this.showDefaultIcon = false,
    this.tintDuration = const Duration(milliseconds: 300),
    super.key,
  });

  /// The number to be displayed on the key
  final int? number;

  /// Shows the finger scan icon if it is set to true
  final bool isFingerScan;

  /// Shows the face scan icon if it is set to true
  final bool isFaceScan;

  /// Shows the loading state of the key
  final bool isLoading;

  /// Shows the face scan icon if it is set to true
  final bool showDefaultIcon;

  /// Callback executed once the key is pressed
  final void Function(int?) onPressed;

  /// The duration of the tint animation once a button is pressed/released
  final Duration tintDuration;

  @override
  State<PinCodeKey> createState() => _PinCodeKeyState();
}

class _PinCodeKeyState extends State<PinCodeKey> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTapDown: widget.isLoading
            ? null
            : (_) async {
                setState(() {
                  isPressed = true;
                });
                if (widget.isFingerScan || widget.isFaceScan) {
                  await Future.delayed(widget.tintDuration);
                }
                widget.onPressed(widget.number);
              },
        onTapUp: widget.isLoading ? null : (_) => _delayedButtonRelease(),
        onTapCancel: widget.isLoading ? null : _delayedButtonRelease,
        onHorizontalDragEnd: (_) => _cancelPress(),
        onVerticalDragEnd: (_) => _cancelPress(),
        child: widget.isFingerScan
            ? AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: isPressed
                    ? context.pinCodeTheme.fingerScanPressedIcon
                    : context.pinCodeTheme.fingerScanDefaultIcon,
              )
            : (widget.isFaceScan || widget.showDefaultIcon)
                ? AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: isPressed
                        ? context.pinCodeTheme.faceScanPressedIcon
                        : context.pinCodeTheme.faceScanDefaultIcon,
                  )
                : AnimatedContainer(
                    width: _calculateSize(context),
                    height: _calculateSize(context),
                    decoration: BoxDecoration(
                      color: context.pinCodeTheme.pinCodeKeyBackgroundColor
                          .withValues(
                        alpha: widget.isLoading
                            ? 0.1
                            : isPressed
                                ? 1.0
                                : 0.20000000298023224,
                      ),
                      borderRadius:
                          BorderRadius.circular(_calculateSize(context) / 2),
                    ),
                    duration: const Duration(milliseconds: 300),
                    child: Center(child: _buildText()),
                  ),
      );

  Widget _buildText() => Text(
        widget.number.toString(),
        style: context.pinCodeTheme.pinCodeKeyTextStyle.copyWith(
          fontSize: _calculateSize(context) / 2.25,
          color: isPressed
              ? context.pinCodeTheme.pinCodeKeyTextColorPressed
              : context.pinCodeTheme.pinCodeKeyTextColorDefault
                  .withValues(alpha: widget.isLoading ? 0.5 : 1.0),
        ),
      );

  double _calculateSize(BuildContext context) =>
      calculateKeyboardButtonSize(context);

  void _cancelPress() {
    setState(() {
      isPressed = false;
    });
  }

  void _delayedButtonRelease() async {
    await Future.delayed(widget.tintDuration);
    _cancelPress();
  }
}
