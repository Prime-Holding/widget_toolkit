// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'sms_code_bloc.dart';

/// Used as a contractor for the bloc, events and states classes
/// {@nodoc}
abstract class SmsCodeBlocType extends RxBlocTypeBase {
  SmsCodeBlocEvents get events;
  SmsCodeBlocStates get states;
}

/// [$SmsCodeBloc] extended by the [SmsCodeBloc]
/// {@nodoc}
abstract class $SmsCodeBloc extends RxBlocBase
    implements SmsCodeBlocEvents, SmsCodeBlocStates, SmsCodeBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// Тhe [Subject] where events sink to by calling [updatePhoneNumber]
  final _$updatePhoneNumberEvent = PublishSubject<String>();

  /// Тhe [Subject] where events sink to by calling [getPhoneNumber]
  final _$getPhoneNumberEvent = PublishSubject<void>();

  /// Тhe [Subject] where events sink to by calling [verifyCode]
  final _$verifyCodeEvent = PublishSubject<String>();

  /// Тhe [Subject] where events sink to by calling [sendNewCode]
  final _$sendNewCodeEvent = PublishSubject<void>();

  /// Тhe [Subject] where events sink to by calling [setResult]
  final _$setResultEvent = PublishSubject<dynamic>();

  /// Тhe [Subject] where events sink to by calling [setTemporaryCodeState]
  final _$setTemporaryCodeStateEvent = PublishSubject<TemporaryCodeState>();

  /// Тhe [Subject] where events sink to by calling [reset]
  final _$resetEvent = PublishSubject<bool>();

  /// Тhe [Subject] where events sink to by calling [codeSent]
  final _$codeSentEvent = BehaviorSubject<bool>.seeded(false);

  /// Тhe [Subject] where events sink to by calling [enableResendButton]
  final _$enableResendButtonEvent = PublishSubject<void>();

  /// The state of [isLoading] implemented in [_mapToIsLoadingState]
  late final Stream<bool> _isLoadingState = _mapToIsLoadingState();

  /// The state of [errors] implemented in [_mapToErrorsState]
  late final Stream<ErrorModel?> _errorsState = _mapToErrorsState();

  /// The state of [phoneNumber] implemented in [_mapToPhoneNumberState]
  late final Stream<String> _phoneNumberState = _mapToPhoneNumberState();

  /// The state of [validityTime] implemented in [_mapToValidityTimeState]
  late final Stream<int> _validityTimeState = _mapToValidityTimeState();

  /// The state of [resendButtonThrottleTime] implemented in
  /// [_mapToResendButtonThrottleTimeState]
  late final Stream<int> _resendButtonThrottleTimeState =
      _mapToResendButtonThrottleTimeState();

  /// The state of [isSendNewCodeEnabled] implemented in
  /// [_mapToIsSendNewCodeEnabledState]
  late final Stream<Result<bool>> _isSendNewCodeEnabledState =
      _mapToIsSendNewCodeEnabledState();

  /// The state of [sentNewCode] implemented in [_mapToSentNewCodeState]
  late final Stream<bool> _sentNewCodeState = _mapToSentNewCodeState();

  /// The state of [onCodeVerificationResult] implemented in
  /// [_mapToOnCodeVerificationResultState]
  late final Stream<TemporaryCodeState> _onCodeVerificationResultState =
      _mapToOnCodeVerificationResultState();

  /// The state of [result] implemented in [_mapToResultState]
  late final Stream<dynamic> _resultState = _mapToResultState();

  /// The state of [pinLength] implemented in [_mapToPinLengthState]
  late final Stream<int> _pinLengthState = _mapToPinLengthState();

  @override
  void updatePhoneNumber(String number) => _$updatePhoneNumberEvent.add(number);

  @override
  void getPhoneNumber() => _$getPhoneNumberEvent.add(null);

  @override
  void verifyCode(String tempCode) => _$verifyCodeEvent.add(tempCode);

  @override
  void sendNewCode() => _$sendNewCodeEvent.add(null);

  @override
  void setResult(dynamic result) => _$setResultEvent.add(result);

  @override
  void setTemporaryCodeState(TemporaryCodeState state) =>
      _$setTemporaryCodeStateEvent.add(state);

  @override
  void reset({bool stopCounter = false}) => _$resetEvent.add(stopCounter);

  @override
  void codeSent(bool isSent) => _$codeSentEvent.add(isSent);

  @override
  void enableResendButton() => _$enableResendButtonEvent.add(null);

  @override
  Stream<bool> get isLoading => _isLoadingState;

  @override
  Stream<ErrorModel?> get errors => _errorsState;

  @override
  Stream<String> get phoneNumber => _phoneNumberState;

  @override
  Stream<int> get validityTime => _validityTimeState;

  @override
  Stream<int> get resendButtonThrottleTime => _resendButtonThrottleTimeState;

  @override
  Stream<Result<bool>> get isSendNewCodeEnabled => _isSendNewCodeEnabledState;

  @override
  Stream<bool> get sentNewCode => _sentNewCodeState;

  @override
  Stream<TemporaryCodeState> get onCodeVerificationResult =>
      _onCodeVerificationResultState;

  @override
  Stream<dynamic> get result => _resultState;

  @override
  Stream<int> get pinLength => _pinLengthState;

  Stream<bool> _mapToIsLoadingState();

  Stream<ErrorModel?> _mapToErrorsState();

  Stream<String> _mapToPhoneNumberState();

  Stream<int> _mapToValidityTimeState();

  Stream<int> _mapToResendButtonThrottleTimeState();

  Stream<Result<bool>> _mapToIsSendNewCodeEnabledState();

  Stream<bool> _mapToSentNewCodeState();

  Stream<TemporaryCodeState> _mapToOnCodeVerificationResultState();

  Stream<dynamic> _mapToResultState();

  Stream<int> _mapToPinLengthState();

  @override
  SmsCodeBlocEvents get events => this;

  @override
  SmsCodeBlocStates get states => this;

  @override
  void dispose() {
    _$updatePhoneNumberEvent.close();
    _$getPhoneNumberEvent.close();
    _$verifyCodeEvent.close();
    _$sendNewCodeEvent.close();
    _$setResultEvent.close();
    _$setTemporaryCodeStateEvent.close();
    _$resetEvent.close();
    _$codeSentEvent.close();
    _$enableResendButtonEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}
