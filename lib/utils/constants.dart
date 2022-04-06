import 'package:intl/intl.dart';

bool obscureText = true;
dynamic userData = [];
dynamic checkInTime = "00:00";
dynamic checkOutTime = "00:00";

String baseUrl = "employee.mtechtesting.com";
String version = "api/";
String login = "login";
String markAttendanceApi = "checkin";
String todayAttendanceApi = "idemp/";

dynamic lat, long;
dynamic headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
};

var format = DateFormat("HH:mm");

timeDifference() {
  return format
      .parse(DateFormat('EEEE').format(DateTime.now()).toString() == "Saturday"
          ? "12:00"
          : "14:00")
      .difference(
          format.parse(DateFormat('HH:mm').format(DateTime.now()).toString()))
      .inMinutes;
}

minutesDifference(time) {
  return format
      .parse(DateFormat('HH:mm').format(DateTime.now()).toString())
      .difference(format.parse(time));
}

minutesDifference2(time1, time2) {
  return format.parse(time1).difference(format.parse(time2));
}
