import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobx/mobx.dart';

import 'package:online_market/data/cateogories_type_repository/dto/categories_types_dto.dart';
import 'package:online_market/data/cateogories_type_repository/repository/categories_type_repository.dart';
import 'package:online_market/data/models/favourity_model.dart';

part 'favourity_controller.g.dart';

class Favourity_Controller = _Favourity_Controller with _$Favourity_Controller;

abstract class _Favourity_Controller with Store {
  var box = Hive.box<Favourity_model>("favourity");
  @observable
  ObservableList favourit = ObservableList<Favourity_model>();
  @observable
  ObservableList keys = ObservableList<Favourity_model>();
  @action
  writedb(Favourity_model models) {
    print("writedb");

    box.put(models.id, models);
  }

  @action
  readdb() {
    favourit = ObservableList.of(box.values);
    keys = ObservableList.of(box.keys);
  }

  @action
  checkdb(String id, Favourity_model model) {
    print(box.keys.toList().contains(id));
    if (box.keys.toList().contains(id)) {
      deletedb(id);
    } else {
      writedb(model);
    }
    readdb();
  }

  @action
  deletedb(String id) {
    box.delete(id);
  }
}
