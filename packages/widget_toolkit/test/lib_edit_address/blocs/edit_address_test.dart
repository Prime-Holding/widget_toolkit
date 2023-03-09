import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rx_bloc_test/rx_bloc_test.dart';
import 'package:widget_toolkit/edit_address.dart';
import 'package:widget_toolkit/src/lib_edit_address/blocs/edit_address_bloc.dart';

import '../../mocks/stubs.dart';
import '../service/save_address_service_mock.dart';
import 'edit_address_test.mocks.dart';

@GenerateMocks([
  EditAddressService,
  SaveAddressServiceMock,
  AddressModel,
])
void main() {
  late EditAddressService service;
  late AddressModel addressModel;

  setUp(() {
    service = MockEditAddressService();
    addressModel = Stubs.addressModel;
  });

  void defineWhen(/*value*/) {
    when(service.saveAddress(addressModel))
        .thenAnswer((_) async => addressModel);
  }

  EditAddressBloc editAddressBloc() => EditAddressBloc(
        service: service,
        addressModel: addressModel,
      );

  group('test edit_address_bloc_dart state onAddressSet', () {
    rxBlocTest<EditAddressBlocType, AddressModel>(
        'test edit_address_bloc_dart state onAddressSet',
        build: () async {
          defineWhen();
          return editAddressBloc();
        },
        act: (bloc) async {
          bloc.events.setAddress(Stubs.addressModel);
        },
        state: (bloc) => bloc.states.onAddressSet,
        expect: [
          Stubs.addressModel,
        ]);
  });

  group('test edit_address_bloc_dart state isLoading', () {
    rxBlocTest<EditAddressBlocType, bool>(
        'test edit_address_bloc_dart state isLoading',
        build: () async {
          defineWhen();
          return editAddressBloc();
        },
        act: (bloc) async {
          bloc.events.saveAddress();
        },
        state: (bloc) => bloc.states.isLoading,
        expect: [
          false,
          true,
          false,
        ]);
  });

  group('test edit_address_bloc_dart state onAddressSaved', () {
    rxBlocTest<EditAddressBlocType, void>(
        'test edit_address_bloc_dart state onAddressSaved',
        build: () async {
          defineWhen();
          return editAddressBloc();
        },
        act: (bloc) async {
          bloc.events.saveAddress();
        },
        state: (bloc) => bloc.states.onAddressSaved,
        expect: []);
  });

  group('test edit_address_bloc_dart state street', () {
    rxBlocTest<EditAddressBlocType, String>(
        'test edit_address_bloc_dart state street',
        build: () async {
          defineWhen();
          return editAddressBloc();
        },
        act: (bloc) async {
          bloc.events.setStreet(Stubs.street);
        },
        state: (bloc) => bloc.states.street,
        expect: [
          Stubs.street,
        ]);
  });

  group('test edit_address_bloc_dart state city', () {
    rxBlocTest<EditAddressBlocType, String>(
        'test edit_address_bloc_dart state city',
        build: () async {
          defineWhen();
          return editAddressBloc();
        },
        act: (bloc) async {
          bloc.events.setCity(Stubs.city);
        },
        state: (bloc) => bloc.states.city,
        expect: [
          Stubs.city,
        ]);
  });

  group('test edit_address_bloc_dart state isCountryEdited', () {
    rxBlocTest<EditAddressBlocType, bool>(
        'test edit_address_bloc_dart state isCountryEdited False',
        build: () async {
          defineWhen();
          return editAddressBloc();
        },
        act: (bloc) async {
          bloc.events.setCountry(Stubs.countryModelBG);
          bloc.events.saveCountry();
        },
        state: (bloc) => bloc.states.isCountryEdited,
        expect: [
          false,
        ]);

    group('test edit_address_bloc_dart state country', () {
      rxBlocTest<EditAddressBlocType, CountryModel>(
          'test edit_address_bloc_dart state country',
          build: () async {
            defineWhen();
            return editAddressBloc();
          },
          act: (bloc) async {
            bloc.events.setCountry(Stubs.countryModelBG);
          },
          state: (bloc) => bloc.states.country,
          expect: [
            Stubs.countryModelBG,
          ]);
    });

    group('test edit_address_bloc_dart state address', () {
      rxBlocTest<EditAddressBlocType, AddressModel>(
          'test edit_address_bloc_dart state address',
          build: () async {
            defineWhen();
            return editAddressBloc();
          },
          act: (bloc) async {
            bloc.events.setAddress(Stubs.addressModel);
          },
          state: (bloc) => bloc.states.address,
          expect: [
            Stubs.addressModel,
          ]);
    });
  });
}
