import 'dart:developer';

import 'package:mobx/mobx.dart';

import 'package:online_market/data/cateogories_type_repository/dto/categories_types_dto.dart';
import 'package:online_market/data/cateogories_type_repository/repository/categories_type_repository.dart';

part 'cateogries_type_controller.g.dart';

class CategoriesTypeController = _CategoriesTypeController
    with _$CategoriesTypeController;

abstract class _CategoriesTypeController with Store {
  @observable
  ObservableFuture<CategoriesTypeDto>? categor;
  CategoriesTypeRepository _repository = CategoriesTypeRepository();

  @action
  Future<void> fetchData() async {
    try {
      categor = ObservableFuture(_repository.product_repository()).then((e) {
        log(e.toString());
        return e;
      }).catchError((e) {
        log(e);
      });
    } catch (e) {
      categor = ObservableFuture.error(e);
    }
  }
}
