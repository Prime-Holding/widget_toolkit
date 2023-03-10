import 'package:flutter/material.dart';

import '../../../widget_toolkit.dart';
import '../../base/models/item_builder.dart';
import '../extensions/user_profile_card_types_extension.dart';
import 'permanent_address_bottom_sheet.dart';

/// [addressModel] is the current address information, which is provided to be
/// displayed in the widgets inside the page.
///
/// [editAddressLocalizedStrings] receives a class, which should implement
/// [EditAddressLocalizedStrings], it should provided translation for the
/// strings in the package.
///
/// [cityErrorMapper] a function, which maps the the exceptions thrown from the
/// validation methods inside the class implementing the [TextFieldValidator]
/// class. The methods in that class validate the input String value for the edit
/// city text input field. The [cityErrorMapper] should map the exception to a
/// RxFieldException
///
/// [addressErrorMapper] a function, which maps the the exceptions thrown from the
/// validation methods inside the class implementing the [TextFieldValidator]
/// class. The methods in that class validate the input String value for the edit
/// address text input field. The [addressErrorMapper] should map the exception to a
/// RxFieldException
///
/// [validator] is a service validator class, which provides methods with validation
/// implementation for the input values of the city and address input values
///
/// [countryCustomIcon] receives a custom icon for the country widget. To use a
/// custom icon, the [editCountryFieldType] should be of type
/// EditFieldType.custom
///
/// [cityCustomIcon] receives a custom icon for the city button. To use a
/// custom icon, the [editCityFieldType] should be of type
/// EditFieldType.custom
///
/// [addressCustomIcon] receives a custom icon for the city button. To use a
/// custom icon, the [editAddressFieldType] should be of type
/// EditFieldType.custom
///
/// [editAddressConfiguration] is a configuration for the edit address bottom sheet.
///
/// [editAddressService] received an extension class of [EditAddressService] with
/// implementation of the logic for the main edit contact address save button
/// logic
///
/// [editContactAddressErrorBuilder] is a custom error builder for the contact
/// address modal sheet
///
/// [searchCountryCustomBuilders] is a class which accepts
/// showEmptyWidgetWhenNoResultsAreFound, custom item builder,
/// error builder, empty builder, separator builder for the search country item
/// picker
class EditAddressWidget<T extends PickerItemModel> extends StatefulWidget {
  const EditAddressWidget({
    required this.translateError,
    required this.validator,
    required this.searchCountryService,
    this.editAddressService = const _DefaultEditAddressService(),
    this.addressModel = _defaultAddressModel,
    this.editAddressLocalizedStrings,
    this.type = UserProfileCardTypes.mailingAddress,
    this.editAddressConfiguration = const EditAddressConfiguration(),
    this.countryCustomIcon,
    this.editCountryFieldType = EditFieldType.dropdown,
    this.cityCustomIcon,
    this.editCityFieldType = EditFieldType.editfield,
    this.addressCustomIcon,
    this.editAddressFieldType = EditFieldType.editfield,
    this.editContactAddressErrorBuilder,
    this.searchCountryCustomBuilders,
    this.textFieldsModalConfiguration = const TextFieldModalConfiguration(),
    this.countryPickerModalConfiguration =
        const SearchPickerModalConfiguration(),
    Key? key,
  }) : super(key: key);

  final EditAddressLocalizedStrings? editAddressLocalizedStrings;
  final AddressModel addressModel;
  final UserProfileCardTypes type;
  final Function(Object error) translateError;
  final TextFieldValidator<String> validator;
  final EditAddressConfiguration editAddressConfiguration;
  final SearchPickerService<T> searchCountryService;
  final EditAddressService editAddressService;
  final dynamic countryCustomIcon;
  final EditFieldType editCountryFieldType;
  final dynamic cityCustomIcon;
  final EditFieldType editCityFieldType;
  final dynamic addressCustomIcon;
  final EditFieldType editAddressFieldType;
  final Widget Function(ErrorModel?)? editContactAddressErrorBuilder;
  final SearchCountryCustomBuilders<T>? searchCountryCustomBuilders;
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
  late AddressModel? savedModel;

  @override
  void initState() {
    savedModel = widget.addressModel;
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
                              widget.editAddressLocalizedStrings
                                      ?.cardFieldLabel ??
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
                            address: savedModel,
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
              headerText: widget.editAddressLocalizedStrings?.headerTitle ??
                  context.getEditAddressLocalizedStrings.headerTitle,
              permanentAddressContentMessage: widget.editAddressLocalizedStrings
                      ?.permanentAddressContentMessage ??
                  context.getEditAddressLocalizedStrings
                      .permanentAddressContentMessage,
              configuration: widget.editAddressConfiguration,
            );
      case UserProfileCardTypes.mailingAddress:
      case UserProfileCardTypes.email:
      case UserProfileCardTypes.phone:
        return () async {
          final savedAddress = await showEditAddressBottomSheet<T>(context,
              countryCustomIcon: widget.countryCustomIcon,
              editCountryFieldType: widget.editCountryFieldType,
              cityCustomIcon: widget.cityCustomIcon,
              editCityFieldType: widget.editCityFieldType,
              addressCustomIcon: widget.addressCustomIcon,
              editAddressFieldType: widget.editAddressFieldType,
              buttonText: widget.editAddressLocalizedStrings?.saveButtonText ??
                  context.getEditAddressLocalizedStrings.saveButtonText,
              headerText: widget.editAddressLocalizedStrings?.headerTitle ??
                  context.getEditAddressLocalizedStrings.headerTitle,
              addressModel: savedModel ?? widget.addressModel,
              modalConfiguration: widget.editAddressConfiguration,
              translateError: widget.translateError,
              validator: widget.validator,
              searchCountryService: widget.searchCountryService,
              editAddressLocalizedStrings: widget.editAddressLocalizedStrings,
              editAddressService: widget.editAddressService,
              editContactAddressErrorBuilder:
                  widget.editContactAddressErrorBuilder,
              searchCountryCustomBuilders: widget.searchCountryCustomBuilders,
              textFieldsModalConfiguration: widget.textFieldsModalConfiguration,
              countryPickerModalConfiguration:
                  widget.countryPickerModalConfiguration);
          if (savedAddress != null) {
            setState(() {
              savedModel = savedAddress;
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
      double? additionalBottomPadding,
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
            additionalBottomPadding: additionalBottomPadding,
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

class _DefaultEditAddressService implements EditAddressService {
  const _DefaultEditAddressService();

  @override
  Future<AddressModel> saveAddress(AddressModel addressModel) async {
    await Future.delayed(const Duration(seconds: 1));
    throw _CustomErrorModel(
        customMessage: 'The address could not be '
            'saved, override the saveAddress() method and provide implementation for the '
            'save operation.');
  }
}

class _CustomErrorModel extends ErrorModel {
  _CustomErrorModel({this.customMessage});

  final String? customMessage;

  @override
  String toString() {
    return customMessage ?? 'CustomErrorModel';
  }
}
