import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:widget_toolkit/edit_address.dart';
import 'package:widget_toolkit/search_picker.dart';
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
      home: const MyHomePage(title: 'Widget Toolkit Example'),
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

class MyHomePage extends StatelessWidget {
  const MyHomePage({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SafeArea(
        child: PageView(
          controller: controller,
          children: <Widget>[
            Center(
              child: _buildShowcasePage(context,
                  title: 'Common Components',
                  child: _buildCommonComponents(context)),
            ),
            const Center(
              child: Text('Second Page'),
            ),
            const Center(
              child: Text('Third Page'),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildShowcasePage(BuildContext context,
        {required String title, required Widget child}) =>
    Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
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

Widget _buildCommonComponents(BuildContext context) => SingleChildScrollView(
      child: Column(
        children: [
          ..._buildUrlLauncherWidgets(context),
          ..._buildShimmerWidgets(context),
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
                translateError: _translateError,
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
                translateError: _translateError,
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

List<Widget> _buildShimmerWidgets(BuildContext context) => [
      WidgetSection(
        description: 'Shimmer Wrapper',
        onRefresh: () => slapAfterThreeSeconds(true),
        child: Center(
          child: SizedBox(
            width: 180,
            height: 120,
            child: StreamBuilder(
              stream: boolStream.stream,
              initialData: true,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                startStreamOnInitialBuild();
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
        onRefresh: () => slapAfterThreeSeconds(true),
        child: StreamBuilder(
            stream: boolStream.stream,
            initialData: true,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              startStreamOnInitialBuild();
              return ShimmerText(
                (snapshot.data ?? true) ? null : 'Display Text after 2 sec',
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
          onPressed: () {
            showModal(
                context: context,
                builder: (BuildContext context) => const MessagePanelWidget(
                    message: 'This is an informative message',
                    messageState: MessagePanelState.informative));
          },
        ),
      ),
      WidgetSection(
        description: 'Error Modal Sheet',
        child: GradientFillButton(
          text: 'Present error in modal',
          onPressed: () {
            showErrorModal(
                error: 'This is an error message',
                context: context,
                retryCallback: (context) {},
                showCloseButton: true);
          },
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

final boolStream = BehaviorSubject<bool>();

void startStreamOnInitialBuild() async {
  if (!boolStream.hasValue) {
    boolStream.add(true);
    await Future.delayed(const Duration(seconds: 3));
    boolStream.add(false);
  }
}

Future<void> slapAfterThreeSeconds(bool initial) async {
  boolStream.add(initial);
  await Future.delayed(const Duration(seconds: 3));
  boolStream.add(!initial);
}

String _translateError(BuildContext context, Exception exception) {
  if (exception is ErrorAccessDeniedModel) {
    return 'Unable to open link on this device. Perhaps you are missing the'
        ' right application to open the link.';
  }
  return exception.toString();
}

/// Widget section that displays a single widget which is part of the page
class WidgetSection extends StatelessWidget {
  const WidgetSection({
    required this.child,
    this.onRefresh,
    this.description,
    this.descriptionStyle,
    this.spacing = 10,
    this.childSize,
    super.key,
  });
  final Widget child;
  final String? description;
  final TextStyle? descriptionStyle;
  final double spacing;
  final Size? childSize;
  final void Function()? onRefresh;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
        ),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (description != null)
                      Text(
                        description!,
                        style:
                            descriptionStyle ?? const TextStyle(fontSize: 14),
                      ),
                    if (onRefresh != null)
                      IconButton(
                          onPressed: onRefresh,
                          icon: const Icon(Icons.refresh)),
                  ],
                ),
                SizedBox(
                  height: spacing,
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

class Constants {
  static const primeHoldingUrl = 'https://www.primeholding.com/';
  static const mobileNumberUrl = '+123456789012';
  static const Size suggestedChildSize = Size(320, 32);
  static const imageUrl =
      'https://www.btsbg.org/sites/default/files/obekti/stobski-piramidi-selo-stob.jpg';
}
