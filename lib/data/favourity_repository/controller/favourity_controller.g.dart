// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourity_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Favourity_Controller on _Favourity_Controller, Store {
  late final _$favouritAtom =
      Atom(name: '_Favourity_Controller.favourit', context: context);

  @override
  ObservableList<dynamic> get favourit {
    _$favouritAtom.reportRead();
    return super.favourit;
  }

  @override
  set favourit(ObservableList<dynamic> value) {
    _$favouritAtom.reportWrite(value, super.favourit, () {
      super.favourit = value;
    });
  }

  late final _$keysAtom =
      Atom(name: '_Favourity_Controller.keys', context: context);

  @override
  ObservableList<dynamic> get keys {
    _$keysAtom.reportRead();
    return super.keys;
  }

  @override
  set keys(ObservableList<dynamic> value) {
    _$keysAtom.reportWrite(value, super.keys, () {
      super.keys = value;
    });
  }

  late final _$_Favourity_ControllerActionController =
      ActionController(name: '_Favourity_Controller', context: context);

  @override
  dynamic writedb(Favourity_model models) {
    final _$actionInfo = _$_Favourity_ControllerActionController.startAction(
        name: '_Favourity_Controller.writedb');
    try {
      return super.writedb(models);
    } finally {
      _$_Favourity_ControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic readdb() {
    final _$actionInfo = _$_Favourity_ControllerActionController.startAction(
        name: '_Favourity_Controller.readdb');
    try {
      return super.readdb();
    } finally {
      _$_Favourity_ControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic checkdb(String id, Favourity_model model) {
    final _$actionInfo = _$_Favourity_ControllerActionController.startAction(
        name: '_Favourity_Controller.checkdb');
    try {
      return super.checkdb(id, model);
    } finally {
      _$_Favourity_ControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deletedb(String id) {
    final _$actionInfo = _$_Favourity_ControllerActionController.startAction(
        name: '_Favourity_Controller.deletedb');
    try {
      return super.deletedb(id);
    } finally {
      _$_Favourity_ControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favourit: ${favourit},
keys: ${keys}
    ''';
  }
}
