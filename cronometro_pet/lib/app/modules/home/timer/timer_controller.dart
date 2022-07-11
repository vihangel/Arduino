import 'dart:async';

import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'timer_controller.g.dart';

class TimerController = _TimerControllerBase with _$TimerController;

abstract class _TimerControllerBase with Store {
  @observable
  bool isActived = false;

  @observable
  String time = "00:00:00";

  @observable
  int minute = 0;
  @observable
  int second = 0;
  @observable
  int mili = 0;

  @observable
  bool stop = false;

  @action
  Future<void> start() async {
    if (isActived) {
      isActived = false;
      stop = true;
      mili = 0;
      second = 0;
      minute = 0;
    } else {
      stop = false;
      isActived = true;
    }
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      if (stop) {
        timer.cancel();
      } else {
        print("aaaaa: ${timer.tick}");

        int value = timer.tick;
        int aux;

        minute = value ~/ 6000;
        aux = value - (minute * 6000);

        second = aux ~/ 100;
        aux = value - (second * 100);
        mili = aux;

        if (minute < 10) {
          time = "0$minute";
        } else {
          time = minute.toString();
        }

        if (second < 10) {
          time += ":0$second";
        } else {
          time += ":${second.toString().substring(0, 2)}";
        }

        if (mili < 10) {
          time += ":0$mili";
        } else if (mili >= 6000) {
          time += ":${mili.toString().substring(2, 4)}";
        } else {
          time += ":${mili.toString().substring(0, 2)}";
        }
        print(" minute: $minute, second: $second, mili: $mili");
      }
    });
  }
}
