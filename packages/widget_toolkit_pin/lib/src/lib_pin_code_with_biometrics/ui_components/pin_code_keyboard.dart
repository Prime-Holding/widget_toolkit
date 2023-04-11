import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:widget_toolkit_biometrics/widget_toolkit_biometrics.dart';

import '../../../widget_toolkit_pin.dart';
import '../../base/extensions/error_model_translations.dart';
import '../../base/resources/app_constants.dart';
import '../../base/utils/utils.dart';
import '../di/pin_code_dependencies.dart';
import '../models/biometrics_authentication_type.dart';
import 'callback_widget.dart';
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
class PinCodeKeyboard extends StatefulWidget {
  const PinCodeKeyboard._({
    required this.onApplyPressed,
    required this.keyLength,
    this.pinCodeService,
    this.biometricsLocalDataSource,
    this.isLoading = false,
    this.isConfirmPage = false,
    this.hasFingerScan = false,
    this.hasFaceScan = false,
    this.onBiometricsPressed,
    this.onChangePin,
    this.error,
    this.deleteKeyButton,
    this.bottomRightKeyboardButton,
    this.translatableStrings,
    this.errorModalConfiguration = const ErrorModalConfiguration(),
    Key? key,
  })  : assert(keyLength <= kPinMaxLength, 'max key length is 20'),
        super(key: key);

  factory PinCodeKeyboard.generic({
    required int keyLength,
    required void Function(String) onApplyPressed,
    bool isLoading = false,
    bool isConfirmPage = false,
    bool hasFingerScan = false,
    bool hasFaceScan = false,
    VoidCallback? onBiometricsPressed,
    void Function()? onChangePin,
    ErrorModel? error,
    PinCodeCustomKey? bottomLeftKeyboardButton,
    PinCodeCustomKey? bottomRightKeyboardButton,
    PinLocalizedStrings? translatableStrings,
    ErrorModalConfiguration errorModalConfiguration =
        const ErrorModalConfiguration(),
    Key? key,
  }) =>
      PinCodeKeyboard._(
        keyLength: keyLength,
        onApplyPressed: onApplyPressed,
        isLoading: isLoading,
        isConfirmPage: isConfirmPage,
        onChangePin: onChangePin,
        error: error,
        deleteKeyButton: bottomLeftKeyboardButton,
        bottomRightKeyboardButton: bottomRightKeyboardButton,
        translatableStrings: translatableStrings,
        errorModalConfiguration: errorModalConfiguration,
        hasFingerScan: hasFingerScan,
        hasFaceScan: hasFaceScan,
        onBiometricsPressed: onBiometricsPressed,
        key: key,
      );

  static Widget withBiometrics({
    required int keyLength,
    required PinCodeService pinCodeService,
    required BiometricsLocalDataSource biometricsLocalDataSource,
    required Function(String) onApplyPressed,
    bool isLoading = false,
    bool isConfirmPage = false,
    void Function()? onChangePin,
    ErrorModel? error,
    PinCodeCustomKey? bottomLeftKeyboardButton,
    PinCodeCustomKey? bottomRightKeyboardButton,
    PinLocalizedStrings? translatableStrings,
    ErrorModalConfiguration errorModalConfiguration =
        const ErrorModalConfiguration(),
    Key? key,
  }) =>
      MultiProvider(
        providers: [
          ...PinCodeDependencies.from(
            pinCodeService: pinCodeService,
            biometricsLocalDataSource: biometricsLocalDataSource,
            translatableStrings: translatableStrings,
          ).providers,
        ],
        child: Column(
          children: [
            RxBlocListener<PinCodeBlocType, String?>(
                state: (bloc) => bloc.states.pinFromBiometricAuthentication,
                listener: (context, pin) {
                  if (pin != null) {
                    onApplyPressed.call(pin);
                  }
                }),
            Expanded(
              child: RxBlocBuilder<PinCodeBlocType, bool>(
                state: (bloc) => bloc.states.areBiometricsEnabled,
                builder: (context, isEnabled, bloc) =>
                    RxBlocBuilder<PinCodeBlocType, List<BiometricsAuthType>>(
                  state: (bloc) => bloc.states.availableBiometrics,
                  builder: (context, availableBiometrics, bloc) =>
                      PinCodeKeyboard._(
                    pinCodeService: pinCodeService,
                    biometricsLocalDataSource: biometricsLocalDataSource,
                    keyLength: keyLength,
                    onApplyPressed: onApplyPressed,
                    isLoading: isLoading,
                    isConfirmPage: isConfirmPage,
                    onChangePin: onChangePin,
                    error: error,
                    deleteKeyButton: bottomLeftKeyboardButton,
                    bottomRightKeyboardButton: bottomRightKeyboardButton,
                    translatableStrings: translatableStrings,
                    errorModalConfiguration: errorModalConfiguration,
                    hasFingerScan: isEnabled.hasData &&
                        isEnabled.data! &&
                        availableBiometrics.hasData &&
                        availableBiometrics.data!
                            .contains(BiometricsAuthType.fingerprint),
                    hasFaceScan: isEnabled.hasData &&
                        isEnabled.data! &&
                        availableBiometrics.hasData &&
                        availableBiometrics.data!
                            .contains(BiometricsAuthType.face),
                    onBiometricsPressed: () {
                      print('onBiometricsPressed1');
                      bloc.events.requestBiometricAuth(
                          translatableStrings?.enterPinWithBiometrics ??
                              context.getPinLocalizedStrings
                                  .enterPinWithBiometrics);
                    },
                    key: key,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  /// Define how many numbers contains your key. Max 10 digits
  final int keyLength;

  final PinCodeService? pinCodeService;

  final BiometricsLocalDataSource? biometricsLocalDataSource;

  /// When the user submit the key, the widget should present to the user that
  /// the pin verification is in progress. Over the masked pin a Shimmer will be
  /// presented and buttons will change their appearance.
  final bool isLoading;

  /// This flag triggers the icon of the confirm button to present if the page
  /// is used to verify a pin code or is the first step of creating a new code
  /// and the user will need to confirm the pin once again.
  final bool isConfirmPage;

  /// If the authentication button will present finger print icon
  final bool hasFingerScan;

  /// If the authentication button will present face icon
  final bool hasFaceScan;

  /// Define what you want to do with the code once it is submitted
  final void Function(String) onApplyPressed;

  /// You may define different function in case ID authentication have been used.
  /// Triggered when the biometrics button on the bottom right is pressed.
  final VoidCallback? onBiometricsPressed;

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
    if (widget.error != null && !widget.isLoading) {
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
  Widget build(BuildContext context) => SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(flex: 4, child: Container()),
            _buildAnimatedKeysAndErrorBuilder(context),
            Flexible(flex: 3, child: Container()),
            _buildKeyboard(
                verticalSpacing: MediaQuery.of(context).size.height / 45),
          ],
        ),
      );

  /// region Builders

  Widget _buildAnimatedKeysAndErrorBuilder(BuildContext context) =>
      AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Align(
            alignment: Alignment(
              lerpDouble(-1, 1, _shakeTweenSequence.evaluate(_controller))!,
              0,
            ),
            child: child,
          );
        },
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
          context.primePinTheme.infoCircleIcon,
          SizedBox(height: context.primePinTheme.spacing2),
          Text(
            widget.error!.translate(context,
                translatableStrings: widget.translatableStrings),
            style: context.primePinTheme.pinKeyboardErrorTextStyle.copyWith(
                color: context.primePinTheme.pinKeyboardErrorTextColor),
          ),
        ],
      );

  Widget _buildMaskedKeysRow(BuildContext context) => IntrinsicWidth(
        child: widget.isLoading
            ? Shimmer.fromColors(
                baseColor: context.primePinTheme.shimmerBaseColor,
                highlightColor: context.primePinTheme.shimmerHighlightColor,
                child: _buildInLayout(),
              )
            : _buildInLayout(),
      );

  num _pinLength() =>
      pin.isEmpty && widget.isLoading ? widget.keyLength : pin.length;

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
          color: context.primePinTheme.pinKeyboardMaskedKeyBorderColor,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(_calculateMaskSize(context) / 2),
        color: context.primePinTheme.pinKeyboardMaskedKeyColor,
      ));

  double _getDistance() => context.primePinTheme.spacing1;

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
  }) =>
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                3,
                (index) => PinCodeKey(
                      number: index + 1,
                      isLoading: widget.isLoading,
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
                      isLoading: widget.isLoading,
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
                      isLoading: widget.isLoading,
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
                isLoading: widget.isLoading,
                onPressed: _onKeyPressed,
              ),
              SizedBox(
                height: calculateKeyboardButtonSize(context),
                width: calculateKeyboardButtonSize(context),
                child: Center(
                  child:
                      widget.bottomRightKeyboardButton ?? _buildApplyButton(),
                ),
              ),
            ],
          ),
        ],
      );

  Widget _buildApplyButton() => AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: pin.isEmpty
            ? widget.hasFaceScan
                ? PinCodeKey(
                    isFaceScan: true,
                    isLoading: widget.isLoading,
                    onPressed: (_) {
                      print('onPressed 1');
                      return widget.onBiometricsPressed?.call();
                    },
                  )
                : widget.hasFingerScan
                    ? PinCodeKey(
                        isFingerScan: true,
                        isLoading: widget.isLoading,
                        onPressed: (_) {
                          print('onPressed 2');
                          return widget.onBiometricsPressed?.call();
                        },
                      )
                    : _buildApplyIcon()
            : pin.length == widget.keyLength
                ? CallbackWidget(
                    onCreated: (pin) => widget.onApplyPressed(pin),
                    child: _buildApplyIcon(
                      isEnabled: true,
                    ),
                  )
                : _buildApplyIcon(),
      );

  Widget _buildApplyIcon({bool isEnabled = false}) => Opacity(
        opacity: widget.isLoading ? 0.5 : 1,
        child: widget.isConfirmPage
            ? isEnabled
                ? context.primePinTheme.pinCheckEnabledIcon
                : context.primePinTheme.pinCheckDisabledIcon
            : pin.isNotEmpty
                ? widget.deleteKeyButton ??
                    PinCodeDeleteKey(
                      isLoading: widget.isLoading,
                      onTap: _onDeletePressed,
                    )
                : (widget.hasFingerScan || widget.hasFaceScan)
                    ? PinCodeKey(
                        number: -12,
                        /// TODO implement onPressed
                        onPressed: (n) {
                          print('TODO TRIGGER biometrics');
                        },
                        isLoading: widget.isLoading,
                        isFingerScan: widget.hasFingerScan,
                        isFaceScan: widget.hasFaceScan,
                      )
                    : PinCodeCustomKey(
                        buildChild: (buildChild) => Container(), onTap: () {}),
      );

  /// endregion

  /// region Callbacks

  void _onKeyPressed(int? key) => pin.length < widget.keyLength
      ? setState(() {
          pin += key.toString();
        })
      : {};

  void _onDeletePressed() => pin.isNotEmpty
      ? setState(() {
          pin = pin.substring(0, pin.length - 1);
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
