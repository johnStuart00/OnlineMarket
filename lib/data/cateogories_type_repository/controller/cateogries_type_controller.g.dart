// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cateogries_type_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CategoriesTypeController on _CategoriesTypeController, Store {
  late final _$categorAtom =
      Atom(name: '_CategoriesTypeController.categor', context: context);

  @override
  ObservableFuture<CategoriesTypeDto>? get categor {
    _$categorAtom.reportRead();
    return super.categor;
  }

  @override
  set categor(ObservableFuture<CategoriesTypeDto>? value) {
    _$categorAtom.reportWrite(value, super.categor, () {
      super.categor = value;
    });
  }

  late final _$fetchDataAsyncAction =
      AsyncAction('_CategoriesTypeController.fetchData', context: context);

  @override
  Future<void> fetchData() {
    return _$fetchDataAsyncAction.run(() => super.fetchData());
  }

  @override
  String toString() {
    return '''
categor: ${categor}
    ''';
  }
}
