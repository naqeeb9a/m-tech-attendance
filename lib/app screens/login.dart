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
        body: SingleChildScrollView(
          child: SizedBox(
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
                          context, "Enter Email or Employee ID", email,
                          icon: true),
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
                      CustomSizes().heightBox(context, 0.08),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: CustomSizes().dynamicWidth(context, 0.03),
                            color: AppColors.customGrey,
                          ),
                          text(context, "You can Login Using Facial", 0.025,
                              AppColors.customGrey),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

topBar(context, text1) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: CustomSizes().dynamicHeight(context, 0.02),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => CustomRoutes().pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            size: CustomSizes().dynamicWidth(context, 0.05),
            color: AppColors.customBlack,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: text(
            context,
            text1,
            0.06,
            AppColors.customBlack,
          ),
        ),
        CircleAvatar(
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
