import 'dart:math' as math;

import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mtech_attendance/Widgets/text_widget.dart';
import 'package:mtech_attendance/app%20screens/individual_attendance.dart';
import 'package:mtech_attendance/utils/app_routes.dart';
import 'package:mtech_attendance/utils/dynamic_sizes.dart';

import '../../Widgets/basic_widgets.dart';
import '../../utils/config.dart';

List teamData = [
  {
    "image":
        "https://bs-uploads.toptal.io/blackfish-uploads/components/image/content/file_file/file/157693/talent_tabs_section-9a2016252f5e887b11b53080a29d9013.jpg",
    "name": "Khubaib",
    "designation": "Boss",
    "checkIn": "09:00am",
    "checkOut": " 06:30pm",
    "team": true,
  },
  {
    "image":
        "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80",
    "name": "Natasha Khan",
    "designation": " Director Business Department",
    "checkIn": "09:25am",
    "checkOut": " 06:10pm",
    "team": true,
  },
  {
    "image":
        "https://www.jeancoutu.com/globalassets/revamp/photo/conseils-photo/20160302-01-reseaux-sociaux-profil/photo-profil_301783868.jpg",
    "name": "Hassan",
    "designation": "App Developer",
    "checkIn": "09:40am",
    "checkOut": " 06:00pm",
    "team": false,
  },
  {
    "image":
        "https://globeecho.com/wp-content/uploads/2021/08/pleasant-looking-serious-man-stands-profile-has-confident-expression-wears-casual-white-t-shirt_273609-16959.jpg",
    "name": "Naqeeb",
    "designation": "App Developer",
    "checkIn": "09:10am",
    "checkOut": " 06:20pm",
    "team": false,
  },
  {
    "image":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuhEB5TN6Ku-wVjzZa_CiltogXAj4q_Cj30A&usqp=CAU",
    "name": "Khansa",
    "designation": "Web Developer",
    "checkIn": "09:20am",
    "checkOut": " 05:56pm",
    "team": true,
  },
  {
    "image":
        "https://expertphotography.b-cdn.net/wp-content/uploads/2020/08/social-media-profile-photos-3.jpg",
    "name": "Yashir",
    "designation": "Unknown Designation",
    "checkIn": "09:40am",
    "checkOut": " 06:00pm",
    "team": false,
  },
];

class MyTeams extends StatefulWidget {
  const MyTeams({Key? key}) : super(key: key);

  @override
  State<MyTeams> createState() => _MyTeamsState();
}

// late final AnimationController _controller;
class _MyTeamsState extends State<MyTeams> {
  String? selectedValue;
  String? selectedDate;
  String? savedDate;
  List<String> items = [
    'Tech Team',
    'Warehouse Team',
    'Graphic Team',
  ];

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
                        padding: EdgeInsets.only(
                            top: CustomSizes().dynamicHeight(context, .025)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            text(context, "My Teams", 0.05,
                                AppColors.customBlack,
                                bold: true),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(CustomSizes()
                                          .dynamicWidth(context, .1)),
                                      topRight: Radius.circular(CustomSizes()
                                          .dynamicWidth(context, .1)),
                                    ),
                                  ),
                                  context: context,
                                  builder: (context) {
                                    return SizedBox(
                                      height: CustomSizes()
                                          .dynamicHeight(context, 0.75),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: CustomSizes()
                                                .dynamicHeight(context, 0.07),
                                            child: Center(
                                              child: text(
                                                  context,
                                                  "Tech Department",
                                                  0.045,
                                                  AppColors.customBlack,
                                                  bold: true),
                                            ),
                                          ),
                                          const Divider(),
                                          CustomSizes()
                                              .heightBox(context, 0.01),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: CustomSizes()
                                                    .dynamicWidth(
                                                        context, .04)),
                                            child: Column(
                                              children: [
                                                IntrinsicHeight(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      timeWidget(context,
                                                          "06/15", "Present"),
                                                      VerticalDivider(
                                                        thickness: CustomSizes()
                                                            .dynamicWidth(
                                                                context, .003),
                                                      ),
                                                      timeWidget(
                                                          context,
                                                          "09:25",
                                                          "Avg Clock In"),
                                                      VerticalDivider(
                                                        thickness: CustomSizes()
                                                            .dynamicWidth(
                                                                context, .003),
                                                      ),
                                                      timeWidget(
                                                          context,
                                                          "05:56",
                                                          "Avg Clock Out"),
                                                    ],
                                                  ),
                                                ),
                                                CustomSizes()
                                                    .heightBox(context, 0.01),
                                                const Divider(),
                                                SizedBox(
                                                  height: CustomSizes()
                                                      .dynamicHeight(
                                                          context, 0.585),
                                                  child: ListView.builder(
                                                    padding: EdgeInsets.symmetric(
                                                        vertical: CustomSizes()
                                                            .dynamicHeight(
                                                                context, 0.01)),
                                                    itemCount: teamData.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return myTeamCard(
                                                          context,
                                                          teamData[index]
                                                              ["image"],
                                                          teamData[index]
                                                              ["name"],
                                                          teamData[index]
                                                              ["designation"],
                                                          teamData[index]
                                                              ["checkIn"],
                                                          teamData[index]
                                                              ["checkOut"],
                                                          team: teamData[index]
                                                              ['team']);
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Icon(
                                CupertinoIcons.square_grid_2x2_fill,
                                color: AppColors.customBlue1,
                                size: CustomSizes().dynamicWidth(context, .06),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomSizes().heightBox(context, 0.08),
                      topBarBox(context),
                      CustomSizes().heightBox(context, 0.05),
                      Row(
                        children: [
                          text(context, "Present", 0.03, AppColors.customGrey,
                              bold: true),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: CustomSizes().dynamicHeight(context, .065),
                            decoration: BoxDecoration(
                              color: AppColors.customWhite,
                              borderRadius: BorderRadius.circular(
                                  CustomSizes().dynamicWidth(context, .01)),
                              border: Border.all(color: AppColors.customBlack),
                            ),
                            child: CustomDropdownButton2(
                              hint: 'Choose Dept',
                              value: selectedValue,
                              dropdownItems: items,
                              dropdownWidth:
                                  CustomSizes().dynamicWidth(context, .42),
                              dropdownDecoration: BoxDecoration(
                                color: AppColors.customWhite,
                                borderRadius: BorderRadius.circular(
                                  CustomSizes().dynamicWidth(context, .015),
                                ),
                                border: Border.all(color: AppColors.customBlue),
                              ),
                              buttonWidth:
                                  CustomSizes().dynamicWidth(context, .42),
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: CustomSizes().dynamicWidth(context, .06),
                              ),
                              buttonDecoration: BoxDecoration(
                                color: AppColors.customWhite,
                                borderRadius: BorderRadius.circular(
                                  CustomSizes().dynamicWidth(context, .01),
                                ),
                              ),
                              onChanged: (value) {
                                setState(
                                  () {
                                    selectedValue = value;
                                  },
                                );
                              },
                            ),
                          ),
                          Container(
                            width: CustomSizes().dynamicWidth(context, .42),
                            height: CustomSizes().dynamicHeight(context, .065),
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    CustomSizes().dynamicWidth(context, .02)),
                            decoration: BoxDecoration(
                              color: AppColors.customWhite,
                              borderRadius: BorderRadius.circular(
                                  CustomSizes().dynamicWidth(context, .01)),
                              border: Border.all(color: AppColors.customBlack),
                            ),
                            child: Theme(
                              data: ThemeData(
                                inputDecorationTheme:
                                    const InputDecorationTheme(
                                  border: InputBorder.none,
                                ),
                                colorScheme:
                                    const ColorScheme.highContrastLight(
                                  primary: AppColors.customBlue,
                                  // header background color
                                  onPrimary: AppColors.customWhite,
                                  // header text color
                                  onSurface: AppColors
                                      .customDarkGrey, // body text color
                                ),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    backgroundColor: AppColors.customBlue,
                                    primary: AppColors.customWhite,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        CustomSizes().dynamicWidth(context, .1),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              child: DateTimePicker(
                                calendarTitle: "Choose Date",
                                dateHintText: 'Choose Date',
                                dateMask: 'dd MMM, yyyy',
                                icon: Icon(
                                  CupertinoIcons.calendar,
                                  color: AppColors.customBlue,
                                  size:
                                      CustomSizes().dynamicHeight(context, .03),
                                ),
                                initialValue: '',
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                                onChanged: (value) {
                                  setState(
                                    () {
                                      selectedDate = value;
                                    },
                                  );
                                },
                                validator: (value) {
                                  return null;
                                },
                                onSaved: (value) {
                                  setState(
                                    () {
                                      savedDate = value ?? "";
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      CustomSizes().heightBox(context, .03),
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            timeWidget(context, "06/15", "Present"),
                            VerticalDivider(
                              thickness:
                                  CustomSizes().dynamicWidth(context, .003),
                            ),
                            timeWidget(context, "09:25", "Avg Clock In"),
                            VerticalDivider(
                              thickness:
                                  CustomSizes().dynamicWidth(context, .003),
                            ),
                            timeWidget(context, "05:56", "Avg Clock Out"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    CustomSizes().dynamicHeight(context, 0.01)),
                            itemCount: teamData.length,
                            itemBuilder: (BuildContext context, int index) {
                              return myTeamCard(
                                  context,
                                  teamData[index]["image"],
                                  teamData[index]["name"],
                                  teamData[index]["designation"],
                                  teamData[index]["checkIn"],
                                  teamData[index]["checkOut"],
                                  team: teamData[index]['team']);
                            }),
                      ),
                      CustomSizes().heightBox(context, 0.1),
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

Widget topBarBox(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      teamTopBox(context, Icons.fact_check_outlined, "  Team\nReports",
          AppColors.customBlue1, AppColors.customLightBlue),
      teamTopBox(context, Icons.check_box_outlined, "  Todo &\nSchedules",
          AppColors.customOrange, AppColors.customLightOrange),
      teamTopBox(context, Icons.location_on_outlined, "  Office &\nLocations",
          AppColors.customLightPurple, AppColors.customDarkPurple),
      teamTopBox(
          context,
          Icons.person_search_outlined,
          "       Team\nManagement",
          AppColors.customGreen,
          AppColors.customSeaGreen),
    ],
  );
}

Widget timeWidget(context, text1, text2) {
  return Row(
    children: [
      Icon(
        CupertinoIcons.clock,
        color: AppColors.customBlue,
        size: CustomSizes().dynamicHeight(context, .03),
      ),
      CustomSizes().widthBox(context, .02),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text(context, text1, .04, AppColors.customBlack, bold: true),
          text(context, text2, 0.03, AppColors.customGrey, bold: true),
        ],
      )
    ],
  );
}

Widget myTeamCard(context, image, name, designation, checkIn, checkOut,
    {team = false}) {
  return GestureDetector(
    onTap: () {
      CustomRoutes().push(
        context,
        IndividualAttendance(
            userImage: image, name: name, designation: designation),
      );
    },
    child: SizedBox(
      width: CustomSizes().dynamicWidth(context, 1),
      height: CustomSizes().dynamicHeight(context, 0.11),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomSizes().heightBox(context, 0.018),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: CustomSizes().dynamicHeight(context, .03),
                    backgroundImage: NetworkImage(image),
                  ),
                  team == true
                      ? Container(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  CustomSizes().dynamicWidth(context, 0.01),
                              vertical:
                                  CustomSizes().dynamicHeight(context, 0.001)),
                          color: AppColors.customBlue,
                          child: Center(
                            child: text(
                                context, "Team", 0.02, AppColors.customWhite),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
              SizedBox(
                width: CustomSizes().dynamicWidth(context, .35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text(context, name, 0.035, AppColors.customBlack,
                        bold: true),
                    text(
                      context,
                      designation,
                      0.035,
                      AppColors.customGrey,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(
                    CupertinoIcons.arrow_down_right,
                    color: AppColors.customBlue,
                    size: CustomSizes().dynamicHeight(context, .02),
                  ),
                  text(context, checkIn, 0.03, AppColors.customGreen),
                ],
              ),
              Row(
                children: [
                  Icon(
                    CupertinoIcons.arrow_up_right,
                    color: AppColors.customBlue,
                    size: CustomSizes().dynamicHeight(context, .02),
                  ),
                  text(context, checkOut, 0.03, AppColors.customGreen),
                ],
              )
            ],
          ),
          Divider(
            height: CustomSizes().dynamicHeight(context, .02),
          ),
        ],
      ),
    ),
  );
}
