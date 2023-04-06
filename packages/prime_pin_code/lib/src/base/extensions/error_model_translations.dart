import 'package:flutter/widgets.dart';

import '../models/error/error_model.dart';
import '../resources/pin_localized_strings.dart';

extension ErrorModelX on ErrorModel {
  /// Translate the business error to a user friendly message
  /// based on the error type
  String translate(BuildContext context,
      {PinLocalizedStrings? translatableStrings}) {
    if (this is ErrorPinAttemptsModel) {
      return (this as ErrorPinAttemptsModel)
          .translateMessage(context, translatableStrings: translatableStrings);
    }
    return translatableStrings?.genericErrorMessage ??
        context.getPinLocalizedStrings.genericErrorMessage;
  }
}

extension ErrorPinAttemptsModelX on ErrorPinAttemptsModel {
  String translate(BuildContext context,
      {PinLocalizedStrings? translatableStrings}) {
    if (remainingAttempts > 1) {
      return translatableStrings
              ?.errorPinXAttemptsLeft(remainingAttempts.toString()) ??
          context.getPinLocalizedStrings
              .errorPinXAttemptsLeft(remainingAttempts.toString());
    } else if (remainingAttempts == 1) {
      return translatableStrings?.errorPinOneAttemptLeft ??
          context.getPinLocalizedStrings.errorPinOneAttemptLeft;
    } else {
      return translatableStrings?.errorPinNoAttemptsLeft ??
          context.getPinLocalizedStrings.errorPinNoAttemptsLeft;
    }
  }

  String translateMessage(BuildContext context,
      {PinLocalizedStrings? translatableStrings}) {
    if (remainingAttempts > 1) {
      return translatableStrings
              ?.errorPinXAttemptsLeft(remainingAttempts.toString()) ??
          context.getPinLocalizedStrings
              .errorPinXAttemptsLeft(remainingAttempts.toString());
    } else if (remainingAttempts == 1) {
      return translatableStrings?.errorPinOneAttemptLeft ??
          context.getPinLocalizedStrings.errorPinOneAttemptLeft;
    } else {
      return translatableStrings?.errorPinNoAttemptsLeft ??
          context.getPinLocalizedStrings.errorPinNoAttemptsLeft;
    }
  }
}
