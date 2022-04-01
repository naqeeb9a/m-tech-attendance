import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:mtech_attendance/Widgets/text_widget.dart';
import 'package:mtech_attendance/app%20screens/qr_screen.dart';
import 'package:mtech_attendance/utils/app_routes.dart';
import 'package:mtech_attendance/utils/config.dart';
import 'package:mtech_attendance/utils/dynamic_sizes.dart';

import '../../utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String locationName = "getting...";
  LocationPermission? permission;

  final startTime = DateTime(10, 00);
  final currentTime = DateTime.now();

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
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  var format = DateFormat("HH:mm");

  timeDifference() {
    return format
        .parse(
            DateFormat('EEEE').format(DateTime.now()).toString() == "Saturday"
                ? "12:00"
                : "14:00")
        .difference(
            format.parse(DateFormat('HH:mm').format(DateTime.now()).toString()))
        .inMinutes;
  }

  @override
  Widget build(BuildContext context) {
    print(currentTime.difference(startTime));
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.customWhite,
        body: Center(
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
                  height: CustomSizes().dynamicHeight(context, .06),
                ),
                CustomSizes().heightBox(context, .16),
                StreamBuilder(
                  stream: Stream.periodic(const Duration(seconds: 30)),
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
                  DateFormat.yMMMMEEEEd().format(DateTime.now()).toString(),
                  .06,
                  AppColors.customGrey,
                ),
                CustomSizes().heightBox(context, .1),
                GestureDetector(
                  onTap: () {
                    if (locationName == "getting...") {
                      CoolAlert.show(
                          context: context,
                          lottieAsset: "assets/animations/failed.json",
                          type: CoolAlertType.error,
                          title: "Error",
                          text: "Enable the Location to further proceed!!!",
                          backgroundColor: AppColors.customBlue,
                          confirmBtnColor: AppColors.customBlue,
                          animType: CoolAlertAnimType.scale,
                          onConfirmBtnTap: () async {
                            CustomRoutes().pop(context);
                            await getLocation();
                          });
                    } else {
                      if (format
                              .parse(DateFormat('HH:mm')
                                  .format(DateTime.now())
                                  .toString())
                              .difference(format.parse("10:00"))
                              .inMinutes >
                          0) {
                        CoolAlert.show(
                            context: context,
                            type: CoolAlertType.warning,
                            title: "Alert",
                            text:
                                "${format.parse(DateFormat('HH:mm').format(DateTime.now()).toString()).difference(format.parse("10:00")).inMinutes.toString()} Minutes Arrived Late !!!",
                            backgroundColor: AppColors.customBlue,
                            confirmBtnColor: AppColors.customBlue,
                            animType: CoolAlertAnimType.scale,
                            onConfirmBtnTap: () async {
                              CustomRoutes().pop(context);
                              CustomRoutes().push(context, const QRScreen());
                            });
                      } else {
                        CustomRoutes().push(context, const QRScreen()
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
                        colors: timeDifference() <= 0
                            ? [
                                AppColors.customPurple,
                                AppColors.customPink,
                              ]
                            : [
                                AppColors.customBlue,
                                AppColors.customPurple,
                              ],
                      ),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LottieBuilder.asset(
                          "assets/animations/button_press.json",
                          height: CustomSizes().dynamicHeight(context, .16),
                        ),
                        text(
                          context,
                          timeDifference() <= 0 ? "CHECK OUT" : "CHECK IN",
                          .04,
                          AppColors.customWhite,
                        ),
                      ],
                    ),
                  ),
                ),
                CustomSizes().heightBox(context, .1),
                text(
                  context,
                  "Location: $locationName",
                  .03,
                  AppColors.customGrey,
                ),
                CustomSizes().heightBox(context, .14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    timeCard(
                        context,
                        format
                            .parse(DateFormat('HH:mm')
                                .format(DateTime.now())
                                .toString())
                            .difference(format.parse("10:50"))
                            .toString(),
                        "Check In"),
                    timeCard(context, "06:00", "Check Out"),
                    timeCard(context, "08:00", "Working Hrs"),
                  ],
                ),
              ],
            ),
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
