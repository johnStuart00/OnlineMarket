import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:online_market/data/banner_repository/dto/brends_dto.dart';
import 'package:online_market/data/banner_repository/repository/brends_repository.dart';
import 'package:online_market/data/categories_repository/dto/Categories_dto.dart';
import 'package:online_market/data/categories_repository/repository/categories_repositroy.dart';
import 'package:online_market/data/product_repository/dto/product_dto.dart';
import 'package:online_market/data/product_repository/repository/product_repository.dart';

part 'categories_controller.g.dart';

class CategoriesController = _CategoriesController with _$CategoriesController;

abstract class _CategoriesController with Store {
  @observable
  ObservableFuture<CategoriesDto>? categories;
  CategoriesRepositroy _repository = CategoriesRepositroy();

  @action
  Future<void> fetchData() async {
    try {
      categories =
          ObservableFuture(_repository.categoriesrepository()).then((e) {
        log(e.toString());
        return e;
      }).catchError((e) {
        log(e);
      });
    } catch (e) {
      categories = ObservableFuture.error(e);
    }
  }
}
