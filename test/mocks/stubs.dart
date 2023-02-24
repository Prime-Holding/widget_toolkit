import 'package:rx_bloc/rx_bloc.dart';
import 'package:widget_toolkit/edit_address.dart';
import 'package:widget_toolkit/language_picker.dart';
import 'package:widget_toolkit/widget_toolkit.dart';

import '../lib_item_picker/models/item_picker_data_mock.dart';
import '../lib_language_picker/models/language_picker_data_mock.dart';
import '../lib_search_picker/models/search_model_mock.dart';

class Stubs {
  static List<ItemPickerDataMock> itemPickerData = <ItemPickerDataMock>[
    ItemPickerDataMock('name 1'),
    ItemPickerDataMock('name 2'),
  ];
  static Result<List<ItemPickerDataMock>> itemPickerDataEmpty =
      Result.success(<ItemPickerDataMock>[]);
  static Result<List<ItemPickerDataMock>> itemPickerDataSuccessResult =
      Result.success(
    <ItemPickerDataMock>[
      ItemPickerDataMock('name 1'),
      ItemPickerDataMock('name 2'),
    ],
  );
  static Result<List<ItemPickerDataMock>> itemPickerError =
      Result<List<ItemPickerDataMock>>.error(GenericErrorModel());
  static Result<List<ItemPickerDataMock>> itemPickerLoading =
      Result<List<ItemPickerDataMock>>.loading();

  static List<SelectedLanguageModel> languagesState = <SelectedLanguageModel>[
    SelectedLanguageModel(
      language: LanguagePickerDataMock(
        locale: 'bg',
        key: 'bulgarian',
        languageCode: 'bg',
      ),
      selected: true,
      isLoading: false,
    ),
    SelectedLanguageModel(
        language: LanguagePickerDataMock(
          locale: 'en',
          key: 'english',
          languageCode: 'en',
        ),
        selected: false,
        isLoading: false),
  ];

  static LanguagePickerDataMock selectedLanguageEnglish =
      LanguagePickerDataMock(
    locale: 'en',
    key: 'english',
    languageCode: 'en',
  );

  static LanguagePickerDataMock selectedLanguageBulgarian =
      LanguagePickerDataMock(
    locale: 'bg',
    key: 'bulgarian',
    languageCode: 'bg',
  );

  static const searchPickerFilterSuccess = 'val';
  static const searchPickerFilterNotExisting = 'non existing';
  static const searchPickerFilterEmpty = '';

  static List<SearchModelMock> searchPickerData = [
    SearchModelMock('value 1'),
    SearchModelMock('value 2'),
    SearchModelMock('item 1'),
    SearchModelMock('item 2'),
  ];

  static List<SearchModelMock> searchPickerFilterSuccessResult = [
    SearchModelMock('value 1'),
    SearchModelMock('value 2'),
  ];

  static List<SearchModelMock> searchPickerFilterEmptyResult = [];

  static String textFieldDialogInitialValue = 'value';
  static String textFieldDialogExceptionValue = '1234567';

  static Result<String> textFieldDialogResultLoading =
      Result<String>.loading(tag: '');

  static Result<String> textFieldDialogResultError =
      Result<String>.error(GenericErrorModel());

  static String city = 'Sofia';
  static String street = 'str1';
  static String countryNameBG = 'Bulgaria';
  static String countryNameUSA = 'USA';
  static String countryCode = 'BG';
  static String countryCodeUSA = 'USA';
  static CountryModel countryModelBG = CountryModel(
      countryName: Stubs.countryNameBG, countryCode: Stubs.countryCode);
  static CountryModel countryModelUSA = CountryModel(
      countryName: Stubs.countryNameUSA, countryCode: Stubs.countryCodeUSA);

  static AddressModel addressModel = AddressModel(
    addressType: AddressTypeModel.correspondence,
    city: Stubs.city,
    streetAddress: Stubs.street,
    country: Stubs.countryModelBG,
  );
}
