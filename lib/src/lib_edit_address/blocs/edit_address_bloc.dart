import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../language_picker.dart';
import '../../base/extensions/error_model_extensions.dart';
import '../models/address_model.dart';
import '../models/country_model.dart';
import '../services/edit_address_service.dart';

part 'edit_address_bloc.rxb.g.dart';

/// A contract class containing all events of the ProfileEditAddressBloC.
abstract class EditAddressBlocEvents {
  /// The event is called, after a country value is selected, a city value is saved
  /// or address value is saved
  @RxBlocEvent(type: RxBlocEventType.behaviour)
  void setAddress(AddressModel addressModel);

  /// The event is called, when the save button for the contact address is tapped
  void saveAddress();

  /// The event is called, when a new street address is saved
  void setStreet(String newStreet);

  /// The event is called, when a new city is saved
  void setCity(String newCity);

  /// The event is called, when a country is selected
  @RxBlocEvent(type: RxBlocEventType.behaviour)
  void setCountry(CountryModel newCountry);

  /// The event is called, when a country is selected
  void saveCountry();
}

/// A contract class containing all states of the ProfileEditAddressBloC.
abstract class EditAddressBlocStates {
  /// The state is updated, when one of the 3 values: country, city, street
  /// is updated
  Stream<AddressModel> get onAddressSet;

  /// The loading state
  Stream<bool> get isLoading;

  /// The error state
  ConnectableStream<ErrorModel?> get errors;

  /// The state is updated, when the save button for the contact address is tapped
  ConnectableStream<void> get onAddressSaved;

  /// The state is updated, when a new street address is saved
  ConnectableStream<String> get street;

  /// The state is updated, when a new city address is saved
  ConnectableStream<String> get city;

  /// The state is updated, when a country is selected
  ConnectableStream<bool> get isCountryEdited;

  /// The state is updated, when a country is selected
  ConnectableStream<CountryModel> get country;

  /// The state is updated, when one of the 3 values: country, city, street
  /// is updated
  ConnectableStream<AddressModel> get address;
}

@RxBloc()
class EditAddressBloc extends $EditAddressBloc {
  EditAddressBloc({
    required EditAddressService service,
    required AddressModel addressModel,
  })  : _service = service,
        _initialAddressModel = addressModel,
        _addressSubject = BehaviorSubject.seeded(addressModel) {
    city.connect().addTo(_compositeSubscription);
    street.connect().addTo(_compositeSubscription);
    country.connect().addTo(_compositeSubscription);
    isCountryEdited.connect().addTo(_compositeSubscription);
    address.connect().addTo(_compositeSubscription);
    onAddressSaved.connect().addTo(_compositeSubscription);
    errors.connect().addTo(_compositeSubscription);
    Rx.merge([
      _$setCityEvent.map((city) => _addressSubject.value.copyWith(city: city)),
      _$saveCountryEvent.map(
        (_) => _addressSubject.value.copyWith(country: _$setCountryEvent.value),
      ),
      _$setStreetEvent.map(
          (street) => _addressSubject.value.copyWith(streetAddress: street)),
    ]).bind(_addressSubject).addTo(_compositeSubscription);
  }

  final EditAddressService _service;
  final AddressModel _initialAddressModel;
  final BehaviorSubject<AddressModel> _addressSubject;

  @override
  ConnectableStream<String> _mapToStreetState() => _$setStreetEvent
      .startWith(_addressSubject.value.streetAddress)
      .publishReplay(maxSize: 1);

  @override
  ConnectableStream<CountryModel> _mapToCountryState() => _$setCountryEvent
      .startWith(_addressSubject.value.country)
      .publishReplay(maxSize: 1);

  @override
  ConnectableStream<String> _mapToCityState() => _$setCityEvent
      .startWith(_addressSubject.value.city)
      .publishReplay(maxSize: 1);

  @override
  ConnectableStream<bool> _mapToIsCountryEditedState() => _$saveCountryEvent
      .map(
        (event) =>
            _$setCountryEvent.value.countryCode !=
            _addressSubject.value.country.countryCode,
      )
      .startWith(false)
      .publishReplay(maxSize: 1);

  @override
  ConnectableStream<AddressModel> _mapToAddressState() =>
      _addressSubject.publishReplay(maxSize: 1);

  @override
  ConnectableStream<ErrorModel?> _mapToErrorsState() => Rx.merge<ErrorModel?>([
        errorState.mapToErrorModel(),
        loadingState.where((loading) => loading).map((event) => null),
      ]).publish();

  @override
  Stream<bool> _mapToIsLoadingState() => loadingState;

  @override
  ConnectableStream<void> _mapToOnAddressSavedState() => _$saveAddressEvent
      .map(
        (_) => _$setAddressEvent.hasValue
            ? _$setAddressEvent.value
            : _initialAddressModel,
      )
      .switchMap(
        (address) => _service.saveAddress(address).asResultStream(),
      )
      .setResultStateHandler(this)
      .whereSuccess()
      .publish();

  @override
  Stream<AddressModel> _mapToOnAddressSetState() => _$setAddressEvent;

  @override
  void dispose() {
    _addressSubject.close();
    super.dispose();
  }
}
