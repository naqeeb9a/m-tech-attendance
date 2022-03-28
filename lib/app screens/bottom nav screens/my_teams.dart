import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mtech_attendance/Widgets/text_widget.dart';
import 'package:mtech_attendance/app%20screens/login.dart';
import 'package:mtech_attendance/utils/dynamic_sizes.dart';
import 'dart:math' as math;
import '../../Widgets/basic_widgets.dart';
import '../../utils/config.dart';

class MyTeams extends StatefulWidget {
  const MyTeams({Key? key}) : super(key: key);

  @override
  State<MyTeams> createState() => _MyTeamsState();
}

class _MyTeamsState extends State<MyTeams> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.customWhite,
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
                    color: AppColors.customBlue.withOpacity(0.5),
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
                    color: AppColors.customBlue,
                    width: CustomSizes().dynamicWidth(context, 0.35),
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
              Center(
                child: SizedBox(
                  width: CustomSizes().dynamicWidth(context, 0.9),
                  height: CustomSizes().dynamicHeight(context, 1),
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(top : CustomSizes().dynamicHeight(context, .025)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            text(context, "My Teams",0.05, AppColors.customBlack,bold: true),
                            Icon(CupertinoIcons.square_grid_2x2_fill,color: AppColors.customBlue1,size:CustomSizes().dynamicWidth(context, .06),),
                          ],
                        ),
                      ),
                      CustomSizes().heightBox(context, 0.08),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          teamTopBox(
                              context,
                              Icons.fact_check_outlined,
                              "  Team\nReports",
                              AppColors.customBlue1,
                               AppColors.customLightBlue),
                          teamTopBox(
                              context,
                              Icons.check_box_outlined,
                              "  Todo &\nSchedules",
                              AppColors.customOrange,
                              AppColors.customLightOrange),
                          teamTopBox(
                              context,
                              Icons.location_on_outlined,
                              "  Office &\nLocations",
                              AppColors.customLightPurple,
                           AppColors.customDarkPurple),
                          teamTopBox(
                              context,
                              Icons.person_search_outlined,
                              "       Team\nManagement",
                              AppColors.customGreen,
                          AppColors.customSeaGreen),
                        ],
                      ),
                      CustomSizes().heightBox(context, 0.05),
                      Row(
                        children: [
                          text(
                              context, "Present", 0.03, AppColors.customGrey,bold: true),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
