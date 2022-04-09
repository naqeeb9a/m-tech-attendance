import 'dart:convert';

import 'package:dialogs/dialogs/message_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mtech_attendance/Widgets/form_fields.dart';
import 'package:mtech_attendance/utils/constants.dart';
import 'package:mtech_attendance/utils/dynamic_sizes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Widgets/buttons.dart';
import '../Widgets/text_widget.dart';
import '../functions/apis.dart';
import '../utils/app_routes.dart';
import '../utils/config.dart';
import 'bottom nav screens/bottom_tab_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool loadingCheck = false;
  bool loginCheck = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    checkLoginStatus(context);
  }

  checkLoginStatus(context) async {
    SharedPreferences loginUser = await SharedPreferences.getInstance();
    dynamic temp = loginUser.getString("LoginResponse");

    var tempData = temp == null ? "" : await jsonDecode(temp);

    setState(() {
      loginCheck = true;
    });

    userData = tempData;

    if (temp != null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context1) => const AppTabBar(),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.customBlack,
      body: loginCheck == false
          ? const SafeArea(
              child: Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            )
          : SafeArea(
              child: Container(
                width: CustomSizes().dynamicWidth(context, 1),
                height: CustomSizes().dynamicHeight(context, 1),
                color: AppColors.customWhite,
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
                          horizontal:
                              CustomSizes().dynamicWidth(context, 0.04)),
                      width: CustomSizes().dynamicWidth(context, 1),
                      height: CustomSizes().dynamicHeight(context, 1),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/logo.png",
                              height: CustomSizes().dynamicHeight(context, .14),
                            ),
                            CustomSizes().heightBox(context, .1),
                            inputTextField(
                              context,
                              "Employee Email",
                              email,
                              icon: true,
                              iconData: CupertinoIcons.person_crop_circle,
                              function: (value) {
                                if (EmailValidator.validate(value)) {
                                } else {
                                  return "Enter Valid Email";
                                }
                                return null;
                              },
                            ),
                            CustomSizes().heightBox(context, .06),
                            inputTextField(
                              context,
                              "Password",
                              password,
                              function: (value) {
                                if (value.isEmpty) {
                                  return 'Enter Valid Password';
                                }
                                return null;
                              },
                            ),
                            CustomSizes().heightBox(context, 0.04),
                            loadingCheck == true
                                ? const CircularProgressIndicator.adaptive(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      AppColors.customBlue,
                                    ),
                                  )
                                : coloredButton(
                                    context,
                                    "Login",
                                    AppColors.customBlue,
                                    width: CustomSizes()
                                        .dynamicWidth(context, 0.75),
                                    function: () async {
                                      if (!_formKey.currentState!.validate()) {
                                        return;
                                      } else {
                                        setState(() {
                                          loadingCheck = true;
                                        });
                                        var response =
                                            await Functions().loginFunc(
                                          email.text.toString().trim(),
                                          password.text.toString(),
                                        );
                                        if (response == "success") {
                                          MessageDialog messageDialog =
                                              MessageDialog(
                                            dialogBackgroundColor:
                                                AppColors.customWhite,
                                            buttonOkColor: AppColors.customBlue,
                                            title: '$response',
                                            titleColor: AppColors.customBlack,
                                            message: 'Login Successfully',
                                            messageColor: AppColors.customBlack,
                                            dialogRadius: CustomSizes()
                                                .dynamicWidth(context, 0.025),
                                          );
                                          messageDialog.show(
                                            context,
                                            barrierColor: Colors.white,
                                          );

                                          CustomRoutes().pushAndRemoveUntil(
                                            context,
                                            const AppTabBar(),
                                          );
                                          email.clear();
                                          password.clear();
                                        } else {
                                          setState(() {
                                            loadingCheck = false;
                                          });
                                          MessageDialog messageDialog =
                                              MessageDialog(
                                            dialogBackgroundColor:
                                                AppColors.customWhite,
                                            buttonOkColor:
                                                AppColors.customBlack,
                                            title: 'error',
                                            titleColor: AppColors.customBlack,
                                            message: "$response",
                                            messageColor: AppColors.customBlack,
                                            buttonOkText: 'Ok',
                                            dialogRadius: CustomSizes()
                                                .dynamicWidth(context, 0.025),
                                            buttonRadius: CustomSizes()
                                                .dynamicWidth(context, 0.05),
                                          );
                                          messageDialog.show(context,
                                              barrierColor: Colors.white);
                                        }
                                      }
                                    },
                                  ),
                          ],
                        ),
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
