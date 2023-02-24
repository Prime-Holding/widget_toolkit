import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../contracts/open_uri_repository.dart';
import '../enums/uri_type_enum.dart';

part 'open_uri_bloc.rxb.g.dart';

/// A contract class containing all events of the OpenUriBloC.
abstract class OpenUriBlocEvents {
  void openURI(String uri, {UriType type = UriType.https});
}

/// A contract class containing all states of the OpenUriBloC.
abstract class OpenUriBlocStates {
  ConnectableStream<Result<void>> get onUriClick;
}

/// A OpenUri [RxBloc](https://pub.dev/packages/rx_bloc) which contains logic
/// required to make the OpenUrlWidget work. Defines contracts which allow its
/// user to open links and listen to any changes.
@RxBloc()
class OpenUriBloc extends $OpenUriBloc {
  OpenUriBloc(OpenUriRepository openUriRepository)
      : _openUriRepository = openUriRepository {
    onUriClick.connect().addTo(_compositeSubscription);
  }

  final OpenUriRepository _openUriRepository;

  @override
  ConnectableStream<Result<void>> _mapToOnUriClickState() => _$openURIEvent
      .map(_mapAndFormatUri)
      .switchMap((uri) => _openUriRepository.openUri(uri).asResultStream())
      .publishReplay(maxSize: 1);

  /// Converts uri and type to proper parsable format
  String _mapAndFormatUri(_OpenURIEventArgs args) {
    String formattedUri = '';

    switch (args.type) {
      case UriType.telephone:
        formattedUri = 'tel:${args.uri}';
        break;
      case UriType.sms:
        formattedUri = 'sms:${args.uri}';
        break;
      case UriType.mail:
        formattedUri = 'mailto:${args.uri}';
        break;
      case UriType.file:
        formattedUri = 'file:${args.uri}';
        break;
      case UriType.https:
      default:
        formattedUri = args.uri;
        if (!formattedUri.startsWith('https:') &&
            !formattedUri.startsWith('http:')) {
          formattedUri = 'https:${args.uri}';
        }
    }

    return formattedUri;
  }
}
