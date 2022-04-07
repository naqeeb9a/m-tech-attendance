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

minutesDifference(time) {
  return format
      .parse(DateFormat('HH:mm').format(DateTime.now()).toString())
      .difference(format.parse(time))
      .toString()
      .substring(0, 5);
}
