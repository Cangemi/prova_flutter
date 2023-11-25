// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controllerHome.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ControllerHome on _ControllerHome, Store {
  late final _$novoValorAtom =
      Atom(name: '_ControllerHome.novoValor', context: context);

  @override
  String get novoValor {
    _$novoValorAtom.reportRead();
    return super.novoValor;
  }

  @override
  set novoValor(String value) {
    _$novoValorAtom.reportWrite(value, super.novoValor, () {
      super.novoValor = value;
    });
  }

  late final _$alertTextAtom =
      Atom(name: '_ControllerHome.alertText', context: context);

  @override
  String get alertText {
    _$alertTextAtom.reportRead();
    return super.alertText;
  }

  @override
  set alertText(String value) {
    _$alertTextAtom.reportWrite(value, super.alertText, () {
      super.alertText = value;
    });
  }

  late final _$setListAsyncAction =
      AsyncAction('_ControllerHome.setList', context: context);

  @override
  Future setList() {
    return _$setListAsyncAction.run(() => super.setList());
  }

  late final _$_ControllerHomeActionController =
      ActionController(name: '_ControllerHome', context: context);

  @override
  void setNovoValor(dynamic value) {
    final _$actionInfo = _$_ControllerHomeActionController.startAction(
        name: '_ControllerHome.setNovoValor');
    try {
      return super.setNovoValor(value);
    } finally {
      _$_ControllerHomeActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSavedList(dynamic value) {
    final _$actionInfo = _$_ControllerHomeActionController.startAction(
        name: '_ControllerHome.setSavedList');
    try {
      return super.setSavedList(value);
    } finally {
      _$_ControllerHomeActionController.endAction(_$actionInfo);
    }
  }

  @override
  void delete(int index) {
    final _$actionInfo = _$_ControllerHomeActionController.startAction(
        name: '_ControllerHome.delete');
    try {
      return super.delete(index);
    } finally {
      _$_ControllerHomeActionController.endAction(_$actionInfo);
    }
  }

  @override
  void update(int index) {
    final _$actionInfo = _$_ControllerHomeActionController.startAction(
        name: '_ControllerHome.update');
    try {
      return super.update(index);
    } finally {
      _$_ControllerHomeActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
novoValor: ${novoValor},
alertText: ${alertText}
    ''';
  }
}
