/// OpenUriRepository contract which defines the methods of the underlying
/// Open Uri logic used in conjunction with the `OpenUriBloc`.
abstract class OpenUriRepository {
  /// The open URI method which should handle any provided URI
  Future<void> openUri(String uri);
}
