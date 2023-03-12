import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../base/models/picker_item_model.dart';
import '../service/item_picker_service.dart';

part 'item_picker_bloc.rxb_g.dart';

/// A contract class containing all events of the CountryPickerBloC.
abstract class ItemPickerBlocEvents {
  void loadItems();
}

/// A contract class containing all states of the CountryPickerBloC.
abstract class ItemPickerBlocStates<T> {
  Stream<Result<List<T>>> get items;
}

@RxBloc()
class ItemPickerBloc<T extends PickerItemModel> extends $ItemPickerBloc<T> {
  ItemPickerBloc(this._service) {
    _$loadItemsEvent
        .startWith(null)
        .switchMap((_) => _service.getItems().asResultStream())
        .onErrorReturnWith(
          (error, stackTrace) => Result.error(
            error is Exception ? error : Exception(),
          ),
        )
        .setResultStateHandler(this)
        .bind(_itemsListSubject)
        .addTo(_compositeSubscription);
  }

  final ItemPickerService<T> _service;

  final _itemsListSubject = BehaviorSubject<Result<List<T>>>();

  @override
  void dispose() {
    _itemsListSubject.close();
    super.dispose();
  }

  @override
  Stream<Result<List<T>>> _mapToItemsState() => _itemsListSubject;
}
