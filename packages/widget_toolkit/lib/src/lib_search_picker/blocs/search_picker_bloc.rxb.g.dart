// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'search_picker_bloc.dart';

//part of 'search_picker_bloc.dart';

/// Used as a contractor for the bloc, events and states classes
/// @nodoc
abstract class SearchPickerBlocType extends RxBlocTypeBase {
  SearchPickerBlocEvents get events;
  SearchPickerBlocStates get states;
}

/// [$SearchPickerBloc<T>] extended by the [SearchPickerBloc<T>]
/// @nodoc
abstract class $SearchPickerBloc<T> extends RxBlocBase
    implements
        SearchPickerBlocEvents,
        SearchPickerBlocStates,
        SearchPickerBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// Тhe [Subject] where events sink to by calling [loadItems]
  final _$loadItemsEvent = PublishSubject<void>();

  /// Тhe [Subject] where events sink to by calling [filterByQuery]
  final _$filterByQueryEvent = BehaviorSubject<String?>.seeded(null);

  /// The state of [itemsList] implemented in [_mapToItemsListState]
  late final Stream<Result<List<T>>> _itemsListState = _mapToItemsListState();

  @override
  void loadItems() => _$loadItemsEvent.add(null);

  @override
  void filterByQuery({String? query}) => _$filterByQueryEvent.add(query);

  @override
  Stream<Result<List<T>>> get itemsList => _itemsListState;

  Stream<Result<List<T>>> _mapToItemsListState();

  @override
  SearchPickerBlocEvents get events => this;

  @override
  SearchPickerBlocStates get states => this;

  @override
  void dispose() {
    _$loadItemsEvent.close();
    _$filterByQueryEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}
