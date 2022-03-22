import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mtech_attendance/Widgets/form_fields.dart';
import 'package:mtech_attendance/app%20screens/bottom%20nav%20screens/bottom_tab_bar.dart';
import 'package:mtech_attendance/utils/dynamic_sizes.dart';

import '../Widgets/buttons.dart';
import '../Widgets/text_widget.dart';
import '../utils/app_routes.dart';
import '../utils/config.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: CustomSizes().dynamicWidth(context, 1),
          height: CustomSizes().dynamicHeight(context, 1),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Image.asset(
                  'assets/signup_top.png',
                  color: AppColors.customBlue,
                  width: CustomSizes().dynamicWidth(context, 0.35),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  "assets/loginbottom.png",
                  color: AppColors.customBlue,
                  width: CustomSizes().dynamicWidth(context, 0.4),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: CustomSizes().dynamicHeight(context, .02),
                    horizontal: CustomSizes().dynamicWidth(context, 0.04)),
                width: CustomSizes().dynamicWidth(context, 1),
                height: CustomSizes().dynamicHeight(context, 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/logo.png",
                      height: CustomSizes().dynamicHeight(context, .08),
                    ),
                    CustomSizes().heightBox(context, 0.16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        text(
                          context,
                          "Employee ID",
                          0.035,
                          AppColors.customGrey,
                        ),
                      ],
                    ),
                    CustomSizes().heightBox(context, 0.02),
                    inputTextField(
                      context,
                      "Employee ID",
                      email,
                      icon: true,
                      iconData: CupertinoIcons.person_crop_circle,
                    ),
                    CustomSizes().heightBox(context, 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        text(
                          context,
                          "Password",
                          0.035,
                          AppColors.customGrey,
                        ),
                      ],
                    ),
                    CustomSizes().heightBox(context, 0.03),
                    inputTextField(context, "Password", password),
                    CustomSizes().heightBox(context, 0.04),
                    coloredButton(
                      context,
                      "Login",
                      AppColors.customBlue,
                      function: () => CustomRoutes().pushAndRemoveUntil(
                        context,
                        const AppTabBar(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

topBar(context, text1, {settingIcon = false}) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: CustomSizes().dynamicHeight(context, 0.02),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        settingIcon == true
            ? const SizedBox()
            : InkWell(
                onTap: () => CustomRoutes().pop(context),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: CustomSizes().dynamicWidth(context, 0.05),
                  color: AppColors.customBlack,
                ),
              ),
        Align(
          alignment: Alignment.center,
          child: text(context, text1, 0.06, AppColors.customBlack, bold: true),
        ),
        settingIcon == true
            ? InkWell(
                onTap: () {
                  showDialog(
                    barrierColor: AppColors.customBlack.withOpacity(0.8),
                    barrierDismissible: true,
                    useSafeArea: true,
                    context: context,
                    builder: (context) {
                      return filterContainer(context);
                    },
                  );
                },
                child: Icon(Icons.tune_outlined,
                    size: CustomSizes().dynamicWidth(context, 0.06),
                    color: AppColors.customBlue),
              )
            : CircleAvatar(
                radius: CustomSizes().dynamicWidth(context, 0.035),
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.arrow_back_ios,
                  size: CustomSizes().dynamicWidth(context, 0.03),
                  color: Colors.transparent,
                ),
              ),
      ],
    ),
  );
}

Widget filterContainer(context) {
  return StatefulBuilder(builder: (context, StateSetter setState) {
    return Align(
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          CustomSizes().dynamicWidth(context, .04),
        ),
        child: Material(
          child: Container(
            height: CustomSizes().dynamicHeight(context, .35),
            width: CustomSizes().dynamicWidth(context, .95),
            padding: EdgeInsets.symmetric(
                horizontal: CustomSizes().dynamicWidth(context, .04),
                vertical: CustomSizes().dynamicHeight(context, .02)),
            decoration: BoxDecoration(
                color: AppColors.customWhite,
                borderRadius: BorderRadius.circular(
                  CustomSizes().dynamicWidth(context, .04),
                ),
                border: Border.all(
                    color: AppColors.customBlue,
                    width: CustomSizes().dynamicWidth(context, .0035))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.tune_outlined,
                        size: CustomSizes().dynamicWidth(context, 0.06),
                        color: AppColors.customBlue),
                    GestureDetector(
                      onTap: () {
                        CustomRoutes().pop(context);
                      },
                      child: Icon(
                        Icons.close_rounded,
                        color: AppColors.customBlack,
                        size: CustomSizes().dynamicWidth(context, .05),
                      ),
                    ),
                  ],
                ),
                CustomSizes().heightBox(context, 0.01),
                text(
                  context,
                  "Late Check In",
                  0.04,
                  AppColors.customBlack,
                ),
                Divider(
                  thickness: CustomSizes().dynamicWidth(context, 0.002),
                ),
                text(
                  context,
                  "Late Check Out",
                  0.04,
                  AppColors.customBlack,
                ),
                Divider(
                  thickness: CustomSizes().dynamicWidth(context, 0.002),
                ),
                text(
                  context,
                  "Leave Approvals",
                  0.04,
                  AppColors.customBlack,
                ),
                Divider(
                  thickness: CustomSizes().dynamicWidth(context, 0.002),
                ),
                text(
                  context,
                  "HR Announcements",
                  0.04,
                  AppColors.customBlack,
                ),
                Divider(
                  thickness: CustomSizes().dynamicWidth(context, 0.002),
                ),
                text(
                  context,
                  "Public Announcements",
                  0.04,
                  AppColors.customBlack,
                ),
                //Divider(thickness: CustomSizes().dynamicWidth(context, 0.002),),
              ],
            ),
          ),
        ),
      ),
    );
  });
}
