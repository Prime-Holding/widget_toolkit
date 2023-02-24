import 'package:url_launcher/url_launcher.dart';

import '../../../base/models/errors/open_url/access_denied_error_model.dart';

/// Open Uri Data source handling all the domain specific logic
class OpenUriDataSource {
  /// The default OpenUriDataSource constructor
  const OpenUriDataSource();

  /// Tries to launch the provided URI. If that is not possible, an exception of
  /// type `ErrorAccessDeniedModel` is thrown.
  Future<void> openUri(String uri) async => await _launch(Uri.parse(uri));

  Future<void> _launch(Uri launchUri) async {
    if (!(await canLaunchUrl(launchUri))) {
      throw ErrorAccessDeniedModel();
    }

    await launchUrl(launchUri);
  }
}
