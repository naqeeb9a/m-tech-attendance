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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      topBar(context, "Notifications", settingIcon: true),
                      customNotificationCard(context,approve: true),
                      customNotificationCard(context,pending: true),
                      notificationCard(context, 1),
                      notificationCard(context, 4),
                      notificationCard(context, 1),
                      customNotificationCard(context,approved: true),

                      // Expanded(
                      //   child: ListView.builder(
                      //       itemCount: 3,
                      //       itemBuilder: (BuildContext context, int index) {
                      //         return customNotificationCard(context,approve: true);
                      //       }),
                      // ),
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

Widget notificationCard(context, index) {
  return index == 4
      ? Container(
          width: CustomSizes().dynamicWidth(context, 1),
          height: CustomSizes().dynamicHeight(context, 0.1),
          margin: EdgeInsets.symmetric(
            vertical: CustomSizes().dynamicHeight(context, .005),
          ),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                AppColors.customBlue,
                AppColors.customPurple,
              ],
            ),
            borderRadius: BorderRadius.circular(
              CustomSizes().dynamicWidth(context, .02),
            ),
          ),
          child: Center(
            child: text(context, "12 March 2022 - Closed for Renovation", 0.05,
                AppColors.customWhite),
          ),
        )
      : Container(
          width: CustomSizes().dynamicWidth(context, 1),
          height: CustomSizes().dynamicHeight(context, 0.1),
          margin: EdgeInsets.symmetric(
              vertical: CustomSizes().dynamicHeight(context, .005)),
          decoration: BoxDecoration(
            color: AppColors.customBlue.withOpacity(.1),
            borderRadius: BorderRadius.circular(
              CustomSizes().dynamicWidth(context, .02),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: CustomSizes().dynamicWidth(context, .035)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: CustomSizes().dynamicHeight(context, 0.03),
                      backgroundImage: const NetworkImage(
                          "https://www.diethelmtravel.com/wp-content/uploads/2016/04/bill-gates-wealthiest-person.jpg"),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: 'Bill Gates',
                              style: TextStyle(
                                  color: AppColors.customBlack,
                                  fontSize: CustomSizes()
                                      .dynamicWidth(context, 0.035),
                                  fontWeight: FontWeight.w700),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' Applied ',
                                  style: TextStyle(
                                      color: AppColors.customBlack,
                                      fontSize: CustomSizes()
                                          .dynamicWidth(context, 0.035),
                                      fontWeight: FontWeight.w400),
                                ),
                                TextSpan(
                                  text: 'Annual Leave',
                                  style: TextStyle(
                                      color: AppColors.customBlack,
                                      fontSize: CustomSizes()
                                          .dynamicWidth(context, 0.035),
                                      fontWeight: FontWeight.w700),
                                ),
                                TextSpan(
                                  text: ' from',
                                  style: TextStyle(
                                      color: AppColors.customBlack,
                                      fontSize: CustomSizes()
                                          .dynamicWidth(context, 0.035),
                                      fontWeight: FontWeight.w400),
                                )
                              ]),
                        ),
                        text(context, "7th March to 9th March", 0.035,
                            AppColors.customBlack),
                        text(context, "12:40 PM", 0.025, AppColors.customGrey)
                      ],
                    ),
                    Icon(
                      Icons.more_horiz_outlined,
                      size: CustomSizes().dynamicWidth(context, .065),
                      color: AppColors.customGrey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
}

//Notification widget for Approved and pendning and aproval and reject

Widget customNotificationCard(context,{pending = false,approved =false ,approve = false}) {
  return Container(
    width: CustomSizes().dynamicWidth(context, 1),
    height: CustomSizes().dynamicHeight(context, 0.125),
    margin: EdgeInsets.symmetric(
      vertical: CustomSizes().dynamicHeight(context, .005),
    ),
    decoration: BoxDecoration(
      color: AppColors.customBlue.withOpacity(.1),
      borderRadius: BorderRadius.circular(
        CustomSizes().dynamicWidth(context, .02),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: CustomSizes().dynamicWidth(context, .035)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: CustomSizes().dynamicHeight(context, 0.03),
                backgroundImage: const NetworkImage(
                    "https://www.diethelmtravel.com/wp-content/uploads/2016/04/bill-gates-wealthiest-person.jpg"),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                        text: 'Bill Gates',
                        style: TextStyle(
                            color: AppColors.customBlack,
                            fontSize:
                                CustomSizes().dynamicWidth(context, 0.035),
                            fontWeight: FontWeight.w700),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Applied ',
                            style: TextStyle(
                                color: AppColors.customBlack,
                                fontSize:
                                    CustomSizes().dynamicWidth(context, 0.035),
                                fontWeight: FontWeight.w400),
                          ),
                          TextSpan(
                            text: 'Annual Leave',
                            style: TextStyle(
                                color: AppColors.customBlack,
                                fontSize:
                                    CustomSizes().dynamicWidth(context, 0.035),
                                fontWeight: FontWeight.w700),
                          ),
                          TextSpan(
                            text: ' from',
                            style: TextStyle(
                                color: AppColors.customBlack,
                                fontSize:
                                    CustomSizes().dynamicWidth(context, 0.035),
                                fontWeight: FontWeight.w400),
                          )
                        ]),
                  ),
                  text(context, "7th March to 9th March", 0.035,
                      AppColors.customBlack),
                  text(context, "12:40 PM", 0.025, AppColors.customGrey)
                ],
              ),
              Icon(
                Icons.more_horiz_outlined,
                size: CustomSizes().dynamicWidth(context, .065),
                color: AppColors.customGrey,
              ),
            ],
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(left : CustomSizes().dynamicWidth(context, 0.2)),
          child: Row(

            children: [

              pending == true ?Container(
                width: CustomSizes().dynamicWidth(context, 0.3),
                height: CustomSizes().dynamicHeight(context, 0.03),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(
                    CustomSizes().dynamicWidth(context, 1),
                  ),
                ),
                child: Center(
                  child: text(context, "Approval Pending".toUpperCase(), 0.0265, AppColors.customBlack,bold: true),
                ),
              ): approve == true ?Container(
                width: CustomSizes().dynamicWidth(context, 0.3),
                height: CustomSizes().dynamicHeight(context, 0.03),
                decoration: BoxDecoration(
                  color: AppColors.customBlue,
                  borderRadius: BorderRadius.circular(
                    CustomSizes().dynamicWidth(context, 1),
                  ),
                ),
                child: Center(
                  child: text(context, "Approve".toUpperCase(), 0.0265, AppColors.customWhite,bold: true),
                ),
              ) :approved == true ?Container(
                width: CustomSizes().dynamicWidth(context, 0.3),
                height: CustomSizes().dynamicHeight(context, 0.03),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(
                    CustomSizes().dynamicWidth(context, 1),
                  ),
                ),
                child: Center(
                  child: text(context, "Approved".toUpperCase(), 0.0265, AppColors.customWhite,bold: true),
                ),
              ) :const SizedBox(),
              CustomSizes().widthBox(context,0.02),
              approve ==true ? Container(
                width: CustomSizes().dynamicWidth(context, 0.3),
                height: CustomSizes().dynamicHeight(context, 0.03),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(
                    CustomSizes().dynamicWidth(context, 1),
                  ),
                ),
                child: Center(
                  child: text(context, "Reject".toUpperCase(), 0.0265, AppColors.customWhite,bold: true),
                ),
              ):const SizedBox(

              ),
            ],
          ),
        )
      ],
    ),
  );
}
