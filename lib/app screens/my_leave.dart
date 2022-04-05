import 'package:flutter/material.dart';
import 'package:mtech_attendance/app%20screens/apply_leave.dart';
import 'package:mtech_attendance/app%20screens/bottom%20nav%20screens/notification.dart';
import 'package:mtech_attendance/app%20screens/login.dart';
import 'package:mtech_attendance/utils/app_routes.dart';
import 'package:mtech_attendance/utils/dynamic_sizes.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../Widgets/text_widget.dart';
import '../utils/config.dart';
import 'dart:math' as math;


class LeaveScreen extends StatefulWidget {
  const LeaveScreen({Key? key}) : super(key: key);

  @override
  State<LeaveScreen> createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
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
                      topBar(context, "My Leaves"),
                      CustomSizes().heightBox(context, .1),
                      Center(
                        child: GestureDetector(
                          onTap : () {
                            CustomRoutes().push(context, const ApplyLeave());
                          },
                          child: CircularPercentIndicator(
                            animation: true,
                            animationDuration: 1000,
                            circularStrokeCap: CircularStrokeCap.round,
                            radius: CustomSizes().dynamicHeight(context, .32),
                            lineWidth: CustomSizes().dynamicWidth(context, .0175),
                            percent: .5,
                            center: SizedBox(
                              width: CustomSizes().dynamicWidth(context, 0.45),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  text(context, "01", 0.08, AppColors.customDarkGrey, bold: true),
                                  text(context, "Leave Balance", 0.06, AppColors.customGrey),
                                ],
                              ),
                            ),
                            backgroundColor: AppColors.customGrey.withOpacity(.3),
                            progressColor: AppColors.customBlue,
                          ),
                        ),
                      ),
                      CustomSizes().heightBox(context, .03),
                      text(context,"Click to Apply for Leave",0.03,AppColors.customGrey.withOpacity(.65),bold: true),
                      CustomSizes().heightBox(context, .12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          leaves(context, AppColors.customGrey,"Total Leaves","2"),
                          leaves(context, AppColors.customBlue,"Leaves Used","1"),
                        ],
                      ),
                      CustomSizes().heightBox(context, .1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          rowCircularIndicator(context, AppColors.customBlue, "Casual Leave" ,),
                          rowCircularIndicator(context, AppColors.customPink, "Medical Leave"),
                          rowCircularIndicator(context, AppColors.customPurple, "Annual Leave"),
                          rowCircularIndicator(context, AppColors.customRed, "Maternity Leave"),
                        ],
                      ),
                      CustomSizes().heightBox(context, .06),
                      SizedBox(
                        height: CustomSizes().dynamicHeight(context, .06),
                        child: TabBar(
                            unselectedLabelColor: AppColors.customGrey,
                            indicator: BoxDecoration(
                                gradient: const LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            colors: [
                                              AppColors.customBlue,
                                              AppColors.customPurple,
                                            ],
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            CustomSizes().dynamicWidth(context, .1),
                                          ),
                            ),
                          tabs: const [
                            Tab(text: "Approvals"),
                            Tab(text: "Leave History"),
                          ],
                        ),
                        ),

                          Expanded(
                            child: TabBarView(
                              children: [
                                // Approvals(),
                                // LeaveHistory(),
                                customNotificationCard(context,approved: true),
                                notificationCard(context, 1),
                              ],
                            ),
                          )

                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}


Widget leaves (context ,circleColor,text1,noLeave) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(top: CustomSizes().dynamicHeight(context, .0025)),
        child: Icon(Icons.circle,color: circleColor,size: CustomSizes().dynamicWidth(context, .02),),
      ),
      CustomSizes().widthBox(context, .02),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text(context, text1, 0.03, AppColors.customGrey,bold: true),
          text(context, noLeave, 0.08, AppColors.customBlack,bold: true)
        ],
      )
    ],
  );
}

Widget rowCircularIndicator(context,indicatorColor,text1) {
  return SizedBox(
    child: Column(
      children: [
        CircularPercentIndicator(
          animation: true,
          animationDuration: 1000,
          circularStrokeCap: CircularStrokeCap.round,
          radius: CustomSizes().dynamicHeight(context, .05),
          lineWidth: CustomSizes().dynamicWidth(context, .0055),
          percent: .5,
          center: text(context, "1", 0.05, AppColors.customDarkGrey, bold: true),
          backgroundColor: AppColors.customGrey.withOpacity(.3),
          progressColor: indicatorColor,
        ),
        CustomSizes().heightBox(context, .01),
        text(context,text1,0.03,AppColors.customGrey),
      ],
    ),
  );
}