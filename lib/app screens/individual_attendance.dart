import 'package:flutter/material.dart';
import 'package:mtech_attendance/Widgets/text_widget.dart';
import 'package:mtech_attendance/app%20screens/bottom%20nav%20screens/my_teams.dart';
import 'package:mtech_attendance/app%20screens/login.dart';

import '../utils/config.dart';
import '../utils/dynamic_sizes.dart';
import 'dart:math' as math;

class IndividualAttendance extends StatefulWidget {
  final dynamic userImage;
  final String name,designation;
  const IndividualAttendance({this.userImage,required this.name,required this.designation,Key? key}) : super(key: key);

  @override
  State<IndividualAttendance> createState() => _IndividualAttendanceState();
}

class _IndividualAttendanceState extends State<IndividualAttendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
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
                    color: AppColors.customBlue.withOpacity(0.2),
                    width: CustomSizes().dynamicWidth(context, 0.4),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Transform.rotate(
                  angle: math.pi / 1,
                  child: Image.asset(
                    'assets/signup_top.png',
                    color: AppColors.customBlue.withOpacity(0.2),
                    width: CustomSizes().dynamicWidth(context, 0.35),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Image.asset(
                  "assets/main_bottom.png",
                  color: AppColors.customBlue.withOpacity(0.2),
                  width: CustomSizes().dynamicWidth(context, 0.15),
                ),
              ),
              Center(
                child: SizedBox(
                  width: CustomSizes().dynamicWidth(context, 1),
                  height: CustomSizes().dynamicHeight(context, 1),
                  child: Column(
                    children: [

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: CustomSizes().dynamicWidth(context, .04)),
                          child: Column(
                            children: [
                              topBar(context, ""),
                              CircleAvatar(
                                radius: CustomSizes().dynamicHeight(context, .06),
                                backgroundImage: NetworkImage(widget.userImage),

                              ),
                              CustomSizes().heightBox(context, .01),
                              text(context, widget.name, 0.05, AppColors.customBlack),
                              CustomSizes().heightBox(context, .01),
                              text(context, widget.designation, 0.035, AppColors.customGrey),
                              CustomSizes().heightBox(context, .03),
                              topBarBox(context),
                            ],
                          ),
                        ),
                      CustomSizes().heightBox(context, .02),
                      const Divider(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
