import 'package:flutter/material.dart';

import '../../../edit_address.dart';
import '../../../models.dart';
import '../../../search_picker.dart';

void showEditCountryBottomSheet<T extends PickerItemModel>(
  BuildContext context,
  CountryModel? country,
  Function(CountryModel) callback, {
  required CountryBottomSheetConfiguration configuration,
  required SearchPickerService<T> searchCountryService,
  required String countrySearchPickerTitle,
  required String countrySearchPickerHintText,
  required String countrySearchPickerRetryText,
  SearchCountryCustomBuilders<T>? searchCountryCustomBuilders,
}) {
  showSearchPickerBottomSheet<T>(
    context: context,
    title: countrySearchPickerTitle,
    hintText: countrySearchPickerHintText,
    retryText: countrySearchPickerRetryText,
    configuration: const SearchPickerConfiguration(haveOnlyOneSheet: false),
    onItemTap: (country) {
      if (country is CountryModel) {
        callback.call(country);
      }
    },
    service: searchCountryService,
    showEmptyWidgetWhenNoResultsAreFound:
        searchCountryCustomBuilders?.showEmptyWidgetWhenNoResultsAreFound ??
            true,
    itemBuilder: searchCountryCustomBuilders?.itemBuilder,
    errorBuilder: searchCountryCustomBuilders?.errorBuilder,
    emptyBuilder: searchCountryCustomBuilders?.emptyBuilder,
    separatorBuilder: searchCountryCustomBuilders?.separatorBuilder,
  );
}

class CountryBottomSheetConfiguration {
  const CountryBottomSheetConfiguration({
    this.isDismissible = true,
    this.heightFactor,
    this.fullScreen = true,
    this.haveOnlyOneSheet = false,
  });

  final double? heightFactor;
  final bool isDismissible;
  final bool fullScreen;
  final bool haveOnlyOneSheet;
}
