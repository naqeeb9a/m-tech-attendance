
import 'package:flutter/material.dart';
import 'package:mtech_attendance/app%20screens/login.dart';
import 'package:mtech_attendance/utils/config.dart';

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'M-Tech Attendance App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.primaryColor,
      ),
      home: const LoginScreen(),
    );
  }
}
