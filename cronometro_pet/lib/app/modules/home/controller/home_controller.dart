import 'dart:developer';

import 'package:cronometro_pet/app/modules/home/history/history_page.dart';
import 'package:cronometro_pet/app/modules/home/timer/timer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../models/user/user_model.dart';
import '../../../services/auth/auth_service.dart';

import '../profile/profile_page.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
//BottomBar
  @observable
  int currentIndex = 1;

  @observable
  int userIndex = 0;

  @action
  void updateIndex(int value) {
    currentIndex = value;
  }

  List<Widget> pages = [
    ProfilePage(),
    TimerPage(),
    HistoryPage(),
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
}
