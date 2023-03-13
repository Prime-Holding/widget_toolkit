import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';
import 'package:widget_toolkit/edit_address.dart';
import 'package:widget_toolkit/language_picker.dart';
import 'package:widget_toolkit/src/lib_edit_address/blocs/edit_address_bloc.dart';

import 'edit_address_mock.mocks.dart';

@GenerateMocks(
    [EditAddressBlocStates, EditAddressBlocEvents, EditAddressBlocType])
EditAddressBlocType editAddressMockFactory({
  AddressModel? onAddressSet,
  bool? isLoading,
  ErrorModel? errors,
  String? street,
  String? city,
  bool? isCountryEdited,
  CountryModel? country,
  AddressModel? address,
}) {
  final blocMock = MockEditAddressBlocType();
  final eventsMock = MockEditAddressBlocEvents();
  final statesMock = MockEditAddressBlocStates();

  when(blocMock.events).thenReturn(eventsMock);
  when(blocMock.states).thenReturn(statesMock);

  when(statesMock.onAddressSet).thenAnswer(
    (_) => onAddressSet != null
        ? Stream.value(onAddressSet)
        : const Stream.empty(),
  );

  when(statesMock.isLoading).thenAnswer(
    (_) => isLoading != null ? Stream.value(isLoading) : const Stream.empty(),
  );

  when(statesMock.errors).thenAnswer(
    (_) => errors != null
        ? Stream<ErrorModel?>.value(errors).publish()
        : Stream<ErrorModel?>.value(null).publish(),
  );

  when(statesMock.onAddressSaved).thenAnswer(
    (_) => address != null
        ? Stream.value(address).publish()
        : const Stream<AddressModel>.empty().publish(),
  );

  when(statesMock.street).thenAnswer(
    (_) => street != null
        ? Stream.value(street).publish()
        : const Stream<String>.empty().publish(),
  );

  when(statesMock.city).thenAnswer(
    (_) => city != null
        ? Stream.value(city).publish()
        : const Stream<String>.empty().publish(),
  );

  when(statesMock.isCountryEdited).thenAnswer(
    (_) => isCountryEdited != null
        ? Stream.value(isCountryEdited).publish()
        : const Stream<bool>.empty().publish(),
  );

  when(statesMock.country).thenAnswer(
    (_) => country != null
        ? Stream.value(country).publish()
        : const Stream<CountryModel>.empty().publish(),
  );

  when(statesMock.address).thenAnswer(
    (_) => address != null
        ? Stream.value(address).publish()
        : const Stream<AddressModel>.empty().publish(),
  );

  return blocMock;
}
