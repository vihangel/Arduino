import 'package:cronometro_pet/app/app_module.dart';
import 'package:cronometro_pet/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:path_provider/path_provider.dart' as path_provider;

import 'app/app_widget.dart';
import 'package:hive/hive.dart';

import 'app/models/user/user_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}

Future<void> initHive() async {
  final pathDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(pathDir.path);

  Hive.registerAdapter<UserModel>(UserModelAdapter());
}
