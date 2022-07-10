import 'package:hive/hive.dart';
import 'package:pega_pega/app/models/user/user_model.dart';

import '../../shared/constants/constants.dart';

class UserRepository extends UserModelAdapter {
  static Future<List<UserModel>> saveUserLogin(List<UserModel> value) async {
    var dbUser = await Hive.openBox<UserModel>(Constants.DB_USER);
    await dbUser.clear();

    dbUser.addAll(value);

    return value;
  }

  static Future<List<UserModel>> getUser() async {
    var dbUser = await Hive.openBox<UserModel>(Constants.DB_USER);
    List<UserModel> userList = [];
    print(dbUser.length);
    for (int i = 0; i < dbUser.length; i++) {
      userList.add(await dbUser.getAt(i)!);
    }

    print(userList.isEmpty);
    return userList;
  }

  static Future<void> deleteAll() async {
    var dbUser = await Hive.openBox<UserModel>(Constants.DB_USER);
    await dbUser.clear();

    return;
  }

  static Future<bool> isUserStored() async {
    var dbUser = await Hive.openBox<UserModel>(Constants.DB_USER);
    print(dbUser.length);
    return dbUser.isNotEmpty;
  }

  static Future<List<UserModel>> getUserHttp() async {
    List<UserModel> userList = [];

    userList.addAll(await UserRepository.getUser());

    return userList;
  }
}
