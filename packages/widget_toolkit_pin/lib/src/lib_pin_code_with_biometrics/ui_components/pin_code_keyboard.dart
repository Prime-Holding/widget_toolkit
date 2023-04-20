import 'dart:ui';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:widget_toolkit/theme_data.dart';
import 'package:widget_toolkit/ui_components.dart';
import 'package:widget_toolkit_biometrics/widget_toolkit_biometrics.dart';

import '../../../widget_toolkit_pin.dart';
import '../../base/extensions/error_model_translations.dart';
import '../../base/resources/app_constants.dart';
import '../../base/utils/utils.dart';
import '../di/pin_code_dependencies.dart';
import '../models/biometrics_authentication_type.dart';
import 'auto_submit_widget.dart';
import 'pin_code_biometric_key_with_auto_submit.dart';
import 'pin_code_delete_key.dart';
import 'pin_code_error_modal.dart';
import 'pin_code_key.dart';

/// This Widget builds custom numeric keyboard on the screen. It presents three
/// columns with numbers from 1 to 9 in three rows. Below them is the zero in the
/// middle and two customizable buttons in bought directions. To define them use
/// [deleteKeyButton] and/or [bottomRightKeyboardButton]. By default the
/// left button will be back arrow and whenever pressed, will delete the last
/// entered number. The right button will be submit button - enabled only if all
/// numbers are provided. If some biometrics are available and no one digit has been entered,
/// respective biometric icon will be displayed and clicking on the button will
/// return the native ID authentication workflow.
/// When the user submits the pin code, the widget should present to the user that
/// the pin verification is in progress. Over the masked pin a Shimmer will be
/// presented and buttons will change their appearance.
/// The pin code from the input is auto submitted once its length reaches [keyLength].
/// When the biometrics button on the bottom right is pressed an enable biometrics
/// question pops up after the permission is given the pressing of the button
/// triggers a biometrics scan.
class PinCodeKeyboard extends StatefulWidget {
  const PinCodeKeyboard({
    required this.keyLength,
    required this.pinCodeService,
    required this.biometricsLocalDataSource,
    this.autoApply = true,
    this.mapMessageToString,
    this.isAuthenticatedWithBiometrics,
    this.isPinCodeVerified,
    this.onChangePin,
    this.error,
    this.deleteKeyButton,
    this.bottomRightKeyboardButton,
    this.translatableStrings,
    this.errorModalConfiguration = const ErrorModalConfiguration(),
    Key? key,
  })  : assert(keyLength <= kPinMaxLength, 'max key length is 20'),
        super(key: key);

  final bool autoApply;

  /// [mapMessageToString] will be used to translate the [BiometricsMessage]
  /// to human readable text and will be used into the default notification
  final String Function(BiometricsMessage message)? mapMessageToString;

  /// Define how many numbers contains your key. Max 10 digits
  final int keyLength;

  /// Provides a contract to be implemented for the pin code related methods.
  final PinCodeService pinCodeService;

  /// Provides a contract to be implemented for the biometrics related methods.
  final BiometricsLocalDataSource biometricsLocalDataSource;

  /// Called when a user is authenticated with biometrics successfully
  final void Function(bool)? isAuthenticatedWithBiometrics;

  /// Returns the verification state of the input from the pin code auto submit value.
  final void Function(bool)? isPinCodeVerified;

  ///Reflects every change of the code
  final void Function()? onChangePin;

  /// Expects to receive ErrorPinAttemptsModel and will translate it. Otherwise
  /// a generic message will be displayed.
  final ErrorModel? error;

  /// Provide custom implementation for the most down left button. Do not forget
  /// to make it clickable. Default to LeftArrow.
  final PinCodeCustomKey? deleteKeyButton;

  /// Provide custom implementation for the most down right button. Do not forget
  /// to make it clickable.
  final PinCodeCustomKey? bottomRightKeyboardButton;

  /// Provide implementation of PrimePinLocalizedStrings if you want to change some default Strings ot make all of them translatable
  final PinLocalizedStrings? translatableStrings;

  /// Customize modal sheet appearance
  final ErrorModalConfiguration errorModalConfiguration;

  @override
  State<PinCodeKeyboard> createState() => _PinCodeKeyboardState();
}

class _PinCodeKeyboardState extends State<PinCodeKeyboard>
    with SingleTickerProviderStateMixin {
  String pin = '';
  late AnimationController _controller;
  bool hasErrorText = false;
  bool isLoading = false;
  static const String _activateBiometrics =
      'Activate the biometrics of your device';
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
  void didUpdateWidget(covariant PinCodeKeyboard oldWidget) {
    if (widget.error != null && !isLoading) {
      _startErrorAnimation();
    }

    WidgetsBinding.instance
        .addPostFrameCallback((_) => _showErrorDialogIfNeeded());

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ...PinCodeDependencies.from(
            pinCodeService: widget.pinCodeService,
            biometricsLocalDataSource: widget.biometricsLocalDataSource,
            translatableStrings: widget.translatableStrings,
          ).providers,
        ],
        child: Column(
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
        ),
      );

  /// todo test setBiometrics bloc event
  /// get the state of the are biometrics enabled for the app and
  /// if they are not available call setBiometrics with enable true
  void _onStateChanged(BuildContext context, BiometricsMessage? message) {
    if (message == null) {
      // the user canceled authentication
      return;
    }

    // if (onStateChanged == null) {
    _showBiometricsMessageBottomSheet(
      context,
      message,
      _localizeMessage(message),
    );
    // } else {
    //   onStateChanged!.call(context, message, _localizeMessage(message));
    // }
  }

  String _localizeMessage(BiometricsMessage message) =>
      widget.mapMessageToString?.call(message) ?? message.translate();

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
                          AppSettings.openSecuritySettings();
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

  Widget _buildBuilders() => Expanded(
        child: RxBlocBuilder<PinCodeBlocType, bool>(
          state: (bloc) => bloc.states.isPinCodeInSecureStorage,
          builder: (context, isPinCodeInSecureStorage, bloc) =>
              RxBlocBuilder<PinCodeBlocType, bool>(
            state: (bloc) => bloc.states.areBiometricsEnabled,
            builder: (context, areBiometricsEnabled, bloc) =>
                RxBlocBuilder<PinCodeBlocType, List<BiometricsAuthType>>(
              state: (bloc) => bloc.states.availableBiometrics,
              builder: (context, availableBiometrics, bloc) =>
                  _buildPageContent(
                isPinCodeIsSecureStorage: isPinCodeInSecureStorage.hasData &&
                    isPinCodeInSecureStorage.data!,
                context: context,
                hasFingerScan: areBiometricsEnabled.hasData &&
                    areBiometricsEnabled.data! &&
                    availableBiometrics.hasData &&
                    availableBiometrics.data!
                        .contains(BiometricsAuthType.fingerprint),
                hasFaceScan: areBiometricsEnabled.hasData &&
                    areBiometricsEnabled.data! &&
                    availableBiometrics.hasData &&
                    availableBiometrics.data!.contains(BiometricsAuthType.face),
                biometricsEnabled: areBiometricsEnabled.hasData
                    ? areBiometricsEnabled.data!
                    : false,
              ),
            ),
          ),
        ),
      );

  Widget _buildPageContent({
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
            Flexible(flex: 4, child: Container()),
            _buildAnimatedKeysAndErrorBuilder(context),
            Flexible(flex: 3, child: Container()),
            _buildKeyboard(
              verticalSpacing: MediaQuery.of(context).size.height / 45,
              isPinCodeIsSecureStorage: isPinCodeIsSecureStorage,
              context: context,
              hasFingerScan: hasFingerScan,
              hasFaceScan: hasFaceScan,
              biometricsEnabled: biometricsEnabled,
            ),
          ],
        ),
      );

  /// region Builders

  Widget _buildAnimatedKeysAndErrorBuilder(BuildContext context) =>
      AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => Align(
          alignment: Alignment(
            lerpDouble(-1, 1, _shakeTweenSequence.evaluate(_controller))!,
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
          child: hasErrorText && widget.error is! ErrorPinAttemptsModel
              ? _buildErrorText(context)
              : _buildMaskedKeysRow(context),
        ),
      );

  Widget _buildErrorText(BuildContext context) => Column(
        children: [
          context.pinCodeTheme.infoCircleIcon,
          SizedBox(height: context.pinCodeTheme.spacing2),
          Text(
            widget.error!.translate(context,
                translatableStrings: widget.translatableStrings),
            style: context.pinCodeTheme.pinKeyboardErrorTextStyle.copyWith(
                color: context.pinCodeTheme.pinKeyboardErrorTextColor),
          ),
        ],
      );

  Widget _buildMaskedKeysRow(BuildContext context) => IntrinsicWidth(
        child: isLoading
            ? Shimmer.fromColors(
                baseColor: context.pinCodeTheme.shimmerBaseColor,
                highlightColor: context.pinCodeTheme.shimmerHighlightColor,
                child: _buildInLayout(),
              )
            : _buildInLayout(),
      );

  num _pinLength() => pin.isEmpty && isLoading ? widget.keyLength : pin.length;

  Widget _buildInLayout() => pin.length <= _calculateRowLength()
      ? Row(
          children: _buildMaskedKeys(true),
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
              children: _buildMaskedKeys(false)),
        );

  List<Widget> _buildMaskedKeys(bool row) {
    List<Widget> widgets = [];
    for (var i = 0; i < _pinLength(); i++) {
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
                      onPressed: _onKeyPressed,
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
                      onPressed: _onKeyPressed,
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
                      onPressed: _onKeyPressed,
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
                onPressed: _onKeyPressed,
              ),
              _buildBiometricsButton(context, isPinCodeIsSecureStorage,
                  hasFingerScan, hasFaceScan, biometricsEnabled),
            ],
          ),
        ],
      );

  Widget _buildBiometricsButton(
          BuildContext context,
          bool isPinCodeIsSecureStorage,
          bool hasFingerScan,
          bool hasFaceScan,
          bool biometricsEnabled) =>
      SizedBox(
        height: calculateKeyboardButtonSize(context),
        width: calculateKeyboardButtonSize(context),
        child: Center(
          child: widget.bottomRightKeyboardButton ??
              _buildButtonSwitcher(
                isPinCodeIsSecureStorage: isPinCodeIsSecureStorage,
                context: context,
                hasFingerScan: hasFingerScan,
                hasFaceScan: hasFaceScan,
                biometricsEnabled: biometricsEnabled,
              ),
        ),
      );

  Widget _buildButtonSwitcher({
    required bool isPinCodeIsSecureStorage,
    required BuildContext context,
    required bool hasFingerScan,
    required bool hasFaceScan,
    required bool biometricsEnabled,
  }) =>
      AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _buildButtonContent(context, isPinCodeIsSecureStorage,
            hasFingerScan, hasFaceScan, biometricsEnabled),
      );

  Widget _buildButtonContent(
      BuildContext context,
      bool isPinCodeIsSecureStorage,
      bool hasFingerScan,
      bool hasFaceScan,
      bool biometricsEnabled) {
    if (!isPinCodeIsSecureStorage && pin.length == widget.keyLength) {
      return _buildAutoSubmitCallbackWidget(
        context,
        hasFingerScan,
        hasFaceScan,
        biometricsEnabled,
        isPinCodeIsSecureStorage,
      );
    } else if (pin.isEmpty && isPinCodeIsSecureStorage) {
      if (hasFaceScan) {
        return _faceScanPinCodeKey(context);
      } else if (hasFingerScan) {
        return _fingerScanPinCodeKey(context);
      } else {
        return _buildDefaultIcon(
            hasFingerScan: hasFingerScan,
            hasFaceScan: hasFaceScan,
            biometricsEnabled: biometricsEnabled,
            context: context,
            isPinCodeIsSecureStorage: isPinCodeIsSecureStorage);
      }
    } else if (pin.length == widget.keyLength) {
      return _buildAutoSubmitCallbackWidget(
        context,
        hasFingerScan,
        hasFaceScan,
        biometricsEnabled,
        isPinCodeIsSecureStorage,
      );
    } else {
      return _buildDefaultIcon(
          hasFingerScan: hasFingerScan,
          hasFaceScan: hasFaceScan,
          biometricsEnabled: biometricsEnabled,
          context: context,
          isPinCodeIsSecureStorage: isPinCodeIsSecureStorage);
    }
  }

  Widget _buildAutoSubmitCallbackWidget(
    BuildContext context,
    bool hasFingerScan,
    bool hasFaceScan,
    bool biometricsEnabled,
    bool isPinCodeIsSecureStorage,
  ) =>
      AutoSubmitWidget(
        onAutoSubmit: () {
          context.read<PinCodeBlocType>().events.autoSubmit(pin);
          context.read<PinCodeBlocType>().events.checkPinCodeInStorage();
        },
        child: _buildDefaultIcon(
          hasFingerScan: hasFingerScan,
          hasFaceScan: hasFaceScan,
          biometricsEnabled: biometricsEnabled,
          context: context,
          isPinCodeIsSecureStorage: isPinCodeIsSecureStorage,
        ),
      );

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
              .requestBiometricAuth(_activateBiometrics),
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
              .requestBiometricAuth(_activateBiometrics);
        },
        onPressedAutoSubmit: (_) {
          context
              .read<PinCodeBlocType>()
              .events
              .requestBiometricAuth(_activateBiometrics);
        },
        onPressedDefault: (_) {
          context
              .read<PinCodeBlocType>()
              .events
              .requestBiometricAuth(_activateBiometrics);
        },
      );

  Widget _buildDefaultIcon({
    required bool hasFingerScan,
    required bool hasFaceScan,
    required bool biometricsEnabled,
    required BuildContext context,
    required bool isPinCodeIsSecureStorage,
  }) =>
      Opacity(
        opacity: isLoading ? 0.5 : 1,
        child: _buildIconContent(context, biometricsEnabled, hasFingerScan,
            hasFaceScan, isPinCodeIsSecureStorage),
      );

  Widget _buildIconContent(BuildContext context, bool biometricsEnabled,
      bool hasFingerScan, bool hasFaceScan, bool isPinCodeIsSecureStorage) {
    if (pin.isNotEmpty && (pin.length < widget.keyLength)) {
      if (widget.deleteKeyButton != null) {
        return widget.deleteKeyButton!;
      } else {
        return _buildPinCodeDeleteKey();
      }
    } else if (pin.length == widget.keyLength) {
      if (biometricsEnabled && (hasFingerScan || hasFaceScan)) {
        return _buildTriggerBiometricsButton(
            context, hasFingerScan, hasFaceScan);
      } else if (isPinCodeIsSecureStorage) {
        return _buildEnableBiometricsButton(
          biometricsEnabled,
          context,
          isPinCodeIsSecureStorage,
          hasFaceScan,
          hasFingerScan,
        );
      } else {
        return Container();
      }
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

  Widget _buildTriggerBiometricsButton(
          BuildContext context, bool hasFingerScan, bool hasFaceScan) =>
      PinCodeKey(
        onPressed: (_) {
          context.read<PinCodeBlocType>().events.requestBiometricAuth('');
        },
        isLoading: isLoading,
        isFingerScan: hasFingerScan,
        isFaceScan: hasFaceScan,
      );

  PinCodeDeleteKey _buildPinCodeDeleteKey() => PinCodeDeleteKey(
        isLoading: isLoading,
        onTap: _onDeletePressed,
      );

  Widget _buildEnableBiometricsButton(
    bool biometricsEnabled,
    BuildContext context,
    bool isPinCodeIsSecureStorage,
    bool hasFaceScan,
    bool hasFingerScan,
  ) {
    if (isPinCodeIsSecureStorage && (biometricsEnabled != true)) {
      // This builds the enable biometrics button
      return PinCodeBiometricKeyWithAutoSubmit(
        autoSubmit: () => context
            .read<PinCodeBlocType>()
            .events
            .requestBiometricAuth(_activateBiometrics),
        startWithAutoSubmit: false,
        isFaceScan: hasFaceScan,
        isFingerScan: hasFingerScan,
        isLoading: isLoading,
        onPressedAutoSubmit: (_) => context
            .read<PinCodeBlocType>()
            .events
            .requestBiometricAuth(_activateBiometrics),
        onPressedDefault: (_) {
          context
              .read<PinCodeBlocType>()
              .events
              .setBiometrics(true, _activateBiometrics);
        },
      );
    } else {
      return Container();
    }
  }

  /// endregion

  /// region Callbacks

  void _onKeyPressed(int? key) => pin.length < widget.keyLength
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

  Future<void> _startErrorAnimation() async {
    await _controller.forward(from: 0);
    if (widget.error is! ErrorPinAttemptsModel) {
      setState(() {
        hasErrorText = true;
      });
    }

    pin = '';
    if (widget.error is! ErrorPinAttemptsModel) {
      await Future.delayed(const Duration(seconds: 2));
    }
    if (mounted) {
      setState(() {
        hasErrorText = false;
      });
    }
  }

  void _showErrorDialogIfNeeded() {
    if (widget.error is! ErrorPinAttemptsModel) return;
    // The user should be logged out from the auth interceptor
    // and this dialog should be opened from the landing page
    if ((widget.error as ErrorPinAttemptsModel).remainingAttempts == 0) return;

    showPinCodeErrorModal(context,
        error: widget.error! as ErrorPinAttemptsModel,
        hasRetryButton:
            (widget.error! as ErrorPinAttemptsModel).remainingAttempts == 0,
        onChangePinTap: widget.onChangePin,
        translatableStrings: widget.translatableStrings,
        modalConfiguration: widget.errorModalConfiguration);
  }

  /// endregion
}
