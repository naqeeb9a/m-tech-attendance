
import 'package:flutter/material.dart';
import 'package:mtech_attendance/Widgets/text_widget.dart';

import '../utils/config.dart';
import '../utils/dynamic_sizes.dart';



Widget coloredButton(context, text, color,
    {function = "", width = "", fontSize = 0.04, fontColor = true}) {
  return GestureDetector(
    onTap: function == "" ? () {} : function,
    child: Container(
      width: width == "" ? CustomSizes().dynamicWidth(context, 1) : width,
      height: CustomSizes().dynamicWidth(context, .12),
      decoration: color == AppColors.noColor
          ? BoxDecoration(
              color: color,
              border: Border.all(width: 1, color: AppColors.customWhite),
            )
          : BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(
                CustomSizes().dynamicWidth(
                  context,
                  1,
                ),
              ),
            ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: fontColor == true
                ? AppColors.customWhite
                : AppColors.customBlack,
            fontWeight: FontWeight.bold,
            fontSize: CustomSizes().dynamicWidth(context, fontSize),
          ),
        ),
      ),
    ),
  );
}

Widget retry(context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // LottieBuilder.asset(
        //   "assets/retry.json",
        //   width: dynamicWidth(context, 0.4),
        //   repeat: false,
        // ),
        CustomSizes().heightBox(context, 0.02),
        text(context, "Check your internet or try again later", 0.03,
            AppColors.customWhite),
        CustomSizes().heightBox(context, 0.1),
        coloredButton(
          context,
          "Retry",
          AppColors.customWhite,
          width: CustomSizes().dynamicWidth(context, .4),
          function: () {},
        ),
      ],
    ),
  );
}
