import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:online_market/data/banner_repository/dto/brends_dto.dart';
import 'package:online_market/data/banner_repository/repository/brends_repository.dart';
import 'package:online_market/data/product_repository/dto/product_dto.dart';
import 'package:online_market/data/product_repository/repository/product_repository.dart';

part 'product_controller.g.dart';

class ProductController = _ProductController with _$ProductController;

abstract class _ProductController with Store {
  @observable
  ObservableFuture<ProductDto>? product_controller;
  ProductRepository _repository = ProductRepository();

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
}
