// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$currentIndexAtom = Atom(name: '_HomeControllerBase.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  final _$userIndexAtom = Atom(name: '_HomeControllerBase.userIndex');

  @override
  int get userIndex {
    _$userIndexAtom.reportRead();
    return super.userIndex;
  }

  @override
  set userIndex(int value) {
    _$userIndexAtom.reportWrite(value, super.userIndex, () {
      super.userIndex = value;
    });
  }

  final _$controllerAtom = Atom(name: '_HomeControllerBase.controller');

  @override
  AuthService get controller {
    _$controllerAtom.reportRead();
    return super.controller;
  }

  @override
  set controller(AuthService value) {
    _$controllerAtom.reportWrite(value, super.controller, () {
      super.controller = value;
    });
  }

  final _$signOutAsyncAction = AsyncAction('_HomeControllerBase.signOut');

  @override
  Future<void> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void updateIndex(int value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.updateIndex');
    try {
      return super.updateIndex(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
userIndex: ${userIndex},
controller: ${controller}
    ''';
  }
}
