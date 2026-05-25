import 'package:flutter/material.dart';

import '../base/models/temporary_code_state.dart';

/// Controls [SmsCodeField] programmatically — for example to clear digits after
/// a failed verification or before showing a fresh code entry step.
///
/// Pass the same instance to [SmsCodeField.smsCodeFieldController]. The field
/// attaches it during [State.didChangeDependencies] and detaches it in
/// [State.dispose], so [hasClients] is `true` only while the widget is mounted.
///
/// ```dart
/// final smsCodeFieldController = SmsCodeFieldController();
///
/// SmsCodeField(smsCodeFieldController: smsCodeFieldController);
///
/// // After a failed attempt:
/// smsCodeFieldController.reset();
/// ```
class SmsCodeFieldController {
  TextEditingController? _textController;
  void Function(TemporaryCodeState state)? _setBlocState;

  /// Whether this controller is currently attached to a mounted [SmsCodeField].
  ///
  /// [clear] and [reset] have no effect when this is `false`.
  bool get hasClients => _textController != null;

  /// Clears the entered PIN without changing bloc verification state.
  ///
  /// Use [reset] when you also need to clear error styling via [SmsCodeBloc].
  void clear() => _textController?.clear();

  /// Clears the entered PIN and sets verification state to [TemporaryCodeState.inactive]
  /// when the field uses [SmsCodeField.useInternalCommunication].
  ///
  /// When [notifyBloc] is `false`, only the text is cleared (same as [clear]).
  /// Set [notifyBloc] to `false` in standalone mode where no [SmsCodeBloc] is
  /// provided.
  void reset({bool notifyBloc = true}) {
    clear();
    if (notifyBloc) {
      _setBlocState?.call(TemporaryCodeState.inactive);
    }
  }

  /// Links this controller to the given [SmsCodeField] state.
  ///
  /// Called automatically by [SmsCodeField]; do not invoke from application code.
  /// [textController] is the PIN [TextEditingController] owned by the field.
  /// [setBlocState] forwards state updates to [SmsCodeBloc] when internal
  /// communication is enabled, or is `null` in standalone mode.
  void bind({
    required TextEditingController textController,
    void Function(TemporaryCodeState state)? setBlocState,
  }) {
    _textController = textController;
    _setBlocState = setBlocState;
  }

  /// Releases the link created by [bind].
  ///
  /// Called automatically when [SmsCodeField] is disposed or when
  /// [SmsCodeField.smsCodeFieldController] changes. After this, [hasClients]
  /// is `false` until the field mounts again.
  void unbind() {
    _textController = null;
    _setBlocState = null;
  }
}
