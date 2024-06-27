import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widget_toolkit.dart';

class OpenUrlWidgetWithDependencies extends StatelessWidget {
  const OpenUrlWidgetWithDependencies({
    required this.url,
    required this.child,
    this.onTap,
    this.onError,
    this.translateError,
    this.uriType = UriType.https,
    this.modalConfiguration = const ModalConfiguration(),
    super.key,
  });

  final String url;
  final Widget child;
  final VoidCallback? onTap;
  final Function(BuildContext, Exception)? onError;
  final String Function(BuildContext, Exception)? translateError;
  final UriType uriType;
  final ModalConfiguration modalConfiguration;

  @override
  Widget build(BuildContext context) => MultiProvider(
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
}
