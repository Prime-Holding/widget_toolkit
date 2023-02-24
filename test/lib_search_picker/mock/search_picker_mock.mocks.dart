// Mocks generated by Mockito 5.3.2 from annotations
// in widget_toolkit/test/lib_search_picker/mock/search_picker_mock.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:rx_bloc/rx_bloc.dart' as _i4;
import 'package:widget_toolkit/src/lib_search_picker/blocs/search_picker_bloc.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeSearchPickerBlocEvents_0 extends _i1.SmartFake
    implements _i2.SearchPickerBlocEvents {
  _FakeSearchPickerBlocEvents_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSearchPickerBlocStates_1<T> extends _i1.SmartFake
    implements _i2.SearchPickerBlocStates<T> {
  _FakeSearchPickerBlocStates_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [SearchPickerBlocStates].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchPickerBlocStates<T> extends _i1.Mock
    implements _i2.SearchPickerBlocStates<T> {
  MockSearchPickerBlocStates() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Stream<_i4.Result<List<T>>> get itemsList => (super.noSuchMethod(
        Invocation.getter(#itemsList),
        returnValue: _i3.Stream<_i4.Result<List<T>>>.empty(),
      ) as _i3.Stream<_i4.Result<List<T>>>);
  @override
  _i3.Stream<String> get queryFilter => (super.noSuchMethod(
        Invocation.getter(#queryFilter),
        returnValue: _i3.Stream<String>.empty(),
      ) as _i3.Stream<String>);
}

/// A class which mocks [SearchPickerBlocEvents].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchPickerBlocEvents extends _i1.Mock
    implements _i2.SearchPickerBlocEvents {
  MockSearchPickerBlocEvents() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void loadItems() => super.noSuchMethod(
        Invocation.method(
          #loadItems,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void filterByQuery({String? query}) => super.noSuchMethod(
        Invocation.method(
          #filterByQuery,
          [],
          {#query: query},
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [SearchPickerBlocType].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchPickerBlocType<T> extends _i1.Mock
    implements _i2.SearchPickerBlocType<T> {
  MockSearchPickerBlocType() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.SearchPickerBlocEvents get events => (super.noSuchMethod(
        Invocation.getter(#events),
        returnValue: _FakeSearchPickerBlocEvents_0(
          this,
          Invocation.getter(#events),
        ),
      ) as _i2.SearchPickerBlocEvents);
  @override
  _i2.SearchPickerBlocStates<T> get states => (super.noSuchMethod(
        Invocation.getter(#states),
        returnValue: _FakeSearchPickerBlocStates_1<T>(
          this,
          Invocation.getter(#states),
        ),
      ) as _i2.SearchPickerBlocStates<T>);
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
}