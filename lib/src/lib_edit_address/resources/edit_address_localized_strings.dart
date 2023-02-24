import 'package:flutter/cupertino.dart';

/// Use this class to translate all labels used in the package. If skip it,
/// default values in English will be used.
/// See the default values in the comments above each method
///
/// [cardFieldLabel] is the text displayed inside the app shimmer text
///
/// [saveButtonText] is the text displayed inside the button at the bottom of the
/// edit address page
///
/// [headerTitle] is the text displayed at the top of the edit address page and
/// at the top of the permanent address page
///
/// [permanentAddressContentMessage] is the text message displayed inside the
/// permanent address page
///
/// [countrySearchPickerTitle] is the text at the top of the country search picker page.
///
/// [countrySearchPickerHintText] is the text in the country search page, text input field.
///
/// [countrySearchPickerRetryText] is a text displayed in retry button, which is displayed, when
/// there is an exception on the country search page.
///
/// [countryLabelText] the label text for the country widget.
///
/// [cityButtonText] is text in the button inside the edit city page.
///
/// [cityLabelText] is the label text of the city widget.
///
/// [cityEmptyLabel] is a value displayed if there is a null value provided for the city name.
///
/// [addressButtonText] is a text inside button in the page with the address edit input field.
///
/// [addressLabelText] is a label text displayed on the address widget.
///
/// [addressEmptyLabel] is value displayed if there is a null value provided for the address name.
///
/// [addressChangedMessage] is a message displayed, when an address is changed successfully.
class EditAddressLocalizedStrings {
  const EditAddressLocalizedStrings(this.context);

  EditAddressLocalizedStrings._(this.context);

  factory EditAddressLocalizedStrings.of(context) => _instance != null
      ? _instance!
      : _instance = EditAddressLocalizedStrings._(context);

  static EditAddressLocalizedStrings? _instance;

  final BuildContext context;

  /// Default value 'Choose country'
  String get countrySearchPickerTitle => 'Choose country';

  /// Default value 'Search by country name'
  String get countrySearchPickerHintText => 'Search by country name';

  /// Default value 'Retry'
  String get countrySearchPickerRetryText => 'Retry';

  /// Default value 'Country'
  String get countryLabelText => 'Country';

  /// Default value 'Save'
  String get cityButtonText => 'Save';

  /// Default value 'City'
  String get cityLabelText => 'City';

  /// Default value 'Add city'
  String get cityEmptyLabel => 'Add city';

  /// Default value 'Save'
  String get addressButtonText => 'Save';

  /// Default value 'Address'
  String get addressLabelText => 'Address';

  /// Default value 'Add address'
  String get addressEmptyLabel => 'Add address';

  /// Default value 'You\'ve successfully changed your address data'
  String get addressChangedMessage =>
      'You\'ve successfully changed your address data';

  /// Default value 'Contact Address'
  String get cardFieldLabel => 'Contact Address';

  /// Default value 'Save'
  String get saveButtonText => 'Save';

  /// Default value 'Contact Address'
  String get headerTitle => 'Contact Address';

  /// Default value 'This is your permanent address content message. \nTo change
  /// the address, you must set Show read only address to false.'
  String get permanentAddressContentMessage =>
      'This is your permanent address content message. \nTo change the address, '
      'you must set Show read only address to false.';
}

extension LocalizedStringsContextExtension on BuildContext {
  EditAddressLocalizedStrings get getEditAddressLocalizedStrings =>
      EditAddressLocalizedStrings.of(this);
}
