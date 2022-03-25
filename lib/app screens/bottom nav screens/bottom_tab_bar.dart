import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mtech_attendance/app%20screens/bottom%20nav%20screens/attendance.dart';
import 'package:mtech_attendance/app%20screens/bottom%20nav%20screens/home.dart';
import 'package:mtech_attendance/app%20screens/bottom%20nav%20screens/more_screen.dart';
import 'package:mtech_attendance/app%20screens/bottom%20nav%20screens/my_teams.dart';
import 'package:mtech_attendance/app%20screens/bottom%20nav%20screens/notification.dart';

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
              MyTeams(),
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
                          Icons.home_rounded,
                        ),
                        customTab(
                          context,
                          iconSize,
                          CupertinoIcons.group_solid,
                          // Icons.group,
                        ),
                        customTab(
                          context,
                          iconSize,
                          // CupertinoIcons.paper,
                          Icons.speaker_notes,
                        ),
                        customTab(
                          context,
                          iconSize,
                          CupertinoIcons.bell_solid,
                        ),
                        customTab(
                          context,
                          iconSize,
                          CupertinoIcons.bars,
                          // Icons.menu_rounded,
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

Widget customTab(context, iconSize, icon) {
  return Tab(
    icon: Icon(
      icon,
      color: AppColors.customBlue,
      size: CustomSizes().dynamicHeight(context, iconSize),
    ),
    iconMargin: EdgeInsets.only(
      bottom: CustomSizes().dynamicHeight(context, .002),
    ),
  );
}
