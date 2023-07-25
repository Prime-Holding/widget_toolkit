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
import '../models/biometrics_authentication_type.dart';
import 'auto_submit_widget.dart';
import 'pin_code_biometric_key_with_auto_submit.dart';
import 'pin_code_delete_key.dart';
import 'pin_code_key.dart';

class PinCodeComponent extends StatefulWidget {
  const PinCodeComponent({
    required this.translateError,
    required this.pinLength,
    required this.localizedReason,
    this.biometricsLocalDataSource,
    this.mapBiometricMessageToString,
    this.isAuthenticatedWithBiometrics,
    this.isPinCodeVerified,
    this.deleteKeyButton,
    this.bottomRightKeyboardButton,
    this.error,
    super.key,
  });

  /// Receives the error from bloc's error state
  final ErrorModel? error;

  /// The pin code length
  final int pinLength;

  /// The biometrics enabling reason
  final String localizedReason;

  /// Data source, which stores a flag if biometrics are enabled for the app.
  final BiometricsLocalDataSource? biometricsLocalDataSource;

  /// Handle the translation of the error from the errors stream
  final String Function(Object error) translateError;

  /// [mapBiometricMessageToString] will be used to translate the [BiometricsMessage]
  /// to human readable text and will be used into the default notification
  final String Function(BiometricsMessage message)? mapBiometricMessageToString;

  /// Called when a user is authenticated with biometrics successfully
  final void Function(bool)? isAuthenticatedWithBiometrics;

  /// Returns the verification state of the input from the pin code auto submit value.
  final void Function(bool)? isPinCodeVerified;

  /// Provide custom implementation for the most down left button. Do not forget
  /// to make it clickable. Default to LeftArrow.
  final PinCodeCustomKey? deleteKeyButton;

  /// Provide custom implementation for the most down right button. Do not forget
  /// to make it clickable.
  final PinCodeCustomKey? bottomRightKeyboardButton;

  @override
  State<PinCodeComponent> createState() => _PinCodeComponentState();
}

class _PinCodeComponentState extends State<PinCodeComponent>
    with SingleTickerProviderStateMixin {
  String pin = '';
  late AnimationController _controller;
  bool hasErrorText = false;
  bool isLoading = false;
  bool pinIsDeleted = false;

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
    _shakeTweenSequence.animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );
    super.initState();
  }

  @override
  void didUpdateWidget(covariant PinCodeComponent oldWidget) {
    if (widget.error != null && !isLoading) {
      _startErrorAnimation();
    }
    super.didUpdateWidget(oldWidget);
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
            state: (bloc) => bloc.states.isLoading,
            listener: (
              context,
              isLoadingSnapshot,
            ) {
              setState(() {
                isLoading = isLoadingSnapshot;
              });
            },
          ),
          RxBlocListener<PinCodeBlocType, bool>(
            state: (bloc) => bloc.states.isAuthenticatedWithBiometrics,
            listener: (context, isAuthenticated) {
              if (widget.isAuthenticatedWithBiometrics != null) {
                widget.isAuthenticatedWithBiometrics!(isAuthenticated);
              }
            },
          ),
          RxBlocListener<PinCodeBlocType, bool>(
            state: (bloc) => bloc.states.isPinCodeVerified,
            listener: (context, isPinCodeVerified) {
              if (widget.isPinCodeVerified != null) {
                widget.isPinCodeVerified!(isPinCodeVerified);
              }
            },
          ),
          RxBlocListener<PinCodeBlocType, BiometricsMessage?>(
            state: (bloc) => bloc.states.biometricsDialog,
            listener: _onStateChanged,
          ),
          _buildBuilders()
        ],
      );

  Widget _buildBuilders() => Expanded(
        child: RxBlocBuilder<PinCodeBlocType, bool>(
          state: (bloc) => bloc.states.isPinCodeInSecureStorage,
          builder: (context, isPinCodeInSecureStorage, bloc) =>
              RxBlocBuilder<PinCodeBlocType, bool>(
            state: (bloc) => bloc.states.areBiometricsEnabled,
            builder: (context, areBiometricsEnabled, bloc) =>
                RxBlocBuilder<PinCodeBlocType, List<BiometricsAuthType>>(
              state: (bloc) => bloc.states.availableBiometrics,
              builder: (context, availableBiometrics, bloc) => Container(
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
                child: _buildPageContent(
                  pinLength: widget.pinLength,
                  isPinCodeIsSecureStorage: isPinCodeInSecureStorage.hasData &&
                      isPinCodeInSecureStorage.data!,
                  context: context,
                  hasFingerScan: _hasBiometricsScan(areBiometricsEnabled,
                      availableBiometrics, BiometricsAuthType.fingerprint),
                  hasFaceScan: _hasBiometricsScan(areBiometricsEnabled,
                      availableBiometrics, BiometricsAuthType.face),
                  biometricsEnabled: areBiometricsEnabled.hasData
                      ? areBiometricsEnabled.data!
                      : false,
                ),
              ),
            ),
          ),
        ),
      );

  bool _hasBiometricsScan(
          AsyncSnapshot<bool> areBiometricsEnabled,
          AsyncSnapshot<List<BiometricsAuthType>> availableBiometrics,
          BiometricsAuthType type) =>
      areBiometricsEnabled.hasData &&
      areBiometricsEnabled.data! &&
      availableBiometrics.hasData &&
      availableBiometrics.data!.contains(type);

  Widget _buildPageContent({
    required int pinLength,
    required bool isPinCodeIsSecureStorage,
    required BuildContext context,
    required bool hasFingerScan,
    required bool hasFaceScan,
    required bool biometricsEnabled,
  }) =>
      SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 4),
            _buildAnimatedKeysBuilder(context, pinLength),
            const Spacer(flex: 3),
            _buildKeyboard(
              verticalSpacing: MediaQuery.of(context).size.height / 45,
              isPinCodeIsSecureStorage: isPinCodeIsSecureStorage,
              context: context,
              hasFingerScan: hasFingerScan,
              hasFaceScan: hasFaceScan,
              biometricsEnabled: biometricsEnabled,
              pinLength: pinLength,
            ),
          ],
        ),
      );

  /// region Builders

  Widget _buildAnimatedKeysBuilder(BuildContext context, int pinLength) =>
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
            } else {
              return AnimatedSwitcher.defaultTransitionBuilder
                  .call(child, animation);
            }
          },
          child: hasErrorText && widget.error is ErrorWrongPin
              ? _buildErrorText(context)
              : _buildMaskedKeysRow(context, pinLength),
        ),
      );

  Widget _buildErrorText(BuildContext context) => Text(
        widget.translateError((widget.error as ErrorWrongPin)),
        style: context.pinCodeTheme.captionBold
            .copyWith(color: context.pinCodeTheme.lightRed),
      );

  Future<void> _startErrorAnimation() async {
    await _controller.forward(from: 0);
    if (widget.error is ErrorWrongPin) {
      setState(() {
        hasErrorText = true;
      });
    }

    pin = '';
    if (widget.error is ErrorWrongPin) {
      await Future.delayed(const Duration(seconds: 2));
    }
    if (mounted) {
      setState(() {
        hasErrorText = false;
      });
    }
  }

  Widget _buildMaskedKeysRow(BuildContext context, int pinLength) =>
      IntrinsicWidth(
        child: isLoading
            ? ShimmerWrapper(
                baseColor: context.pinCodeTheme.shimmerBaseColor,
                highlightColor: context.pinCodeTheme.shimmerHighlightColor,
                showShimmer: true,
                child: _buildInLayout(pinLength),
              )
            : _buildInLayout(pinLength),
      );

  num _pinLength(int pinLength) =>
      pin.isEmpty && isLoading ? pinLength : pin.length;

  Widget _buildInLayout(int pinLength) => pin.length <= _calculateRowLength()
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
    for (var i = 0; i < _pinLength(pinLength); i++) {
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
    required bool isPinCodeIsSecureStorage,
    required BuildContext context,
    required bool hasFingerScan,
    required bool hasFaceScan,
    required bool biometricsEnabled,
    required int pinLength,
  }) =>
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                3,
                (index) => PinCodeKey(
                      number: index + 1,
                      isLoading: isLoading,
                      onPressed: (key) => _onKeyPressed(key, pinLength),
                    )),
          ),
          SizedBox(height: verticalSpacing),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                3,
                (index) => PinCodeKey(
                      number: index + 4,
                      isLoading: isLoading,
                      onPressed: (key) => _onKeyPressed(key, pinLength),
                    )),
          ),
          SizedBox(height: verticalSpacing),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                3,
                (index) => PinCodeKey(
                      number: index + 7,
                      isLoading: isLoading,
                      onPressed: (key) => _onKeyPressed(key, pinLength),
                    )),
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
              PinCodeKey(
                number: 0,
                isLoading: isLoading,
                onPressed: (key) => _onKeyPressed(key, pinLength),
              ),
              _buildBiometricsButton(context, isPinCodeIsSecureStorage,
                  hasFingerScan, hasFaceScan, biometricsEnabled, pinLength),
            ],
          ),
        ],
      );

  Widget _buildBiometricsButton(
          BuildContext context,
          bool isPinCodeIsSecureStorage,
          bool hasFingerScan,
          bool hasFaceScan,
          bool biometricsEnabled,
          int pinLength) =>
      SizedBox(
        height: calculateKeyboardButtonSize(context),
        width: calculateKeyboardButtonSize(context),
        child: Center(
          child: widget.bottomRightKeyboardButton ??
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _buildButtonContent(context, isPinCodeIsSecureStorage,
                    hasFingerScan, hasFaceScan, biometricsEnabled, pinLength),
              ),
        ),
      );

  Widget _buildButtonContent(
      BuildContext context,
      bool isPinCodeIsSecureStorage,
      bool hasFingerScan,
      bool hasFaceScan,
      bool biometricsEnabled,
      int pinLength) {
    if (widget.biometricsLocalDataSource == null) {
      if (pin.length == pinLength) {
        return AutoSubmitWidget(
          onAutoSubmit: () {
            context.read<PinCodeBlocType>().events.autoSubmit(pin);
            context.read<PinCodeBlocType>().events.checkPinCodeInStorage();
          },
          child: Container(),
        );
      }
      return Container();
    }
    if (!isPinCodeIsSecureStorage && pin.length == pinLength) {
      return AutoSubmitWidget(
        onAutoSubmit: () {
          context.read<PinCodeBlocType>().events.autoSubmit(pin);
          context.read<PinCodeBlocType>().events.checkPinCodeInStorage();
        },
        child: Opacity(
          opacity: isLoading ? 0.5 : 1,
          child: _buildIconContent(context, biometricsEnabled, hasFingerScan,
              hasFaceScan, isPinCodeIsSecureStorage, pinLength),
        ),
      );
    } else if (pin.isEmpty && isPinCodeIsSecureStorage) {
      if (hasFaceScan) {
        return _faceScanPinCodeKey(context);
      } else if (hasFingerScan) {
        return _fingerScanPinCodeKey(context);
      } else {
        return Opacity(
          opacity: isLoading ? 0.5 : 1,
          child: _buildIconContent(context, biometricsEnabled, hasFingerScan,
              hasFaceScan, isPinCodeIsSecureStorage, pinLength),
        );
      }
    } else if (pin.length == pinLength) {
      return AutoSubmitWidget(
        onAutoSubmit: () {
          context.read<PinCodeBlocType>().events.autoSubmit(pin);
          context.read<PinCodeBlocType>().events.checkPinCodeInStorage();
        },
        child: Opacity(
          opacity: isLoading ? 0.5 : 1,
          child: _buildIconContent(context, biometricsEnabled, hasFingerScan,
              hasFaceScan, isPinCodeIsSecureStorage, pinLength),
        ),
      );
    } else {
      return Opacity(
        opacity: isLoading ? 0.5 : 1,
        child: _buildIconContent(context, biometricsEnabled, hasFingerScan,
            hasFaceScan, isPinCodeIsSecureStorage, pinLength),
      );
    }
  }

  Widget _fingerScanPinCodeKey(BuildContext context) => AutoSubmitWidget(
        onAutoSubmit: () {
          context.read<PinCodeBlocType>().events.requestBiometricAuth('');
        },
        child: PinCodeKey(
          isFingerScan: true,
          isLoading: isLoading,
          onPressed: (_) => context
              .read<PinCodeBlocType>()
              .events
              .requestBiometricAuth(widget.localizedReason),
        ),
      );

  Widget _faceScanPinCodeKey(BuildContext context) =>
      PinCodeBiometricKeyWithAutoSubmit(
        startWithAutoSubmit: pinIsDeleted ? false : true,
        isFaceScan: true,
        isLoading: isLoading,
        autoSubmit: () {
          context
              .read<PinCodeBlocType>()
              .events
              .requestBiometricAuth(widget.localizedReason);
        },
        onPressedAutoSubmit: (_) {
          context
              .read<PinCodeBlocType>()
              .events
              .requestBiometricAuth(widget.localizedReason);
        },
        onPressedDefault: (_) {
          context
              .read<PinCodeBlocType>()
              .events
              .requestBiometricAuth(widget.localizedReason);
        },
      );

  Widget _buildIconContent(
      BuildContext context,
      bool biometricsEnabled,
      bool hasFingerScan,
      bool hasFaceScan,
      bool isPinCodeIsSecureStorage,
      int pinLength) {
    if (pin.isNotEmpty && (pin.length < pinLength)) {
      if (widget.deleteKeyButton != null) {
        return widget.deleteKeyButton!;
      } else {
        return PinCodeDeleteKey(
          isLoading: isLoading,
          onTap: _onDeletePressed,
        );
      }
    } else if (pin.length == pinLength) {
      if (biometricsEnabled && (hasFingerScan || hasFaceScan)) {
        return PinCodeKey(
          onPressed: (_) {
            context.read<PinCodeBlocType>().events.requestBiometricAuth('');
          },
          isLoading: isLoading,
          isFingerScan: hasFingerScan,
          isFaceScan: hasFaceScan,
        );
      } else if (isPinCodeIsSecureStorage) {
        return _buildEnableBiometricsButton(
          biometricsEnabled,
          context,
          isPinCodeIsSecureStorage,
          hasFaceScan,
          hasFingerScan,
        );
      }
      return Container();
    } else {
      return _buildEnableBiometricsButton(
        biometricsEnabled,
        context,
        isPinCodeIsSecureStorage,
        hasFaceScan,
        hasFingerScan,
      );
    }
  }

  Widget _buildEnableBiometricsButton(
    bool biometricsEnabled,
    BuildContext context,
    bool isPinCodeIsSecureStorage,
    bool hasFaceScan,
    bool hasFingerScan,
  ) =>
      (isPinCodeIsSecureStorage && (biometricsEnabled != true))
          ? PinCodeBiometricKeyWithAutoSubmit(
              autoSubmit: () => context
                  .read<PinCodeBlocType>()
                  .events
                  .requestBiometricAuth(widget.localizedReason),
              startWithAutoSubmit: false,
              isFaceScan: hasFaceScan,
              isFingerScan: hasFingerScan,
              isLoading: isLoading,
              onPressedAutoSubmit: (_) => context
                  .read<PinCodeBlocType>()
                  .events
                  .requestBiometricAuth(widget.localizedReason),
              onPressedDefault: (_) {
                context
                    .read<PinCodeBlocType>()
                    .events
                    .setBiometrics(true, widget.localizedReason);
              },
            )
          : Container();

  /// endregion

  /// region Callbacks

  void _onKeyPressed(int? key, int pinLength) => pin.length < pinLength
      ? setState(() {
          pin += key.toString();
          if (pinIsDeleted) {
            pinIsDeleted = false;
          }
        })
      : {};

  void _onDeletePressed() => pin.isNotEmpty
      ? setState(() {
          pin = pin.substring(0, pin.length - 1);
          if (pin.isEmpty) {
            pinIsDeleted = true;
          }
        })
      : null;

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
          padding: context.widgetToolkitTheme.mediumEdgeInsets,
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
