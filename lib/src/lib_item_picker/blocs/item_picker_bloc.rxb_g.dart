// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'item_picker_bloc.dart';

/// Used as a contractor for the bloc, events and states classes
/// {@nodoc}
abstract class ItemPickerBlocType<T> extends RxBlocTypeBase {
  ItemPickerBlocEvents get events;
  ItemPickerBlocStates<T> get states;
}

/// [$ItemPickerBloc<T>] extended by the [ItemPickerBloc<T>]
/// {@nodoc}
abstract class $ItemPickerBloc<T> extends RxBlocBase
    implements ItemPickerBlocEvents, ItemPickerBlocStates<T>, ItemPickerBlocType<T> {
  final _compositeSubscription = CompositeSubscription();

  /// Тhe [Subject] where events sink to by calling [loadItems]
  final _$loadItemsEvent = PublishSubject<void>();

  /// The state of [items] implemented in [_mapToItemsState]
  late final Stream<Result<List<T>>> _itemsState = _mapToItemsState();

  @override
  void loadItems() => _$loadItemsEvent.add(null);

  @override
  Stream<Result<List<T>>> get items => _itemsState;

  Stream<Result<List<T>>> _mapToItemsState();

  @override
  ItemPickerBlocEvents get events => this;

  @override
  ItemPickerBlocStates<T> get states => this;

  @override
  void dispose() {
    _$loadItemsEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}
