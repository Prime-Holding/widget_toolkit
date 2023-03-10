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
/// [editAddressErrorMapper] receives a class, which should implement
/// [EditAddressErrorMapper] where you should map the errors
/// for the city and street text values validation to RxFieldException<String>
/// type, for more information check the documentation inside [EditAddressErrorMapper].
///
/// [editAddressConfiguration] is a configuration for the edit address bottom sheet.
///
/// [editAddressService] received an implementation of the [EditAddressService] class
/// The API of the class provides methods for the logic for the main save address
/// button, fetching of the list of countries, filtering the countries list,
/// validating the city and street values while typing and when pressing the save
/// button for each of them. Some methods have default implementation. For more
/// information, check the documentation in the file [EditAddressService] class.
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
    required this.editAddressErrorMapper,
    required this.editAddressService,
    this.addressModel = _defaultAddressModel,
    this.editAddressLocalizedStrings,
    this.type = UserProfileCardTypes.mailingAddress,
    this.editAddressConfiguration = const EditAddressConfiguration(),
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
  final EditAddressErrorMapper editAddressErrorMapper;
  final EditAddressConfiguration editAddressConfiguration;
  final EditAddressService<T> editAddressService;
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
              buttonText: widget.editAddressLocalizedStrings?.saveButtonText ??
                  context.getEditAddressLocalizedStrings.saveButtonText,
              headerText: widget.editAddressLocalizedStrings?.headerTitle ??
                  context.getEditAddressLocalizedStrings.headerTitle,
              addressModel: savedModel ?? widget.addressModel,
              modalConfiguration: widget.editAddressConfiguration,
              editAddressErrorMapper: widget.editAddressErrorMapper,
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
