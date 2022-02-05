import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:interview/app/core/themes/themes.dart';
import 'package:interview/app/routes/app_pages.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Data Management',
      initialRoute: Routes.login,
      getPages: AppPages.routes,
      theme: lightTheme,
      darkTheme: dartTheme,
    );
  }
}
