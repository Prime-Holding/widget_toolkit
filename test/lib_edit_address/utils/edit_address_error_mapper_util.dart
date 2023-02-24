import 'package:flutter/cupertino.dart';
import 'package:flutter_rx_bloc/rx_form.dart';

class EditAddressErrorMapperUtil<T> {
  RxFieldException<T> cityErrorMapper(Object error, BuildContext context) {
    throw const RxFieldException<String>(
      error: 'Error',
      fieldValue: 'city field value',
    );
  }

  RxFieldException<T> addressErrorMapper(Object error, BuildContext context) {
    throw const RxFieldException<String>(
      error: 'Error',
      fieldValue: 'address error',
    );
  }
}
