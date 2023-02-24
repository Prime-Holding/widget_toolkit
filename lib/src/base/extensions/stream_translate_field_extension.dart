import 'package:flutter/widgets.dart';
import 'package:flutter_rx_bloc/rx_form.dart';

extension StreamFieldErrors<T> on Stream<T> {
  /// A method, which receives an error mapper, where the exceptions are mapped
  /// to RxFieldException errors. In the errorMapper you should translate the
  /// errors from an RxFormField steam to the correct language
  Stream<T> translateErrors(
      RxFieldException<dynamic> Function(Object obj, BuildContext context)
          errorMapper,
      BuildContext context) {
    return handleError((error) {
      throw errorMapper(error, context);
    });
  }
}
