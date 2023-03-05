import 'dart:async';

import 'package:example/search_country_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/rx_form.dart';
import 'package:rxdart/rxdart.dart';
import 'package:widget_toolkit/widget_toolkit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Toolkit Demo',
      theme: ThemeData.light().copyWith(
          colorScheme: ColorScheme.fromSwatch(),
          extensions: _widgetToolkitThemeExtensions(true)),
      darkTheme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSwatch(),
          extensions: _widgetToolkitThemeExtensions(false)),
      home: const MyHomePage(),
    );
  }
}

List<ThemeExtension> _widgetToolkitThemeExtensions(bool inLightMode) =>
    inLightMode
        ? [
            WidgetToolkitTheme.light,
            ItemPickerTheme.light,
            SearchPickerTheme.light,
            TextFieldDialogTheme.light,
            EditAddressTheme.light,
          ]
        : [
            WidgetToolkitTheme.dark,
            ItemPickerTheme.dark,
            SearchPickerTheme.dark,
            TextFieldDialogTheme.dark,
            EditAddressTheme.dark,
          ];

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final boolStream = BehaviorSubject<bool>();

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Scaffold(
      appBar: AppBar(title: const Text('Widget Toolkit Example')),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: PageView(
          controller: controller,
          children: <Widget>[
            _buildShowcasePage(context,
                title: 'Common Components',
                child: _buildCommonComponents(context, boolStream)),
            _buildShowcasePage(context,
                title: 'Pickers', child: _buildItemPicker(context)),
            _buildShowcasePage(context,
                title: 'Edit Fields', child: _buildTextField(context)),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    boolStream.close();
    super.dispose();
  }
}

//# region Common components
Widget _buildCommonComponents(
        BuildContext context, BehaviorSubject<bool> boolStream) =>
    SingleChildScrollView(
      child: Column(
        children: [
          ..._buildUrlLauncherWidgets(context),
          ..._buildShimmerWidgets(context, boolStream),
          ..._buildModalWidgets(context),
          ..._buildButtons(context),
        ],
      ),
    );

List<Widget> _buildUrlLauncherWidgets(BuildContext context) => [
      WidgetSection(
        description: 'Open Url widget - URL',
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            const Text('The following link can be opened: '),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: OpenUrlWidget.withDependencies(
                url: Constants.primeHoldingUrl,
                translateError: translateError,
                child: const Text(
                  Constants.primeHoldingUrl,
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
      WidgetSection(
        description: 'Open Url widget - phone number',
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            const Text('The following phone number can be opened: '),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: OpenUrlWidget.withDependencies(
                url: Constants.mobileNumberUrl,
                uriType: UriType.telephone,
                errorModalSafeBottom: false,
                translateError: translateError,
                child: const Text(
                  Constants.mobileNumberUrl,
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    ];

List<Widget> _buildShimmerWidgets(
        BuildContext context, BehaviorSubject<bool> boolStream) =>
    [
      WidgetSection(
        description: 'Shimmer Wrapper',
        onRefresh: () => slapAfterThreeSeconds(true, boolStream),
        child: Center(
          child: SizedBox(
            width: 180,
            height: 120,
            child: StreamBuilder(
              stream: boolStream.stream,
              initialData: true,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                startStreamOnInitialBuild(boolStream);
                return ShimmerWrapper(
                  showShimmer: snapshot.data ?? true,
                  fadeTransition: true,
                  alignment: Alignment.center,
                  child: Image.network(
                    Constants.imageUrl,
                    // fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ),
      ),
      WidgetSection(
        description: 'Shimmer Text',
        childSize: Constants.suggestedChildSize,
        onRefresh: () => slapAfterThreeSeconds(true, boolStream),
        child: StreamBuilder(
            stream: boolStream.stream,
            initialData: true,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              startStreamOnInitialBuild(boolStream);
              return ShimmerText(
                (snapshot.data ?? true) ? null : 'Displays Text after loaded',
                alignment: Alignment.center,
                type: ShimmerType.random(),
              );
            }),
      ),
    ];

List<Widget> _buildModalWidgets(BuildContext context) => [
      WidgetSection(
        description: 'Modal Sheet with message',
        child: OutlineFillButton(
          text: 'Open modal sheet',
          onPressed: () => showModal(
              context: context,
              builder: (BuildContext context) => const MessagePanelWidget(
                  message: 'This is an informative message',
                  messageState: MessagePanelState.informative)),
        ),
      ),
      WidgetSection(
        description: 'Error Modal Sheet',
        child: GradientFillButton(
          text: 'Present error in modal',
          onPressed: () => showErrorModal(
              error: 'This is an error message',
              context: context,
              retryCallback: (context) {},
              showCloseButton: true),
        ),
      ),
    ];

List<Widget> _buildButtons(BuildContext context) => [
      WidgetSection(
        description: 'Buttons',
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: OutlineFillButton(
                text: 'OutlineFillButton',
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: GradientFillButton(
                text: 'GradientFillButton',
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: GradientFillButton(
                text: 'GradientFillButton - disabled',
                state: ButtonStateModel.disabled,
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: IconTextButton(
                text: 'IconTextButton',
                icon: Icons.send_time_extension_outlined,
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: SmallButton(
                onPressed: () {},
                icon: Icons.home_work_outlined,
              ),
            ),
          ],
        ),
      ),
    ];
//# endregion

//# region Pickers
//# region ItemPicker
Widget _buildItemPicker(BuildContext context) => SingleChildScrollView(
      child: Column(
        children: [
          _buildSingleSelectItemPicker(context),
          _buildMultiSelectItemPicker(context),
          _buildSearchPicker(context),
        ],
      ),
    );

Widget _buildSingleSelectItemPicker(BuildContext context) => WidgetSection(
      description: 'ItemPicker - single select',
      child: UpdateStateOnSelection<DataModel>(
        builder: (updatedData, updateFunction) => OutlineFillButton(
          text: 'Select one item',
          onPressed: () => showItemPickerBottomSheet<DataModel>(
            context: context,
            title: 'Select a single item',
            selectedItems: updatedData,
            callback: (data) => updateFunction.call(data),
            service: DataService(
              data: _generateData(18),
            ),
            configuration: const ItemPickerConfiguration(
                isMultiSelect: false, safeAreaBottom: true),
          ),
        ),
      ),
    );

Widget _buildMultiSelectItemPicker(BuildContext context) => WidgetSection(
      description: 'ItemPicker - multi select',
      child: UpdateStateOnSelection<DataModel>(
        builder: (updatedData, updateFunction) => OutlineFillButton(
          text: 'Select a few items',
          onPressed: () => showItemPickerBottomSheet<DataModel>(
              context: context,
              title: 'Select a few items',
              selectedItems: updatedData,
              callback: (data) => updateFunction.call(data),
              service: DataService(
                data: _generateData(18),
              ),
              configuration: const ItemPickerConfiguration(
                  isMultiSelect: true, safeAreaBottom: true)),
        ),
      ),
    );

class UpdateStateOnSelection<T> extends StatefulWidget {
  const UpdateStateOnSelection({required this.builder, Key? key})
      : super(key: key);

  final Widget Function(
      List<T> data, void Function(List<T> newData) updateState) builder;

  @override
  State<UpdateStateOnSelection<T>> createState() =>
      _UpdateStateOnSelectionState<T>();
}

class _UpdateStateOnSelectionState<T> extends State<UpdateStateOnSelection<T>> {
  late List<T> localData;

  @override
  void initState() {
    localData = <T>[];
    super.initState();
  }

  void updateState(List<T> newData) {
    setState(() {
      localData = newData;
    });
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          widget.builder
              .call(localData, (List<T> newData) => updateState(newData)),
          if (localData.isNotEmpty)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 12),
                Text((localData.length >= 2)
                    ? 'Selected Items:'
                    : 'Selected Item:'),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...localData
                          .map(
                            (e) => Text(
                              '${e.toString()} ',
                              style: const TextStyle(fontSize: 10),
                            ),
                          )
                          .toList(),
                    ],
                  ),
                ),
              ],
            )
        ],
      );
}

List<DataModel> _generateData(int count) => List.generate(
      count,
      (index) => DataModel(
        name: 'Person $index',
        description:
            'This may be very long description for user named Person $index',
        color: index % 2 == 0 ? 0xFF42A5F5 : 0xFFF4511E,
      ),
    );

class DataModel extends PickerItemModel {
  DataModel({
    required this.name,
    required this.description,
    required this.color,
  });

  final String name;
  final String description;
  final int color;

  @override
  String get itemDisplayName => name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataModel &&
          runtimeType == other.runtimeType &&
          other.name == name &&
          other.description == description &&
          other.color == color;

  @override
  int get hashCode => name.hashCode ^ description.hashCode ^ color.hashCode;
}

class DataService extends ItemPickerService<DataModel> {
  DataService({
    required this.data,
  });

  final List<DataModel> data;

  @override
  Future<List<DataModel>> getItems() =>
      Future.delayed(Constants.threeSec, () => data);
}
//# endregion

//# region SearchPicker
Widget _buildSearchPicker(BuildContext context) => WidgetSection(
      description: 'Search Picker',
      child: UpdateStateOnSelection<CountryModel>(
        builder: (updatedData, updateFunction) => OutlineFillButton(
          text: 'Select an item from a long list',
          onPressed: () => showSearchPickerBottomSheet<CountryModel>(
              context: context,
              title: 'Select country',
              hintText: 'Type substring',
              retryText: 'Retry',
              selectedItem: updatedData.isNotEmpty ? updatedData[0] : null,
              onItemTap: (item) =>
                  updateFunction.call(item != null ? [item] : []),
              service: SearchService(SearchCountryRepository()),
              emptyBuilder: _buildSearchPickerCustomEmpty,
              configuration:
                  const SearchPickerConfiguration(safeAreaBottom: true)),
        ),
      ),
    );

Widget _buildSearchPickerCustomEmpty() =>
    Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.blueGrey[300],
              borderRadius: BorderRadius.circular(20)),
          child: const Text('There is no results for the searched query !'),
        ),
      ),
    ]);

class SearchService extends SearchPickerService<CountryModel> {
  SearchService(this._searchRepository);

  final SearchCountryRepository _searchRepository;

  @override
  Future<List<CountryModel>> filteredListByName(
      List<CountryModel> list, String? searchParam) async {
    if (searchParam == null) {
      return list;
    }

    return list
        .where((item) => (item.itemDisplayName ?? '')
            .toLowerCase()
            .contains(searchParam.toLowerCase()))
        .toList();
  }

  @override
  Future<List<CountryModel>> getItems() => _searchRepository.searchList;

  @override
  List<CountryModel> getPlaceholderList() =>
      List.generate(5, (index) => CountryModel.empty());
}
//# endregion
//# endregion

//# region EditFields
Widget _buildTextField(BuildContext context) => SingleChildScrollView(
      child: Column(
        children: [
          _buildTextFieldItem(context),
          _buildEditAddressItem(context),
        ],
      ),
    );
//# region TextField

Widget _buildTextFieldItem(BuildContext context) => WidgetSection(
      description: 'TextFieldDialog',
      child: TextFieldDialog<String>(
        errorMapper: (obj, context) =>
            ErrorMapperUtil<String>().errorMapper(obj, context),
        label: 'First Name',
        value: 'John',
        validator: LocalAddressFieldService(),
        dialogHasBottomPadding: true,
        header: 'Enter your data',
      ),
    );

class ErrorMapperUtil<T> {
  RxFieldException<T> errorMapper(Object error, BuildContext context) {
    if (error is ErrorFormFieldModel) {
      throw RxFieldExceptionFatory.fromFormField<T>(error, context);
    }
    throw error;
  }
}

extension RxFieldExceptionFatory on RxFieldException {
  static RxFieldException<T> fromFormField<T>(
    ErrorFormFieldModel formFieldModel,
    BuildContext context,
  ) =>
      RxFieldException<T>(
        error: formFieldModel.error,
        fieldValue: formFieldModel.fieldValue,
      );
}

class LocalAddressFieldService extends TextFieldValidator<String> {
  static const int minLengthRequired = 2;
  static const int maxLengthRequired = 7;

  @override
  Future<String> validateOnSubmit(String text) async {
    await Future.delayed(const Duration(seconds: 1));
    if (text.length >= maxLengthRequired) {
      await Future.delayed(const Duration(seconds: 1));
      throw ErrorFormFieldModel<String>(
          error: 'Please enter at max $maxLengthRequired symbols',
          fieldValue: text);
    }
    return text;
  }

  @override
  void validateOnType(String text) {
    if (text.length < minLengthRequired) {
      throw ErrorFormFieldModel<String>(
          error: 'Please enter at least $minLengthRequired symbols',
          fieldValue: text);
    }
  }
}

class ErrorFormFieldModel<T> extends ErrorModel {
  ErrorFormFieldModel({
    required this.error,
    required this.fieldValue,
  });

  final String error;
  final T fieldValue;

  @override
  String toString() =>
      'ErrorRequiredField. Translation Key: $error. Value: $fieldValue.';
}

//# endregion

//# region EditAddress
Widget _buildEditAddressItem(BuildContext context) => WidgetSection(
      description: 'EditAddress',
      child: EditAddressWidget<CountryModel>(
        cityErrorMapper: (obj, context) =>
            ErrorMapperUtil<String>().errorMapper(obj, context),
        addressErrorMapper: (obj, context) =>
            ErrorMapperUtil<String>().errorMapper(obj, context),
        validator: LocalAddressFieldService(),
        searchCountryService: SearchService(
          SearchCountryRepository(),
        ),
      ),
    );

//# endregion
//# endregion

//# region Helper Methods and Classes
Widget _buildShowcasePage(BuildContext context,
        {required String title, required Widget child}) =>
    Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Expanded(child: child),
      ],
    );

/// Widget section that displays a single widget which is part of the page
class WidgetSection extends StatelessWidget {
  const WidgetSection({
    required this.child,
    this.onRefresh,
    required this.description,
    this.childSize,
    super.key,
  });
  final Widget child;
  final String description;
  final Size? childSize;
  final void Function()? onRefresh;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      description,
                      style: const TextStyle(fontSize: 14),
                    ),
                    if (onRefresh != null)
                      IconButton(
                          onPressed: onRefresh,
                          icon: const Icon(Icons.refresh)),
                  ],
                ),
                SizedBox(
                  height: 10,
                  width: MediaQuery.of(context).size.width,
                ),
                childSize != null
                    ? SizedBox(
                        width: childSize!.width,
                        height: childSize!.height,
                        child: child,
                      )
                    : child,
              ],
            ),
          ),
        ),
      );
}

void startStreamOnInitialBuild(BehaviorSubject<bool> boolStream) async {
  if (!boolStream.hasValue) {
    boolStream.add(true);
    await Future.delayed(Constants.threeSec);
    boolStream.add(false);
  }
}

Future<void> slapAfterThreeSeconds(
    bool initial, BehaviorSubject<bool> boolStream) async {
  boolStream.add(initial);
  await Future.delayed(Constants.threeSec);
  boolStream.add(!initial);
}

String translateError(BuildContext context, Exception exception) {
  if (exception is ErrorAccessDeniedModel) {
    return 'Unable to open link on this device. Perhaps you are missing the'
        ' right application to open the link.';
  }
  return exception.toString();
}
//# endregion

class Constants {
  static const primeHoldingUrl = 'https://www.primeholding.com/';
  static const mobileNumberUrl = '+123456789012';
  static const Size suggestedChildSize = Size(320, 32);
  static const imageUrl =
      'https://www.btsbg.org/sites/default/files/obekti/stobski-piramidi-selo-stob.jpg';
  static const threeSec = Duration(seconds: 3);
}
