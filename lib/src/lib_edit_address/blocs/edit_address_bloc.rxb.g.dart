// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'edit_address_bloc.dart';

/// Used as a contractor for the bloc, events and states classes
/// {@nodoc}
abstract class EditAddressBlocType extends RxBlocTypeBase {
  EditAddressBlocEvents get events;
  EditAddressBlocStates get states;
}

/// [$EditAddressBloc] extended by the [EditAddressBloc]
/// {@nodoc}
abstract class $EditAddressBloc extends RxBlocBase
    implements
        EditAddressBlocEvents,
        EditAddressBlocStates,
        EditAddressBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// Тhe [Subject] where events sink to by calling [setAddress]
  final _$setAddressEvent = BehaviorSubject<AddressModel>();

  /// Тhe [Subject] where events sink to by calling [saveAddress]
  final _$saveAddressEvent = PublishSubject<void>();

  /// Тhe [Subject] where events sink to by calling [setStreet]
  final _$setStreetEvent = PublishSubject<String>();

  /// Тhe [Subject] where events sink to by calling [setCity]
  final _$setCityEvent = PublishSubject<String>();

  /// Тhe [Subject] where events sink to by calling [setCountry]
  final _$setCountryEvent = BehaviorSubject<CountryModel>();

  /// Тhe [Subject] where events sink to by calling [saveCountry]
  final _$saveCountryEvent = PublishSubject<void>();

  /// The state of [onAddressSet] implemented in [_mapToOnAddressSetState]
  late final Stream<AddressModel> _onAddressSetState =
      _mapToOnAddressSetState();

  /// The state of [isLoading] implemented in [_mapToIsLoadingState]
  late final Stream<bool> _isLoadingState = _mapToIsLoadingState();

  /// The state of [errors] implemented in [_mapToErrorsState]
  late final ConnectableStream<ErrorModel?> _errorsState = _mapToErrorsState();

  /// The state of [onAddressSaved] implemented in [_mapToOnAddressSavedState]
  late final ConnectableStream<void> _onAddressSavedState =
      _mapToOnAddressSavedState();

  /// The state of [street] implemented in [_mapToStreetState]
  late final ConnectableStream<String> _streetState = _mapToStreetState();

  /// The state of [city] implemented in [_mapToCityState]
  late final ConnectableStream<String> _cityState = _mapToCityState();

  /// The state of [isCountryEdited] implemented in [_mapToIsCountryEditedState]
  late final ConnectableStream<bool> _isCountryEditedState =
      _mapToIsCountryEditedState();

  /// The state of [country] implemented in [_mapToCountryState]
  late final ConnectableStream<CountryModel> _countryState =
      _mapToCountryState();

  /// The state of [address] implemented in [_mapToAddressState]
  late final ConnectableStream<AddressModel> _addressState =
      _mapToAddressState();

  @override
  void setAddress(AddressModel addressModel) =>
      _$setAddressEvent.add(addressModel);

  @override
  void saveAddress() => _$saveAddressEvent.add(null);

  @override
  void setStreet(String newStreet) => _$setStreetEvent.add(newStreet);

  @override
  void setCity(String newCity) => _$setCityEvent.add(newCity);

  @override
  void setCountry(CountryModel newCountry) => _$setCountryEvent.add(newCountry);

  @override
  void saveCountry() => _$saveCountryEvent.add(null);

  @override
  Stream<AddressModel> get onAddressSet => _onAddressSetState;

  @override
  Stream<bool> get isLoading => _isLoadingState;

  @override
  ConnectableStream<ErrorModel?> get errors => _errorsState;

  @override
  ConnectableStream<void> get onAddressSaved => _onAddressSavedState;

  @override
  ConnectableStream<String> get street => _streetState;

  @override
  ConnectableStream<String> get city => _cityState;

  @override
  ConnectableStream<bool> get isCountryEdited => _isCountryEditedState;

  @override
  ConnectableStream<CountryModel> get country => _countryState;

  @override
  ConnectableStream<AddressModel> get address => _addressState;

  Stream<AddressModel> _mapToOnAddressSetState();

  Stream<bool> _mapToIsLoadingState();

  ConnectableStream<ErrorModel?> _mapToErrorsState();

  ConnectableStream<void> _mapToOnAddressSavedState();

  ConnectableStream<String> _mapToStreetState();

  ConnectableStream<String> _mapToCityState();

  ConnectableStream<bool> _mapToIsCountryEditedState();

  ConnectableStream<CountryModel> _mapToCountryState();

  ConnectableStream<AddressModel> _mapToAddressState();

  @override
  EditAddressBlocEvents get events => this;

  @override
  EditAddressBlocStates get states => this;

  @override
  void dispose() {
    _$setAddressEvent.close();
    _$saveAddressEvent.close();
    _$setStreetEvent.close();
    _$setCityEvent.close();
    _$setCountryEvent.close();
    _$saveCountryEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}
