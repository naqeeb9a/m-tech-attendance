import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mtech_attendance/utils/dynamic_sizes.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({Key? key}) : super(key: key);

  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
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
      ),

      // SfCalendar(
      //   view: CalendarView.timelineMonth,
      //   showNavigationArrow: true,
      // ),
    );
  }
}
