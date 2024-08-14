// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brends_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BrendsController on _BrendsController, Store {
  late final _$brends_getAtom =
      Atom(name: '_BrendsController.brends_get', context: context);

  @override
  ObservableFuture<BrendsDto>? get brends_get {
    _$brends_getAtom.reportRead();
    return super.brends_get;
  }

  @override
  set brends_get(ObservableFuture<BrendsDto>? value) {
    _$brends_getAtom.reportWrite(value, super.brends_get, () {
      super.brends_get = value;
    });
  }

  late final _$fetchDataAsyncAction =
      AsyncAction('_BrendsController.fetchData', context: context);

  @override
  Future<void> fetchData() {
    return _$fetchDataAsyncAction.run(() => super.fetchData());
  }

  @override
  String toString() {
    return '''
brends_get: ${brends_get}
    ''';
  }
}
