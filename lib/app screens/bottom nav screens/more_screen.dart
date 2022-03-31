import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mtech_attendance/Widgets/text_widget.dart';
import 'package:mtech_attendance/app%20screens/about.dart';
import 'package:mtech_attendance/app%20screens/my_leave.dart';
import 'package:mtech_attendance/utils/app_routes.dart';
import 'package:mtech_attendance/utils/constants.dart';

import '../../utils/config.dart';
import '../../utils/dynamic_sizes.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
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
                top: 0,
                left: 0,
                child: Transform.rotate(
                  angle: math.pi / 1,
                  child: Image.asset(
                    "assets/loginbottom.png",
                    color: AppColors.customBlue,
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
                width: CustomSizes().dynamicWidth(context, 1),
                height: CustomSizes().dynamicHeight(context, .9),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        child: Column(
                          children: [
                            CircleAvatar(
                                radius:
                                    CustomSizes().dynamicHeight(context, 0.05),
                                backgroundImage: const NetworkImage(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOOFMe-CzzMAgkPdsGK1wsKLtoF33HXGK98A&usqp=CAU")),
                            text(
                              context,
                              "${userData["first_name"]} ${userData["last_name"]}",
                              0.035,
                              AppColors.customBlack,
                              bold: true,
                            ),
                            text(
                              context,
                              userData["department"] ?? "-----",
                              0.03,
                              AppColors.customGrey,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: CustomSizes().dynamicWidth(context, 0.9),
                        height: CustomSizes().dynamicHeight(context, 0.14),
                        padding: EdgeInsets.symmetric(
                          horizontal: CustomSizes().dynamicWidth(context, 0.05),
                          vertical: CustomSizes().dynamicHeight(context, 0.022),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.customGrey.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(
                            CustomSizes().dynamicWidth(context, 0.04),
                          ),
                          border: Border.all(
                            color: AppColors.customGrey.withOpacity(0.15),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.mail_outline_outlined,
                                  size: CustomSizes()
                                      .dynamicHeight(context, 0.03),
                                  color: AppColors.customGrey.withOpacity(0.2),
                                ),
                                CustomSizes().widthBox(context, 0.04),
                                text(
                                  context,
                                  userData["email"] ?? "-----",
                                  0.04,
                                  AppColors.customBlack,
                                  bold: true,
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: CustomSizes()
                                      .dynamicWidth(context, 0.11)),
                              child: Divider(
                                thickness:
                                    CustomSizes().dynamicWidth(context, 0.002),
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.perm_identity_outlined,
                                  size: CustomSizes()
                                      .dynamicHeight(context, 0.03),
                                  color: AppColors.customGrey.withOpacity(0.2),
                                ),
                                CustomSizes().widthBox(context, 0.04),
                                text(
                                  context,
                                  userData["department"] ?? "-----",
                                  0.04,
                                  AppColors.customBlack,
                                  bold: true,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: CustomSizes().dynamicWidth(context, 0.9),
                        height: CustomSizes().dynamicHeight(context, 0.14),
                        padding: EdgeInsets.symmetric(
                          horizontal: CustomSizes().dynamicWidth(context, 0.05),
                          vertical: CustomSizes().dynamicHeight(context, 0.022),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.customGrey.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(
                            CustomSizes().dynamicWidth(context, 0.04),
                          ),
                          border: Border.all(
                            color: AppColors.customGrey.withOpacity(0.15),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  size: CustomSizes()
                                      .dynamicHeight(context, 0.03),
                                  color: AppColors.customGrey.withOpacity(0.2),
                                ),
                                CustomSizes().widthBox(context, 0.04),
                                text(
                                  context,
                                  userData["phone"] ?? "-----",
                                  0.04,
                                  AppColors.customBlack,
                                  bold: true,
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: CustomSizes()
                                      .dynamicWidth(context, 0.11)),
                              child: Divider(
                                thickness:
                                    CustomSizes().dynamicWidth(context, 0.002),
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.home_outlined,
                                  size: CustomSizes()
                                      .dynamicHeight(context, 0.03),
                                  color: AppColors.customGrey.withOpacity(0.2),
                                ),
                                CustomSizes().widthBox(context, 0.04),
                                text(
                                  context,
                                  userData["address"] ?? "-----",
                                  0.04,
                                  AppColors.customBlack,
                                  bold: true,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Container(
                        width: CustomSizes().dynamicWidth(context, 0.9),
                        height: CustomSizes().dynamicHeight(context, 0.25),
                        padding: EdgeInsets.symmetric(
                          horizontal: CustomSizes().dynamicWidth(context, 0.05),
                          vertical: CustomSizes().dynamicHeight(context, 0.022),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.customGrey.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(
                            CustomSizes().dynamicWidth(context, 0.04),
                          ),
                          border: Border.all(
                            color: AppColors.customGrey.withOpacity(0.15),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                CustomRoutes().push(
                                  context,
                                  const LeaveScreen(),
                                );
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.assignment_outlined,
                                    size: CustomSizes()
                                        .dynamicHeight(context, 0.03),
                                    color:
                                        AppColors.customGrey.withOpacity(0.2),
                                  ),
                                  CustomSizes().widthBox(context, 0.04),
                                  text(
                                    context,
                                    "My Leaves",
                                    0.04,
                                    AppColors.customBlack,
                                    bold: true,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: CustomSizes()
                                      .dynamicWidth(context, 0.11)),
                              child: Divider(
                                thickness:
                                    CustomSizes().dynamicWidth(context, 0.002),
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.perm_identity_outlined,
                                  size: CustomSizes()
                                      .dynamicHeight(context, 0.03),
                                  color: AppColors.customGrey.withOpacity(0.2),
                                ),
                                CustomSizes().widthBox(context, 0.04),
                                text(
                                  context,
                                  "Update Profile",
                                  0.04,
                                  AppColors.customBlack,
                                  bold: true,
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: CustomSizes()
                                      .dynamicWidth(context, 0.11)),
                              child: Divider(
                                thickness:
                                    CustomSizes().dynamicWidth(context, 0.002),
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.notifications_none_sharp,
                                  size: CustomSizes()
                                      .dynamicHeight(context, 0.03),
                                  color: AppColors.customGrey.withOpacity(0.2),
                                ),
                                CustomSizes().widthBox(context, 0.04),
                                text(
                                  context,
                                  "Notification Settings",
                                  0.04,
                                  AppColors.customBlack,
                                  bold: true,
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: CustomSizes()
                                      .dynamicWidth(context, 0.11)),
                              child: Divider(
                                thickness:
                                    CustomSizes().dynamicWidth(context, 0.002),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                CustomRoutes().push(
                                  context,
                                  About(),
                                );
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.question_mark_outlined,
                                    size: CustomSizes()
                                        .dynamicHeight(context, 0.03),
                                    color:
                                        AppColors.customGrey.withOpacity(0.2),
                                  ),
                                  CustomSizes().widthBox(context, 0.04),
                                  text(
                                    context,
                                    "About CMC M-Tech",
                                    0.04,
                                    AppColors.customBlack,
                                    bold: true,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Container(
                      //   width: CustomSizes().dynamicWidth(context, 0.9),
                      //   height: CustomSizes().dynamicHeight(context, 0.14),
                      //   padding: EdgeInsets.symmetric(
                      //       horizontal: CustomSizes().dynamicWidth(context, 0.05),
                      //       vertical: CustomSizes()
                      //           .dynamicHeight(context, 0.022),),
                      //   decoration: BoxDecoration(
                      //     color: AppColors.customGrey.withOpacity(0.05),
                      //     borderRadius: BorderRadius.circular(
                      //       CustomSizes().dynamicWidth(context, 0.04),
                      //     ),
                      //     border: Border.all(
                      //       color: AppColors.customGrey.withOpacity(0.15),
                      //     ),
                      //   ),
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Row(
                      //         children: [
                      //           Icon(
                      //             Icons.assignment_outlined,
                      //             size:
                      //                 CustomSizes().dynamicHeight(context, 0.03),
                      //             color: AppColors.customGrey.withOpacity(0.2),
                      //           ),
                      //           CustomSizes().widthBox(context, 0.04),
                      //           text(context, "My Leaves", 0.04,
                      //               AppColors.customBlack,bold: true),
                      //         ],
                      //       ),
                      //       Padding(
                      //         padding:  EdgeInsets.only(left : CustomSizes().dynamicWidth(context, 0.11)),
                      //         child: Divider(thickness: CustomSizes().dynamicWidth(context, 0.002),),
                      //       ),
                      //       Row(
                      //         children: [
                      //           Icon(
                      //             Icons.perm_identity_outlined,
                      //             size:
                      //             CustomSizes().dynamicHeight(context, 0.03),
                      //             color: AppColors.customGrey.withOpacity(0.2),
                      //           ),
                      //           CustomSizes().widthBox(context, 0.04),
                      //           text(context, "Update Profile", 0.04,
                      //               AppColors.customBlack,bold: true),
                      //         ],
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      //

                      // Container(
                      //   width: CustomSizes().dynamicWidth(context, 0.9),
                      //   height: CustomSizes().dynamicHeight(context, 0.2),
                      //   padding: EdgeInsets.symmetric(
                      //     horizontal: CustomSizes().dynamicWidth(context, 0.05),
                      //     vertical: CustomSizes()
                      //         .dynamicHeight(context, 0.022),),
                      //   decoration: BoxDecoration(
                      //     color: AppColors.customGrey.withOpacity(0.05),
                      //     borderRadius: BorderRadius.circular(
                      //       CustomSizes().dynamicWidth(context, 0.04),
                      //     ),
                      //     border: Border.all(
                      //       color: AppColors.customGrey.withOpacity(0.15),
                      //     ),
                      //   ),
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Row(
                      //         children: [
                      //           Icon(
                      //             Icons.notifications_none_sharp ,
                      //             size:
                      //             CustomSizes().dynamicHeight(context, 0.03),
                      //             color: AppColors.customGrey.withOpacity(0.2),
                      //           ),
                      //           CustomSizes().widthBox(context, 0.04),
                      //           text(context, "Notification Settings", 0.04,
                      //               AppColors.customBlack,bold: true),
                      //         ],
                      //       ),
                      //       Padding(
                      //         padding:  EdgeInsets.only(left : CustomSizes().dynamicWidth(context, 0.11)),
                      //         child: Divider(thickness: CustomSizes().dynamicWidth(context, 0.002),),
                      //       ),
                      //       Row(
                      //         children: [
                      //           Icon(
                      //             Icons.key_sharp,
                      //             size:
                      //             CustomSizes().dynamicHeight(context, 0.03),
                      //             color: AppColors.customGrey.withOpacity(0.2),
                      //           ),
                      //           CustomSizes().widthBox(context, 0.04),
                      //           text(context, "Change Password", 0.04,
                      //               AppColors.customBlack,bold: true),
                      //         ],
                      //       ),
                      //       Padding(
                      //         padding:  EdgeInsets.only(left : CustomSizes().dynamicWidth(context, 0.11)),
                      //         child: Divider(thickness: CustomSizes().dynamicWidth(context, 0.002),),
                      //       ),
                      //       Row(
                      //         children: [
                      //           Icon(
                      //             Icons.access_alarms_outlined,
                      //             size:
                      //             CustomSizes().dynamicHeight(context, 0.03),
                      //             color: AppColors.customGrey.withOpacity(0.2),
                      //           ),
                      //           CustomSizes().widthBox(context, 0.04),
                      //           text(context, "Reminder Settings", 0.04,
                      //               AppColors.customBlack,bold: true),
                      //         ],
                      //       ),
                      //     ],
                      //   ),
                      // ),

                      // Container(
                      //   width: CustomSizes().dynamicWidth(context, 0.9),
                      //   height: CustomSizes().dynamicHeight(context, 0.2),
                      //   padding: EdgeInsets.symmetric(
                      //     horizontal: CustomSizes().dynamicWidth(context, 0.05),
                      //     vertical: CustomSizes()
                      //         .dynamicHeight(context, 0.022),),
                      //   decoration: BoxDecoration(
                      //     color: AppColors.customGrey.withOpacity(0.05),
                      //     borderRadius: BorderRadius.circular(
                      //       CustomSizes().dynamicWidth(context, 0.04),
                      //     ),
                      //     border: Border.all(
                      //       color: AppColors.customGrey.withOpacity(0.15),
                      //     ),
                      //   ),
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Row(
                      //         children: [
                      //           Icon(
                      //             Icons.privacy_tip_outlined ,
                      //             size:
                      //             CustomSizes().dynamicHeight(context, 0.03),
                      //             color: AppColors.customGrey.withOpacity(0.2),
                      //           ),
                      //           CustomSizes().widthBox(context, 0.04),
                      //           text(context, "Privacy Policy", 0.04,
                      //               AppColors.customBlack,bold: true),
                      //         ],
                      //       ),
                      //       Padding(
                      //         padding:  EdgeInsets.only(left : CustomSizes().dynamicWidth(context, 0.11)),
                      //         child: Divider(thickness: CustomSizes().dynamicWidth(context, 0.002),),
                      //       ),
                      //       Row(
                      //         children: [
                      //           Icon(
                      //             Icons.my_library_books_outlined ,
                      //             size:
                      //             CustomSizes().dynamicHeight(context, 0.03),
                      //             color: AppColors.customGrey.withOpacity(0.2),
                      //           ),
                      //           CustomSizes().widthBox(context, 0.04),
                      //           text(context, "Term & Conditions", 0.04,
                      //               AppColors.customBlack,bold: true),
                      //         ],
                      //       ),
                      //       Padding(
                      //         padding:  EdgeInsets.only(left : CustomSizes().dynamicWidth(context, 0.11)),
                      //         child: Divider(thickness: CustomSizes().dynamicWidth(context, 0.002),),
                      //       ),
                      //       Row(
                      //         children: [
                      //           Icon(
                      //             Icons.question_mark_outlined,
                      //             size:
                      //             CustomSizes().dynamicHeight(context, 0.03),
                      //             color: AppColors.customGrey.withOpacity(0.2),
                      //           ),
                      //           CustomSizes().widthBox(context, 0.04),
                      //           text(context, "Help & FeedBack", 0.04,
                      //               AppColors.customBlack,bold: true),
                      //         ],
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      CustomSizes().heightBox(context, 0.025),
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
