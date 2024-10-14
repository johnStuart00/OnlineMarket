import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:online_market/data/product_repository/dto/product_dto.dart';
import 'package:online_market/data/product_repository/repository/product_repository.dart';

part 'product_controller.g.dart';

class ProductController = _ProductController with _$ProductController;

abstract class _ProductController with Store {
  @observable
  ObservableFuture<ProductDto>? product_controller;
  ProductRepository _repository = ProductRepository();
  @observable
  ObservableFuture<ProductDto>? brend_controller;
  @action
  Future<void> fetchData() async {
    try {
      product_controller =
          ObservableFuture(_repository.product_repository()).then((e) {
        log(e.toString());
        return e;
      }).catchError((e) {
        log(e);
      });
    } catch (e) {
      product_controller = ObservableFuture.error(e);
    }
  }

  @action
  Future<void> brendProduct(String id) async {
    try {
      brend_controller =
          ObservableFuture(_repository.brendProduct(id)).then((e) {
        log(e.toString());
        return e;
      }).catchError((e) {
        log(e);
      });
    } catch (e) {
      brend_controller = ObservableFuture.error(e);
    }
  }
}
