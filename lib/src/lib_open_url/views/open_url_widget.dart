import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rx_bloc/rx_bloc.dart';

import '../../../ui_components.dart';
import '../bloc/open_uri_bloc.dart';
import '../di/open_url_dependencies.dart';
import '../enums/uri_type_enum.dart';

/// OpenUrlWidget is a simple wrapper widget which reacts to user input and
/// tries to open the provided [url].
///
/// You can define a callback which is triggered right before trying to open the
/// url with the [onTap] method.
///
/// If an error occurs, an [onError] callback will be triggered with the
/// BuildContext and the exception as an input parameter.
///
/// In case an error needs to be translated or localized, you can use the
/// [translateError] callback which returns the string used as the error
/// message, and accepts the context and exception as inputs.
///
/// In case you need to open a phone number to call or send sms, you can provide
/// a new value for the [uriType] parameter. By default it is set to [UriType.https]
/// which handles any https requests.
///
/// When an error happens, a modal sheet will be displayed with that particular
/// error. By default that modal sheet will apply a safe area bottom padding, to
/// stay away from device-specific intrusions. You can turn this behaviour off
/// by setting the [errorModalConfiguration] to `false`.
class OpenUrlWidget extends StatelessWidget {
  const OpenUrlWidget({
    required this.child,
    required this.url,
    this.onTap,
    this.onError,
    this.translateError,
    this.uriType = UriType.https,
    this.errorModalConfiguration = const ModalConfiguration(),
    super.key,
  });

  /// The child widget
  final Widget child;

  /// The url to be opened
  final String url;

  /// The type of the uri request (defaults to https)
  final UriType uriType;

  /// Callback executed before we actually open the url
  final VoidCallback? onTap;

  /// Callback triggered in case an error occurs
  final Function(BuildContext, Exception)? onError;

  /// Function used for translating/localizing errors
  final String Function(BuildContext context, Exception)? translateError;

  /// With [configuration] property you can set up how the ModalBottomSheet in
  /// the default implementation of onError will appear. It refers to the default
  /// ModalConfiguration, but doesn't show close button and allows more then one sheets.
  final ModalConfiguration errorModalConfiguration;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          onTap?.call();
          context.read<OpenUriBlocType>().events.openURI(url, type: uriType);
        },
        child: _buildLinkErrorListener(context),
      );

  /// Convenience builder method that initializes OpenUrlWidget dependencies
  /// right above the widget.
  static Widget withDependencies({
    required String url,
    required Widget child,
    VoidCallback? onTap,
    Function(BuildContext, Exception)? onError,
    String Function(BuildContext, Exception)? translateError,
    UriType uriType = UriType.https,
    ModalConfiguration modalConfiguration = const ModalConfiguration(),
    Key? key,
  }) =>
      MultiProvider(
        providers: OpenUrlDependencies.from().providers,
        child: OpenUrlWidget(
          key: key,
          url: url,
          uriType: uriType,
          onTap: onTap,
          onError: onError,
          translateError: translateError,
          errorModalConfiguration: modalConfiguration,
          child: child,
        ),
      );

  Widget _buildLinkErrorListener(BuildContext context) =>
      RxBlocListener<OpenUriBlocType, Result<void>>(
        state: (bloc) => bloc.states.onUriClick,
        listener: (context, state) {
          if (state is ResultError) {
            final error = state.error;
            final errorMsg =
                translateError?.call(context, error) ?? error.toString();

            onError?.call(context, error);
            showErrorBlurredBottomSheet(
              context: context,
              error: errorMsg,
              configuration: errorModalConfiguration,
            );
          }
        },
        child: child,
      );
}
