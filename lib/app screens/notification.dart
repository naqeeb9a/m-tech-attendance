import 'package:flutter/material.dart';
import 'package:mtech_attendance/Widgets/text_widget.dart';
import 'package:mtech_attendance/app%20screens/login.dart';

import '../utils/config.dart';
import '../utils/dynamic_sizes.dart';
import 'dart:math' as math;

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: CustomSizes().dynamicWidth(context, 1),
          height: CustomSizes().dynamicHeight(context, 1),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Transform.rotate(
                  angle: math.pi / 1,
                  child: Image.asset(
                    "assets/loginbottom.png",
                    color: AppColors.customBlue.withOpacity(0.5),
                    width: CustomSizes().dynamicWidth(context, 0.4),
                  ),
                ),
              ),
             Positioned(
                bottom: 0,
                left: 0,
                child: Image.asset(
                  "assets/main_bottom.png",
                  color: AppColors.customBlue,
                  width: CustomSizes().dynamicWidth(context, 0.15),
                ),
              ),
              Container(
                width: CustomSizes().dynamicWidth(context, 1),
                height: CustomSizes().dynamicHeight(context, 1),
                padding: EdgeInsets.symmetric(
                  horizontal: CustomSizes().dynamicWidth(context, .04),
                ),
                child: Column(
                  children: [
                    topBar(context, "Notifications", settingIcon: true),
                    
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
