#!/usr/bin/env sh

flutter pub get && flutter pub run build_runner watch --delete-conflicting-outputs &&\
rm lib/src/lib_item_picker/blocs/item_picker_bloc.rxb.g.dart &&\
rm lib/src/lib_search_picker/blocs/search_picker_bloc.rxb.g.dart
