import 'package:flutter/cupertino.dart';

SingleChildRenderObjectWidget appFadeTransition({
  required Animation<double> animation,
  required Widget child,
}) =>
    FadeTransition(
      opacity: CurvedAnimation(
        parent: animation,
        curve: const Interval(
          0.4,
          1.0,
          curve: Curves.easeInOutCubic,
        ),
      ),
      child: SizeTransition(
        sizeFactor: CurvedAnimation(
          parent: animation,
          curve: const Interval(
            0.0,
            1.0,
            curve: Curves.easeInOutCubic,
          ),
        ),
        child: child,
      ),
    );
