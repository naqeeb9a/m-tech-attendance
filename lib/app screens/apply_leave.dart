import 'dart:math' as math;

import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:mtech_attendance/Widgets/form_fields.dart';

import '../Widgets/buttons.dart';
import '../Widgets/text_widget.dart';
import '../utils/config.dart';
import '../utils/dynamic_sizes.dart';
import 'login.dart';

class ApplyLeave extends StatefulWidget {
  const ApplyLeave({Key? key}) : super(key: key);

  @override
  State<ApplyLeave> createState() => _ApplyLeaveState();
}

class _ApplyLeaveState extends State<ApplyLeave> {
  String? selectedValue;
  List<String> items = [
    'Casual Leave',
    'Medical Leave',
    'Annual Leave',
    'Maternity Leave',
    'Umera Leave',
    'UnPaid Leave',
  ];
  DateTimeRange dateRange =
      DateTimeRange(start: DateTime.now(), end: DateTime(2022, 03, 24));

  TextEditingController reason = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    final difference = dateRange.duration;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Transform.rotate(
                angle: math.pi / 1,
                child: Image.asset(
                  "assets/loginbottom.png",
                  color: AppColors.customBlue.withOpacity(0.28),
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
                  width: CustomSizes().dynamicWidth(context, 0.25),
                ),
              ),
            ),
            Container(
              width: CustomSizes().dynamicWidth(context, 1),
              height: CustomSizes().dynamicHeight(context, 1),
              padding: EdgeInsets.symmetric(
                horizontal: CustomSizes().dynamicWidth(context, .04),
              ),
              child: Column(
                children: [
                  topBar(context, "Apply for Leave"),
                  CustomSizes().heightBox(context, 0.015),
                  Row(
                    children: [
                      text(context, "Choose Date", 0.03, AppColors.customGrey,
                          bold: true),
                    ],
                  ),
                  CustomSizes().heightBox(context, 0.015),
                  GestureDetector(
                    onTap: () {
                      pickDateRange();
                    },
                    child: Container(
                      width: CustomSizes().dynamicWidth(context, 1),
                      height: CustomSizes().dynamicHeight(context, .065),
                      decoration: BoxDecoration(
                        color: AppColors.customWhite,
                        borderRadius : BorderRadius.circular(CustomSizes().dynamicWidth(context, .01)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.25),
                            spreadRadius: 3,
                            blurRadius: 4,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text(
                              context,
                              " ${start.day} ${monthName(start.month)} to ${end.day} ${monthName(end.month)} ",
                              0.04,
                              AppColors.customGrey,
                              bold: true),
                          text(context, " ${difference.inDays} Days  ", 0.04,
                              AppColors.customGrey,
                              bold: true)
                        ],
                      ),
                    ),
                  ),
                  CustomSizes().heightBox(context, 0.015),
                  Row(
                    children: [
                      text(context, "Choose Leave Type", 0.03, AppColors.customGrey,
                          bold: true),
                    ],
                  ),
                  CustomSizes().heightBox(context, 0.015),
                  Container(
                    height: CustomSizes().dynamicHeight(context, .065),decoration: BoxDecoration(
                    color: AppColors.customWhite,
                    borderRadius : BorderRadius.circular(CustomSizes().dynamicWidth(context, .01)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.25),
                        spreadRadius: 3,
                        blurRadius: 4,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),

                    child: CustomDropdownButton2(
                      hint: 'Choose Type of Leave',
                      value: selectedValue,
                      dropdownItems: items,
                      dropdownWidth:   CustomSizes().dynamicWidth(context, .9),
                      buttonWidth:
                      CustomSizes().dynamicWidth(context, 1),
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
                        setState(() {
                          selectedValue = value;
                        });
                      },
                    ),
                  ),
                  CustomSizes().heightBox(context, 0.015),
                  Row(
                    children: [
                      text(context, "Reason", 0.03, AppColors.customGrey,
                          bold: true),
                    ],
                  ),
                  Container(
                    // height: CustomSizes().dynamicHeight(context, .25),
                    decoration: BoxDecoration(
                      color: AppColors.customWhite,
                      borderRadius : BorderRadius.circular(CustomSizes().dynamicWidth(context, .01)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.25),
                          spreadRadius: 3,
                          blurRadius: 4,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: inputTextField3(context, "Reason", reason,),
                  ),
                  CustomSizes().heightBox(context, .075),
                  coloredButton(
                    context,
                    "Submit for Approval",
                    AppColors.customBlue,

                    ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
        context: context,
        initialDateRange: dateRange,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (newDateRange == null) return;
    setState(() {
      dateRange = newDateRange;
    });
  }
}

String monthName(_month){
  if(_month==1){
    return "Jan";
  }
  else if(_month==2){
    return "Feb";
  }
  if(_month==3){
    return "Mar";
  }
  else if(_month==4){
    return "Apr";
  }
  if(_month==5){
    return "May";
  }
  else if(_month==6){
    return "Jun";
  }
  if(_month==7){
    return "Jul";
  }
  else if(_month==8){
    return "Aug";
  }
  if(_month==9){
    return "Sep";
  }
  else if(_month==10){
    return "Oct";
  }
  if(_month==11){
    return "Nov";
  }
  else if(_month==12){
    return "Dec";
  }
  else{
    return "";
  }
}