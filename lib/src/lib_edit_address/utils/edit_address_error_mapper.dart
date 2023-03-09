import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/rx_form.dart';

/// This class should be implemented in your project in order to map the error
/// for the city and street text values validation to RxFieldException<String>
/// type
///
/// [cityErrorMapper] ia a function, which maps the the exceptions thrown from the
/// validation methods inside the class implementing the [TextFieldValidator]
/// class. The methods in that class validate the input String value for the edit
/// city text input field. The [cityErrorMapper] should map the exception to a
/// RxFieldException
///
/// [streetErrorMapper] a function, which maps the the exceptions thrown from the
/// validation methods inside the class implementing the [TextFieldValidator]
/// class. The methods in that class validate the input String value for the edit
/// address text input field. The [addressErrorMapper] should map the exception to a
/// RxFieldException
abstract class EditAddressErrorMapper {
  RxFieldException<String> cityErrorMapper(Object error, BuildContext context);

  RxFieldException<String> streetErrorMapper(
      Object error, BuildContext context);
}
