// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'open_uri_bloc.dart';

/// Used as a contractor for the bloc, events and states classes
/// {@nodoc}
abstract class OpenUriBlocType extends RxBlocTypeBase {
  OpenUriBlocEvents get events;
  OpenUriBlocStates get states;
}

/// [$OpenUriBloc] extended by the [OpenUriBloc]
/// {@nodoc}
abstract class $OpenUriBloc extends RxBlocBase
    implements OpenUriBlocEvents, OpenUriBlocStates, OpenUriBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// Тhe [Subject] where events sink to by calling [openURI]
  final _$openURIEvent = PublishSubject<_OpenURIEventArgs>();

  /// The state of [onUriClick] implemented in [_mapToOnUriClickState]
  late final ConnectableStream<Result<void>> _onUriClickState =
      _mapToOnUriClickState();

  @override
  void openURI(
    String uri, {
    UriType type = UriType.https,
  }) =>
      _$openURIEvent.add(_OpenURIEventArgs(
        uri,
        type: type,
      ));

  @override
  ConnectableStream<Result<void>> get onUriClick => _onUriClickState;

  ConnectableStream<Result<void>> _mapToOnUriClickState();

  @override
  OpenUriBlocEvents get events => this;

  @override
  OpenUriBlocStates get states => this;

  @override
  void dispose() {
    _$openURIEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}

/// Helps providing the arguments in the [Subject.add] for
/// [OpenUriBlocEvents.openURI] event
class _OpenURIEventArgs {
  const _OpenURIEventArgs(
    this.uri, {
    this.type = UriType.https,
  });

  final String uri;

  final UriType type;
}
