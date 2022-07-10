// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MainController on _MainControllerBase, Store {
  final _$currentIndexAtom = Atom(name: '_MainControllerBase.currentIndex');

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

  final _$homeControllerAtom = Atom(name: '_MainControllerBase.homeController');

  @override
  HomeController get homeController {
    _$homeControllerAtom.reportRead();
    return super.homeController;
  }

  @override
  set homeController(HomeController value) {
    _$homeControllerAtom.reportWrite(value, super.homeController, () {
      super.homeController = value;
    });
  }

  final _$userAtom = Atom(name: '_MainControllerBase.user');

  @override
  UserModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$cardsAtom = Atom(name: '_MainControllerBase.cards');

  @override
  List<Widget> get cards {
    _$cardsAtom.reportRead();
    return super.cards;
  }

  @override
  set cards(List<Widget> value) {
    _$cardsAtom.reportWrite(value, super.cards, () {
      super.cards = value;
    });
  }

  final _$controllerAtom = Atom(name: '_MainControllerBase.controller');

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

  final _$signOutAsyncAction = AsyncAction('_MainControllerBase.signOut');

  @override
  Future<void> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  final _$_MainControllerBaseActionController =
      ActionController(name: '_MainControllerBase');

  @override
  void incrementIndex() {
    final _$actionInfo = _$_MainControllerBaseActionController.startAction(
        name: '_MainControllerBase.incrementIndex');
    try {
      return super.incrementIndex();
    } finally {
      _$_MainControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrementIndex() {
    final _$actionInfo = _$_MainControllerBaseActionController.startAction(
        name: '_MainControllerBase.decrementIndex');
    try {
      return super.decrementIndex();
    } finally {
      _$_MainControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateUser() {
    final _$actionInfo = _$_MainControllerBaseActionController.startAction(
        name: '_MainControllerBase.updateUser');
    try {
      return super.updateUser();
    } finally {
      _$_MainControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
homeController: ${homeController},
user: ${user},
cards: ${cards},
controller: ${controller}
    ''';
  }
}
