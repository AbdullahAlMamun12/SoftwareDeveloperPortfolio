import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/ui_contorller.dart';
import 'screens/main/main_screen.dart';

void main() {
  var uiController = Get.put(UiController(),permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MainScreen(),
    );
  }
}
