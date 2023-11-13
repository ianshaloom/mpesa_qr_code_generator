import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'app.dart';
import 'hive/hive_initialization.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  // device orientation
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // get application documents directory
  final appDir = await path_provider.getApplicationDocumentsDirectory();

  // hive initialization
  await HiveInitialization.initFlutter(appDir.path);
  // registerAdapter
  await HiveInitialization.registerAdapters();

  runApp(const QrMpesa());
}