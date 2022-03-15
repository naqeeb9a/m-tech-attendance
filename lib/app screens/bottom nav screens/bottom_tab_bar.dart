import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mtech_attendance/app%20screens/bottom%20nav%20screens/attendance.dart';
import 'package:mtech_attendance/app%20screens/bottom%20nav%20screens/home.dart';
import 'package:mtech_attendance/app%20screens/more_screen.dart';
import 'package:mtech_attendance/app%20screens/notification.dart';


import '../../utils/config.dart';
import '../../utils/dynamic_sizes.dart';

class AppTabBar extends StatefulWidget {
  const AppTabBar({Key? key}) : super(key: key);

  @override
  _AppTabBarState createState() => _AppTabBarState();
}

class _AppTabBarState extends State<AppTabBar>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  double iconSize = .03;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Stack(
        children: [
          TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              HomePage(),
              HomePage(),
              AttendancePage(),
              NotificationScreen(),
              MoreScreen(),
            ],
          ),
          Positioned(
            bottom: 0.0,
            child: Material(
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    height: CustomSizes().dynamicWidth(context, .14),
                    width: CustomSizes().dynamicWidth(context, 1),
                    decoration: BoxDecoration(
                      color: AppColors.customWhite.withOpacity(.6),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.customBlue.withOpacity(0.4),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: TabBar(
                      controller: _tabController,
                      indicatorColor: AppColors.noColor,
                      labelColor: AppColors.customBlue,
                      labelStyle: TextStyle(
                        fontSize: CustomSizes().dynamicWidth(context, .03),
                      ),
                      tabs: [
                        customTab(
                          context,
                          iconSize,
                          "Home",
                          Icons.home_rounded,
                        ),
                        customTab(
                          context,
                          iconSize,
                          "My Teams",
                          Icons.group,
                        ),
                        customTab(
                          context,
                          iconSize,
                          "Attendance",
                          Icons.speaker_notes,
                        ),
                        customTab(
                          context,
                          iconSize,
                          "Notifications",
                          Icons.notifications,
                        ),
                        customTab(
                          context,
                          iconSize,
                          "More",
                          Icons.menu_rounded,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget customTab(context, iconSize, label, icon) {
  return Tab(
    icon: Icon(
      icon,
      color: AppColors.customBlue,
      size: CustomSizes().dynamicHeight(context, iconSize),
    ),
    text: label,
    iconMargin: EdgeInsets.only(
      bottom: CustomSizes().dynamicHeight(context, .002),
    ),
  );
}
