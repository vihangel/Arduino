import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../models/user/user_model.dart';
import '../../../services/auth/auth_service.dart';
import '../controller/home_controller.dart';
import '../main/main_page.dart';
import 'widget/cards_swipe.dart';

part 'main_controller.g.dart';

class MainController = _MainControllerBase with _$MainController;

abstract class _MainControllerBase with Store {
//BottomBar
  @observable
  int currentIndex = 0;

  @action
  void incrementIndex() {
    if (currentIndex <
        homeController.users[homeController.userIndex].photos!.length - 1) {
      currentIndex += 1;
    }
  }

  @action
  void decrementIndex() {
    if (currentIndex > 0) {
      currentIndex -= 1;
    }
  }

  @observable
  HomeController homeController = Modular.get<HomeController>();

  @observable
  UserModel user = UserModel();

  @observable
  List<Widget> cards = [];

  @action
  void updateUser() {
    currentIndex = 0;
    cards.clear();
    homeController.users.forEach((element) {
      cards.add(CardsSwipe(
        name: element.name,
        userId: element.userId,
        age: element.age,
        photos: element.photos,
        tags: element.tags,
        pronoun: element.pronoun,
        profileIcon: element.profileIcon,
        course: element.course,
      ));
    });
  }

  @observable
  AuthService controller = Modular.get<AuthService>();

  @action
  Future<void> signOut() async {
    try {
      await controller.signOut();

      print("a");
    } catch (e, s) {
      log('Error ao realizar login, error: $e, stack: $s');
    }
  }
}
