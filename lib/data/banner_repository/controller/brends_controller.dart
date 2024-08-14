import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:online_market/data/banner_repository/dto/brends_dto.dart';
import 'package:online_market/data/banner_repository/repository/brends_repository.dart';

part 'brends_controller.g.dart';

class BrendsController = _BrendsController with _$BrendsController;

abstract class _BrendsController with Store {
  @observable
  ObservableFuture<BrendsDto>? brends_get;
  BrendsRepository _repository = BrendsRepository();

  @action
  Future<void> fetchData() async {
    try {
      brends_get = ObservableFuture(_repository.purchase_get()).then((e) {
        log(e.toString());
        return e;
      }).catchError((e) {
        log(e);
      });
    } catch (e) {
      brends_get = ObservableFuture.error(e);
    }
  }
}
