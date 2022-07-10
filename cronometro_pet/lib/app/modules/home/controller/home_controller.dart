import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../models/user/user_model.dart';
import '../../../services/auth/auth_service.dart';
import '../main/main_page.dart';
import '../profile/profile_page.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
//BottomBar
  @observable
  int currentIndex = 0;

  @observable
  int userIndex = 0;

  @action
  void updateIndex(int value) {
    currentIndex = value;
  }

  List<Widget> pages = [
    MainPage(),
    Text("Matchs"),
    ProfilePage(),
  ];

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

  void updateUserIndex() {
    if (userIndex == users.length - 1) {
      userIndex = 0;
    } else {
      userIndex += 1;
    }
    print("UserIndex: $userIndex");
  }

  List<UserModel> users = [
    UserModel(
      profileIcon: 'assets/img/caio1.jpeg',
      course: "Engenharia Elétrica",
      userId: "@ca.io.7",
      pronoun: "Ele/Elu",
      name: "Caio Andrade",
      age: 18,
      photos: [
        'assets/img/caio4.jpeg',
        'assets/img/caio1.jpeg',
      ],
      tags: [
        "Cerveja",
        "Lol",
      ],
    ),
    UserModel(
      course: "Engenharia Elétrica",
      userId: "@vih.angel",
      pronoun: "Ela/Ele/Elu",
      name: "Angel",
      age: 19,
      photos: [
        'assets/img/eu1.jpg',
        'assets/img/eu2.jpeg',
        'assets/img/eu3.jpeg',
        'assets/img/eu4.jpeg',
      ],
      profileIcon: 'assets/img/eu1.jpg',
      tags: [
        "Sair",
        "Jogos",
      ],
    ),
    UserModel(
      profileIcon: 'assets/img/flavio1.jpeg',
      course: "Sistemas de informação",
      userId: "@flavio_math",
      pronoun: "Ele/dele",
      name: "Flavio Matheus",
      age: 21,
      photos: [
        'assets/img/flavio2.jpeg',
        'assets/img/flavio3.jpeg',
        'assets/img/flavio4.jpeg',
        'assets/img/flavio5.jpeg',
      ],
      tags: [
        "Lol",
        "GEEK",
        "SEXTOU",
        "MUSICA",
      ],
    ),
  ];
}
