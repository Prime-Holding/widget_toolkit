import 'package:flutter/cupertino.dart';
import 'package:flutter_rx_bloc/rx_form.dart';
import 'package:widget_toolkit/edit_address.dart';

class EditAddressErrorMapperUtil implements EditAddressErrorMapper{
  @override
  RxFieldException<String> cityErrorMapper(Object error, BuildContext context) {
    throw const RxFieldException<String>(
      error: 'Error',
      fieldValue: 'city field value',
    );
  }

  @override
  RxFieldException<String> streetErrorMapper(Object error, BuildContext context) {
    throw const RxFieldException<String>(
      error: 'Error',
      fieldValue: 'address error',
    );
  }
}
