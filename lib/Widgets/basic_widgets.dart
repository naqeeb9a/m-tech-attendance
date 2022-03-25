import 'package:flutter/material.dart';
import 'package:mtech_attendance/Widgets/buttons.dart';
import 'package:mtech_attendance/Widgets/text_widget.dart';

import '../utils/config.dart';
import '../utils/dynamic_sizes.dart';

Widget chip(context, title) {
  return Container(
    height: CustomSizes().dynamicHeight(context, .03),
    decoration: BoxDecoration(
      color: AppColors.customWhite,
      borderRadius: BorderRadius.all(
        Radius.circular(
          CustomSizes().dynamicWidth(context, 1),
        ),
      ),
      border: Border.all(color: AppColors.customBlack),
    ),
    padding: EdgeInsets.symmetric(
      horizontal: CustomSizes().dynamicWidth(context, .02),
    ),
    child: Center(
      child: text(
        context,
        title,
        0.022,
        AppColors.customBlack,
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
        color: AppColors.customGrey.withOpacity(0.4),
        width: CustomSizes().dynamicWidth(context, .24),
      ),
      CustomSizes().heightBox(context, .03),
      text(
        context,
        "Oops...",
        0.07,
        AppColors.customBlack,
        alignText: TextAlign.center,
        bold: true,
      ),
      CustomSizes().heightBox(context, .03),
      Image.asset(
        "assets/no_net.png",
        color: AppColors.customBlack,
        width: CustomSizes().dynamicWidth(context, .1),
      ),
      CustomSizes().heightBox(context, .02),
      text(
        context,
        "No Internet Connection",
        0.036,
        AppColors.customBlack,
        alignText: TextAlign.center,
      ),
      retryFunc == "" ? CustomSizes().heightBox(context, .04) : 0.0,
      retryFunc == ""
          ? coloredButton(
              context,
              "Retry",
              AppColors.customBlack,
              width: CustomSizes().dynamicWidth(context, .4),
              function: retryFunc == "" ? () {} : retryFunc,
            )
          : Container(),
    ],
  );
}

Widget Kuchbhirakhomagarmastrakho (context,icon,text1,color){
  return Container(
    height: CustomSizes().dynamicHeight(context, 0.15),
    width: CustomSizes().dynamicWidth(context, 0.2),
    child: Column(
      children: [
        Container(
          height: CustomSizes().dynamicHeight(context, 0.08),
          width: CustomSizes().dynamicWidth(context, 0.17),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon),
        ),
        CustomSizes().heightBox(context, 0.01),
        text(context, text1, 0.0335, AppColors.customBlack,),
      ],
    ),
  );
}
