import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mtech_attendance/utils/dynamic_sizes.dart';

import '../utils/constants.dart';

class MarkAttendance extends StatefulWidget {
  final dynamic qrApi;

  const MarkAttendance({this.qrApi, Key? key}) : super(key: key);

  @override
  State<MarkAttendance> createState() => _MarkAttendanceState();
}

class _MarkAttendanceState extends State<MarkAttendance> {
  dynamic data;
  @override
  Widget build(BuildContext context) {
    data=jsonDecode(widget.qrApi).toString();
    print(widget.qrApi.toString());
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: CustomSizes().dynamicWidth(context, 1),
          height: CustomSizes().dynamicHeight(context, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(jsonDecode(widget.qrApi).toString()),

              Text("lat=>"),
              Text(lat.toString()),
              Text("long=>"),
              Text(long.toString()),
              // Text(data[0]['lat']),
              // Text(data[0]['long']),
              // Text(lat.toStringAsFixed(2) ==
              //     data['lat'].toStringAsFixed(2) &&
              //         long.toStringAsFixed(2) ==
              //             data['long'].toStringAsFixed(2)
              //     ? "Success"
              //     : "Error"),
            ],
          ),
        ),
      ),
    );
  }
}
