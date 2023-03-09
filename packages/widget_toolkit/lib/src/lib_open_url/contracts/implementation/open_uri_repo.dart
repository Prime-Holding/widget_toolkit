import '../open_uri_repository.dart';
import 'open_uri_data_source.dart';

/// Concrete implementation of the OpenUriRepository abstract class
class OpenUriRepositoryImpl implements OpenUriRepository {
  const OpenUriRepositoryImpl(OpenUriDataSource openUriDataSource)
      : _openUriDataSource = openUriDataSource;

  /// Open Uri data source which handles all the logic related to opening URIs
  final OpenUriDataSource _openUriDataSource;

  @override
  Future<void> openUri(String uri) => _openUriDataSource.openUri(uri);
}
