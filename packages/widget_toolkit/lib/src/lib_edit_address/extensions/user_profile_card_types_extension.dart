import 'package:flutter/material.dart';

import '../../../edit_address.dart';

extension UserProfileCardTypesX on UserProfileCardTypes {
  Color getColor(BuildContext context) {
    switch (this) {
      case UserProfileCardTypes.permanentAddress:
        return context.editAddressTheme.iconColorPrimary;
      case UserProfileCardTypes.mailingAddress:
      case UserProfileCardTypes.email:
      case UserProfileCardTypes.phone:
        return context.editAddressTheme.iconColorSecondary;
    }
  }
}
