import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Model/Constant.dart';
import 'View/Screens/All_Tasks_Page.dart';
import 'View/Screens/Login_page.dart';
import 'View/Screens/Tasks_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager System',
      theme: lightThemeData(context),
      home:  LoginPage(),
      getPages: [
        GetPage(name: '/LoginPage', page: () =>  LoginPage()),
        GetPage(name: '/TasksPage', page: () =>  TasksPage()),
        GetPage(name: '/AllTasks', page: () =>  AllTasks())
      ],
    );
  }
}
//          'username': 'kminchelle',
//           'password': '0lelplR',