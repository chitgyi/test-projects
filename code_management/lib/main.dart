import 'dart:io';

import 'package:code_management/app/core/bindings/initial_bindings.dart';
import 'package:code_management/app/core/database/my_db.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:code_management/app/core/themes/themes.dart';
import 'package:code_management/app/routes/app_pages.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dbFolder = await getApplicationDocumentsDirectory();
  final file = File(p.join(dbFolder.path, 'db6.sqlite'));
  Get.put<Database>(Database(NativeDatabase(file, logStatements: true)));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movie App',
      initialRoute: Routes.home,
      getPages: AppPages.routes,
      theme: lightTheme,
      darkTheme: dartTheme,
      initialBinding: InitialBindings(),
    );
  }
}
