import 'package:flutter/cupertino.dart';
import 'package:flutter_rx_bloc/rx_form.dart';

class EditAddressErrorMapperUtil<T> {
  T translateError(Object error, BuildContext context) {
    throw const RxFieldException<String>(
      error: 'Error',
      fieldValue: 'field value',
    );
  }
}
