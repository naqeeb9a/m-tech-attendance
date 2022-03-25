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
                child: Container(
                  width: CustomSizes().dynamicWidth(context, 0.9),
                  height: CustomSizes().dynamicHeight(context, 1),
                  child: Column(
                    children: [
                      topBar(context, "My Team"),
                      CustomSizes().heightBox(context, 0.1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Kuchbhirakhomagarmastrakho(
                              context,
                              Icons.fact_check_outlined,
                              "  Team\nReports",
                              AppColors.customPink),
                          Kuchbhirakhomagarmastrakho(
                              context,
                              Icons.check_box_outlined,
                              "  Todo &\nSchedules",
                              AppColors.customPurple),
                          Kuchbhirakhomagarmastrakho(
                              context,
                              Icons.location_on_outlined,
                              "  Office &\nLocations",
                              AppColors.customBlue),
                          Kuchbhirakhomagarmastrakho(
                              context,
                              Icons.person_search_outlined,
                              "       Team\nManagement",
                              AppColors.customRed),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: text(
                            context, "Present", 0.035, AppColors.customGrey),
                      ),
                      CustomSizes().heightBox(context, 0.05),
                      Row(
                        children: [
                          Container(
                            width: CustomSizes().dynamicWidth(context, 0.43),
                            height: CustomSizes().dynamicHeight(context, 0.07),
                            decoration: BoxDecoration(
                              border: Border.all(),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                text(context, "Oman Team", 0.03, AppColors.customBlack),
                                CustomSizes().widthBox(context, 0.12),
                                Icon(Icons.keyboard_arrow_down_outlined)
                              ],
                            ),
                          ),
                          CustomSizes().widthBox(context, 0.04),
                          Container(
                            width: CustomSizes().dynamicWidth(context, 0.43),
                            height: CustomSizes().dynamicHeight(context, 0.07),
                            decoration: BoxDecoration(
                              border: Border.all(),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                text(context, "25 March 2021", 0.03, AppColors.customBlack),
                                CustomSizes().widthBox(context, 0.12),
                                Icon(Icons.keyboard_arrow_down_outlined)
                              ],
                            ),
                          ),
                        ],
                      )
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
