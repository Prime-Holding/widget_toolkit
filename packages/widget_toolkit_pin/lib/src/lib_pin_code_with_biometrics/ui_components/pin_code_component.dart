import 'dart:ui';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';
import 'package:widget_toolkit/models.dart';
import 'package:widget_toolkit/shimmer.dart';
import 'package:widget_toolkit/theme_data.dart';
import 'package:widget_toolkit/ui_components.dart';
import 'package:widget_toolkit_biometrics/widget_toolkit_biometrics.dart';

import '../../../widget_toolkit_pin.dart';
import '../../base/utils/utils.dart';
import '../models/error_enable_biometrics.dart';
import 'pin_code_biometric_key.dart';
import 'pin_code_delete_key.dart';
import 'pin_code_key.dart';

class PinCodeComponent extends StatefulWidget {
  const PinCodeComponent({
    required this.translateError,
    required this.localizedReason,
    this.biometricsLocalDataSource,
    this.mapBiometricMessageToString,
    this.onAuthenticated,
    this.deleteKeyButton,
    this.bottomRightKeyboardButton,
    this.error,
    this.autoBiometricAuth,
    super.key,
  });

  /// Receives the error from bloc's error state
  final ErrorModel? error;

  /// The biometrics enabling reason
  final String localizedReason;

  /// Data source, which stores a flag if biometrics are enabled for the app.
  final BiometricsLocalDataSource? biometricsLocalDataSource;

  /// Handle the translation of the error from the errors stream
  final String Function(Object error) translateError;

  /// [mapBiometricMessageToString] will be used to translate the [BiometricsMessage]
  /// to human readable text and will be used into the default notification
  final String Function(BiometricsMessage message)? mapBiometricMessageToString;

  /// Returns the verification state of the input from the pin code value.
  final Function(dynamic)? onAuthenticated;

  /// Provide custom implementation for the most down left button. Do not forget
  /// to make it clickable. Default to LeftArrow.
  final PinCodeCustomKey? deleteKeyButton;

  /// Provide custom implementation for the most down right button. Do not forget
  /// to make it clickable.
  final PinCodeCustomKey? bottomRightKeyboardButton;

  /// Triggers the biometrics authentication process on the first screen load
  final bool? autoBiometricAuth;

  @override
  State<PinCodeComponent> createState() => _PinCodeComponentState();
}

class _PinCodeComponentState extends State<PinCodeComponent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isShakeAnimation = false;
  bool hasErrorText = false;
  bool authenticatedPin = false;
  static final _shakeTweenSequence = TweenSequence(
    <TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.5, end: 1)
            .chain(CurveTween(curve: Curves.easeInBack)),
        weight: 100,
      ),
      TweenSequenceItem<double>(
        tween: ConstantTween<double>(1),
        weight: 25,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1, end: 0)
            .chain(CurveTween(curve: Curves.easeInBack)),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: ConstantTween<double>(0),
        weight: 25,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0, end: 1)
            .chain(CurveTween(curve: Curves.easeInBack)),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: ConstantTween<double>(1),
        weight: 25,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1, end: 0)
            .chain(CurveTween(curve: Curves.easeInBack)),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: ConstantTween<double>(0),
        weight: 25,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0, end: 0.5)
            .chain(CurveTween(curve: Curves.easeInBack)),
        weight: 100,
      ),
    ],
  );

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          RxBlocListener<PinCodeBlocType, bool>(
            state: (bloc) => bloc.states.showBiometricsButton,
            listener: (context, state) {
              if (widget.autoBiometricAuth == true && state == true) {
                context
                    .read<PinCodeBlocType>()
                    .events
                    .biometricsButtonPressed();
              }
            },
          ),
          RxBlocListener<PinCodeBlocType, ErrorModel>(
            state: (bloc) => bloc.states.errors,
            listener: (context, errors) {
              if (errors is ErrorEnableBiometrics) {
                _onStateChanged(context, errors.message);
                return;
              }
              _startErrorAnimation();
            },
          ),
          RxBlocListener<PinCodeBlocType, dynamic>(
            state: (bloc) => bloc.states.authenticated,
            condition: (oldState, newState) => oldState != newState,
            listener: (context, authValue) {
              if (authValue == false) {
                return;
              }

              setState(() {
                authenticatedPin = true;
              });

              widget.onAuthenticated?.call(authValue);
            },
          ),
          _buildBuilders()
        ],
      );

  Widget _buildBuilders() => Expanded(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                context.pinCodeTheme.primaryGradientStart,
                context.pinCodeTheme.primaryGradientEnd
              ],
            ),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1,
              vertical: 20),
          child: RxBlocBuilder<PinCodeBlocType, bool>(
            state: (bloc) => bloc.states.isLoading,
            builder: (context, isLoading, bloc) =>
                RxBlocBuilder<PinCodeBlocType, int>(
              state: (bloc) => bloc.states.digitsCount,
              builder: (context, pinLength, bloc) => _buildPageContent(
                pinLength: pinLength.data ?? 0,
                context: context,
                isLoading: isLoading.data ?? false,
              ),
            ),
          ),
        ),
      );

  Widget _buildPageContent({
    required int pinLength,
    required BuildContext context,
    bool isLoading = false,
  }) =>
      SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 4),
            _buildAnimatedKeysBuilder(
              context,
              pinLength,
              isLoading,
            ),
            const Spacer(flex: 3),
            _buildKeyboard(
              verticalSpacing: MediaQuery.of(context).size.height / 45,
              context: context,
              pinLength: pinLength,
              isLoading: isLoading,
            ),
          ],
        ),
      );

  /// region Builders

  Widget _buildAnimatedKeysBuilder(
    BuildContext context,
    int pinLength,
    bool isLoading,
  ) =>
      AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => Align(
          alignment: Alignment(
            lerpDouble(-0.1, 0.1, _shakeTweenSequence.evaluate(_controller))!,
            0,
          ),
          child: child,
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          switchInCurve: Curves.easeOut,
          switchOutCurve: Curves.easeOut,
          transitionBuilder: (child, animation) {
            if (hasErrorText) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, -1),
                  end: const Offset(0, 0),
                ).animate(animation),
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            }

            return AnimatedSwitcher.defaultTransitionBuilder
                .call(child, animation);
          },
          child: hasErrorText && widget.error != null
              ? _buildErrorText(context, widget.error!)
              : RxBlocBuilder<PinCodeBlocType, int>(
                  state: (bloc) => bloc.states.placeholderDigitsCount,
                  builder: (context, totalDigitsCount, bloc) =>
                      _buildMaskedKeysRow(
                    context,
                    isShakeAnimation || isLoading
                        ? totalDigitsCount.data ?? 4
                        : pinLength,
                    isLoading,
                  ),
                ),
        ),
      );

  Widget _buildErrorText(BuildContext context, ErrorModel error) => Text(
        widget.translateError(error),
        style: context.pinCodeTheme.captionBold
            .copyWith(color: context.pinCodeTheme.pinCodeErrorTextColor),
      );

  Future<void> _startErrorAnimation() async {
    isShakeAnimation = true;
    await _controller.forward(from: 0);
    setState(() {
      hasErrorText = true;
      isShakeAnimation = false;
    });
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() {
        hasErrorText = false;
      });
    }
  }

  Widget _buildMaskedKeysRow(
    BuildContext context,
    int pinLength,
    bool isLoading,
  ) =>
      IntrinsicWidth(
        child: ShimmerWrapper(
          baseColor: context.pinCodeTheme.shimmerBaseColor,
          highlightColor: context.pinCodeTheme.shimmerHighlightColor,
          showShimmer: isLoading,
          child: _buildInLayout(pinLength),
        ),
      );

  Widget _buildInLayout(int pinLength) => pinLength <= _calculateRowLength()
      ? Row(
          children: _buildMaskedKeys(true, pinLength),
        )
      : SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: _calculateMaskSize(context),
                crossAxisSpacing: _getDistance(),
                mainAxisSpacing: _calculateMaskSize(context),
              ),
              children: _buildMaskedKeys(false, pinLength)),
        );

  List<Widget> _buildMaskedKeys(bool row, int pinLength) {
    List<Widget> widgets = [];
    for (int i = 0; i < pinLength; i++) {
      if (i != 0 && row) widgets.add(SizedBox(width: _getDistance()));
      widgets.add(_buildMaskedKey());
    }
    return widgets;
  }

  Widget _buildMaskedKey() => Container(
      width: _calculateMaskSize(context),
      height: _calculateMaskSize(context),
      decoration: BoxDecoration(
        border: Border.all(
          color: context.pinCodeTheme.pinKeyboardMaskedKeyBorderColor,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(_calculateMaskSize(context) / 2),
        color: context.pinCodeTheme.pinKeyboardMaskedKeyColor,
      ));

  double _getDistance() => context.pinCodeTheme.spacing1;

  double _calculateMaskSize(BuildContext context) {
    final size = MediaQuery.of(context).size.width / 15;
    if (size < 16) return 16;
    if (size > 32) return 32;
    return size;
  }

  int _calculateRowLength() {
    double itemWidth = _calculateMaskSize(context) + _getDistance();
    double availableWidth = MediaQuery.of(context).size.width * 0.8;
    return availableWidth ~/ itemWidth;
  }

  Widget _buildKeyboard({
    required double verticalSpacing,
    required BuildContext context,
    required int pinLength,
    bool isLoading = false,
  }) =>
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                3, (index) => _buildPinCodeKey(context, index, 1, isLoading)),
          ),
          SizedBox(height: verticalSpacing),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                3, (index) => _buildPinCodeKey(context, index, 4, isLoading)),
          ),
          SizedBox(height: verticalSpacing),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                3, (index) => _buildPinCodeKey(context, index, 7, isLoading)),
          ),
          SizedBox(height: verticalSpacing),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: calculateKeyboardButtonSize(context),
                width: calculateKeyboardButtonSize(context),
                child: Center(
                  child: Container(),
                ),
              ),
              _buildPinCodeKey(context, 0, 0, isLoading),
              _buildBiometricsButton(context, pinLength, isLoading),
            ],
          ),
        ],
      );

  Widget _buildPinCodeKey(
    BuildContext context,
    int index,
    int number,
    bool isLoading,
  ) =>
      PinCodeKey(
        number: index + number,
        isLoading: isLoading,
        onPressed: (key) {
          if (!authenticatedPin) {
            context.read<PinCodeBlocType>().events.addDigit(key.toString());
          }
        },
      );

  Widget _buildBiometricsButton(
    BuildContext context,
    int pinLength,
    bool isLoading,
  ) =>
      SizedBox(
        height: calculateKeyboardButtonSize(context),
        width: calculateKeyboardButtonSize(context),
        child: Center(
          child: widget.bottomRightKeyboardButton ??
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: RxBlocBuilder<PinCodeBlocType, bool>(
                  state: (bloc) => bloc.states.showBiometricsButton,
                  builder: (context, showButton, bloc) => _buildButtonContent(
                    context,
                    showButton.hasData && showButton.data!,
                    pinLength,
                    isLoading,
                  ),
                ),
              ),
        ),
      );

  Widget _buildButtonContent(
    BuildContext context,
    bool showBiometricsButton,
    int pinLength,
    bool isLoading,
  ) {
    if (pinLength > 0) {
      return PinCodeDeleteKey(
        isLoading: isLoading,
        onTap: () => context.read<PinCodeBlocType>().events.deleteDigit(),
      );
    } else if (showBiometricsButton) {
      return _buildEnableBiometricsButton(
        context,
        showBiometricsButton,
        isLoading,
      );
    }

    return Opacity(
      opacity: isLoading ? 0.5 : 1,
      child: _buildIconContent(
        context,
        showBiometricsButton,
        pinLength,
        isLoading,
      ),
    );
  }

  Widget _buildIconContent(
    BuildContext context,
    bool showBiometricsButton,
    int pin,
    bool isLoading,
  ) {
    if (pin > 0) {
      if (widget.deleteKeyButton != null) {
        return widget.deleteKeyButton!;
      } else {
        return PinCodeDeleteKey(
          isLoading: isLoading,
          onTap: () => context.read<PinCodeBlocType>().events.deleteDigit(),
        );
      }
    } else if (pin == 0) {
      return Container();
    } else if (showBiometricsButton) {
      return _buildEnableBiometricsButton(
        context,
        showBiometricsButton,
        isLoading,
      );
    }
    return Container();
  }

  Widget _buildEnableBiometricsButton(
    BuildContext context,
    bool showBiometricsButton,
    bool isLoading,
  ) =>
      (widget.biometricsLocalDataSource != null && showBiometricsButton)
          ? PinCodeBiometricKey(
              isLoading: isLoading,
              onPressedDefault: (_) => context
                  .read<PinCodeBlocType>()
                  .events
                  .biometricsButtonPressed(),
            )
          : Container();

  /// endregion

  /// region Callbacks

  void _onStateChanged(BuildContext context, BiometricsMessage? message) {
    if (message == null) {
      return;
    }

    _showBiometricsMessageBottomSheet(
      context,
      message,
      _localizeMessage(message),
    );
  }

  String _localizeMessage(BiometricsMessage message) =>
      widget.mapBiometricMessageToString?.call(message) ?? message.translate();

  Future<void> _showBiometricsMessageBottomSheet(
    BuildContext context,
    BiometricsMessage message,
    String localizedMessage,
  ) =>
      showBlurredBottomSheet(
        context: context,
        configuration: const ModalConfiguration(
          safeAreaBottom: false,
          showCloseButton: false,
        ),
        builder: (context) => Padding(
          padding: context.widgetToolkitTheme.bottomSheetPaddingAlternative,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MessagePanelWidget(
                message: localizedMessage,
                messageState: message.state(),
              ),
              Padding(
                padding:
                    context.widgetToolkitTheme.bottomSheetCloseButtonPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SmallButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icons.close,
                      type: SmallButtonType.outline,
                      colorStyle: ButtonColorStyle.fromContext(
                        context,
                        activeGradientColorStart: context.widgetToolkitTheme
                            .disabledFilledButtonBackgroundColor,
                        activeGradientColorEnd:
                            context.widgetToolkitTheme.primaryGradientEnd,
                      ),
                    ),
                    if (message == BiometricsMessage.notSetup)
                      SmallButton(
                        onPressed: () {
                          AppSettings.openAppSettings(
                            type: AppSettingsType.security,
                          );
                          Navigator.of(context).pop();
                        },
                        icon: Icons.settings,
                        type: SmallButtonType.outline,
                        colorStyle: ButtonColorStyle.fromContext(
                          context,
                          activeGradientColorStart: context.widgetToolkitTheme
                              .disabledFilledButtonBackgroundColor,
                          activeGradientColorEnd:
                              context.widgetToolkitTheme.primaryGradientEnd,
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
