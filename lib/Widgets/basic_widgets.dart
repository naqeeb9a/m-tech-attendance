import 'package:flutter/material.dart';
import 'package:mtech_attendance/Widgets/buttons.dart';
import 'package:mtech_attendance/Widgets/text_widget.dart';

import '../utils/config.dart';
import '../utils/dynamic_sizes.dart';

Widget chip(context, title) {
  return Container(
    height: CustomSizes().dynamicHeight(context, .03),
    decoration: BoxDecoration(
      color: CustomColors.customWhite,
      borderRadius: BorderRadius.all(
        Radius.circular(
          CustomSizes().dynamicWidth(context, 1),
        ),
      ),
      border: Border.all(color: CustomColors.customBlack),
    ),
    padding: EdgeInsets.symmetric(
      horizontal: CustomSizes().dynamicWidth(context, .02),
    ),
    child: Center(
      child: text(
        context,
        title,
        0.022,
        CustomColors.customBlack,
      ),
    ),
  );
}


Widget retry(context, {retryFunc = ""}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        "assets/oops.png",
        color: CustomColors.customGrey.withOpacity(0.4),
        width: CustomSizes().dynamicWidth(context, .24),
      ),
      CustomSizes().heightBox(context, .03),
      text(
        context,
        "Oops...",
        0.07,
        CustomColors.customBlack,
        alignText: TextAlign.center,
        bold: true,
      ),
      CustomSizes().heightBox(context, .03),
      Image.asset(
        "assets/no_net.png",
        color: CustomColors.customBlack,
        width: CustomSizes().dynamicWidth(context, .1),
      ),
      CustomSizes().heightBox(context, .02),
      text(
        context,
        "No Internet Connection",
        0.036,
        CustomColors.customBlack,
        alignText: TextAlign.center,
      ),
      retryFunc == "" ? CustomSizes().heightBox(context, .04) : 0.0,
      retryFunc == ""
          ? coloredButton(
              context,
              "Retry",
              CustomColors.customBlack,
              width: CustomSizes().dynamicWidth(context, .4),
              function: retryFunc == "" ? () {} : retryFunc,
            )
          : Container(),
    ],
  );
}
