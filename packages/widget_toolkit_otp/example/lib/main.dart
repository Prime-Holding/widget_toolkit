import 'package:flutter/material.dart';
import 'package:widget_toolkit/theme_data.dart';
import 'package:widget_toolkit/ui_components.dart';
import 'package:widget_toolkit_otp/widget_toolkit_otp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light()
          .copyWith(colorScheme: ColorScheme.fromSwatch(), extensions: [
        WidgetToolkitTheme.light,
        SmsCodeTheme.light,
      ]),
      darkTheme: ThemeData.dark()
          .copyWith(colorScheme: ColorScheme.fromSwatch(), extensions: [
        WidgetToolkitTheme.dark,
        SmsCodeTheme.dark,
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
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: _selectedIndex == 0
              ? const Text('widget_toolkit_otp Standalone')
              : const Text('widget_toolkit_otp Combined'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Standalone Widgets',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Combined Widgets',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        body: _selectedIndex == 0
            ? const StandaloneWidgetsPage()
            : const CombinedWidgetsPage(),
      );
}

Future _showSuccessDialog(BuildContext context, {required String text}) =>
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Text(text),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );

class StandaloneWidgetsPage extends StatelessWidget {
  const StandaloneWidgetsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          /// Standalone Widgets
          WidgetSection(
            description: 'CountdownWidget',
            hasSwitch: false,
            builder: (_) => CountdownWidget.withDependencies(),
          ),
          WidgetSection(
            description: 'SmsCodeField - success state',
            builder: (isEnabled) => SmsCodeField(
              enabled: isEnabled,
              useInternalCommunication: false,
              onCompleted: (code) => _showSuccessDialog(context,
                  text: 'SMS Code succeeded! \nCode: $code'),
            ),
          ),
          WidgetSection(
            description: 'SmsCodeField - error state',
            builder: (isEnabled) => SmsCodeField(
              useInternalCommunication: false,
              enabled: isEnabled,
              validator: (_, __) => 'fake error',
              onCompleted: (code) => _showSuccessDialog(context,
                  text: 'SMS Code failed! \nCode: $code'),
            ),
          ),
          WidgetSection(
            description: 'AutomatedResendCodeButton',
            hasSwitch: false,
            builder: (_) => AutomatedResendCodeButton(
                onPressed: () => _showSuccessDialog(context,
                    text: 'Resend Button pressed!')),
          ),
        ],
      );
}

class CombinedWidgetsPage extends StatefulWidget {
  const CombinedWidgetsPage({Key? key}) : super(key: key);

  @override
  State<CombinedWidgetsPage> createState() => _CombinedWidgetsPageState();
}

class _CombinedWidgetsPageState extends State<CombinedWidgetsPage> {
  bool isSuccess = true;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(isSuccess ? 'Success State!' : 'Error State...'),
                  Switch(
                      value: isSuccess,
                      onChanged: (value) => setState(() {
                            isSuccess = value;
                          })),
                ],
              ),
            ),

            /// Widgets with internal communication (Combined Widgets)
            WidgetSection(
              description: 'Default SmsCodeWidget',
              builder: (isEnabled) => SmsCodeWidget(
                key: ValueKey(isSuccess),
                sentNewCodeActivationTime: 5,
                service: FakeSmsCodeService(isSuccess: isSuccess),
                onResult: (context, result) =>
                    _showSuccessDialog(context, text: 'Completed!'),
                onError: (context, result) =>
                    _showSuccessDialog(context, text: 'Failed!'),
                builder: (state) => Column(
                  children: [
                    SmsCodeField(enabled: isEnabled),
                    const ResendCodeButton(),
                    const ResendButtonTimer(),
                    SmsPhoneNumberField(
                      builder: (context, number, onChanged) {
                        return TextFormField(
                          key: ValueKey(number),
                          initialValue: number,
                          onChanged: onChanged,
                          decoration: const InputDecoration(
                            label: Text('Phone Number'),
                          ),
                        );
                      },
                    ),
                    // ),
                  ],
                ),
              ),
            ),
            WidgetSection(
                description: 'Custom SmsCodeWidget 1',
                builder: (isEnabled) => SmsCodeWidget(
                      sentNewCodeActivationTime: 5,
                      service: FakeSmsCodeService(
                          codeLength: 6, isSuccess: isSuccess),
                      builder: (state) => Column(
                        children: [
                          SizedBox(
                            height: 50,
                            child: SmsCodeField(
                              key: ValueKey(isSuccess),
                              enabled: isEnabled,
                              themeConfig: SmsThemeConfiguration(
                                errorStyle:
                                    _buildFieldTheme1(color: Colors.red),
                                successStyle: _buildFieldTheme1(
                                    color: Colors.greenAccent),
                                disabledStyle: _buildFieldTheme1(
                                  color: Colors.lightBlue.withOpacity(0.3),
                                  textStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.3)),
                                ),
                                focusedStyle:
                                    _buildFieldTheme1(hasBorder: true),
                                submittedStyle: _buildFieldTheme1(
                                    color: Colors.purple[200]),
                                unfilledStyle: _buildFieldTheme1(),
                              ),
                            ),
                          ),
                          ResendCodeButton(
                              strings: CustomLocalizedStrings(context)),
                          const ResendButtonTimer(),
                        ],
                      ),
                    )),
            WidgetSection(
              description: 'Custom SmsCodeWidget 2',
              builder: (isEnabled) => SmsCodeWidget(
                key: ValueKey(isSuccess),
                sentNewCodeActivationTime: 5,
                service:
                    FakeSmsCodeService(codeLength: 5, isSuccess: isSuccess),
                builder: (state) => Column(
                  children: [
                    Container(
                      width: 243,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SmsCodeField(
                        enabled: isEnabled,
                        themeConfig: SmsThemeConfiguration(
                          defaultStyle: _buildFieldTheme2(),
                          submittedStyle: _buildFieldTheme2(),
                          unfilledStyle: _buildFieldTheme2(),
                          disabledStyle: _buildFieldTheme2(isDisabled: true),
                          focusedStyle: _buildFieldTheme2().copyWith(
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(124, 102, 152, 1),
                            ),
                          ),
                          errorStyle: _buildFieldTheme2().copyWith(
                            decoration: BoxDecoration(
                              color: Colors.redAccent.withOpacity(0.7),
                            ),
                          ),
                          successStyle: _buildFieldTheme2().copyWith(
                            decoration: BoxDecoration(
                              color: Colors.greenAccent.withOpacity(0.7),
                            ),
                          ),
                        ),
                        separator: const SizedBox(
                          height: 64,
                          width: 1,
                        ),
                      ),
                    ),
                    ResendCodeButton(
                      activeStateIcon: const Icon(
                        Icons.send,
                        color: Colors.purple,
                      ),
                      disabledStateIcon: Icons.send,
                      pressedStateIcon: const Icon(
                        Icons.check_circle_outline_rounded,
                        color: Colors.purple,
                      ),
                      buttonColorStyle: ButtonColorStyle.fromContext(
                        context,
                        activeButtonTextColor: Colors.purple,
                        activeGradientColorStart: Colors.white,
                        activeGradientColorEnd: Colors.white,
                        shadowColor: const Color.fromRGBO(159, 132, 193, 0.4),
                        pressedColor: Colors.white,
                        borderColor: const Color.fromRGBO(159, 132, 193, 0.4),
                        // borderColor: borderColor,
                      ),
                    ),
                    const ResendButtonTimer(),
                  ],
                ),
              ),
            ),
            WidgetSection(
              description: 'Custom SmsCodeWidget 3',
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blueAccent.withOpacity(0.7),
                  Colors.white,
                ],
              )),
              builder: (isEnabled) => SmsCodeWidget(
                key: ValueKey(isSuccess),
                sentNewCodeActivationTime: 5,
                service: FakeSmsCodeService(isSuccess: isSuccess),
                builder: (state) => Column(
                  children: [
                    SmsCodeField(
                      enabled: isEnabled,
                      themeConfig: SmsThemeConfiguration(
                        defaultStyle: _buildFieldTheme3(),
                        submittedStyle: _buildFieldTheme3(),
                        unfilledStyle: _buildFieldTheme3(),
                        disabledStyle: _buildFieldTheme3(isDisabled: true),
                        focusedStyle: _buildFieldTheme3().copyWith(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.05999999865889549),
                                offset: Offset(0, 3),
                                blurRadius: 16,
                              )
                            ],
                          ),
                        ),
                        errorStyle: _buildFieldTheme3(
                          color: Colors.redAccent.withOpacity(0.7),
                        ),
                        successStyle: _buildFieldTheme3(
                          color: Colors.greenAccent.withOpacity(0.7),
                        ),
                      ),
                    ),
                    ResendCodeButton(strings: CustomLocalizedStrings(context)),
                    const ResendButtonTimer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  SmsFieldTheme _buildFieldTheme1({
    Color? color,
    TextStyle? textStyle,
    bool hasBorder = false,
  }) =>
      SmsFieldTheme(
        height: hasBorder ? 50 : 40,
        width: hasBorder ? 50 : 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: hasBorder
              ? Border.all(
                  color: Colors.blueAccent,
                  width: 3,
                )
              : null,
          color: color ?? Colors.lightBlue,
        ),
        textStyle: textStyle,
      );

  SmsFieldTheme _buildFieldTheme2({bool isDisabled = false}) => SmsFieldTheme(
        width: 60,
        height: 64,
        textStyle: TextStyle(
          fontFamily: 'Calibri',
          fontSize: 20,
          color: Colors.white.withOpacity(isDisabled ? 0.5 : 1),
        ),
        decoration: BoxDecoration(
            color: Color.fromRGBO(159, 132, 193, isDisabled ? 0.4 : 0.8)),
      );

  SmsFieldTheme _buildFieldTheme3({
    bool isDisabled = false,
    Color? color,
  }) =>
      SmsFieldTheme(
        width: 60,
        height: 64,
        textStyle: TextStyle(
          fontFamily: 'Calibri',
          fontSize: 20,
          color: Color.fromRGBO(70, 69, 66, isDisabled ? 0.3 : 1),
        ),
        decoration: BoxDecoration(
          color:
              color ?? Color.fromRGBO(232, 235, 241, isDisabled ? 0.15 : 0.37),
          borderRadius: BorderRadius.circular(24),
        ),
      );
}

//# region Helper Methods and Classes
class WidgetSection extends StatefulWidget {
  const WidgetSection({
    required this.builder,
    required this.description,
    this.hasSwitch = true,
    this.childSize,
    this.decoration,
    super.key,
  });

  final Widget Function(bool) builder;
  final String description;
  final bool hasSwitch;
  final Size? childSize;
  final BoxDecoration? decoration;

  @override
  State<WidgetSection> createState() => _WidgetSectionState();
}

class _WidgetSectionState extends State<WidgetSection> {
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Card(
          child: Container(
            decoration: widget.decoration,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        widget.description,
                        style: TextStyle(
                          fontSize: 14,
                          color:
                              widget.decoration != null ? Colors.white : null,
                        ),
                      ),
                    ),
                    if (widget.hasSwitch)
                      Switch(
                          value: isEnabled,
                          onChanged: (value) => setState(() {
                                isEnabled = value;
                              })),
                  ],
                ),
                SizedBox(
                  height: 10,
                  width: MediaQuery.of(context).size.width,
                ),
                widget.childSize != null
                    ? SizedBox(
                        width: widget.childSize!.width,
                        height: widget.childSize!.height,
                        child: widget.builder.call(isEnabled),
                      )
                    : widget.builder.call(isEnabled),
              ],
            ),
          ),
        ),
      );
}

/// Custom Strings for the ResendCodeButton
class CustomLocalizedStrings extends LocalizedStrings {
  CustomLocalizedStrings(super.context);

  @override
  String get sendNewCode => 'Resend';

  @override
  String get codeSent => 'Code resent';
}

/// Service used to implement SMS code logic
class FakeSmsCodeService implements SmsCodeService {
  FakeSmsCodeService({this.codeLength = 4, this.isSuccess = true});

  final int codeLength;
  final bool isSuccess;

  /// Confirm if the entered code is equal to the last send code
  @override
  Future<dynamic> confirmPhoneCode(String code) async {
    await Future.delayed(const Duration(seconds: 3));
    return isSuccess ? true : throw Exception();
  }

  /// Get user's phone number with the country code
  @override
  Future<String> getFullPhoneNumber() async => '+38164 1234567';

  /// Edit the user's phone number and return fullPhoneNumber
  @override
  Future<String> updatePhoneNumber(String newNumber) async => '+38164 1234567';

  /// Send a new code to the user
  @override
  Future<bool> sendConfirmationSms(String usersPhoneNumber) async {
    await Future.delayed(const Duration(seconds: 3));
    return isSuccess ? true : throw Exception();
  }

  /// How long codes will be valid in seconds
  @override
  Future<int> getValidityTime(bool reset) async => 5;

  /// How long resendCode button will be disabled after a code have been sent
  @override
  Future<int> getResendButtonThrottleTime(bool reset) async =>
      getValidityTime(reset);

  /// How many characters will contain the code
  @override
  Future<int> getCodeLength() async => codeLength;
}
