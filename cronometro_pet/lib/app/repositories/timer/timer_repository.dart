import 'package:cronometro_pet/app/models/timer/timer_model.dart';
import 'package:hive/hive.dart';

import '../../shared/constants/constants.dart';

class TimerRepository extends TimerModelAdapter {
  static Future<TimerModel> addTime(TimerModel value) async {
    var dbTimer = await Hive.openBox<TimerModel>(Constants.DB_TIMER);

    dbTimer.add(value);

    return value;
  }

  static Future<List<TimerModel>> getListTime() async {
    var dbTimer = await Hive.openBox<TimerModel>(Constants.DB_TIMER);
    List<TimerModel> timerList = [];
    print(dbTimer.length);
    for (int i = 0; i < dbTimer.length; i++) {
      timerList.add(await dbTimer.getAt(i)!);
    }

    print("Timer list is empty: ${timerList.isEmpty}");
    return timerList;
  }

  static Future<TimerModel> updateTime(TimerModel value) async {
    var dbTimer = await Hive.openBox<TimerModel>(Constants.DB_TIMER);
    List<TimerModel> timerList = [];
    print(dbTimer.length);
    for (int i = 0; i < dbTimer.length; i++) {
      if (dbTimer.getAt(i) == value) {
        print("Achou igual");
        dbTimer.putAt(i, value);
      }
    }
    return value;
  }

  //Ver id do model timer para deletar

  static Future<void> deleteAll() async {
    var dbTimer = await Hive.openBox<TimerModel>(Constants.DB_TIMER);
    await dbTimer.clear();

    return;
  }
}
