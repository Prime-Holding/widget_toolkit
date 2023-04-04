#!/usr/bin/env sh

flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs &&\
rm lib/src/lib_qr_scanner/blocs/qr_scanner_bloc.rxb.g.dart