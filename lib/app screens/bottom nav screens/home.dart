import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:mtech_attendance/Widgets/text_widget.dart';
import 'package:mtech_attendance/functions/apis.dart';
import 'package:mtech_attendance/utils/config.dart';
import 'package:mtech_attendance/utils/dynamic_sizes.dart';

import '../../Widgets/alert.dart';
import '../../utils/app_routes.dart';
import '../../utils/constants.dart';
import '../qr_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String locationName = "getting...";
  LocationPermission? permission;

  getLocation() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          locationName = "Permission Denied!!";
        });
        return Future.error('Location permissions are denied');
      }
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placeMarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    setState(() {
      lat = position.latitude;
      long = position.longitude;
      locationName = placeMarks[0].street.toString() +
          ", " +
          placeMarks[0].subLocality.toString() +
          ", " +
          placeMarks[0].locality.toString();
    });
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.customBlack,
      body: SafeArea(
        child: Container(
          width: CustomSizes().dynamicWidth(context, 1),
          height: CustomSizes().dynamicHeight(context, 1),
          color: AppColors.customWhite,
          child: FutureBuilder(
            future: Functions().todayAttendance(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return Center(
                    child: Container(
                      width: CustomSizes().dynamicWidth(context, .9),
                      height: CustomSizes().dynamicHeight(context, 1),
                      padding: EdgeInsets.symmetric(
                        vertical: CustomSizes().dynamicHeight(context, .06),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            "assets/logo.png",
                            height: CustomSizes().dynamicHeight(context, .12),
                          ),
                          // CustomSizes().heightBox(context, .08),
                          StreamBuilder(
                            stream:
                                Stream.periodic(const Duration(seconds: 10)),
                            builder: (context, snapshot) {
                              return text(
                                context,
                                DateFormat('hh:mm a').format(DateTime.now()),
                                .07,
                                AppColors.customDarkGrey,
                                bold: true,
                              );
                            },
                          ),
                          text(
                            context,
                            DateFormat.yMMMMEEEEd()
                                .format(DateTime.now())
                                .toString(),
                            .06,
                            AppColors.customGrey,
                          ),
                          CustomSizes().heightBox(context, .04),
                          GestureDetector(
                            onTap: () {
                              if (locationName == "getting...") {
                                errorAlert(
                                  context,
                                  "Enable the Location to further proceed!!!",
                                  function: () async {
                                    CustomRoutes().pop(context);
                                    await getLocation();
                                  },
                                );
                              } else {
                                if (snapshot.data == null) {
                                  warningAlert(
                                      context,
                                      "You arrived "
                                      "${minutesDifference(userData["starting_hours"].toString())}"
                                      " Hours Late!!!", function: () {
                                    CustomRoutes().pop(context);
                                    CustomRoutes().push(
                                      context,
                                      QRScreen(
                                        type: "in",
                                        setState: () {
                                          setState(() {});
                                        },
                                      ),
                                    );
                                  });
                                } else if (snapshot.data["check_in"] != null &&
                                    snapshot.data["check_out"] == null) {
                                  warningAlert(
                                    context,
                                    "You are going "
                                    "${minutesDifference(userData["ending_hours"].toString())}"
                                    " Hours Earlier!!!",
                                    function: () {
                                      CustomRoutes().pop(context);
                                      CustomRoutes().push(
                                        context,
                                        QRScreen(
                                          type: "out",
                                          setState: () {
                                            setState(() {});
                                          },
                                        ),
                                      );
                                    },
                                  );
                                } else if (snapshot.data["check_out"] != null) {
                                  warningAlert(
                                    context,
                                    "You have already marked your Attendance!!!",
                                  );
                                }
                              }
                            },
                            child: Container(
                              width: CustomSizes().dynamicWidth(context, .5),
                              height: CustomSizes().dynamicWidth(context, .5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: snapshot.data == null
                                      ? [
                                          AppColors.customBlue,
                                          AppColors.customPurple,
                                        ]
                                      : [
                                          AppColors.customPurple,
                                          AppColors.customPink,
                                        ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        AppColors.customBlue.withOpacity(0.4),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  LottieBuilder.asset(
                                    "assets/animations/button_press.json",
                                    height: CustomSizes()
                                        .dynamicHeight(context, .16),
                                  ),
                                  text(
                                    context,
                                    snapshot.data == null || snapshot.data == ""
                                        ? "CHECK IN"
                                        : (snapshot.data["check_in"] != null &&
                                                snapshot.data["check_out"] ==
                                                    null)
                                            ? "CHECK OUT"
                                            : "Signed Out",
                                    .04,
                                    AppColors.customWhite,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          CustomSizes().heightBox(context, .04),
                          text(
                            context,
                            "Location: $locationName",
                            .03,
                            AppColors.customGrey,
                          ),
                          CustomSizes().heightBox(context, .08),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              timeCard(
                                context,
                                snapshot.data == null
                                    ? "00:00"
                                    : snapshot.data["check_in"].toString(),
                                "Check In",
                              ),
                              timeCard(
                                context,
                                snapshot.data == null ||
                                        snapshot.data["check_out"] == null
                                    ? "00:00"
                                    : snapshot.data["check_out"].toString(),
                                "Check Out",
                              ),
                              timeCard(
                                context,
                                snapshot.data == null
                                    ? "00:00"
                                    : snapshot.data["check_out"] != null
                                        ? snapshot.data["type"].toString()
                                        : snapshot.data["type"] == null
                                            ? "00:00"
                                            : "00:00",
                                "Working Hrs",
                              ),
                            ],
                          ),
                          CustomSizes().heightBox(context, .04),
                        ],
                      ),
                    ),
                  );
                }
              }
            },
          ),
        ),
      ),
    );
  }
}

Widget timeCard(context, time, status) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Icon(
        Icons.access_time_rounded,
      ),
      CustomSizes().heightBox(context, .04),
      text(
        context,
        time,
        .046,
        AppColors.customDarkGrey,
        bold: true,
      ),
      CustomSizes().heightBox(context, .01),
      text(
        context,
        status,
        .034,
        AppColors.customGrey,
      ),
    ],
  );
}
