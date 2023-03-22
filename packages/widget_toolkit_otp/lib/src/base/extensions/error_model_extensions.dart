import '../models/error/error_model.dart';

extension ExceptionToErrorModel on Exception {
  ErrorModel asErrorModel() =>
      this is ErrorModel ? this as ErrorModel : ErrorUnknown(exception: this);
}

extension StreamExceptionToErrorModel on Stream<Exception> {
  Stream<ErrorModel> mapToErrorModel() =>
      map((exception) => exception.asErrorModel());
}
