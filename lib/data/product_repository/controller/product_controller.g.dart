// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductController on _ProductController, Store {
  late final _$product_controllerAtom =
      Atom(name: '_ProductController.product_controller', context: context);

  @override
  ObservableFuture<ProductDto>? get product_controller {
    _$product_controllerAtom.reportRead();
    return super.product_controller;
  }

  @override
  set product_controller(ObservableFuture<ProductDto>? value) {
    _$product_controllerAtom.reportWrite(value, super.product_controller, () {
      super.product_controller = value;
    });
  }

  late final _$fetchDataAsyncAction =
      AsyncAction('_ProductController.fetchData', context: context);

  @override
  Future<void> fetchData() {
    return _$fetchDataAsyncAction.run(() => super.fetchData());
  }

  @override
  String toString() {
    return '''
product_controller: ${product_controller}
    ''';
  }
}
