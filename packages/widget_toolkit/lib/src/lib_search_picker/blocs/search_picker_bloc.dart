import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../services/search_picker_service.dart';

part 'search_picker_bloc.rxb_g.dart';

/// A contract class containing all events of the SearchPickerBloC.
abstract class SearchPickerBlocEvents {
  void loadItems();

  @RxBlocEvent(type: RxBlocEventType.behaviour, seed: null)
  void filterByQuery({String? query});
}

/// A contract class containing all states of the SearchPickerBloC.
abstract class SearchPickerBlocStates<T> {
  Stream<Result<List<T>>> get itemsList;

  @RxBlocIgnoreState()
  Stream<String> get queryFilter;
}

@RxBloc()
class SearchPickerBloc<T> extends $SearchPickerBloc<T> {
  SearchPickerBloc(this._service) {
    _$loadItemsEvent
        .startWith(null)
        .throttleTime(const Duration(seconds: 1))
        .switchMap((_) => _service.getItems().asResultStream())
        .bind(_listSubject)
        .addTo(_compositeSubscription);
  }

  final SearchPickerService<T> _service;

  final _listSubject =
      BehaviorSubject<Result<List<T>>>.seeded(Result.loading());

  @override
  Stream<Result<List<T>>> _mapToItemsListState() =>
      Rx.combineLatest2<Result<List<T>>, String?, _SearchParams<T>>(
        _listSubject,
        _$filterByQueryEvent,
        (result, searchQuery) => _SearchParams<T>(result, searchQuery),
      )
          .switchMap((value) => value.resultList
              .asyncMapResult((data) =>
                  _service.filteredListByName(data, value.searchQuery))
              .asStream())
          .distinct()
          .shareReplay(maxSize: 1);

  Future<List<T>> asyncFiltering(List<T> data, String searchQuery) =>
      _service.filteredListByName(data, searchQuery);

  @override
  Stream<String> get queryFilter =>
      _$filterByQueryEvent.map((searchQuery) => searchQuery ?? '');

  @override
  void dispose() {
    _listSubject.close();
    super.dispose();
  }
}

class _SearchParams<T> {
  _SearchParams(this.resultList, this.searchQuery);

  final Result<List<T>> resultList;
  final String? searchQuery;
}
