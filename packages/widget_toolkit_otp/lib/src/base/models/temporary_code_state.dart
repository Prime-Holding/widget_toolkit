import 'package:flutter/cupertino.dart';

import '../utils/localized_strings.dart';

enum TemporaryCodeState {
  inactive,
  populated,
  correct,
  wrong,
  wrongTooManyRetries,
  loading,
  reset,
  disabled
}

extension TemporaryCodeTranslate on TemporaryCodeState {
  String translateToMessage(BuildContext context) {
    switch (this) {
      case TemporaryCodeState.correct:
        return context.getLocalizedStrings.codeStateCorrect;
      case TemporaryCodeState.wrong:
        return context.getLocalizedStrings.codeStateWrong;
      case TemporaryCodeState.disabled:
        return context.getLocalizedStrings.codeStateDisabled;
      default:
        return context.getLocalizedStrings.codeStateDefault;
    }
  }
}
