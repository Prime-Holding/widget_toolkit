import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../bloc/open_uri_bloc.dart';
import '../contracts/implementation/open_uri_data_source.dart';
import '../contracts/implementation/open_uri_repo.dart';
import '../contracts/open_uri_repository.dart';

/// Open URL dependencies that the OpenUrlWidget widget requires in order to
/// perform properly. Includes the bloc containing the states and events to
/// which the OpenUrlWidget can react to or manipulate.
class OpenUrlDependencies {
  OpenUrlDependencies._();

  factory OpenUrlDependencies.from() => OpenUrlDependencies._();

  /// The list of providers that can be injected into the widget tree in order
  /// for the OpenUrlWidget to work properly.
  late List<SingleChildWidget> providers = [
    ..._dataSources,
    ..._repos,
    ..._blocs,
  ];

  /// List of all supplied data sources
  late final List<SingleChildWidget> _dataSources = [
    Provider<OpenUriDataSource>(
      create: (context) => const OpenUriDataSource(),
    ),
  ];

  /// List of all supplied repositories
  late final List<SingleChildWidget> _repos = [
    Provider<OpenUriRepository>(
      create: (context) => OpenUriRepositoryImpl(
        context.read(),
      ),
    ),
  ];

  /// List of all supplied blocs
  late final List<RxBlocProvider> _blocs = [
    RxBlocProvider<OpenUriBlocType>(
      create: (context) => OpenUriBloc(
        context.read(),
      ),
    ),
  ];
}
