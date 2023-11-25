// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alerts.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AlertStore on _AlertStore, Store {
  late final _$alertTextAtom =
      Atom(name: '_AlertStore.alertText', context: context);

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

  late final _$tokenAtom = Atom(name: '_AlertStore.token', context: context);

  @override
  bool get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(bool value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  late final _$usuarioAtom =
      Atom(name: '_AlertStore.usuario', context: context);

  @override
  String get usuario {
    _$usuarioAtom.reportRead();
    return super.usuario;
  }

  @override
  set usuario(String value) {
    _$usuarioAtom.reportWrite(value, super.usuario, () {
      super.usuario = value;
    });
  }

  late final _$senhaAtom = Atom(name: '_AlertStore.senha', context: context);

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  late final _$fieldCheckoutAsyncAction =
      AsyncAction('_AlertStore.fieldCheckout', context: context);

  @override
  Future fieldCheckout() {
    return _$fieldCheckoutAsyncAction.run(() => super.fieldCheckout());
  }

  late final _$_AlertStoreActionController =
      ActionController(name: '_AlertStore', context: context);

  @override
  void setUsuario(dynamic value) {
    final _$actionInfo = _$_AlertStoreActionController.startAction(
        name: '_AlertStore.setUsuario');
    try {
      return super.setUsuario(value);
    } finally {
      _$_AlertStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(dynamic value) {
    final _$actionInfo =
        _$_AlertStoreActionController.startAction(name: '_AlertStore.setSenha');
    try {
      return super.setSenha(value);
    } finally {
      _$_AlertStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
alertText: ${alertText},
token: ${token},
usuario: ${usuario},
senha: ${senha}
    ''';
  }
}
