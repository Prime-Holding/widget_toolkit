import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/rx_form.dart';
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
      theme: ThemeData.light()
          .copyWith(colorScheme: ColorScheme.fromSwatch(), extensions: [
        WidgetToolkitTheme.light,
        ItemPickerTheme.light,
        SearchPickerTheme.light,
        TextFieldDialogTheme.light,
        EditAddressTheme.light,
      ]),
      darkTheme: ThemeData.dark()
          .copyWith(colorScheme: ColorScheme.fromSwatch(), extensions: [
        WidgetToolkitTheme.dark,
        ItemPickerTheme.dark,
        SearchPickerTheme.dark,
        TextFieldDialogTheme.dark,
        EditAddressTheme.dark,
      ]),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController pageController;
  String title = 'Common Components';
  int nextPageIndex = 1;

  @override
  void initState() {
    pageController = PageController();
    maintainAppBar();
    super.initState();
  }

  void maintainAppBar() {
    pageController.addListener(() {
      if (pageController.page == 0) {
        setState(() {
          title = 'Common Components';
          nextPageIndex = 1;
        });
      }
      if (pageController.page == 1) {
        setState(() {
          title = 'Pickers';
          nextPageIndex = 2;
        });
      }
      if (pageController.page == 2) {
        setState(() {
          title = 'Edit Fields';
          nextPageIndex = 0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(title), actions: [
          IconButton(
              onPressed: () {
                pageController.animateToPage(nextPageIndex,
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.ease);
              },
              icon: const Icon(Icons.arrow_forward))
        ]),
        body: PageView(
          controller: pageController,
          children: <Widget>[
            CommonComponentsPage(
              pageController: pageController,
            ),
            PickersPage(
              pageController: pageController,
            ),
            EditFieldsPage(
              pageController: pageController,
            ),
          ],
        ),
      );

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}

//# region Showcase Pages
class CommonComponentsPage extends StatelessWidget {
  const CommonComponentsPage({required this.pageController, Key? key})
      : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            WidgetSection(
              description: 'OpenUrlWidget - launch URL link',
              child: OpenUrlWidget.withDependencies(
                url: 'https://www.primeholding.com/',
                translateError: translateError,
                child: const Text(
                  'https://www.primeholding.com/',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            WidgetSection(
              description: 'OpenUrlWidget - call a phone number',
              child: OpenUrlWidget.withDependencies(
                url: '+123456789012',
                uriType: UriType.telephone,
                translateError: translateError,
                child: const Text(
                  '+123456789012',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            LoadingStateSwitcher(
              builder: (isLoading, simulateLoading) => WidgetSection(
                description: 'Shimmer Wrapper',
                childSize: const Size(180, 120),
                onRefresh: () => simulateLoading.call(true),
                child: ShimmerWrapper(
                  showShimmer: isLoading,
                  fadeTransition: true,
                  alignment: Alignment.center,
                  child: Image.network(
                      'https://www.btsbg.org/sites/default/files/obekti/stobski-piramidi-selo-stob.jpg'),
                ),
              ),
            ),
            LoadingStateSwitcher(
              builder: (isLoading, simulateLoading) => WidgetSection(
                description: 'Text Shimmer',
                childSize: const Size(320, 32),
                onRefresh: () => simulateLoading.call(true),
                child: ShimmerText(
                  isLoading ? null : 'Displays Text after loaded',
                  alignment: Alignment.center,
                  type: ShimmerType.random(),
                ),
              ),
            ),
            WidgetSection(
              description: 'Modal Sheet with message',
              child: OutlineFillButton(
                text: 'Open modal sheet',
                onPressed: () => showBlurredBottomSheet(
                  context: context,
                  builder: (BuildContext context) => const Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: MessagePanelWidget(
                        message: 'This is an informative message',
                        messageState: MessagePanelState.informative),
                  ),
                ),
              ),
            ),
            WidgetSection(
              description: 'Error Modal Sheet',
              child: GradientFillButton(
                text: 'Present error in modal',
                onPressed: () => showErrorBlurredBottomSheet(
                  error: 'This is an error message',
                  context: context,
                  retryCallback: (context) =>
                      Future.delayed(const Duration(seconds: 2)),
                ),
              ),
            ),
            WidgetSection(
              description: 'Buttons',
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: OutlineFillButton(
                      text: 'OutlineFillButton',
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: GradientFillButton(
                      text: 'GradientFillButton',
                      onPressed: () {},
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: GradientFillButton(
                      text: 'GradientFillButton - disabled',
                      state: ButtonStateModel.disabled,
                      onPressed: null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: IconTextButton(
                      text: 'IconTextButton',
                      icon: Icons.send_time_extension_outlined,
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: SmallButton(
                      onPressed: () {},
                      icon: Icons.home_work_outlined,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

class PickersPage extends StatelessWidget {
  const PickersPage({required this.pageController, Key? key}) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            WidgetSection(
              description: 'ItemPicker - single select',
              child: UpdateStateOnSelection<DataModel>(
                builder: (updatedData, updateFunction) => OutlineFillButton(
                  text: 'Select one item',
                  onPressed: () => showItemPickerBottomSheet<DataModel>(
                    context: context,
                    title: 'Select a single item',
                    selectedItems: updatedData,
                    callback: (data) => updateFunction.call(data),
                    service: DataService(),
                    configuration:
                        const ItemPickerConfiguration(isMultiSelect: false),
                  ),
                ),
              ),
            ),
            WidgetSection(
              description: 'ItemPicker - multi select',
              child: UpdateStateOnSelection<DataModel>(
                builder: (updatedData, updateFunction) => OutlineFillButton(
                  text: 'Select a few items',
                  onPressed: () => showItemPickerBottomSheet<DataModel>(
                      context: context,
                      title: 'Select a few items',
                      selectedItems: updatedData,
                      callback: (data) => updateFunction.call(data),
                      service: DataService(),
                      configuration:
                          const ItemPickerConfiguration(isMultiSelect: true)),
                ),
              ),
            ),
            WidgetSection(
              description: 'Search Picker',
              child: UpdateStateOnSelection<CountryModel>(
                getString: (CountryModel element) => element.itemDisplayName,
                builder: (updatedData, updateFunction) => OutlineFillButton(
                  text: 'Select an item from a long list',
                  onPressed: () => showSearchPickerBottomSheet<CountryModel>(
                      context: context,
                      title: 'Select country',
                      hintText: 'Type substring',
                      retryText: 'Retry',
                      selectedItem:
                          updatedData.isNotEmpty ? updatedData[0] : null,
                      onItemTap: (item) =>
                          updateFunction.call(item != null ? [item] : []),
                      service: SearchService(SearchCountryRepository()),
                      emptyBuilder: () => const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: MessagePanelWidget(
                              message:
                                  'There is no results for the searched query!',
                              messageState: MessagePanelState.neutral,
                            ),
                          ),
                      modalConfiguration: const SearchPickerModalConfiguration(
                          safeAreaBottom: true)),
                ),
              ),
            ),
          ],
        ),
      );
}

class EditFieldsPage extends StatelessWidget {
  const EditFieldsPage({required this.pageController, Key? key})
      : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            WidgetSection(
              description: 'TextFieldDialog',
              child: TextFieldDialog<String>(
                translateError: (error) =>
                    TranslateErrorUtil.translateError<String>(error, context),
                label: 'First Name',
                value: 'John',
                validator: LocalAddressFieldService(),
                header: 'Enter your data',
              ),
            ),
          ],
        ),
      );
}
//# endregion

//# region Helper Methods and Classes
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

class LoadingStateSwitcher extends StatefulWidget {
  const LoadingStateSwitcher({required this.builder, Key? key})
      : super(key: key);

  final Widget Function(bool isDataLoading, void Function(bool value)) builder;

  @override
  State<LoadingStateSwitcher> createState() => _LoadingStateSwitcherState();
}

class _LoadingStateSwitcherState extends State<LoadingStateSwitcher> {
  late bool isLoading;

  @override
  void initState() {
    _slapAfterThreeSeconds(true);
    super.initState();
  }

  Future<void> _slapAfterThreeSeconds(bool initial) async {
    if (mounted) {
      setState(() {
        isLoading = initial;
      });
    }
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      setState(() {
        isLoading = !initial;
      });
    }
  }

  @override
  Widget build(BuildContext context) =>
      widget.builder.call(isLoading, _slapAfterThreeSeconds);
}

String translateError(BuildContext context, Exception exception) {
  if (exception is ErrorAccessDeniedModel) {
    return 'Unable to open link on this device. Perhaps you are missing the'
        ' right application to open the link.';
  }
  return exception.toString();
}

class UpdateStateOnSelection<T> extends StatefulWidget {
  const UpdateStateOnSelection(
      {required this.builder, this.getString, Key? key})
      : super(key: key);

  final Widget Function(
      List<T> data, void Function(List<T> newData) updateState) builder;
  final String Function(T element)? getString;

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
                              '${widget.getString?.call(e) ?? e.toString()} ',
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

class DataModel extends PickerItemModel {
  DataModel({
    required this.name,
    required this.description,
  });

  final String name;
  final String description;

  @override
  String get itemDisplayName => name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataModel &&
          runtimeType == other.runtimeType &&
          other.name == name &&
          other.description == description;

  @override
  int get hashCode => name.hashCode ^ description.hashCode;

  @override
  String toString() => name;
}

class DataService extends ItemPickerService<DataModel> {
  DataService();

  @override
  Future<List<DataModel>> getItems() => Future.delayed(
        const Duration(seconds: 3),
        () => List.generate(
          20,
          (index) => DataModel(
            name: 'Person $index',
            description:
                'This may be very long description for user named Person $index',
          ),
        ),
      );
}

class SearchService extends SearchPickerService<CountryModel> {
  SearchService(this._searchRepository);

  final SearchCountryRepository _searchRepository;

  @override
  Future<List<CountryModel>> getItems() => _searchRepository.searchList;

  @override
  List<CountryModel> getPlaceholderList() =>
      List.generate(5, (index) => CountryModel.empty());
}

class TranslateErrorUtil {
  static void translateError<T>(Object error, BuildContext context) {
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

class SearchCountryRepository {
  Future<List<CountryModel>> get searchList => Future.delayed(
        const Duration(seconds: 1),
        () => _countriesList
            .map((country) =>
                CountryModel(countryCode: 'US', countryName: country))
            .toList(),
      );

  final _countriesList = ['Angola', 'Bulgaria', 'Cuba', 'Egypt', 'Italy'];
}
//# endregion
