import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mtech_attendance/app%20screens/bottom%20nav%20screens/bottom_tab_bar.dart';
import 'package:mtech_attendance/app%20screens/login.dart';
import 'package:mtech_attendance/utils/config.dart';
import 'package:mtech_attendance/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool loader = false;

  checkLoginStatus(context1) async {
    SharedPreferences loginUser = await SharedPreferences.getInstance();
    dynamic temp = loginUser.getString("LoginResponse");

    var tempData = temp == null ? "" : await jsonDecode(temp);

    setState(() {
      userData = tempData;
    });

    if (temp == null) {
      Navigator.pushAndRemoveUntil(
        context1,
        MaterialPageRoute(
          builder: (context1) => const LoginScreen(),
        ),
        (route) => false,
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLoginStatus(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'M-Tech Attendance App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.primaryColor,
      ),
      home: userData == "" ? const LoginScreen() : const AppTabBar(),
    );
  }
}
