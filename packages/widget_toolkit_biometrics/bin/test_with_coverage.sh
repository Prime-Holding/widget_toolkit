#!/usr/bin/env sh

echo "🚀 Starting CI" 🚀
flutter analyze || exit
flutter test --coverage || exit
dart run clean_coverage clean --exclusions '**/**.g.dart','**/**.rxb.g.dart','**/**.mocks.dart','**repository.dart','**data_source.dart','**datasource.dart','**dependencies.dart','**_dependencies.dart','example/*' coverage/lcov.info
genhtml -o coverage coverage/lcov.info