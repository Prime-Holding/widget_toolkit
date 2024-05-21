import 'build_app.dart';

class ConfigParams {
  const ConfigParams();

  ///General PatrolTesterConfig parameters
  static const generalExistsTimeout = Duration(seconds: 10);
  static const generalVisibleTimeout = Duration(seconds: 10);
  static const generalSettleTimeout = Duration(seconds: 10);
  static const generalSettlePolicy = SettlePolicy.settle;

  ///General NativeAutomatorConfig parameters
  static const generalConnectionTimeout = Duration(seconds: 60);
  static const generalFindTimeout = Duration(seconds: 10);

  ///Specific widget-related PatrolTesterConfig parameters
  static const pageVisibleTimeout = Duration(seconds: 15);
  static const mobileOnboardingScanQRTimeout = Duration(minutes: 1);
  static const dashboardAccountCardScrollStep = 370.0;
  static const dashboardAccountCardMaxScrolls = 1;
  static const utilityBillsTabsScrollStep = 500.0;
  static const utilityBillsItemsListScrollStep = 300.0;
}
