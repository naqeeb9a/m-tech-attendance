import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/config.dart';
import '../utils/constants.dart';
import '../utils/dynamic_sizes.dart';

Widget inputTextField(context, label, myController,
    {function,
    function2,
    password = false,
    white = false,
    icon = false,
    dynamic iconData = ""}) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: (function == "")
        ? () {
            return null;
          }
        : function,
    controller: myController,
    textInputAction: TextInputAction.next,
    keyboardType: password == true
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
    obscureText: password == true ? obscureText : false,
    cursorColor: white == true ? AppColors.customWhite : AppColors.customBlack,
    cursorWidth: 2.0,
    cursorHeight: CustomSizes().dynamicHeight(context, .03),
    style: TextStyle(
      color: white == true ? AppColors.customWhite : AppColors.customBlack,
      fontSize: CustomSizes().dynamicWidth(context, .04),
    ),
    decoration: InputDecoration(
      labelText: label,
      suffixIcon: icon == true
          ? Icon(
              iconData,
              size: CustomSizes().dynamicHeight(context, 0.02),
              color: AppColors.customGrey,
            )
          : const SizedBox(),
      hintStyle: TextStyle(
          color: white == true ? AppColors.customWhite : AppColors.customGrey),
      enabledBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(CustomSizes().dynamicWidth(context, 1)),
        borderSide: BorderSide(
            width: CustomSizes().dynamicWidth(context, 0.001),
            color:
                white == true ? AppColors.customWhite : AppColors.customGrey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(CustomSizes().dynamicWidth(context, 1)),
        borderSide: BorderSide(
            width: CustomSizes().dynamicWidth(context, 0.004),
            color:
                white == true ? AppColors.customWhite : AppColors.customBlue),
      ),
      border: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(CustomSizes().dynamicWidth(context, 1)),
        borderSide: BorderSide(
            width: CustomSizes().dynamicWidth(context, 0.001),
            color:
                white == true ? AppColors.customWhite : AppColors.customGrey),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: CustomSizes().dynamicWidth(context, .05),
      ),
    ),
  );
}
