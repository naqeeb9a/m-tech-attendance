import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mtech_attendance/Widgets/text_widget.dart';
import 'package:mtech_attendance/app%20screens/login.dart';

import '../../utils/app_routes.dart';
import '../../utils/config.dart';
import '../../utils/constants.dart';
import '../../utils/dynamic_sizes.dart';
import 'dart:math' as math;

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
              SizedBox(
                width: CustomSizes().dynamicWidth(context,1),
                height: CustomSizes().dynamicHeight(context, 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset("assets/animations/coming_soon.json",height:
                    CustomSizes().dynamicHeight(context, .2),)
                  ],
                ),
              ),
              // Container(
              //   width: CustomSizes().dynamicWidth(context, 1),
              //   height: CustomSizes().dynamicHeight(context, 1),
              //   padding: EdgeInsets.symmetric(
              //     horizontal: CustomSizes().dynamicWidth(context, .04),
              //   ),
              //   child: SingleChildScrollView(
              //     child: Column(
              //       children: [
              //         topBar(context, "Notifications", settingIcon: true),
              //         customNotificationCard(context, approve: true),
              //         customNotificationCard(context, pending: true),
              //         notificationCard(context, 1),
              //         notificationCard(context, 4),
              //         notificationCard(context, 1),
              //         customNotificationCard(context, approved: true),
              //
              //         // Expanded(
              //         //   child: ListView.builder(
              //         //       itemCount: 3,
              //         //       itemBuilder: (BuildContext context, int index) {
              //         //         return customNotificationCard(context,approve: true);
              //         //       }),
              //         // ),
              //       ],
              //     ),
              //   ),
              // )
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
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return detailContainer(context,
                                  "https://www.diethelmtravel.com/wp-content/uploads/2016/04/bill-gates-wealthiest-person.jpg");
                            });
                      },
                      child: Icon(
                        Icons.more_horiz_outlined,
                        size: CustomSizes().dynamicWidth(context, .065),
                        color: AppColors.customGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
}

//Notification widget for Approved and pendning and aproval and reject

Widget customNotificationCard(context,
    {pending = false, approved = false, approve = false}) {
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
              InkWell(
                onTap: () {
                  showDialog(
                      barrierColor: AppColors.customBlack.withOpacity(.8),
                      context: context,
                      builder: (context) {
                        return detailContainer(context,
                            "https://www.diethelmtravel.com/wp-content/uploads/2016/04/bill-gates-wealthiest-person.jpg");
                      });
                },
                child: Icon(
                  Icons.more_horiz_outlined,
                  size: CustomSizes().dynamicWidth(context, .065),
                  color: AppColors.customGrey,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(left: CustomSizes().dynamicWidth(context, 0.2)),
          child: Row(
            children: [
              pending == true
                  ? Container(
                      width: CustomSizes().dynamicWidth(context, 0.3),
                      height: CustomSizes().dynamicHeight(context, 0.04),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(
                          CustomSizes().dynamicWidth(context, 1),
                        ),
                      ),
                      child: Center(
                        child: text(context, "Approval Pending".toUpperCase(),
                            0.0265, AppColors.customBlack,
                            bold: true),
                      ),
                    )
                  : approve == true
                      ? Container(
                          width: CustomSizes().dynamicWidth(context, 0.3),
                          height: CustomSizes().dynamicHeight(context, 0.04),
                          decoration: BoxDecoration(
                            color: AppColors.customBlue,
                            borderRadius: BorderRadius.circular(
                              CustomSizes().dynamicWidth(context, 1),
                            ),
                          ),
                          child: Center(
                            child: text(context, "Approve".toUpperCase(),
                                0.0265, AppColors.customWhite,
                                bold: true),
                          ),
                        )
                      : approved == true
                          ? Container(
                              width: CustomSizes().dynamicWidth(context, 0.3),
                              height:
                                  CustomSizes().dynamicHeight(context, 0.04),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(
                                  CustomSizes().dynamicWidth(context, 1),
                                ),
                              ),
                              child: Center(
                                child: text(context, "Approved".toUpperCase(),
                                    0.0265, AppColors.customWhite,
                                    bold: true),
                              ),
                            )
                          : const SizedBox(),
              CustomSizes().widthBox(context, 0.02),
              approve == true
                  ? Container(
                      width: CustomSizes().dynamicWidth(context, 0.3),
                      height: CustomSizes().dynamicHeight(context, 0.04),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(
                          CustomSizes().dynamicWidth(context, 1),
                        ),
                      ),
                      child: Center(
                        child: text(context, "Reject".toUpperCase(), 0.0265,
                            AppColors.customWhite,
                            bold: true),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        )
      ],
    ),
  );
}

Widget detailContainer(context, image) {
  TextEditingController comments = TextEditingController();
  return StatefulBuilder(
    builder: (context, StateSetter setState) {
      return Align(
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            CustomSizes().dynamicWidth(context, .04),
          ),
          child: Material(
            child: Container(
              height: CustomSizes().dynamicHeight(context, .55),
              width: CustomSizes().dynamicWidth(context, .95),
              padding: EdgeInsets.symmetric(
                  horizontal: CustomSizes().dynamicWidth(context, .04),
                  vertical: CustomSizes().dynamicHeight(context, .02)),
              decoration: BoxDecoration(
                  color: AppColors.customWhite,
                  borderRadius: BorderRadius.circular(
                    CustomSizes().dynamicWidth(context, .04),
                  ),
                  border: Border.all(
                      color: AppColors.customBlue,
                      width: CustomSizes().dynamicWidth(context, .0035))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: CustomSizes().dynamicHeight(context, .03),
                        backgroundImage: NetworkImage(image),
                      ),
                      CustomSizes().widthBox(context, .025),
                      text(context, "Bill Gates", 0.04, AppColors.customBlack,
                          bold: true),
                    ],
                  ),
                  Divider(
                    thickness: CustomSizes().dynamicWidth(context, 0.002),
                  ),
                  text(context, "Comments", 0.04, AppColors.customGrey,
                      bold: true),
                  text(context, "Taking a Vacation leave", 0.04,
                      AppColors.customBlack,
                      bold: true),
                  text(context, "leave Type", 0.04, AppColors.customGrey,
                      bold: true),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: CustomSizes().dynamicHeight(context, 0.015),
                        color: AppColors.customBlue,
                      ),
                      text(context, "Casual Leave", 0.04, AppColors.customBlack,
                          bold: true),
                    ],
                  ),
                  text(context, "Team Lead", 0.04, AppColors.customGrey,
                      bold: true),
                  RichText(
                    text: TextSpan(
                      text: "Approved",
                      style: TextStyle(
                          color: AppColors.customBlack,
                          fontSize: CustomSizes().dynamicWidth(context, 0.04),
                          fontWeight: FontWeight.w900),
                      children: [
                        TextSpan(
                          text: ' By Mark Zuckerberg',
                          style: TextStyle(
                              color: AppColors.customBlack,
                              fontSize:
                                  CustomSizes().dynamicWidth(context, 0.04),
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  text(context, "Leave Dates", 0.04, AppColors.customGrey,
                      bold: true),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      text(context, "7th March  -  9th March", 0.04,
                          AppColors.customBlack,
                          bold: true),
                      text(context, "2 Days", 0.04, AppColors.customGrey,
                          bold: true),
                    ],
                  ),
                  text(context, "Comments", 0.04, AppColors.customGrey,
                      bold: true),
                  inputTextField2(context, "Comments", comments),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: (){
                          CustomRoutes().pop(context);
                        },
                        child: Container(
                          width: CustomSizes().dynamicWidth(context, .35),
                          height: CustomSizes().dynamicHeight(context, .05),
                          decoration: BoxDecoration(
                            color: AppColors.customBlue,
                            borderRadius: BorderRadius.circular(
                              CustomSizes().dynamicWidth(context, 1),
                            ),
                          ),
                          child: Center(
                            child: text(context, "Approve".toUpperCase(), 0.035,
                                AppColors.customWhite),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          CustomRoutes().pop(context);
                        },
                        child: Container(
                          width: CustomSizes().dynamicWidth(context, .35),
                          height: CustomSizes().dynamicHeight(context, .05),
                          decoration: BoxDecoration(
                            color: AppColors.customRed,
                            borderRadius: BorderRadius.circular(
                              CustomSizes().dynamicWidth(context, 1),
                            ),
                          ),
                          child: Center(
                            child: text(context, "reject".toUpperCase(), 0.035,
                                AppColors.customWhite),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

Widget inputTextField2(context, label, myController,
    {function, function2, password = false, white = false, icon= false}) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: (function == "")
        ? () {
            return null;
          }
        : function,
    controller: myController,
    textInputAction: TextInputAction.next,
    keyboardType: password == true
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
    obscureText: password == true ? obscureText : false,
    cursorColor: white == true ? AppColors.customWhite : AppColors.customBlack,
    cursorWidth: 2.0,
    cursorHeight: CustomSizes().dynamicHeight(context, .03),
    style: TextStyle(
      color: white == true ? AppColors.customWhite : AppColors.customBlack,
      fontSize: CustomSizes().dynamicWidth(context, .04),
    ),
    decoration: InputDecoration(
      suffixIcon: icon == true
          ? Icon(
              Icons.error_outline_outlined,
              size: CustomSizes().dynamicHeight(context, 0.02),
              color: AppColors.customGrey,
            )
          : const Icon(Icons.error, color: Colors.transparent),
      hintStyle: TextStyle(
          color: white == true ? AppColors.customWhite : AppColors.customGrey),
      enabledBorder: OutlineInputBorder(
        // borderRadius: BorderRadius.circular(CustomSizes().dynamicWidth(context, 1)),
        borderSide: BorderSide(
            width: CustomSizes().dynamicWidth(context, 0.001),
            color:
                white == true ? AppColors.customWhite : AppColors.customGrey),
      ),
      focusedBorder: OutlineInputBorder(
        // borderRadius: BorderRadius.circular(CustomSizes().dynamicWidth(context, 1)),
        borderSide: BorderSide(
            width: CustomSizes().dynamicWidth(context, 0.004),
            color:
                white == true ? AppColors.customWhite : AppColors.customBlue),
      ),
      border: OutlineInputBorder(
        // borderRadius: BorderRadius.circular(CustomSizes().dynamicWidth(context, 1)),
        borderSide: BorderSide(
            width: CustomSizes().dynamicWidth(context, 0.001),
            color:
                white == true ? AppColors.customWhite : AppColors.customGrey),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: CustomSizes().dynamicWidth(context, .05),
      ),
    ),
  );
}
