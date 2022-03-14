import 'package:flutter/material.dart';


import '../utils/config.dart';
import '../utils/constants.dart';
import '../utils/dynamic_sizes.dart';

Widget inputTextField(context, label, myController,
    {function, function2, password = false, white = false}) {
  return ClipRRect(
    borderRadius:
        BorderRadius.circular(CustomSizes().dynamicWidth(context, 0.04)),
    child: TextFormField(
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
      cursorColor:
          white == true ? AppColors.customWhite : AppColors.customBlack,
      cursorWidth: 2.0,
      cursorHeight: CustomSizes().dynamicHeight(context, .03),
      style: TextStyle(
        color:
            white == true ? AppColors.customWhite : AppColors.customBlack,
        fontSize: CustomSizes().dynamicWidth(context, .04),
      ),
      decoration: InputDecoration(
        hintStyle: TextStyle(
            color: white == true
                ? AppColors.customWhite
                : AppColors.customBlack),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: white == true
                  ? AppColors.customWhite
                  : AppColors.customBlack),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: white == true
                  ? AppColors.customWhite
                  : AppColors.customBlack),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
              color: white == true
                  ? AppColors.customWhite
                  : AppColors.customBlack),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: CustomSizes().dynamicWidth(context, .05),
        ),
      ),
    ),
  );
}
