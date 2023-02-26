import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/rx_form.dart';

import '../../../edit_address.dart';
import '../../../search_picker.dart';
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
/// [configuration] is a configuration for the edit address bottom sheet.
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
class EditAddressWidget<T extends PickerItemModel> extends StatelessWidget {
  const EditAddressWidget({
    required this.cityErrorMapper,
    required this.addressErrorMapper,
    required this.validator,
    required this.searchCountryService,
    this.editAddressService = const _DefaultEditAddressService(),
    this.addressModel = _defaultAddressModel,
    this.editAddressLocalizedStrings,
    this.type = UserProfileCardTypes.mailingAddress,
    this.configuration = const EditAddressConfiguration(),
    this.countryCustomIcon,
    this.editCountryFieldType = EditFieldType.dropdown,
    this.cityCustomIcon,
    this.editCityFieldType = EditFieldType.editfield,
    this.addressCustomIcon,
    this.editAddressFieldType = EditFieldType.editfield,
    this.editContactAddressErrorBuilder,
    this.searchCountryCustomBuilders,
    Key? key,
  }) : super(key: key);

  final EditAddressLocalizedStrings? editAddressLocalizedStrings;
  final AddressModel addressModel;
  final UserProfileCardTypes type;
  final RxFieldException<String> Function(Object error, BuildContext context)
      cityErrorMapper;
  final RxFieldException<String> Function(Object error, BuildContext context)
      addressErrorMapper;
  final TextFieldValidator<String> validator;
  final EditAddressConfiguration configuration;
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

  static const _defaultAddressModel = AddressModel(
    addressType: AddressTypeModel.correspondence,
    city: 'Plovd',
    streetAddress: 'str1',
    country: CountryModel.withDefaults(),
  );

  @override
  Widget build(BuildContext context) => Material(
        child: InkWell(
          splashColor:
              context.editAddressTheme.editAddressWidgetSplashTransparent,
          highlightColor:
              context.editAddressTheme.editAddressWidgetHighlightTransparent,
          onTap: _onWidgetIconTab(
            context: context,
            type: type,
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
                              editAddressLocalizedStrings?.cardFieldLabel ??
                                  context.getEditAddressLocalizedStrings
                                      .cardFieldLabel,
                              style: context.editAddressTheme.captionBold
                                  .copyWith(color: type.getColor(context)),
                              maxLines: 1,
                              type: ShimmerType.proportional(
                                  trailingFlex: 3, leadingFlex: 4),
                              baseColor: context.editAddressTheme.white,
                              highlightColor:
                                  context.editAddressTheme.mediumWhite,
                            ),
                          ),
                          _AddressWidget(
                            address: addressModel,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          context.editAddressTheme.editAddressWidgetPadding4,
                      child: _IconWidget(
                        type: type,
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
        return () => showAppPermanentAddressBottomSheet(
              context,
              headerText: editAddressLocalizedStrings?.headerTitle ??
                  context.getEditAddressLocalizedStrings.headerTitle,
              permanentAddressContentMessage:
                  editAddressLocalizedStrings?.permanentAddressContentMessage ??
                      context.getEditAddressLocalizedStrings
                          .permanentAddressContentMessage,
              configuration: configuration,
            );
      case UserProfileCardTypes.mailingAddress:
      case UserProfileCardTypes.email:
      case UserProfileCardTypes.phone:
        return () {
          showAppAddressForCorrespondence<T>(
            context,
            countryCustomIcon: countryCustomIcon,
            editCountryFieldType: editCountryFieldType,
            cityCustomIcon: cityCustomIcon,
            editCityFieldType: editCityFieldType,
            addressCustomIcon: addressCustomIcon,
            editAddressFieldType: editAddressFieldType,
            buttonText: editAddressLocalizedStrings?.saveButtonText ??
                context.getEditAddressLocalizedStrings.saveButtonText,
            headerText: editAddressLocalizedStrings?.headerTitle ??
                context.getEditAddressLocalizedStrings.headerTitle,
            addressModel: addressModel,
            configuration: configuration,
            cityErrorMapper: cityErrorMapper,
            addressErrorMapper: addressErrorMapper,
            validator: validator,
            searchCountryService: searchCountryService,
            editAddressLocalizedStrings: editAddressLocalizedStrings,
            editAddressService: editAddressService,
            editContactAddressErrorBuilder: editContactAddressErrorBuilder,
            searchCountryCustomBuilders: searchCountryCustomBuilders,
          );
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
  const _AddressWidget({required this.address, Key? key}) : super(key: key);

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

class EditAddressConfiguration {
  const EditAddressConfiguration({
    this.isDismissible = true,
    this.heightFactor,
    this.fullScreen = false,
  });

  final double? heightFactor;
  final bool isDismissible;
  final bool fullScreen;
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
