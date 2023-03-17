import 'package:flutter/material.dart';

import '../../../widget_toolkit.dart';
import '../../base/models/item_builder.dart';
import '../extensions/user_profile_card_types_extension.dart';
import 'permanent_address_bottom_sheet.dart';

/// [translateError] provide a function which maps the city and street validation
/// errors from the [service] service to the appropriate
/// RxFieldException<String>, which is an ui error with text.
///
/// [service] received an implementation of the [EditAddressService] class.
/// The API of the class provides methods for the logic for the main save address
/// button, fetching of the list of countries, filtering the countries list,
/// validating the city and street values while typing and when pressing the save
/// button for each of them. Some methods have default implementation. For more
/// information, check the documentation in the file [EditAddressService] class.
///
/// [onChanged] receives a function, which accepts the edited address model and
/// it is invoked when any of its property changes.
///
/// [onSaved] receives a function, which accepts the edited address model and
/// it is invoked when the model is saved and the dialog is dismissed.
///
/// [initialAddress] is the current address information, which is provided to be
/// displayed in the widgets inside the page.
///
/// [searchCountryBuilders] is a class which accepts
/// showEmptyWidgetWhenNoResultsAreFound, custom item builder,
/// error builder, empty builder, separator builder for the search country item
/// picker
///
/// [editContactAddressErrorBuilder] is a custom error builder for the contact
/// address modal sheet
///
/// [localizedStrings] receives a class, which should implement
/// [EditAddressLocalizedStrings], it should provided translation for the
/// strings in the package.
///
/// [configuration] is a configuration for the edit address bottom sheet.
///
/// [type] depending on the selected type, a different type of modal bottom
/// sheet is displayed. Currently choosing [UserProfileCardTypes.permanentAddress]
/// displays a permanent address bottom sheet.
///
/// [textFieldsModalConfiguration] is the configuration for the city and street
/// bottom sheets.
///
/// [countryPickerModalConfiguration] is the configuration for the country picker.
class EditAddressWidget<T extends PickerItemModel> extends StatefulWidget {
  const EditAddressWidget({
    required this.translateError,
    required this.service,
    this.onChanged,
    this.onSaved,
    this.initialAddress = _defaultAddressModel,
    this.searchCountryBuilders,
    this.editContactAddressErrorBuilder,
    this.localizedStrings,
    this.type = UserProfileCardTypes.mailingAddress,
    this.configuration = const EditAddressConfiguration(),
    this.textFieldsModalConfiguration = const TextFieldModalConfiguration(),
    this.countryPickerModalConfiguration =
        const SearchPickerModalConfiguration(),
    Key? key,
  }) : super(key: key);

  final Function(AddressModel? addressModel)? onChanged;
  final Function(AddressModel addressModel)? onSaved;
  final EditAddressLocalizedStrings? localizedStrings;
  final AddressModel initialAddress;
  final UserProfileCardTypes type;
  final Function(Object error) translateError;
  final EditAddressConfiguration configuration;
  final EditAddressService<T> service;
  final Widget Function(ErrorModel?)? editContactAddressErrorBuilder;
  final SearchCountryCustomBuilders<T>? searchCountryBuilders;
  final TextFieldModalConfiguration textFieldsModalConfiguration;
  final SearchPickerModalConfiguration countryPickerModalConfiguration;

  static const _defaultAddressModel = AddressModel(
    addressType: AddressTypeModel.correspondence,
    city: 'Plovd',
    streetAddress: 'str1',
    country: CountryModel.withDefaults(),
  );

  @override
  State<EditAddressWidget> createState() => _EditAddressWidgetState();
}

class _EditAddressWidgetState<T extends PickerItemModel>
    extends State<EditAddressWidget<T>> {
  late AddressModel? _savedModel;

  @override
  void initState() {
    _savedModel = widget.initialAddress;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Material(
        child: InkWell(
          splashColor:
              context.editAddressTheme.editAddressWidgetSplashTransparent,
          highlightColor:
              context.editAddressTheme.editAddressWidgetHighlightTransparent,
          onTap: _onWidgetIconTab(
            context: context,
            type: widget.type,
          ),
          child: Padding(
            padding: context.editAddressTheme.editAddressWidgetPadding1,
            child: Container(
              decoration: BoxDecoration(
                color: context.editAddressTheme.editAddressWidgetColor,
                borderRadius: BorderRadius.circular(
                    context.editAddressTheme.editAddressWidgetSpacingXS),
              ),
              child: Padding(
                padding: context.editAddressTheme.editAddressWidgetPadding2,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: context
                                .editAddressTheme.editAddressWidgetPadding3,
                            child: ShimmerText(
                              widget.localizedStrings?.cardFieldLabel ??
                                  context.getEditAddressLocalizedStrings
                                      .cardFieldLabel,
                              style: context.editAddressTheme.captionBold
                                  .copyWith(
                                      color: widget.type.getColor(context)),
                              maxLines: 1,
                              type: ShimmerType.proportional(
                                  trailingFlex: 3, leadingFlex: 4),
                              baseColor: context.editAddressTheme.white,
                              highlightColor:
                                  context.editAddressTheme.mediumWhite,
                            ),
                          ),
                          _AddressWidget(
                            address: _savedModel,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          context.editAddressTheme.editAddressWidgetPadding4,
                      child: _IconWidget(
                        type: widget.type,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  VoidCallback _onWidgetIconTab({
    required BuildContext context,
    required UserProfileCardTypes type,
  }) {
    switch (type) {
      case UserProfileCardTypes.permanentAddress:
        return () => showPermanentAddressBottomSheet(
              context,
              headerText: widget.localizedStrings?.headerTitle ??
                  context.getEditAddressLocalizedStrings.headerTitle,
              permanentAddressContentMessage:
                  widget.localizedStrings?.permanentAddressContentMessage ??
                      context.getEditAddressLocalizedStrings
                          .permanentAddressContentMessage,
              configuration: widget.configuration,
            );
      case UserProfileCardTypes.mailingAddress:
      case UserProfileCardTypes.email:
      case UserProfileCardTypes.phone:
        return () async {
          final savedAddress = await showEditAddressBottomSheet<T>(
            context,
            onChanged: widget.onChanged,
            buttonText: widget.localizedStrings?.saveButtonText ??
                context.getEditAddressLocalizedStrings.saveButtonText,
            headerText: widget.localizedStrings?.headerTitle ??
                context.getEditAddressLocalizedStrings.headerTitle,
            addressModel: _savedModel ?? widget.initialAddress,
            modalConfiguration: widget.configuration,
            translateError: widget.translateError,
            editAddressLocalizedStrings: widget.localizedStrings,
            editAddressService: widget.service,
            editContactAddressErrorBuilder:
                widget.editContactAddressErrorBuilder,
            searchCountryCustomBuilders: widget.searchCountryBuilders,
            textFieldsModalConfiguration: widget.textFieldsModalConfiguration,
            countryPickerModalConfiguration:
                widget.countryPickerModalConfiguration,
          );

          if (savedAddress != null) {
            setState(() {
              _savedModel = savedAddress;
              widget.onSaved?.call(savedAddress);
            });
          }
        };
    }
  }
}

class _IconWidget extends StatelessWidget {
  const _IconWidget({
    required this.type,
    Key? key,
  }) : super(key: key);

  final UserProfileCardTypes type;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case UserProfileCardTypes.permanentAddress:
        return context.widgetToolkitTheme.infoCircleIcon.copyWith(
          color: type.getColor(context),
        );
      case UserProfileCardTypes.mailingAddress:
      case UserProfileCardTypes.email:
      case UserProfileCardTypes.phone:
        return context.editAddressTheme.editPenIcon
            .copyWith(color: context.widgetToolkitTheme.highlightColor);
    }
  }
}

class _AddressWidget extends StatelessWidget {
  const _AddressWidget({
    required this.address,
    Key? key,
  }) : super(key: key);

  final AddressModel? address;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: address != null
                  ? double.minPositive
                  : context.editAddressTheme.addressWidgetSpacingXS,
            ),
            child: ShimmerText(
              address?.countryAndCity,
              style: context.editAddressTheme.descriptionThin,
              maxLines: 1,
              type: ShimmerType.proportional(trailingFlex: 2, leadingFlex: 2),
              baseColor: context.editAddressTheme.white,
              highlightColor: context.editAddressTheme.mediumWhite,
            ),
          ),
          ShimmerText(
            address?.streetAddress,
            style: context.editAddressTheme.descriptionThin,
            maxLines: 1,
            type: ShimmerType.fixed(),
            baseColor: context.editAddressTheme.white,
            highlightColor: context.editAddressTheme.mediumWhite,
          ),
        ],
      );
}

class EditAddressConfiguration extends ModalConfiguration {
  const EditAddressConfiguration(
      {bool safeAreaBottom = true,
      MainAxisAlignment? contentAlignment,
      bool? fullScreen = false,
      bool haveOnlyOneSheet = false,
      bool showHeaderPill = true,
      bool showCloseButton = true,
      double? heightFactor,
      bool dialogHasBottomPadding = true,
      bool isDismissible = true})
      : super(
            safeAreaBottom: safeAreaBottom,
            contentAlignment: contentAlignment,
            fullScreen: fullScreen,
            haveOnlyOneSheet: haveOnlyOneSheet,
            showHeaderPill: showHeaderPill,
            showCloseButton: showCloseButton,
            heightFactor: heightFactor,
            dialogHasBottomPadding: dialogHasBottomPadding,
            isDismissible: isDismissible);
}

class SearchCountryCustomBuilders<T> {
  SearchCountryCustomBuilders({
    required this.showEmptyWidgetWhenNoResultsAreFound,
    this.itemBuilder,
    this.errorBuilder,
    this.emptyBuilder,
    this.separatorBuilder,
  });

  final bool showEmptyWidgetWhenNoResultsAreFound;
  final ItemPickerItemBuilder<T>? itemBuilder;
  final Widget Function(Exception)? errorBuilder;
  final Widget Function()? emptyBuilder;
  final Widget Function(int index)? separatorBuilder;
}
